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

#include <Arduino.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Adafruit_MCP4725.h>
#include <Adafruit_ADS1015.h>

LiquidCrystal_I2C lcd(0x3f,20,4);
Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */
Adafruit_MCP4725 dac;



//functions:
void initEncoders();
void updateDisp();
void bargraph(int length, int row, int full);
void setDAC();
void click();
void debounce();

//Vars:
int lastEncVal =0;
boolean BTN = false;
int deboundeTime = 0;
int doubleClick =0;
float blockTemp =0.0;
int temptime =0;


//pins:

int pwmOut = PA9;
int clicker = PB13;
int blockTempPin = PB0;


//encoder stuff:
#define MAXENCODERS 2
volatile int encstate[MAXENCODERS];
volatile int encflag[MAXENCODERS];
boolean A_set[MAXENCODERS];
boolean B_set[MAXENCODERS];
volatile int16_t encoderpos[MAXENCODERS];
volatile int encodertimer = millis();  // acceleration measurement
int encoderpinA[MAXENCODERS] = {PA4, PA6}; // pin array of all encoder A inputs
int encoderpinB[MAXENCODERS] = {5, 7}; // pin array of all encoder B inputs
unsigned int lastEncoderPos[MAXENCODERS];

// timer
#define ENCODER_RATE 1000    // in microseconds;
HardwareTimer timer(1);
uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};

uint8_t graph1[] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};
uint8_t graph2[] = {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18};
uint8_t graph3[] = {0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c};
uint8_t graph4[] = {0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e};
uint8_t graph5[] = {0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f};
uint8_t graph6[8] = {
	0b11100,
	0b10100,
	0b11100,
	0b00000,
	0b00000,
	0b00000,
	0b00000,
	0b00000
};
void setup()
{

        Serial.begin(9600);
        initEncoders();
        pinMode(pwmOut, PWM);
        pinMode(clicker, INPUT_PULLUP);
        pinMode(blockTempPin, INPUT_ANALOG);
        attachInterrupt(clicker, click, FALLING);
        lcd.init();                  // initialize the lcd // For Adafruit MCP4725A1 the address is 0x62 (default) or 0x63 (ADDR pin tied to VCC)



        // For MCP4725A0 the address is 0x60 or 0x61
        // For MCP4725A2 the address is 0x64 or 0x65
        //  dac.setVoltage(0, true); Set DAC eeprom frist time to startup as 0
        // For Adafruit MCP4725A1 the address is 0x62 (default) or 0x63 (ADDR pin tied to VCC)
        // For MCP4725A0 the address is 0x60 or 0x61
        // For MCP4725A2 the address is 0x64 or 0x65
        dac.begin(0x62);
        //  dac.setVoltage(0, true); Set DAC eeprom frist time to startup as 0.00v Do this once per DAC.

        lcd.backlight();
        lcd.clear();
        lcd.setCursor(0, 0 );
        lcd.print("Programmable Load");
        lcd.createChar(0, heart);
        lcd.createChar(1, graph1);
        lcd.createChar(2, graph2);
        lcd.createChar(3, graph3);
        lcd.createChar(4, graph4);
        lcd.createChar(5, graph5);
        lcd.createChar(6, graph6);

        lcd.print(1);

delay(500);
lcd.clear();

/*
        for (size_t i = 0; i < 4095; i=i+50) {
                bargraph(i, 2,41);
                bargraph(i, 3,41);
                delay(100);
        }
        lcd.clear();
 */

        ads.begin();
        // ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
        for (byte counter = 0; counter < MAXENCODERS; counter++) {
                encoderpos[counter] =0;
        }

}
void loop()
{

        for (byte counter = 0; counter < MAXENCODERS; counter++)
        {
                if ((lastEncoderPos[counter] != encoderpos[counter])) {
                        Serial.print("Encoder #");
                        Serial.print(counter);
                        Serial.print(" Value ");
                        Serial.println(encoderpos[counter]);
                        encflag[counter] = LOW;
                        lastEncoderPos[counter] = encoderpos[counter];
                        setDAC();
                        updateDisp();

                }
        }

        if (BTN == true) {
                for (byte counter = 0; counter < MAXENCODERS; counter++) {
                        encoderpos[counter] =0;
                }
                BTN = false;
        }

                if (millis() - temptime >= 1000) {
                        lcd.setCursor(17,0);
                        lcd.print("  ");
                        blockTemp = analogRead(blockTempPin);
                      blockTemp = (blockTemp  / 4) /10;
                        lcd.setCursor(17,0);
                        lcd.print(blockTemp,0);
                        lcd.write(6);
                        temptime=millis();
                }


}



