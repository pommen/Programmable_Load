/*

#


*/
#include <LiquidCrystal_I2C.h>

float voltageRangeCal[] = {
    //holds calibration data read from eeprom in setup
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
    25.00, //
    26.00, //
    27.00, //
    28.00, //
    29.00, //
    30.00, //
    31.00, //
    32.00, //
    33.00, //
    34.00, //
    35.00, //
    36.00, //
    37.00, //
    38.00, //
    39.00, //
    40.00, //
    41.00, //
    42.00, //
    43.00, //
    44.00, //
    45.00, //
    46.00, //
    47.00, //
    48.00, //
    49.00, //
    50.00, //

};
int voltageRange[] = {
    //this is my calibration points, in volts.
    1,  //
    2,  //
    3,  //
    4,  //
    5,  //
    6,  //
    7,  //
    8,  //
    9,  //
    10, //
    11, //
    12, //
    13, //
    14, //
    15, //
    16, //
    17, //
    18, //
    19, //
    20, //
    21, //
    22, //
    23, //
    24, //
    25, //
    26, //
    27, //
    28, //
    29, //
    30, //
    31, //
    32, //
    33, //
    34, //
    35, //
    36, //
    37, //
    38, //
    39, //
    40, //
    41, //
    42, //
    43, //
    44, //
    45, //
    46, //
    47, //
    48, //
    49, //
    50, //

};
float currentRange[] = {
    //this is my calibration points, in in milliAmpere's.
    10,    //
    20,    //
    50,    //
    70,    //
    100,   //
    150,   //
    200,   //
    250,   //
    300,   //
    350,   //
    400,   //
    450,   //
    500,   //
    600,   //
    700,   //
    800,   //
    900,   //
    1000,  //
    1200,  //
    1400,  //
    1600,  //
    1800,  //
    2000,  //
    2500,  //
    3000,  //
    3600,  //
    4600,  //
    5000,  //
    5600,  //
    6000,  //
    6600,  //
    7000,  //
    7600,  //
    8000,  //
    8600,  //
    9000,  //
    9600,  //
    10000, //
};
    int currentRangeTarget[] = {
        //this is my calibration points, in in milli Ampere's.
        10,    //
        20,    //
        50,    //
        70,    //
        100,   //
        150,   //
        200,   //
        250,   //
        300,   //
        350,   //
        400,   //
        450,   //
        500,   //
        600,   //
        700,   //
        800,   //
        900,   //
        1000,  //
        1200,  //
        1400,  //
        1600,  //
        1800,  //
        2000,  //
        2500,  //
        3000,  //
        3600,  //
        4600,  //
        5000,  //
        5600,  //
        6000,  //
        6600,  //
        7000,  //
        7600,  //
        8000,  //
        8600,  //
        9000,  //
        9600,  //
        10000, //
    };
float currentRangeCal[] = {
    //holds calibration data read from eeprom in setup
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
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
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
void SWcurrentCal();
float applyCalCurrent(float input);

void setupCal()
{ /*this function is reading the EEPROM and putting it in to our calibration array*/
    lcd.clear();
    for (int i = 0; i < voltageCalnoOfIndex; i++)
    {
        int addr = voltageRangeCalADDR + i;
        int temp = EEPROM.read(addr);
        voltageRangeCal[i] = temp / 1000.0;
        /*    lcd.setCursor(0, 0);
        lcd.print("EEPROM addr: ");
        lcd.print(addr);
        lcd.setCursor(0, 1);
        lcd.print(" CAL Val: ");
        lcd.print(voltageRangeCal[i], 3); */
        delay(2);
    }
    int addr = currentRangeADDR;

    for (int i = 0; i < currentCalnoOfIndex; i++)
    {

        int temp = EEPROM.read(addr);
        currentRangeCal[i] = temp; //heltal
        delay(2);
        addr = addr + 1;

        currentRange[i] += EEPROM.read(addr) / 100.0; //fraktioner
        /*       lcd.setCursor(0, 0);
        lcd.print("EEPROM addr: ");
        lcd.print(addr);
        lcd.setCursor(0, 1);
        lcd.print(" CAL Val: ");
        lcd.print(currentRangeCal[i], 3); */
        delay(2);
    }
    for (int i = 0; i < currentCalnoOfIndex; i++)
    {
        int addr = currentRangeCalADDR + i;
        int temp = EEPROM.read(addr);
        currentRangeCal[i] = temp / 1000.0;
        delay(2);
    }
}

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
            vDisp = readVoltage();
            lcd.setCursor(12, 2);
            lcd.print("       ");
            lcd.setCursor(12, 2);
            lcd.print(vDisp);
            delay(50);
        }

        vDisp = readVoltage();
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
        vDisp = readVoltage();
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

