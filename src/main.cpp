/*


   ==============  Variable load  ================

   Currently running on bluepill

    --------------------
   DAC = 4096 steps (12 bit)
   ADC = 65536 steps (16bit)
   ref to VCC on breakout
    --------------------

   I2C addresses:

   LCD:0x3F (63)
   DAC:0x60
   ADC:0x48 (72)
   INA219: 0x4A
   DS3231 (RTC):0x68
   LM75:

   ADC inouts:
              A0:Current set gain (trim to 1.1v @ max steps)
              A1:zerocurrent (Trim to 0v at min steps)
              A2:input volta ge
              A3:Voltagedrop over shunt

 */

#include <Arduino.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Adafruit_MCP4725.h>
#include <Adafruit_ADS1015.h>
#include <Adafruit_INA219.h>
#include <RTClib.h>


RTC_DS3231 rtc;
Adafruit_INA219 ina219(0x4A);
LiquidCrystal_I2C lcd(0x3f,20,4);
Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;



//functions:
void updateDisp();
void bargraph(int length, int row, int full);
void setDAC();
void debounce();
void getADC();
void status();
void printTime();

//Vars:
char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int lastEncVal =0;
bool clickHeld = false;
int clickHeldTime =0;
float blockTemp =0.0;
int temptime =0;
int currentDraw =0;
int currentDrawOLD =99; //för att kolla om vi ska uppdatera LCD
int Vin =0;
int VinOLD =99; //för att kolla om vi ska uppdatera LCD
int lcdUpdateTime = 500;
int vintemp =0;
int rot_EncA_Value =0;
volatile int rot_enc =0; //rotational encoder. needs to volatile. Gets input frpm ISR
int dacset = 0; //this is the 14 bit numer that we send to the dac.
int dacsetOld=99; //place holder for dac output. to compare if we need to update
long int accelTimer=0; //acceleration timer for the rotantion encoder
long int statusTimer=99;
int loadOn = 0;

//pins:
const int out1 = PA7;
const int out2 = PB1;
const int blockTempPin = PB0;
//const int loadEnabledPin = PA12;
const int rot_EncA = PA15;
const int rot_EncB = PB4;
const int rot_EncBTN = PB5;
//const int compratorPin = PA11;
const int trig = PA4;
const int fetTemp = PA0;
const int tempAlarm = PA8;

//custom files:
#include <enc.h>
#include <LCDBargraph.h>
#include <I2CscannerLCD.h>
#include <Sorting.h>
#include <printTime.h>
#include <TempControl.h>
#include <LCDsetup.h>



void setup(){

								Wire.begin();
								Wire.setClock(400000);
								pinMode(rot_EncA, INPUT);
								pinMode(rot_EncB, INPUT);
								pinMode(rot_EncBTN, INPUT);
								pinMode(out1, OUTPUT); //göra om denna till opendrain pwm?
								pinMode(out2, OUTPUT);
								pinMode(blockTempPin, INPUT_ANALOG);
								digitalWrite(out1, HIGH); //stänger av fläkten
								pinMode(trig, INPUT);
								//pinMode(loadEnabledPin, OUTPUT);
								setupLCD();

								// Initialize the INA219.
								// By default the initialization will use the largest range (32V, 2A).  However
								// you can call a setCalibration function to change this range (see comments).
								ina219.begin();
								// To use a slightly lower 32V, 1A range (higher precision on amps):
								ina219.setCalibration_32V_1A();
								// Or to use a lower 16V, 400mA range (higher precision on volts and amps):
								//		ina219.setCalibration_16V_400mA();

								// For MCP4725A0 the address is 0x60 or 0x61
								// For MCP4725A2 the address is 0x64 or 0x65
								//  dac.setVoltage(0, true); Set DAC eeprom frist time to startup as 0
								// For Adafruit MCP4725A1 the address is 0x62 (default) or 0x63 (ADDR pin tied to VCC)
								// For MCP4725A0 the address is 0x60 or 0x61
								// For MCP4725A2 the address is 0x64 or 0x65
								dac.begin(0x60);
								dac.setVoltage(0, false);  //Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.

								ads.begin();
								//	ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
								//40V = 0.76V, 3.8A=0.47V
								//ads.setGain(GAIN_ONE);         // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV

								setupRTC();
								printTime();
								delay(3000);
								//	i2cScanner();
								attachInterrupt(rot_EncB, Rot_enc_ISR, FALLING);
								//digitalWrite(loadEnabledPin, LOW);
								analogWrite(out2, 254/2); //cabinett fläkten
								lcd.clear();

}

void loop(){


								Serial.println(dacset);
								if (millis() - lcdUpdateTime >= 1000) updateDisp();


								if (rot_enc != dacset) {
																if (rot_enc < 0) {
																								dacset = 0;
																}
																else if (rot_enc > 4096) {
																								dacset = 4095;
																}
																else dacset=rot_enc;

								}


								if (digitalRead(rot_EncBTN) == HIGH) {

								}
								//clickHeldTime = millis();
								temperature();
//writes the coolingblock temperatur every sec
								if (digitalRead(trig) == HIGH && loadOn == 0) {
																dac.setVoltage(dacset, false);
																loadOn =1;

								} else{
																dacset = 0;
																rot_enc=0;
																loadOn =0;
								}

}




void status(){
								lcd.setCursor(12, 0);
								lcd.print("   ");
								lcd.setCursor(0, 0);
								lcd.print("V:");
								lcd.print(ina219.getBusVoltage_V());
								lcd.print(" mA:");
								lcd.print(ina219.getCurrent_mA(), 0);
}

void getADC(){/*
	                int vintemp[9];
	                int currtemp[9];
	                for (size_t i = 0; i < 9; i++) { //tar 10 mätningar
	                vintemp[i] =  ads.readADC_Differential_0_1();
	                currtemp[i] = ads.readADC_Differential_2_3();
	                }
	                Vin = sorting(vintemp);
	                currentDraw = sorting(currtemp);


	                Vin = ads.readADC_Differential_0_1() * 0.03125;
	                currentDraw = ads.readADC_Differential_2_3() * 0.03125;

	              */





}

void updateDisp(){

								if (dacset != dacsetOld) {

																lcd.setCursor(0, 1);
																lcd.print("Dac:     ");
																lcd.setCursor(5, 1);

																lcd.print(dacset);
																bargraph(dacset, 2,4096);
																dacsetOld = dacset;
								}
								delay(50);

								currentDraw = ads.readADC_Differential_0_1() *0.1875;
								if (currentDraw != currentDrawOLD) {
																lcd.setCursor(0, 3);
																lcd.print("I: ");
																lcd.print("     ");
																lcd.setCursor(3, 3);
																lcd.print(currentDraw);
																lcd.print("mA");
																currentDrawOLD = currentDraw;
								}
								delay(50);
								Vin = ads.readADC_Differential_2_3();
								if (Vin != VinOLD) {
																/* code */
																float vDisp = (Vin  * 0.01875) / 2;

																lcd.setCursor(11, 3);
																lcd.print("V: ");
																lcd.print("     ");
																lcd.setCursor(14, 3);
																lcd.print(vDisp, 2);
																VinOLD = Vin;
								}

								if (millis() - statusTimer >500) { //uppdatera status varje gång denna slår in
																/* code */
																statusTimer = millis();
																status();
								}
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