void click(){
        if (millis() - doubleClick < 250) BTN = true;
        else doubleClick = millis();

        BTN = true;
}


void setDAC(){
        dac.setVoltage(encoderpos[0], false);
        int pwmDuty = ((65535 / 4095)*  encoderpos[1])/2;
        pwmWrite(pwmOut, pwmDuty);


}

void updateDisp(){

        lcd.setCursor(0, 1);
        lcd.print("Enc1: ");
        lcd.print(encoderpos[0]);
        lcd.print("  Enc1: ");
        lcd.print(encoderpos[1]);
        bargraph(encoderpos[0]*10, 2,410);
        bargraph(encoderpos[1]*10, 3,410);


}

void bargraph(int length, int row, int full){
        if (length == 0 ) {
                lcd.setCursor(0, row);
                lcd.print(" ");
                return;
        }
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


        if (fullablock > 19) {
                fullablock = 19;
                delAvBlock=4;
        }

        if (fullablock >0) {    //printa fulla block om det behövs
                for (int i = 0; i < fullablock; i++) {
                        lcd.write(5);
                }
                if (fullablock<lastEncVal && fullablock>0) lcd.print(" "); //om vi går bakår så suddar vi ut det som var framför
                lcd.setCursor(fullablock, row);
        }


        if (delAvBlock>0) lcd.write(delAvBlock); //printa pixel om det behövs

        if (fullablock<lastEncVal && fullablock>0) { //sudda ut den gamla om vi går nedåt
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


// ********encoder function
void readEncoders() {
        for (byte counter = 0; counter < MAXENCODERS; counter++)
        {
                if ( (gpio_read_bit(PIN_MAP[encoderpinA[counter]].gpio_device, PIN_MAP[encoderpinA[counter]].gpio_bit) ? HIGH : LOW) != A_set[counter] )
                {
                        A_set[counter] = !A_set[counter];
                        if ( A_set[counter] && !B_set[counter] )
                        {
                                if (millis() - encodertimer > 5)
                                        encoderpos[counter] += 1;
                                else
                                if (millis() - encodertimer > 3)
                                        encoderpos[counter] += 5;

                                else
                                        encoderpos[counter] += 10;
                        }
                        if (encoderpos[counter] > 4095 ) encoderpos[counter] = 4095;        //make sure encoderpos dosent count negative or higher than 12 bit.


                        encodertimer = millis();
                }
                if ( (gpio_read_bit(PIN_MAP[encoderpinB[counter]].gpio_device, PIN_MAP[encoderpinB[counter]].gpio_bit) ? HIGH : LOW) != B_set[counter] )
                {
                        B_set[counter] = !B_set[counter];
                        if ( B_set[counter] && !A_set[counter] )
                                if (millis() - encodertimer > 5)
                                        encoderpos[counter] -= 1;
                                else
                                if (millis() - encodertimer > 3)
                                        encoderpos[counter] -= 5;

                                else
                                        encoderpos[counter] -= 10;
                        if (encoderpos[counter] < 0 ) encoderpos[counter] =0;                        //make sure encoderpos dosent count negative or higher than 12 bit.


                        encodertimer = millis();
                }
        }
}

void initEncoders(){
        encodertimer = millis(); // acceleration measurement
        for (byte counter = 0; counter < MAXENCODERS; counter++)
        {
                encstate[counter] = HIGH;
                encflag[counter] = HIGH;
                A_set[counter] = false;
                B_set[counter] = false;
                encoderpos[counter] = 0;
                pinMode(encoderpinA[counter], INPUT);
                pinMode(encoderpinB[counter], INPUT);
                lastEncoderPos[counter] = 1;
        }
        // timer setup for encoder
        timer.pause();
        timer.setPeriod(ENCODER_RATE); // in microseconds
        timer.setChannel1Mode(TIMER_OUTPUT_COMPARE);
        timer.setCompare(TIMER_CH1, 1); // Interrupt 1 count after each update
        timer.attachCompare1Interrupt(readEncoders);
        timer.refresh();
        timer.resume();
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
