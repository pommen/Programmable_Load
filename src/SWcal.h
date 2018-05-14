/*

#


*/
#include <LiquidCrystal_I2C.h>

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

void SWvoltageCal()
{
    int noOfIndex = 3;
    boolean BTNrelisedlocal = false;

    for (int i = 0; i < noOfIndex; i++)
    {
        /* code */
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("                  ");
        lcd.setCursor(0, 0);
        lcd.print("Set voltage to ");
        //lcd.setCursor(0, 1);
        lcd.print(voltageRange[i]);
        lcd.setCursor(0, 1);
        lcd.print("Press BTN ");
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelisedlocal = true;
            else             BTNrelisedlocal = false;


        while (digitalRead(rot_EncBTN) == LOW || BTNrelisedlocal == false)
        {
            if (digitalRead(rot_EncBTN) == LOW)
                BTNrelisedlocal = true;
            Vin = ads.readADC_Differential_2_3();
            vDisp = (Vin * 0.3125) / 400; //0.0625mV / bit
            lcd.setCursor(0, 2);
            lcd.print("                  ");
            lcd.setCursor(0, 2);
            lcd.print(vDisp);
            delay(50);
        }

        /*         delay(10);
        int minRange = (voltageRange[i] - (voltageRange[i] * 0.1));
        int maxRange = (voltageRange[i] + (voltageRange[i] * 0.1)); */

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
    for (int i = 0; i < noOfIndex; i++) //writes the voltage calibration values to eeprom. note the adressing when doing the same to current
    {
        int addr = voltageRangeCalADDR + i;
        EEPROM.write(addr, voltageRangeCal[i]);
    }

    for (int i = 0; i < noOfIndex; i++) //check the cal
    {
        int addr = voltageRangeCalADDR + i;

        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("Array Val: ");
        lcd.print(voltageRangeCal[i]);
        lcd.setCursor(0, 1);
        lcd.print("EEPROM val: ");
        lcd.print(EEPROM.read(addr));
        lcd.setCursor(0, 2);
        lcd.print("array NO[] : ");
        lcd.print(i);
        lcd.setCursor(0, 3);
        lcd.print("EEPROM ADDR:  ");
        lcd.print(addr);
        delay(2000);
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