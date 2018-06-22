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
void forceUpdate();
float samples(int pin);
float readCurrent();
float readVoltage();
float voltage(float adc, int gain);

//Vars:
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
adsGain_t gain[6] = {GAIN_TWOTHIRDS, GAIN_ONE, GAIN_TWO, GAIN_FOUR, GAIN_EIGHT, GAIN_SIXTEEN}; // create an array of type adsGain_t, which is a struct in the Adafruit_ADS1015.h library
int voltageG = 5;
int currentG = 5;
int menuColPointer = 0;
int OLDmenuColPointer = 0;
// set gain to 16x to begin with
float adc, volt;

int lastEncVal = 0;
int rot_EncA_Value = 0;
volatile int rot_enc = 0; //rotational encoder. needs to volatile. Gets input frpm ISR
int rot_encOld = 0;		  //used for comparrisson
bool clickHeld = false;
int clickHeldTime = 0;
int clickHeldTimeStart = 0;
int btnPushed = 0;

bool startLogOnTrig = 0; //flag for starting datalog on external trig
bool startBelowFalg = 0;
bool startAboveFlag = 0;
bool stoppBelowFalg = 0;
bool stoppAboveFlag = 0;
bool startlog = 0;
bool loggingStarted = 0; //flag for starting datalog
int loggingInterval = 0;
long int lastLoggingmillis = 0;
float VoltageStartLogging = 0.0; //trigger for when to start logging based on vaoltage
float VoltageStoppLogging = 0.0; //trigger for when to start logging based on vaoltage

float blockTemp = 0.0;
int temptime = 0;
int Vin = 0;
int VinOLD = 99; //för att kolla om vi ska uppdatera LCD strömförsörjning in
long int lcdUpdateTime = 500;
int vintemp = 0;
int dacset = 0;			 //This is the value translated from Rotenc. not allowed to go under 0
int dacsetVal = 0;		 //this is the 14 bit numer that we send to the dac.
int dacsetValOld = 99;   //place holder for dac output. to compare if we need to update
long int accelTimer = 0; //acceleration timer for the rotantion encoder
//long int statusTimer = 99;
long int quarterSecUpdate = 0;
boolean buildInLedState = 0;
boolean loadOnToggel = 0;
boolean loadOnToggelOld = false;
int loadOnSwitch = 99;
boolean Trigged = false;	 //flag for trigger state
boolean fourWireMode = 0;	//flag for using 4wire.
boolean fourWireModeOld = 1; //comparison flag
int temp = 99;
float currentDraw = 0.00;
float currentDrawOLD = 99.00; //för att kolla om vi ska uppdatera LCD
float vDisp = 99;

int voltageCalnoOfIndex = 49; //antal voltage cal punkter (max) 49=50V
int currentCalnoOfIndex = 28; //antal current cal puinkter(max) 28=5A
int dacVScurrentADDR = 99;	//fejk

unsigned long toggleLockOutTimer = 0; //timer for not spamming toggle
const int VsensePoti2caddr = 0x2d;
const int IsensePoti2caddr = 0x2c;
int potStep = 0;
int potVcal = 0;
int potVcalEEPROMAddr = 0;
int potIcal = 0;
int potIcalEEPROMAddr = 1;
int voltageRangeCalADDR = 2;  //eeeprom adress till kaliberings värde för volt. slutar voltageCalnoOfIndex efter 2.
int currentRangeCalADDR = 99; //denna är fejk.
int currentRangeADDR = 99;
//datalogger vars:
char fileName[] = "000000000000.CSV";

//pins:
const int LED1 = PA1; //LED
const int LED2 = PA0; //LED
const int fourWire = PB8;
const int blockTempPin = PB1; //internal ADC till temp mätning för MOSFET och power resitor
const int fanPWM = PB0;		  //Fan PWM output
const int fanTach = PB5;	  //fan RPM input
const int rot_EncA = PB3;	 //enocder
const int rot_EncB = PB4;	 //enocder
const int rot_EncBTN = PA15;  //enocder definer above in click libary, Active HIGH
const int compratorPin = PB11;
const int trig = PA10;		//trigger ingång slår igång last
const int tempAlarm = PB10; //LM75 ... som inte funkar
const int chipSelect = PA4; // SD chip select pin.

