/*
   ==============  Variable load  ================

   Currently running on bluepill

    --------------------
   DAC = 4096 steps (12 bit)
   ADC = 65536 steps (16bit)
   ref to Vref 4.096V
    --------------------

   I2C addresses:

   LCD:0x3F (63)
   DAC:0x60
   ADC:0x48 (72)
   INA219: 0x4A
   DS3231 (RTC):0x68 (104)
   LM75B: 0x90 ???s
   pot 1: (i sense)   2c-44
   pot 2(volt sense):    2d

*/

#include <Arduino.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Adafruit_MCP4725.h>
#include <Adafruit_ADS1015.h>
#include <Adafruit_INA219.h>
#include <RTClib.h>
#include <Bounce2.h>
#include <EEPROM.h>
#include <SPI.h>
#include "SdFat.h"

RTC_DS3231 rtc;
Adafruit_INA219 ina219(0x4A);
LiquidCrystal_I2C lcd(0x3f, 20, 4);
Adafruit_ADS1115 ads; /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;
Bounce debouncer = Bounce();
SdFat SD;
File dataFile;

//Prototypes:
void updateDisp();
void bargraph(int length, int row, int full); //en custom <3 bargrapg för att se % av max
void inaStatus();
void printTime();
void loadSwitching(int forceON);
//void setupLCD();
void i2cPot(int steps, int wichPot); //0=vsense, 1 = isense
void setupPots();
boolean debounce(int pin, int level);

//Vars:
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int lastEncVal = 0;
bool clickHeld = false;
int clickHeldTime = 0;
float blockTemp = 0.0;
int temptime = 0;
int currentDraw = 0;
int currentDrawOLD = 99; //för att kolla om vi ska uppdatera LCD
int Vin = 0;
int VinOLD = 99; //för att kolla om vi ska uppdatera LCD
int lcdUpdateTime = 500;
int vintemp = 0;
int rot_EncA_Value = 0;
volatile int rot_enc = 0; //rotational encoder. needs to volatile. Gets input frpm ISR
int rot_encOld = 0;	//used for comparrisson
int dacset = 0;	    //This is the value translated from Rotenc. not allowed to go under 0
int dacsetVal = 0;	 //this is the 14 bit numer that we send to the dac.
int dacsetValOld = 99;    //place holder for dac output. to compare if we need to update
long int accelTimer = 0;  //acceleration timer for the rotantion encoder
long int statusTimer = 99;
boolean buildInLedState = 0;
boolean loadOnToggel = 0;
boolean loadOnToggelOld = false;
int loadOnSwitch = 99;
int temp = 99;
float vDisp = 99;
boolean Trigged = false; //flag for trigger state
int rot_EncBTN_Bounced = 0;
long menuTimer = 0;

const int VsensePot = 0x2d;
const int IsensePot = 0x2c;
int potStep = 0;
uint potVcal = 0;
uint16 potVcalAddr = 0;
uint potIcal = 0;
uint16 potIcalAddr = 1;

//datalogger vars:
char fileName[] = "000000000000.CSV";

//pins:
const int out1 = PA8;	  //GPIO
const int out2 = PA9;	  //GPIO
const int blockTempPin = PB1; //internal ADC till temp mätning för MOSFET och power resitor
const int fanPWM = PB0;	//Fan PWM output
const int fanTach = PB5;      //fan RPM input
const int rot_EncA = PB3;     //enocder
const int rot_EncB = PB4;     //enocder
const int rot_EncBTN = PA15;  //enocder
//const int compratorPin = PA11;
const int trig = PA10; //trigger ingång slår igång last
//const int fetTemp = PA0;   //NTC limmad på MOSFET
const int tempAlarm = PB10; //LM75 ... som inte funkar
// SD chip select pin.  Be sure to disable any other SPI devices such as Enet.
const int chipSelect = PA4;
const int comperator = PB11;

//custom files:
#include <enc.h>
#include <LCDBargraph.h>
#include <I2CscannerLCD.h>
#include <Sorting.h>
#include <printTime.h>
#include <TempControl.h>
#include <LCDsetup.h>
#include <i2cPots.h>
#include <datalogger.h>
#include <menu.h>

