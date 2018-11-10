
#include <LiquidCrystal_I2C.h>
void drawDATALOGGINGmenu();

void setupSD()
{
    DateTime now = rtc.now();

    fileName[0] = (now.year() / 1000) % 10 + '0'; //To get 1st digit from year()
    fileName[1] = (now.year() / 100) % 10 + '0';  //To get 2nd digit from year()
    fileName[2] = (now.year() / 10) % 10 + '0';   //To get 3rd digit from year()
    fileName[3] = now.year() % 10 + '0';          //To get 4th digit from year()
    fileName[4] = now.month() / 10 + '0';         //To get 1st digit from month()
    fileName[5] = now.month() % 10 + '0';         //To get 2nd digit from month()
    fileName[6] = now.day() / 10 + '0';           //To get 1st digit from day()
    fileName[7] = now.day() % 10 + '0';           //To get 2nd digit from day()
    fileName[8] = now.hour() / 10 + '0';          //To get 1st digit from day()
    fileName[9] = now.hour() % 10 + '0';          //To get 2nd digit from day()
    fileName[10] = now.minute() / 10 + '0';       //To get 1st digit from day()
    fileName[11] = now.minute() % 10 + '0';       //To get 2nd digit from day()
    lcd.clear();
    lcd.setCursor(0, 0);
    if (!SD.begin(chipSelect, SPI_HALF_SPEED))
    {

        lcd.print(" SD FAIL!!");
        lcd.setCursor(0, 1);
        lcd.print("Card failed");
        lcd.setCursor(0, 2);
        lcd.print("or not present");
        delay(10000); // don't do anything more:
        return;
    }
    // Serial.print(F("card initialized."));
    lcd.print("card initialized.");

    int cardSize = SD.card()->cardSize();
    if (cardSize == 0)
    {
        lcd.print("cardSize failed");
        return;
    }
}
long int logstartmillis;
void startLoggging()
{
    // open the file. note that only one file can be open at a time,
    // so you have to close this one before opening another.
    //fileName = "123456790";
    File dataFile = SD.open(fileName, FILE_WRITE);

    // if the file is available, write to it:
    if (dataFile)
    {
  

        dataFile.print(millis() - logstartmillis);
        dataFile.print(";");
        dataFile.print(vDisp);
        dataFile.print(";");
        dataFile.println(currentDraw);

        dataFile.close();
    }
}

void DATALOGStartWhen()
{
    boolean BTNrelised = true;

    int quitMenu = 0;
    char *StartWhenItems[] = {
        "Ext Trig", //0
        "V above ", //1
        "V below",  //2
        "Quit",     //3

    };
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(StartWhenItems[i]);
    }
    while (quitMenu != 1)
    {
        while (digitalRead(rot_EncBTN) == HIGH)
        {
            /* code */
        }
        if (rot_enc != rot_encOld) //only update if chaged
        {
            int rotDiff = rot_encOld - rot_enc;
            menuColPointer += rotDiff;
            rot_encOld = rot_enc;
            if (menuColPointer < 0)
            {
                menuColPointer = 0;
            }
            else if (menuColPointer > 3)
            {
                menuColPointer = 3;
            }

            lcd.setCursor(0, OLDmenuColPointer);
            lcd.print(" ");
            lcd.setCursor(19, OLDmenuColPointer);
            lcd.print(" ");

            lcd.setCursor(0, menuColPointer);
            lcd.print(">");
            lcd.setCursor(19, menuColPointer);
            lcd.print("<");
            OLDmenuColPointer = menuColPointer;
        }
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelised = true;

        if (digitalRead(rot_EncBTN) == HIGH && BTNrelised == true)
        {

            switch (menuColPointer)
            {
            case 0:

                startLogOnTrig = 1;
                lcd.setCursor(12, 0);
                lcd.print('*');
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                break;
            case 1:
                //lcd.clear();

                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }

                startAboveFlag = 1;
                int temp;
                float temp2;
                while (digitalRead(rot_EncBTN) == LOW)
                {
                    if (rot_enc != rot_encOld) //only update if chaged
                    {
                        int rotDiff = rot_encOld - rot_enc;
                        temp += rotDiff;
                        rot_encOld = rot_enc;
                        lcd.setCursor(10, 1);
                        temp2 = temp / 10.0;
                        lcd.print(temp2);
                    }
                }
                VoltageStartLogging = temp2;
                for (u_int i = 0; i < 4; i++)
                {
                    lcd.setCursor(2, i);
                    lcd.print(StartWhenItems[i]);
                }
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                break;
            case 2:
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                lcd.clear();
                startBelowFalg = 1;
                while (digitalRead(rot_EncBTN) == LOW)
                {
                    if (rot_enc != rot_encOld) //only update if chaged
                    {
                        int rotDiff = rot_encOld - rot_enc;
                        temp += rotDiff;
                        rot_encOld = rot_enc;
                        lcd.setCursor(10, 2);
                        temp2 = temp / 10.0;
                        lcd.print(temp2);
                    }
                }
                VoltageStartLogging = temp2;
                for (u_int i = 0; i < 4; i++)
                {
                    lcd.setCursor(2, i);
                    lcd.print(StartWhenItems[i]);
                }
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                break;
            case 3:
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                lcd.clear();
                drawDATALOGGINGmenu();

                quitMenu = 1;
                break;

            default:
                break;
            }
        }
    }
}

