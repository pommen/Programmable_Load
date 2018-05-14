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
#include <EEPROM.h>
#include <SPI.h>
#include "SdFat.h"

RTC_DS3231 rtc;
Adafruit_INA219 ina219(0x4A);
LiquidCrystal_I2C lcd(0x3f, 20, 4);
Adafruit_ADS1115 ads; /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;
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
void trigger();
void wait(int wait);
void forceUpdate();

//Vars:
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int lastEncVal = 0;
int rot_EncA_Value = 0;
volatile int rot_enc = 0; //rotational encoder. needs to volatile. Gets input frpm ISR
int rot_encOld = 0;	//used for comparrisson
bool clickHeld = false;
int clickHeldTime = 0;
int clickHeldTimeStart = 0;
int btnPushed = 0;

float blockTemp = 0.0;
int temptime = 0;
int Vin = 0;
int VinOLD = 99; //för att kolla om vi ska uppdatera LCD strömförsörjning in
int lcdUpdateTime = 500;
int vintemp = 0;
int dacset = 0;	   //This is the value translated from Rotenc. not allowed to go under 0
int dacsetVal = 0;	//this is the 14 bit numer that we send to the dac.
int dacsetValOld = 99;   //place holder for dac output. to compare if we need to update
long int accelTimer = 0; //acceleration timer for the rotantion encoder
long int statusTimer = 99;
boolean buildInLedState = 0;
boolean loadOnToggel = 0;
boolean loadOnToggelOld = false;
int loadOnSwitch = 99;
boolean Trigged = false;     //flag for trigger state
boolean fourWireMode = 0;    //flag for using 4wire.
boolean fourWireModeOld = 1; //comparison flag
int temp = 99;
float currentDraw = 0.00;
float currentDrawOLD = 99.00; //för att kolla om vi ska uppdatera LCD
float vDisp = 99;
float currentDrawCalVal = 0.11; //11% too high
float vDispCalVal = 0.00;

unsigned long toggleLockOutTimer = 0; //timer for not spamming toggle
const int VsensePoti2caddr = 0x2d;
const int IsensePoti2caddr = 0x2c;
int potStep = 0;
int potVcal = 0;
int potVcalEEPROMAddr = 0;
int potIcal = 0;
int potIcalEEPROMAddr = 1;
int voltageRangeCalADDR = 2;
int currantRangeCalADDR = 3;
//datalogger vars:
char fileName[] = "000000000000.CSV";

//pins:
const int LED1 = PA1; //LED
const int LED2 = PA0; //LED
const int fourWire = PB8;
const int blockTempPin = PB1; //internal ADC till temp mätning för MOSFET och power resitor
const int fanPWM = PB0;	//Fan PWM output
const int fanTach = PB5;      //fan RPM input
const int rot_EncA = PB3;     //enocder
const int rot_EncB = PB4;     //enocder
const int rot_EncBTN = PA15;  //enocder definer above in click libary
const int compratorPin = PB11;
const int trig = PA10;      //trigger ingång slår igång last
const int tempAlarm = PB10; //LM75 ... som inte funkar
const int chipSelect = PA4; // SD chip select pin.

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
#include <SWcal.h>
#include <menu.h>
void setup()
{
	currentDrawCalVal = 1 - currentDrawCalVal;
	vDispCalVal = 1 - vDispCalVal;
	/* 
	Serial.begin(9600);
	Serial.println("starting");
	 */
	Wire.begin();
	Wire.setClock(400000); //fast mode!
	enableDebugPorts();    //need this to use PB3...for some reason

	pinMode(rot_EncA, INPUT);
	pinMode(rot_EncB, INPUT);
	pinMode(rot_EncBTN, INPUT);
	pinMode(LED1, OUTPUT);
	pinMode(LED2, OUTPUT);
	pinMode(fourWire, INPUT_PULLUP);
	pinMode(blockTempPin, INPUT_ANALOG);
	pinMode(trig, INPUT);
	pinMode(fanPWM, OUTPUT);
	pinMode(fanTach, INPUT);
	pinMode(LED_BUILTIN, OUTPUT);
	digitalWrite(LED_BUILTIN, !buildInLedState);
	//pinMode(loadEnabledPin, OUTPUT);
	digitalWrite(LED1, HIGH);
	digitalWrite(LED2, HIGH);
	ina219.begin();
	ina219.setCalibration_32V_1A();
	dac.begin(0x60);
	dac.setVoltage(0, false); //Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.
	ads.begin();
	//ads.setGain(GAIN_TWO);			      // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
	ads.setGain(GAIN_FOUR);			      // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
	attachInterrupt(rot_EncB, Rot_enc_ISR, RISING); //Rotary encoder

	digitalWrite(LED_BUILTIN, buildInLedState);
	setupLCD();
	//setupMenu();
	setupRTC();
	printTime();
	setupSD();
	setupPots();
	//calPots();
	//startLoggging();
	digitalWrite(LED_BUILTIN, !buildInLedState);
	digitalWrite(LED1, LOW);
	digitalWrite(LED2, LOW);
	//i2cScanner();
	wait(500);
	lcd.clear();
	lcd.print(fileName);
	wait(500);
	lcd.clear();
}
void loop()
{
	//i2cPot(dacsetVal, 1); //0=vsense, 1 = isense

	if (millis() - lcdUpdateTime >= 500)
		updateDisp(); //update LCD every 0.5 sec

	read_encoder(); //do encoderstuff get updated values. call often
	temperature();  //writes the coolingblock temperatur every sec and fan control. call often under load

	if (digitalRead(rot_EncBTN) == LOW)
	{
		if (btnPushed == 1 && millis() - toggleLockOutTimer > 300)
		{
			loadOnToggel = !loadOnToggel;
			toggleLockOutTimer = millis();
		}
		btnPushed = 0;
		clickHeldTimeStart = millis();
	}
	if (digitalRead(rot_EncBTN) == HIGH)
		btnPushed = 1;

	if (millis() - clickHeldTimeStart > 1000)
	{ //long click
		mainMenu();
		toggleLockOutTimer = millis();
		forceUpdate();
	}
	if (loadOnToggel != loadOnToggelOld)
		loadSwitching(3); // (3) toggles load

	if (dacsetVal != dacsetValOld && loadOnToggel == true)
		dac.setVoltage(dacsetVal, false);

	if (digitalRead(trig) == LOW)
		loadSwitching(1);				      //(1) force load to switch on
	else if (digitalRead(trig) == HIGH && Trigged == true) //this forces load of if the trigger is relised
		loadSwitching(0);				      //   (0) forces load to switch off

	digitalWrite(LED1, Trigged);
	digitalWrite(LED2, loadOnToggel);
	fourWireMode = digitalRead(fourWire);
	fourWireMode = !fourWireMode; //was active low. need to invert for names to make sense. HIGH when active.
}

