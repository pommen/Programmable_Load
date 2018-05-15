/*

#


*/
#include <LiquidCrystal_I2C.h>

int voltageCalnoOfIndex = 24;

float voltageRangeCal[] = {
    1.00,  //
    2.00,  //
    3.00,  //
    4.00,  //
    5.00,  //
    6.00,  //
    7.00,  //
    8.00,  //
    9.00,  //
    10.00, //
    11.00, //
    12.00, //
    13.00, //
    14.00, //
    15.00, //
    16.00, //
    17.00, //
    18.00, //
    19.00, //
    20.00, //
    21.00, //
    22.00, //
    23.00, //
    24.00, //
};
float voltageRange[] = {
    1.00,  //
    2.00,  //
    3.00,  //
    4.00,  //
    5.00,  //
    6.00,  //
    7.00,  //
    8.00,  //
    9.00,  //
    10.00, //
    11.00, //
    12.00, //
    13.00, //
    14.00, //
    15.00, //
    16.00, //
    17.00, //
    18.00, //
    19.00, //
    20.00, //
    21.00, //
    22.00, //
    23.00, //
    24.00, //

};
float currantRangeCal[] = {
    0.00, //0-10 mA
    0.00, //10,1-50 mA
    0.00, //50,1-100 mA
    0.00, //100,1-200 mA
    0.00, //200,1-500 mA
    0.00, //500,1-800 mA
    0.00, //800,1-950 mA
    0.00, //950,1-1050 mA
    0.00, //1050,1-1200 mA
    0.00, //1200,1-1500 mA
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
};

void SWvoltageCal();
float applyCalVoltage(float input);
void SWvoltageCal()
{
    boolean BTNrelisedlocal = false;

    for (int i = 0; i < voltageCalnoOfIndex; i++)
    {
        /* code */
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("                  ");
        lcd.setCursor(0, 0);
        lcd.print("Set voltage to ");
        //lcd.setCursor(0, 1);
        lcd.print(voltageRange[i]);
        lcd.setCursor(0, 3);
        lcd.print("Press BTN ");
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelisedlocal = true;
        else
            BTNrelisedlocal = false;
        lcd.setCursor(0, 2);
        lcd.print("V in RAW: ");
        while (digitalRead(rot_EncBTN) == LOW || BTNrelisedlocal == false)
        {
            if (digitalRead(rot_EncBTN) == LOW)
                BTNrelisedlocal = true;
            Vin = ads.readADC_Differential_2_3();
            vDisp = (Vin * 0.3125) / 400; //0.0625mV / bit
            lcd.setCursor(12, 2);
            lcd.print("       ");
            lcd.setCursor(12, 2);
            lcd.print(vDisp);
            delay(50);
        }

        Vin = ads.readADC_Differential_2_3();
        vDisp = (Vin * 0.3125) / 400; //0.0625mV / bit
        lcd.print(vDisp);
        float temp = voltageRange[i] / vDisp; //får skinnaden mellan var ska borde vara, och vad det är
                                              /*   temp = temp - voltageRange[i];        //?? vi tar för att få skillnaden i %
        temp = temp + 1;                      //+1 så vi enkelt kan multiplisera för att göra om raw värde till kaliberat värde */
        voltageRangeCal[i] = temp;            //skriver caliberings % till minne
        lcd.print(voltageRangeCal[i]);
    } //end Calibration loop

    lcd.clear();

    for (int i = 0; i < voltageCalnoOfIndex; i++) //writes the voltage calibration values to eeprom. note the adressing when doing the same to current
    {
        int addr = voltageRangeCalADDR + i;
        float temp = voltageRangeCal[i];
        int eepromTemp = temp * 1000;
        EEPROM.write(addr, eepromTemp);
        float temp2 = EEPROM.read(addr) / 1000.0;
        float eepromTemp2 = eepromTemp / 1000.0;
        if (temp2 != eepromTemp2)
        {
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("Somethings wrong!");
            lcd.setCursor(0, 1);
            lcd.print("when writing the");
            lcd.setCursor(0, 2);
            lcd.print("cal too EEPROM");
            while (true)
            {
            }
        }
    }

    lcd.setCursor(0, 3);
    lcd.print("DONE!");
    delay(1000);

    lcd.clear();
    if (digitalRead(rot_EncBTN) == LOW)
        BTNrelisedlocal = true;

    while (digitalRead(rot_EncBTN) == LOW || BTNrelisedlocal == false)
    {
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelisedlocal = true;

        Vin = ads.readADC_Differential_2_3();
        vDisp = (Vin * 0.3125) / 400; //0.0625mV / bit
                                      //finn vilket kalibering värde vi ska använda

        int witchCalindex = vDisp;
        vDisp = vDisp * voltageRangeCal[witchCalindex];
        lcd.setCursor(0, 2);
        lcd.print("                  ");
        lcd.setCursor(0, 2);
        lcd.print(vDisp);
        lcd.setCursor(0, 1);
        lcd.print("                  ");
        lcd.setCursor(0, 1);
        lcd.print(voltageRangeCal[witchCalindex]);
        delay(50);
    }
}

