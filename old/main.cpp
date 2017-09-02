/*


   ==============  Variable load  ================


    --------------------
   DAC = 4096 steps (12 bit)
   ADC = 65536 steps (16bit)
   ref to VCC on breakout
    --------------------

   I2C addresses:

   LCD:0x3F (63)
   DAC:0x62 (98)
   ADC:0x48 (72)
   POT1:0x2C (44) - max gain set
   POT2:0x2f (47) - set 0 current

   ADC inouts:
              A0:Current set gain (trim to 1.1v @ max steps)
              A1:zerocurrent (Trim to 0v at min steps)
              A2:input voltage
              A3:Voltagedrop over shunt

 */


//Libs:


#include "Wire.h"
#include <Arduino.h>
#include <LiquidCrystal_I2C.h>
#include <ClickEncoder.h>
#include <TimerOne.h>
#include <Adafruit_MCP4725.h>
#include <Adafruit_ADS1015.h>


//Functions:
void update();
void timerIsr();
void bargraph();
void CalMax();
void CalZero();



//Globals:
int calsteps[4095];
float CalMaxSteps =0.0;
int encVal =0;
int dacVal =0;
int adcVal = 0;
float dacOut = 0.000;
float blockTemp=0.0;
int rangeMult=10;
int rangeSelect =0;
int lastrangeSelect =1;
long temptime =0;
long updatetime =0;
int lastEncVal =0;



Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;
ClickEncoder *encoder;
int16_t last;
LiquidCrystal_I2C lcd(0x3F,20,4);  // set the LCD address to 0x27 for a 20 chars and 4 line display


uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};

uint8_t graph1[] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};
uint8_t graph2[] = {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18};
uint8_t graph3[] = {0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c};
uint8_t graph4[] = {0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e};
uint8_t graph5[] = {0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f};

void setup()
{
        pinMode(8, OUTPUT);
        lcd.init();                // initialize the lcd
        // Print a message to the LCD.
        lcd.backlight();
        lcd.clear();
        lcd.setCursor( 3, 0 );
        lcd.print("Variable Load");
        delay(700);
        lcd.clear();

        Serial.begin(9600);
        encoder = new ClickEncoder(2, 3, 4);
        Timer1.initialize(1000);
        Timer1.attachInterrupt(timerIsr);

        last = -1;
        encoder->setAccelerationEnabled(true);


// For Adafruit MCP4725A1 the address is 0x62 (default) or 0x63 (ADDR pin tied to VCC)
// For MCP4725A0 the address is 0x60 or 0x61
// For MCP4725A2 the address is 0x64 or 0x65
        dac.begin(0x62);
        //  dac.setVoltage(0, true); Set DAC eeprom frist time to startup as 0

        ads.begin();
        // ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV

        lcd.createChar(0, heart);
        lcd.createChar(1, graph1);
        lcd.createChar(2, graph2);
        lcd.createChar(3, graph3);
        lcd.createChar(4, graph4);
        lcd.createChar(5, graph5);
        lcd.print(1);

        lcd.setCursor(0,0);
        lcd.print(rangeMult);
        delay(50);
        digitalWrite(8, LOW);
        CalMax();// Setting max output to 1.1A
//CalZero();

}



void timerIsr() {
        encoder->service();
}



void loop() {


        if (millis() - temptime >= 1000) {
                lcd.setCursor(16,0);
                lcd.print("   ");
                blockTemp = (analogRead(A0) * 0.0048828125);
                blockTemp = blockTemp*100;
                lcd.setCursor(16,0);
                lcd.print(blockTemp,1);
                temptime=millis();
        }

        encVal += (encoder->getValue() * rangeMult);
        if (encVal <=0) encVal=0;
        if (encVal >=4095) encVal=4095;
        dacVal=encVal;


        ClickEncoder::Button b = encoder->getButton();
        if (b != ClickEncoder::Open) {
                switch (b) {
                case ClickEncoder::DoubleClicked:
                        encVal =0;
                        lcd.clear();
                        break;
                case ClickEncoder::Clicked:
                        rangeSelect++;

                        if (rangeSelect == 3) rangeSelect =0;
                        Serial.print("rangeSelect: ");
                        Serial.println(rangeSelect);
                        Serial.print("lastrangeSelect: ");
                        Serial.println(lastrangeSelect);

                        break;

                case ClickEncoder::Held:
                        break;
                }

        }


        if (rangeSelect != lastrangeSelect) {

                switch (rangeSelect) {

                case 0:
                        rangeMult = 10;
                        lcd.setCursor(0,0);
                        lcd.print("   ");
                        lcd.setCursor(0,0);
                        lcd.print(rangeMult);
                        break;
                case 1:
                        rangeMult = 100;
                        lcd.setCursor(0,0);
                        lcd.print("   ");
                        lcd.setCursor(0,0);

                        lcd.print(rangeMult);
                        break;

                case 2:
                        rangeMult = 1;
                        lcd.setCursor(0,0);
                        lcd.print("   ");
                        lcd.setCursor(0,0);
                        lcd.print(rangeMult);
                        break;
                }

                lastrangeSelect = rangeSelect;

        }

        if (millis() - updatetime >= 300) {
                update();
                updatetime = millis();


        }
}