void loadSwitching(int forceOn /*1:on 2:off 3:toggle*/) //1:on 2:off 3:toggle
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
		digitalWrite(LED2, LOW);

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

void wait(int wait) //instead of delay
{

	int temp = millis();

	while (millis() - temp < wait)
	{
	}
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
void forceUpdate()
{
	lcd.setCursor(0, 1);
	lcd.print("DAC Set:       ");
	lcd.setCursor(9, 1);
	lcd.print(dacsetVal);
	lcd.setCursor(0, 3);
	lcd.print("I: ");
	lcd.print("     ");
	lcd.setCursor(3, 3);
	lcd.print(currentDraw);
	lcd.print("mA");
	vDisp = vDisp * vDispCalVal;
	lcd.setCursor(11, 3);
	lcd.print("V: ");
	lcd.print("     ");
	lcd.setCursor(14, 3);
	lcd.print(vDisp, 2);
	if (fourWireMode == true)
	{
		lcd.setCursor(0, 0);
		lcd.print("4wire Vsense");
		fourWireModeOld = fourWireMode;
	}
	else if (fourWireMode == false)
	{
		lcd.setCursor(0, 0);
		lcd.print("Local Vsense");
		fourWireModeOld = fourWireMode;
	}
	temperature();
}
void updateDisp()
{

	if (dacsetVal != dacsetValOld) //only print new value is changed
	{

		/* lcd.setCursor(0, 1);
		lcd.print("Dac:     ");
		lcd.setCursor(5, 1);
		lcd.print(dacsetVal); */

		lcd.setCursor(0, 1);
		lcd.print("DAC Set:       ");
		lcd.setCursor(9, 1);
		lcd.print(dacsetVal);

		bargraph(dacsetVal, 2, 4096); //prints the bargrapg to the 3 row
		dacsetValOld = dacsetVal;
	}

	wait(50);						      //adc need some time to shift registers
	currentDraw = ads.readADC_Differential_0_1() * 0.3125; //03125mV
	currentDraw = currentDraw * currentDrawCalVal;
	currentDraw = currentDraw * 1.03;
	if (currentDraw != currentDrawOLD) //update if value has changed
	{

		lcd.setCursor(0, 3);
		lcd.print("I: ");
		lcd.print("     ");
		lcd.setCursor(3, 3);
		lcd.print(currentDraw);
		lcd.print("mA");
		currentDrawOLD = currentDraw;
	}

	wait(50);
	Vin = ads.readADC_Differential_2_3();
	if (Vin != VinOLD) //update if changed
	{
		vDisp = (Vin * 0.3125) / 400; //0.0625mV / bit
		vDisp = vDisp * vDispCalVal;
		lcd.setCursor(11, 3);
		lcd.print("V: ");
		lcd.print("     ");
		lcd.setCursor(14, 3);
		lcd.print(vDisp, 2);
		VinOLD = Vin;
	}
	if (fourWireMode == true && fourWireMode != fourWireModeOld)
	{
		lcd.setCursor(0, 0);
		lcd.print("4wire Vsense");
		fourWireModeOld = fourWireMode;
	}
	else if (fourWireMode == false && fourWireMode != fourWireModeOld)
	{
		lcd.setCursor(0, 0);
		lcd.print("Local Vsense");
		fourWireModeOld = fourWireMode;
	}

	/* if (millis() - statusTimer > 1500)
	{ //uppdatera status varje gång denna slår in
		statusTimer = millis();
		inaStatus();
	} */
}

void i2cPot(int step, int address)
{

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