void setup()
{
	Serial.begin(9600);
	Serial.println("starting");
	Wire.begin();
	//Wire.setClock(400000); //fast mode!
	enableDebugPorts(); //need this to use PB3...for some reason

	pinMode(rot_EncA, INPUT);
	pinMode(rot_EncB, INPUT);
	pinMode(rot_EncBTN, INPUT);
	pinMode(out1, OUTPUT); //göra om denna till opendrain pwm?
	pinMode(out2, OUTPUT);
	pinMode(blockTempPin, INPUT_ANALOG);
	digitalWrite(out1, HIGH); //stänger av fläkten
	pinMode(trig, INPUT);
	pinMode(fanPWM, OUTPUT);
	pinMode(fanTach, INPUT);
	pinMode(LED_BUILTIN, OUTPUT);
	digitalWrite(LED_BUILTIN, !buildInLedState);
	//pinMode(loadEnabledPin, OUTPUT);
	debouncer.attach(rot_EncBTN);
	debouncer.interval(5);
	ina219.begin();
	ina219.setCalibration_32V_1A();
	dac.begin(0x60);
	dac.setVoltage(0, false); //Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.
	ads.begin();
	ads.setGain(GAIN_TWO); // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV

	digitalWrite(LED_BUILTIN, buildInLedState);
	setupLCD();
	setupRTC();
	printTime();
	setupSD();
	setupPots();
	// calPots();
	startLoggging();
	digitalWrite(LED_BUILTIN, !buildInLedState);
	//i2cScanner();
	attachInterrupt(rot_EncB, Rot_enc_ISR, RISING); //Rotary encoder
	delay(2000);
	lcd.clear();
	lcd.print(fileName);
	delay(2000);
	lcd.clear();
}

void loop()
{
	debouncer.update();
	rot_EncBTN_Bounced = debouncer.read();
	if (millis() - lcdUpdateTime >= 1000)
		updateDisp(); //update LCD every sec

	if (rot_enc != rot_encOld) //only update if chaged
	{
		int rotDiff = rot_encOld - rot_enc;
		dacsetVal += rotDiff;
		rot_encOld = rot_enc;
	}

	//make sure that the dac is with in 12 bit range
	if (dacsetVal < 0)
	{
		dacsetVal = 0;
	}
	else if (dacsetVal > 4096)
	{
		dacsetVal = 4095;
	}

	//external load on trig forces load on
	if (debounce(trig, 0) == true)
	{
		loadSwitching(1); //(1) force load to switch on
	}
	else if (debounce(trig, 1) == true && Trigged == true) //this forces load of if the trigger is relised
	{
		loadSwitching(0); //   (0) forces load to switch off
	}
	if (rot_EncBTN_Bounced == HIGH)
	{
		
		if (millis() - menuTimer > 1000)
		{
			mainMenu();
			menuTimer = millis();
		}
	}

	else
	{
		menuTimer = millis();
	}
	if (debouncer.fell())
	{
		loadOnToggel = !loadOnToggel;
	}

	if (loadOnToggel != loadOnToggelOld)
	{
		loadSwitching(3); // (3) toggles load
	}
	temperature(); //writes the coolingblock temperatur every sec and fan control. call often under load

	if (dacsetVal != dacsetValOld && loadOnToggel == true)
	{
		dac.setVoltage(dacsetVal, false);
	}
}

boolean debounce(int pin, int level)
{

	/*

kan vi spara våra variabler i en enum, så vi kan jonglera olika pinnar med samma funktion?

tar in en pin och kollar om den har blivigt testad för debounce förr (behöver en timeout)
om den har blivit testad förr så kollar vi om det äar dags att testa den igen.
om den har samma värde så return'ar vi true



	*/
	uint bounceTime = 5; //bouncetime, i millis
	uint timeout = 150;
	static int pinOld;	 //förra pinnen vi kollade
	static int valueOld;      //värdet på den förra pinnen
	static int debounceTimer; //så länge väntar vi innan vi ska kolla igen
	uint timeSinceLast = millis() - debounceTimer;
	int value = 0;
	if (pin == pinOld && timeSinceLast > timeout)
	{
		pinOld = 99;
		valueOld = 99;
	}

	if (pin != pinOld)
	{
		valueOld = digitalRead(pin);
		debounceTimer = millis();
		pinOld = pin;
		return false;
	}

	if (pin == pinOld && timeSinceLast > bounceTime)
	{
		value = digitalRead(pin);
	}
	if (value == valueOld && value == level)
	{
		return true;
	}
	else
		return false;
}