void setupCal()
{ /*
this function is reading the EEPROM and putting it in to our calibration array

*/
    lcd.clear();
    for (int i = 0; i < voltageCalnoOfIndex; i++)
    {
        lcd.clear();
        int addr = voltageRangeCalADDR + i;
        int temp = EEPROM.read(addr);
        voltageRangeCal[i] = temp / 1000.0;
        lcd.setCursor(0, 0);
        lcd.print("EEPROM addr: ");
        lcd.print(addr);
        lcd.setCursor(0, 1);
        lcd.print(" CAL Val: ");
        lcd.print(voltageRangeCal[i],3);
        delay(50);
    }
}

float applyCalVoltage(float input)
{
    //input example 2.68 volts
    float blend = input;       //blandningen mellan de olika kaliberings värdena i procent
    int witchCalindex = input; //vilken kaliberings värde ska vi använda voltageRangeCal[]

    //first get the blend (%) between the two numbers.

    int findHigherInputVal = input; //by making a int from a float we disregard the fraction and get the whole numbers ex. 2

    //now remove the integer, and get left with the fraction.
    blend = blend - findHigherInputVal; // ex 2.68 - 2 = 0.68 this means that 68 is the distance between the the diffrent calibrationvalues.

    //now we need to look up the calibration values we need. I chose extreme values for the example

    float firstVal = voltageRangeCal[witchCalindex];      //ex: calibration value for 2 Volt =  1.78
    float secondVal = voltageRangeCal[witchCalindex + 1]; //ex: calibration value for 3 Volts =  0.89
    // this means that the slope(imagine that we draw a line between our two calibration values, its almost always a slope) goes downwards, from 1.78 to 0.89

    //subtract the second from the first to get the slope value (diffrence)
    float slope = secondVal - firstVal; //this would be 0.89 - 1.78 = -0.89

    //now its time to figure out what the actual value is. we know in our case that its between 1.78 and 0.89. we also know that its closer towards the second than the first(it's 68% of the way).

    slope = slope * blend; /* 68% of the diffrence between the two values is -0.89 x 0.68 = -0.6052. This is the number that we add to our first value. in this case: 1.78 + -0.6052 = 1.1748. 
    In other words: the distance between the two calibration values is -0.89. as we 68% on our way to the other value we take 68% of the distance (slope). That value is added to our first value, with gives us our actual calibraion value.
    */

    float ActualCalVal = firstVal + slope; // 2.68 + -0.6052 = 1.1748
    float outPut = input * ActualCalVal;   // do the calibration caluculation: 2.68 *1.1748 = 3.14865 Volts

    return outPut; //return our finnished caluculation
}