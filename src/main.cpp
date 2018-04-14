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
#include <PID_v1.h>

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

//Vars:
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
#include <LM75.h>
//custom chars:
uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};
uint8_t graph1[] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};
uint8_t graph2[] = {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18};
uint8_t graph3[] = {0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c};
uint8_t graph4[] = {0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e};
uint8_t graph5[] = {0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f};
uint8_t graph6[8] = { 0b11100, 0b10100, 0b11100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000};

void setup(){

								Wire.begin();
								Wire.setClock(400000);
								pinMode(rot_EncA, INPUT);
								pinMode(rot_EncB, INPUT);
								pinMode(rot_EncBTN, INPUT);
								pinMode(out1, OUTPUT);
								pinMode(out2, OUTPUT);
								pinMode(blockTempPin, INPUT_ANALOG);
								//pinMode(loadEnabledPin, OUTPUT);
								lcd.init();  // initialize the lcd
								lcd.backlight();
								lcd.print("Programmable Load");
								lcd.clear();
								lcd.setCursor(0, 0 );
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

								lcd.createChar(0, heart);
								lcd.createChar(1, graph1);
								lcd.createChar(2, graph2);
								lcd.createChar(3, graph3);
								lcd.createChar(4, graph4);
								lcd.createChar(5, graph5);
								lcd.createChar(6, graph6);


								ads.begin();
								//	ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV

								//40V = 0.76V, 3.8A=0.47V

								//ads.setGain(GAIN_ONE);         // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
								//	i2cScanner();
								attachInterrupt(rot_EncB, Rot_enc_ISR, FALLING);

								//digitalWrite(loadEnabledPin, LOW);
								analogWrite(out2, 254/2); //cabinett fläkten

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

																setDAC();
								}
								if (digitalRead(rot_EncBTN) == HIGH) {
																dacset = 0;
																rot_enc=0;
																setDAC();
								}
								//clickHeldTime = millis();

//writes the coolingblock temperatur every sec
								if (millis() - temptime >= 1000) {

																lcd.setCursor(17,0);
																lcd.print("  ");
																blockTemp = analogRead(blockTempPin);
																blockTemp = (blockTemp  / 4) /10;
																lcd.setCursor(17,0);
																lcd.print(blockTemp,0);
																lcd.write(6);//grader symbolen
																//lcd.setCursor(17,1);
																//lcd.print(sensor.temp(),0);   // call to working lm75 function
																//lcd.write(6); //grader symbolen


																temptime=millis();

								}
								if (blockTemp > 30) {

																analogWrite(out1, 255-100);
								}
								if (blockTemp > 35) {

																analogWrite(out1, 255-150);
								}
								if (blockTemp > 40) {

																analogWrite(out1, 255-200);
								}
								if (blockTemp > 45) {

																analogWrite(out1, 0);
								}
								if (blockTemp < 25) {
																analogWrite(out1, 255);
								}

}


void setDAC(){
								dac.setVoltage(dacset, false);

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