//custom files:
#include <enc.h>
#include <LCDBargraph.h>
#include <I2CscannerLCD.h>
#include <Sorting.h>
#include <printTime.h>
#include <TempControl.h>
//#include <LCDsetup.h>
#include <i2cPots.h>
#include <datalogger.h>
#include <SWcal.h>
#include <menu.h>

void setup()
{
	//currentDrawCalVal = 1 - currentDrawCalVal;
	currentRangeCalADDR = voltageCalnoOfIndex + 1; //adressen börjAR EFTER max calVolt slutar
	currentRangeADDR = currentRangeCalADDR + 1;	//adressen börjAR EFTER max cal current slutar
	//dacVScurrentADDR = currentRangeADDR + 1; /not used. for dac cal. too much RAM usage
	Wire.begin();
	Wire.setClock(400000); //fast mode! WROOM
	enableDebugPorts();	//need this to use PB3...because reasons

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
	digitalWrite(LED1, HIGH);
	digitalWrite(LED2, HIGH);
	ina219.begin();
	ina219.setCalibration_32V_1A();
	dac.begin(0x60);
	dac.setVoltage(0, false); //Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.
	ads.begin();

	ads.setGain(gain[5]);

	attachInterrupt(rot_EncB, Rot_enc_ISR, RISING); //Rotary encoder

	digitalWrite(LED_BUILTIN, buildInLedState);
	setupLCD();
	setupRTC();
	printTime();
	setupSD();
	setupPots();
	//startLoggging();
	setupCal();
	digitalWrite(LED_BUILTIN, !buildInLedState);
	digitalWrite(LED1, LOW);
	digitalWrite(LED2, LOW);
	//i2cScanner();

	lcd.clear();
}
void loop()
{
	//i2cPot(dacsetVal, 1); //0=vsense, 1 = isense

	if (millis() - lcdUpdateTime >= 500) //do every 500 ms
	{
		updateDisp(); //update LCD every 0.5 sec
	}

	if (millis() - quarterSecUpdate >= 250) // do every 250ms
	{

		digitalWrite(LED1, Trigged);
		digitalWrite(LED2, loadOnToggel);
		fourWireMode = digitalRead(fourWire);
		fourWireMode = !fourWireMode; //was active low. need to invert for names to make sense. HIGH when active.
		temperature(0);				  //writes the coolingblock temperatur every sec and fan control. call often under load
		quarterSecUpdate = millis();
	}

	read_encoder(); //do encoderstuff get updated values. call often

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

	if (millis() - clickHeldTimeStart > 1000) //timer to enter menu
	{										  //long click
		mainMenu();
		toggleLockOutTimer = millis();
		forceUpdate();
	}
	if (loadOnToggel != loadOnToggelOld)
		loadSwitching(3); // (3) toggles load

	if (dacsetVal != dacsetValOld && loadOnToggel == true)
		dac.setVoltage(dacsetVal, false);

	if (digitalRead(trig) == LOW)
		loadSwitching(1);								   //(1) force load to switch on
	else if (digitalRead(trig) == HIGH && Trigged == true) //this forces load of if the trigger is relised
		loadSwitching(0);								   //   (0) forces load to switch off

	///datalogging triggers:

	if (startBelowFalg == 1)
	{
		if (vDisp > VoltageStartLogging)
			startlog = 1;
	}
	if (startLogOnTrig == 1)
	{
		if (Trigged == 1)
			startlog = 1;
	}
	if (startAboveFlag == 1)
	{
		if (vDisp < VoltageStartLogging)
			startlog = 1;
	}
	if (startlog == 1 && loggingStarted != 1)
	{
		//setupSD();
		lcd.clear();
		lcd.print("logging started");
		File dataFile = SD.open(fileName, FILE_WRITE);

		// if the file is available, write to it:
		if (dataFile)
		{
			String head = "MS;V;mA";
			dataFile.println(head);
			dataFile.close();
		}
		loggingStarted = 1;
		logstartmillis = millis();
		delay(1000);
		forceUpdate();
	}
	if (millis() - lastLoggingmillis > loggingInterval && loggingStarted == 1)
	{
		startLoggging();
	}
	/// datalog stop triggers:
	if (stoppAboveFlag == 1)
	{
		if (vDisp > VoltageStoppLogging)
		{
			startLogOnTrig = 0; //flag for starting datalog on external trig
			startBelowFalg = 0;
			startAboveFlag = 0;
			stoppBelowFalg = 0;
			stoppAboveFlag = 0;
			startlog = 0;
			loggingStarted = 0; //flag for starting datalog
			lcd.clear();
			lcd.print("logging STOPPED");
			delay(1000);
			forceUpdate();
		}
	}

	if (stoppBelowFalg == 1)
	{
		if (vDisp < VoltageStoppLogging)
		{
			startLogOnTrig = 0; //flag for starting datalog on external trig
			startBelowFalg = 0;
			startAboveFlag = 0;
			stoppBelowFalg = 0;
			stoppAboveFlag = 0;
			startlog = 0;
			loggingStarted = 0; //flag for starting datalog
			lcd.clear();
			lcd.print("logging STOPPED");
			loadSwitching(0); //turn load off
		}
	}
}