void DATAOGStopWhen()
{
    boolean BTNrelised = true;

    int quitMenu = 0;
    char *StartWhenItems[] = {
        "Ext Trig", //0
        "V above ", //1
        "V below",  //2
        "Quit",     //3

    };
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(StartWhenItems[i]);
    }
    while (digitalRead(rot_EncBTN) == HIGH)
    {
        /* code */
    }
    while (quitMenu != 1)
    {
        int temp = 0;
        float temp2 = 0.0;
        if (rot_enc != rot_encOld) //only update if chaged
        {
            int rotDiff = rot_encOld - rot_enc;
            menuColPointer += rotDiff;
            rot_encOld = rot_enc;
            if (menuColPointer < 0)
            {
                menuColPointer = 0;
            }
            else if (menuColPointer > 3)
            {
                menuColPointer = 3;
            }

            lcd.setCursor(0, OLDmenuColPointer);
            lcd.print(" ");
            lcd.setCursor(19, OLDmenuColPointer);
            lcd.print(" ");

            lcd.setCursor(0, menuColPointer);
            lcd.print(">");
            lcd.setCursor(19, menuColPointer);
            lcd.print("<");
            OLDmenuColPointer = menuColPointer;
        }
        if (digitalRead(rot_EncBTN) == LOW)
            BTNrelised = true;

        if (digitalRead(rot_EncBTN) == HIGH && BTNrelised == true)
        {

            switch (menuColPointer)
            {
            case 0:
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                startLogOnTrig = 1;
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                delay(200);
                break;

            case 1:
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                //lcd.clear();
                stoppAboveFlag = 1;

                while (digitalRead(rot_EncBTN) == LOW)
                {
                    if (rot_enc != rot_encOld) //only update if chaged
                    {
                        int rotDiff = rot_encOld - rot_enc;
                        temp += rotDiff;
                        rot_encOld = rot_enc;
                        lcd.setCursor(1, 10);
                        temp2 = temp / 10.0;
                        lcd.print(temp2, 1);
                    }
                }
                VoltageStoppLogging = temp2;
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                for (u_int i = 0; i < 4; i++)
                {
                    lcd.setCursor(2, i);
                    lcd.print(StartWhenItems[i]);
                }
                break;

            case 2:
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                lcd.clear();
                stoppBelowFalg = 1;
                while (digitalRead(rot_EncBTN) == LOW)
                {
                    if (rot_enc != rot_encOld) //only update if chaged
                    {
                        int rotDiff = rot_encOld - rot_enc;
                        temp += rotDiff;
                        rot_encOld = rot_enc;
                        lcd.setCursor(2, 10);
                        temp2 = temp / 10.0;
                        lcd.print(temp2, 1);
                    }
                }
                VoltageStoppLogging = temp2;
                while (digitalRead(rot_EncBTN) == HIGH)
                {
                    /* code */
                }
                lcd.clear();
                for (u_int i = 0; i < 4; i++)
                {
                    lcd.setCursor(2, i);
                    lcd.print(StartWhenItems[i]);
                }
                break;
            case 3:
                lcd.clear();
                drawDATALOGGINGmenu();

                quitMenu = 1;
                break;

            default:
                break;
            }
        }
    }
}