void bargraph(int length, int row, int full){
        lastEncVal=length;
        int fullablock =0;
        int delAvBlock=0;
        int temp=0;

        lcd.setCursor(0, row); // set cursor to commanded row
        //  lcd.print("                    ");
        length = length/full; //scale dac resolution to length of row

        fullablock = length/5; //figure out how many filled we need

        delAvBlock=fullablock*5;  //how many partly filled do we need?
        temp=fullablock*5;
        delAvBlock=length-temp;


        if (fullablock >0) {    //printa fulla block om det behövs
                for (int i = 0; i < fullablock; i++) {
                        lcd.write(5);
                }
                if (fullablock<lastEncVal && fullablock>0) lcd.print(" "); //om vi går bakår så suddar vi ut det som var framför
                lcd.setCursor(fullablock, row);
        }


        if (delAvBlock>0) lcd.write(delAvBlock); //printa pixel om det behövs

        if (fullablock<lastEncVal && fullablock>0) {

                lcd.setCursor(fullablock+1, row);
                int clear =19-fullablock;
                for (size_t i = 0; i < clear; i++) {
                        lcd.print(" ");
                }

        }

        if (fullablock<lastEncVal && fullablock==0) { //sudda ut den näst sista om vi äar på 0 fulla
                lcd.setCursor(1, row);
                lcd.print(" ");

        }

        lastEncVal=fullablock;

}
void update(){
        float Aset=0.00;
        last = encVal;
        lcd.setCursor(0, 1);
        bargraph(encVal, 1,41);
        /*
                               lcd.setCursor(0, 1);
                               lcd.print("EncVal:         ");
                               Serial.println(encVal);
                               lcd.setCursor(8, 1);
                               lcd.print(encVal);
         */
        dac.setVoltage(encVal, false);

        lcd.setCursor(0, 2);
        lcd.print("Current set");
        lcd.setCursor(0, 3);
        Aset=(ads.readADC_SingleEnded(0)*0.1875);

        if (Aset <50) {
          /* code */

        lcd.print(Aset*10,0);
        lcd.print("mA");
        lcd.print(" ");
      }
      else
      {
        lcd.print(Aset/100,2);
        lcd.print("A");
        lcd.print(" ");

      }
}



void CalMax(){
        /*
           Calibrating the max dac output to 1.1V
         */
        lcd.setCursor(5, 1);
        lcd.println("Calibrating");
        int i =10;

        Wire.beginTransmission(0x2c);
        Wire.write(12);
        Wire.write(0);
        Wire.endTransmission();

        dac.setVoltage(4095, false);
        CalMaxSteps = ads.readADC_SingleEnded(0)*0.1875,2;
        if (CalMaxSteps < 1100) {

                while (CalMaxSteps <1100 ) {

                        CalMaxSteps = ads.readADC_SingleEnded(0)*0.1875,2;
                        Serial.println(CalMaxSteps);
                        Wire.beginTransmission(0x2c);
                        Wire.write(12);
                        Wire.write(i);
                        Wire.endTransmission();
                        delay(100);
                        i++;
                }
        }
        if (CalMaxSteps > 1110) {
                while (CalMaxSteps >1110 ) {

                        CalMaxSteps = ads.readADC_SingleEnded(0)*0.1875,2;
                        Serial.println(CalMaxSteps);
                        Wire.beginTransmission(0x2c);
                        Wire.write(12);
                        Wire.write(i);
                        Wire.endTransmission();
                        delay(100);
                        i--;

                }
        }
        delay(100);
        dac.setVoltage(0, false);
        /*
           for (size_t i = 0; i < 4095; i++) {
           dac.setVoltage(i, false);
           delay(50);
           calsteps[i] = ads.readADC_SingleEnded(1)*0.1875,2;
           }
           dac.setVoltage(0, false);
         */
        lcd.clear();

}
/* ClickEncoder button codes


   ClickEncoder::Button b = encoder->getButton();
   if (b != ClickEncoder::Open) {
        Serial.print("Button: ");
 #define VERBOSECASE(label) case label: Serial.println(#label); break;
        switch (b) {
                VERBOSECASE(ClickEncoder::Pressed);
                VERBOSECASE(ClickEncoder::Held)
                VERBOSECASE(ClickEncoder::Released)
                VERBOSECASE(ClickEncoder::Clicked)
        case ClickEncoder::DoubleClicked:
                Serial.println("ClickEncoder::DoubleClicked");
                encoder->setAccelerationEnabled(!encoder->getAccelerationEnabled());
                Serial.print("  Acceleration is ");
                Serial.println((encoder->getAccelerationEnabled()) ? "enabled" : "disabled");
                displayAccelerationStatus();
                break;
        }
   }



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