void loadSwitching(int forceOn) //1:on 0:off
{
	if (forceOn == 1)
	{
		lcd.setCursor(16, 1);
		lcd.print("    ");
		lcd.setCursor(16, 1);
		lcd.print("TRIG");
		dac.setVoltage(dacsetVal, false);
		Trigged = true;
		digitalWrite(LED2, HIGH);
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
	lcd.clear();	
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
	temperature(0);
}
void updateDisp()
{
	static boolean tickTock;
	if (dacsetVal != dacsetValOld) //only print if value is changed
	{
		lcd.setCursor(0, 1);
		lcd.print("DAC Set:       ");
		lcd.setCursor(9, 1);
		lcd.print(dacsetVal);

		bargraph(dacsetVal, 2, 4096); //prints the davsetval to bargraph on the 3'rd row. scale full row to 4096 steps
		dacsetValOld = dacsetVal;
	}

	//currentDraw = readCurrent();
	if (tickTock == 0)
	{
		currentDraw = applyCalCurrent(readCurrent());
		if (currentDraw != currentDrawOLD) //update if value has changed
		{
			lcd.setCursor(0, 3);
			lcd.print("I: ");
			lcd.print("     ");
			lcd.setCursor(3, 3);
			lcd.print(currentDraw, 0);
			lcd.print("mA");
			currentDrawOLD = currentDraw;
			tickTock = 1;
		}
	}

	//vDisp = readVoltage();
	if (tickTock == 1)
	{
		vDisp = applyCalVoltage(readVoltage()); // get voltage and use our calibration
		if (vDisp != VinOLD)					//update if changed
		{
			lcd.setCursor(11, 3);
			lcd.print("V: ");
			lcd.print("     ");
			lcd.setCursor(14, 3);
			lcd.print(vDisp, 2);
			VinOLD = vDisp;
			tickTock = 0;
		}
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
}

float samples(int pin)
{ // Perform multiple iterations to get higher accuracy ADC values (reduce noise)

	float n = 5.0;   // number of iterations to perform
	float sum = 0.0; //store sum as a 32-bit number

	if (pin == 23) //voltage
	{

		for (int i = 0; i < n; i++)
		{
			float value = ads.readADC_Differential_2_3();

			sum = sum + value;
			delay(1); // makes readings slower - probably don't need this delay, but ¯\_(ツ)_/¯
		}
	}

	if (pin == 1) //current
	{

		for (int i = 0; i < n; i++)
		{
			float value = ads.readADC_Differential_0_1();

			sum = sum + value;
			delay(1); // makes readings slower - probably don't need this delay, but ¯\_(ツ)_/¯
		}
	}
	float average = sum / n; //store average as a 32-bit number with decimal accuracy
	return average;
}
float voltage(float adc, int gain)
{ // Get voltage ****************************************************************

	float V;
	switch (gain)
	{
	case 0: // default 2/3x gain setting for +/- 6.144 V
		V = adc * 0.0001875;
		break;
	case 1: // 1x gain setting for +/- 4.096 V
		V = adc * 0.000125;
		break;
	case 2: // 2x gain setting for +/- 2.048 V
		V = adc * 0.0000625;
		break;
	case 3: // 4x gain setting for +/- 1.024 V
		V = adc * 0.00003125;
		break;
	case 4: // 8x gain setting for +/- 0.512 V
		V = adc * 0.000015625;
		break;
	case 5: // 16x gain setting for +/- 0.256 V
		V = adc * 0.0000078125;
		break;

	default:
		V = 0.0;
		break;
	}
	return V;
}

float readCurrent()
{
	ads.setGain(gain[currentG]);
	while (1) // this function constantly adjusts the gain to an optimum level
	{

		adc = samples(1); // get avg ADC value from channel 2-3

		if (adc >= 20000 && currentG > 0) // if ADC is getting pegged at maximum value and is not the widest voltage range already, reduce the gain
		{

			currentG--;
			ads.setGain(gain[currentG]);
			delay(15);
		}
		else if (adc <= 7000 && currentG < 5)
		{
			// if ADC is reading very low values and is not the lowest voltage range already, increase the gain
			currentG++;
			ads.setGain(gain[currentG]);
			delay(15);
		}
		else
			break;
	}
	/* 	lcd.setCursor(0, 0);
	lcd.print(currentG); */

	adc = samples(1);			   // get avg ADC value from channel 2-3
	volt = voltage(adc, currentG); // convert ADC value to a voltage reading based on the gain
	volt = volt * 10000;
	return volt;
}

float readVoltage()
{
	ads.setGain(gain[voltageG]);
	while (1) // this function constantly adjusts the gain to an optimum level
	{

		adc = samples(23); // get avg ADC value from channel 2-3

		if (adc >= 20000 && voltageG > 0) // if ADC is getting pegged at maximum value and is not the widest voltage range already, reduce the gain
		{

			voltageG--;
			ads.setGain(gain[voltageG]);
			delay(15);
		}
		else if (adc <= 7000 && voltageG < 5)
		{
			// if ADC is reading very low values and is not the lowest voltage range already, increase the gain
			voltageG++;
			ads.setGain(gain[voltageG]);
			delay(15);
		}
		else
			break;
	}
	/* 	lcd.setCursor(2, 0);
	lcd.print(voltageG); */

	adc = samples(23);			   // get avg ADC value from channel 2-3
	volt = voltage(adc, voltageG); // convert ADC value to a voltage reading based on the gain
	volt = volt * 26.4;
	return volt;
}
/*
   ADS:

   // The ADC input range (or gain) can be changed via the following
   // functions, but be careful never to exceed VDD +0.3V max, or to
   // exceed the upper and lower limits if you adjust the input range!
   // Setting these values incorrectly may destroy your ADC!
   //                                                                ADS1015  ADS1115
   //                                                                -------  -------
   0// ads.setGain(GAIN_TWOTHIRDS);  // 2/3x gain +/- 6.144V  1 bit = 3mV      0.1875mV (default)
   1// ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
   2// ads.setGain(GAIN_TWO);        // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
   3// ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
   4// ads.setGain(GAIN_EIGHT);      // 8x gain   +/- 0.512V  1 bit = 0.25mV   0.015625mV
   5// ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV

   ads.begin();
 */
