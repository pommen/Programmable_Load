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

RTC_DS3231 rtc;
Adafruit_INA219 ina219(0x4A);
LiquidCrystal_I2C lcd(0x3f, 20, 4);
Adafruit_ADS1115 ads; /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;
Bounce debouncer = Bounce();

//Prototypes:
void updateDisp();
void bargraph(int length, int row, int full); //en custom <3 bargrapg för att se % av max
void inaStatus();
void printTime();
void loadSwitching();
void setupLCD();
void i2cPot(int steps);

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

const int VsensePot = 0x2d;
const int IsensePot = 0x2c;
int potStep = 0;

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

const int comperator = PB11;

//custom files:
#include <enc.h>
#include <LCDBargraph.h>
#include <I2CscannerLCD.h>
#include <Sorting.h>
#include <printTime.h>
#include <TempControl.h>
#include <LCDsetup.h>
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
	digitalWrite(LED_BUILTIN, buildInLedState);

	setupLCD();
	digitalWrite(LED_BUILTIN, !buildInLedState);

	// Initialize the INA219.
	// By default the initialization will use the largest range (32V, 2A).  However
	// you can call a setCalibration function to change this range (see comments).

	ina219.begin();
	ina219.setCalibration_32V_1A();
	dac.begin(0x60);
	dac.setVoltage(0, false); //Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.
	ads.begin();


	setupRTC();
	printTime();
	//i2cScanner();

	attachInterrupt(rot_EncB, Rot_enc_ISR, RISING); //Rotary encoder

	lcd.clear();
}

void loop()
{

	if (millis() - lcdUpdateTime >= 1000)
		updateDisp(); //update LCD every sec

	if (rot_enc != rot_encOld) //only update if chaged
	{
		int rotDiff = rot_encOld - rot_enc;

		/* 	lcd.setCursor(12, 1);
		lcd.print("   ");
		lcd.print(rot_enc);
		lcd.setCursor(12, 1); */

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

	if (digitalRead(trig) == HIGH) //denna slår på lasten behöver en debounce(bebounce från HW.)
	{
		loadOnToggel = !loadOnToggel;
	}

	if (loadOnToggel != loadOnToggelOld)
	{

		loadSwitching();
	}
	temperature(); //writes the coolingblock temperatur every sec and fan control. call often under load

	if (dacsetVal != dacsetValOld && loadOnToggel == true)
	{

		dac.setVoltage(dacsetVal, false);
		//updateDisp();
	}
}

void loadSwitching()
{

	if (loadOnToggel == true && loadOnToggelOld != loadOnToggel)
	{
		loadOnToggelOld = loadOnToggel;
		lcd.setCursor(17, 1);
		lcd.print("   ");
		lcd.setCursor(17, 1);
		lcd.print("ON");
		dac.setVoltage(dacsetVal, false);
	}
	if (loadOnToggel == false && loadOnToggelOld != loadOnToggel)
	{
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
		bargraph(dacsetVal, 2, 4096); //prints the bargrapg to the 3 row
		dacsetValOld = dacsetVal;
	}

	delay(50); //adc need some time to shift registers
	currentDraw = ads.readADC_Differential_0_1() * 1.875;
	if (currentDraw != currentDrawOLD)//update if value has changed
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
		vDisp = (Vin * 0.01875) / 4;

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

void i2cPot(int step) // wichPot 1 = isense, 0= Vsense
{

	byte dataPackage = 131;

	Wire.beginTransmission(VsensePot);
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