void loadSwitching(int forceOn)
{
	if (forceOn == 1)
	{
		lcd.setCursor(16, 1);
		lcd.print("    ");
		lcd.setCursor(16, 1);
		lcd.print("TRIG");
		dac.setVoltage(dacsetVal, false);
		Trigged = true;
		return;
	}
	if (forceOn == 0)
	{
		lcd.setCursor(16, 1);
		lcd.print("    ");
		lcd.setCursor(17, 1);
		lcd.print("OFF");
		dac.setVoltage(0, false);
		Trigged = false;

		return;
	}

	if (loadOnToggel == true && loadOnToggelOld != loadOnToggel)
	{
		loadOnToggelOld = loadOnToggel;
		lcd.setCursor(16, 1);
		lcd.print("    ");
		lcd.setCursor(18, 1);
		lcd.print("ON");
		dac.setVoltage(dacsetVal, false);
	}
	else if (loadOnToggel == false && loadOnToggelOld != loadOnToggel)
	{
		lcd.setCursor(16, 1);
		lcd.print("    ");
		lcd.setCursor(17, 1);
		lcd.print("OFF");
		dac.setVoltage(0, false);
	}
	loadOnToggelOld = loadOnToggel;
}

void inaStatus()
{
	lcd.setCursor(12, 0);
	lcd.print("   ");
	lcd.setCursor(0, 0);
	lcd.print("V:");
	lcd.print(ina219.getBusVoltage_V());
	lcd.print(" mA:");
	lcd.print(ina219.getCurrent_mA(), 0);
}

void updateDisp()
{

	if (dacsetVal != dacsetValOld) //only print new value is changed
	{

		lcd.setCursor(0, 1);
		lcd.print("Dac:     ");
		lcd.setCursor(5, 1);

		lcd.print(dacsetVal);
		lcd.setCursor(9, 1);
		lcd.print("mA Set:     ");
		lcd.setCursor(15, 1);
		lcd.print(dacsetVal * 2);

		bargraph(dacsetVal, 2, 4096); //prints the bargrapg to the 3 row
		dacsetValOld = dacsetVal;
	}

	delay(50);						     //adc need some time to shift registers
	currentDraw = ads.readADC_Differential_0_1() * 0.625; //0.0625mV / bit / 0,1 ohm = amp
	if (currentDraw != currentDrawOLD)			     //update if value has changed
	{
		if (currentDraw < 0)
			currentDraw = 0; //vill jag verkligen ha denna?
		lcd.setCursor(0, 3);
		lcd.print("I: ");
		lcd.print("     ");
		lcd.setCursor(3, 3);
		lcd.print(currentDraw);
		lcd.print("mA");
		currentDrawOLD = currentDraw;
	}

	delay(50); //adc need some time to shift registers
	Vin = ads.readADC_Differential_2_3();
	if (Vin != VinOLD) //update if changed
	{
		vDisp = (Vin * 0.625) / 400; //0.0625mV / bit

		lcd.setCursor(11, 3);
		lcd.print("V: ");
		lcd.print("     ");
		lcd.setCursor(14, 3);
		lcd.print(vDisp, 2);
		VinOLD = Vin;
	}

	if (millis() - statusTimer > 1500)
	{ //uppdatera status varje gång denna slår in
		/* code */
		statusTimer = millis();
		inaStatus();
	}
}

void i2cPot(int step, int wichPot) // wichPot 1 = isense, 0= Vsense
{
	int address;
	if (wichPot == 0)
	{
		address = VsensePot;
	}
	if (wichPot == 1)
	{
		address = IsensePot;
	}
	byte dataPackage = 131;

	Wire.beginTransmission(address);
	Wire.write(dataPackage);
	Wire.write(step);
	Wire.endTransmission();
	//updateDisp();
}
/*
   ADS:

   // The ADC input range (or gain) can be changed via the following
   // functions, but be careful never to exceed VDD +0.3V max, or to
   // exceed the upper and lower limits if you adjust the input range!
   // Setting these values incorrectly may destroy your ADC!
   //                                                                ADS1015  ADS1115
   //                                                                -------  -------
   // ads.setGain(GAIN_TWOTHIRDS);  // 2/3x gain +/- 6.144V  1 bit = 3mV      0.1875mV (default)
   // ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
   // ads.setGain(GAIN_TWO);        // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
   // ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
   // ads.setGain(GAIN_EIGHT);      // 8x gain   +/- 0.512V  1 bit = 0.25mV   0.015625mV
   // ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV

   ads.begin();
 */