void SWcurrentCal()
{
    boolean BTNrelisedlocal = false;

    for (int i = 0; i < currentCalnoOfIndex; i++)
    {                                /* här ska vi:

    *visa vilken ca range vi är ute efter.
    *fråga vilken fansikt currentnrage det är, via enc.
    *spara range
    *göra vanliga kalibering offseten

    */
        int addr = currentRangeADDR; //här börjar eeprom ardressen
        //////////ställ in det här värdet:
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("                  ");
        lcd.setCursor(0, 0);
        lcd.print("Set Current near ");
        lcd.setCursor(0, 1);
        lcd.print(currentRangeTarget[i]);
        lcd.print(" mA");
        lcd.setCursor(0, 3);
        lcd.print("Press BTN ");
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelisedlocal = true;
        else
            BTNrelisedlocal = false;
        lcd.setCursor(0, 2);
        lcd.print("mA in RAW: ");

        while (digitalRead(rot_EncBTN) == LOW || BTNrelisedlocal == false)
        {
            read_encoder(); //do encoderstuff get updated values. call often
            temperature(1);
            loadSwitching(1);

            if (digitalRead(rot_EncBTN) == LOW)
                BTNrelisedlocal = true;
            currentDraw = readCurrent();
            lcd.setCursor(12, 2);
            lcd.print("       ");
            lcd.setCursor(12, 2);
            lcd.print(currentDraw);
            delay(50);
        }
        ///////////////////////vär är det faktiska värdet?
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("                  ");
        lcd.setCursor(0, 0);
        lcd.print("Set actual current ");
        lcd.setCursor(0, 1);
        lcd.print("then Press BTN ");

        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelisedlocal = true;
        else
            BTNrelisedlocal = false;

        float actualCurrent = 0.00;
        actualCurrent = currentRangeTarget[i]; //så det blir kindre att scolla med encodern

        while (digitalRead(rot_EncBTN) == LOW || BTNrelisedlocal == false) //använd encodern för att ställa in riktiga värdet
        {
            temperature(1);
            if (digitalRead(rot_EncBTN) == LOW)
                BTNrelisedlocal = true;
            if (rot_enc != rot_encOld) //only update if changed
            {
                int rotDiff = rot_encOld - rot_enc;
                if (currentDraw < 300)
                    actualCurrent += (rotDiff / 10.0);
                else actualCurrent += rotDiff;
                rot_encOld = rot_enc;
            }

            lcd.setCursor(0, 2);
            lcd.print(actualCurrent, 1);
        }

        addr = addr + i;
        int whatToWriteToEEPROM = actualCurrent;             //tar bort fraktionernerna och skriver heltalet (9.39 blir 9)
        currentRange[i] = whatToWriteToEEPROM;               //lagrar heltalet till senare
        EEPROM.write(addr, whatToWriteToEEPROM);             //sparar på första platsen
        actualCurrent = actualCurrent - whatToWriteToEEPROM; // tar bort heltalet. så vi bara har fraktionerna (9,39 blir 0,39)
        whatToWriteToEEPROM = (actualCurrent * 100);         // gör om fraktionerna till heltal 0,39 bli 39
        addr = addr + 1;                                     //nästa adress
        EEPROM.write(addr, whatToWriteToEEPROM);             //skriver fraktionerna
        int temp2 = EEPROM.read(addr);
        if (temp2 != whatToWriteToEEPROM)
        {
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("Something's wrong!");
            lcd.setCursor(0, 1);
            lcd.print("when writing the");
            lcd.setCursor(0, 2);
            lcd.print("cal too EEPROM");
            while (true)
            {
            }
        }

        currentRange[i] += whatToWriteToEEPROM / 100.0; //lagrar fraktionerna
        currentDraw = readCurrent();
        float temp = currentRange[i] / currentDraw; //får skillnaden mellan var ska borde vara, och vad det är tex 250mA vs 263 = 0,95057 = 95,057%

        currentRangeCal[i] = temp; //skriver caliberings % till minne
    }                              //end Calibration loop

    lcd.clear();

    for (int i = 0; i < currentCalnoOfIndex; i++) //writes the voltage calibration values to eeprom. note the adressing when doing the same to current
    {
        int addr = currentRangeCalADDR + i;
        float temp = currentRangeCal[i];
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
    /* if (digitalRead(rot_EncBTN) == LOW)
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
    } */
    loadSwitching(0);
}

float applyCalCurrent(float input)
{
    if (input <= 0.00)
        return 0.00;
    //input example 356.7 mA
    float blend; //blandningen mellan de olika kaliberings värdena i procent
    float witchCalindex = 0;
    int counter = currentCalnoOfIndex; //max värde
    witchCalindex = currentRange[currentCalnoOfIndex];

    if (input > currentRange[0])
    {
        while (input < witchCalindex) //hittar vilken caliberings range vi ska använda. börjar uppfrån och räknar nedåt till vi är lika eller över målet. (350)
        {
            counter--;
            witchCalindex = currentRange[counter];
            if (counter < 0) //error handler
            {
                lcd.clear();
                lcd.setCursor(0, 0);
                lcd.print("Error!");
                lcd.setCursor(0, 1);
                lcd.print("cant find range :(");
                while (true)
                {
                }
            }
        }
    }
    else
        counter = 0;

    int findHigherInputVal = counter + 1; // the cal value above (400,00)

    /*
    350,20 ---356,7-----------------------400,00

     first get the blend (%) between the two numbers.

    get the fraction between the two values:
    400-350 = 50 <- distance(total)
    356,7 - 350 = 6,7
    fraction(%) = 6,7/50 = 0,134 % we call this "blend"
    */
    float distance = currentRange[findHigherInputVal] - currentRange[counter]; //50,0..
    float temp = currentRange[counter] - input;                                // (350- 356,7 = 6,7)
    blend = temp / distance;                                                   // = 0,134

    //now we need to look up the calibration values we need. I chose extreme values for the example

    float firstVal = currentRangeCal[counter];      //ex: calibration value for 2 Volt =  1.11
    float secondVal = currentRangeCal[counter + 1]; //ex: calibration value for 3 Volts =  0.97
    // this means that the slope(imagine that we draw a line between our two calibration values, its almost always a slope) goes downwards, from 1.11 to 0.97

    //subtract the second from the first to get the slope value (diffrence)
    float slope = secondVal - firstVal; //this would be 0.97 - 1.11 = -0.14

    //now its time to figure out what the actual value is. we know in our case that its between 1.78 and 0.89. we also know that its closer towards the second than the first(it's 68% of the way).

    slope = slope * blend; /* 68% of the diffrence between the two values is -0.89 x 0.68 = -0.6052. This is the number that we add to our first value. in this case: 1.78 + -0.6052 = 1.1748. 
    In other words: the distance between the two calibration values is -0.89. as we 68% on our way to the other value we take 68% of the distance (slope). That value is added to our first value, with gives us our actual calibraion value.
    */

    float ActualCalVal = firstVal + slope; // 2.68 + -0.6052 = 1.1748
    float outPut = input * ActualCalVal;   // do the calibration caluculation: 2.68 *1.1748 = 3.14865 Volts

    return outPut; //return our finnished caluculation
}