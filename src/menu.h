
/*
MENU ROUTINE enablened by pressing the encoder button for a long time
*/

// Put the menu items here. Remember, the first item will have a 'position' of 0.

#include <LiquidCrystal_I2C.h>

void drawMainMenu();
void drawCALmenu();
void drawDATALOGGINGmenu();
void drawSTATUSmenu();
void CALmenu();

/* void mainMenu();
void drawMainMenu(); */
char *TOPmenuItems[] = {
    "status",      //0
    "CAL",         //1
    "Datalogging", //2
    "Quit",        //3

};
char *CALmenuItems[] = {
    "Cal Pots",    //0
    "Cal Voltage", //1
    "Cal Current", //2
    "Cal Dac"      //3
    "Quit",        //4

};
char *DATALOGGINGmenuItems[] = {
    "Start When", //0
    "Stop When",  //1
    " ",          //2
    "Quit",       //3

};
char *STATUSmenuItems[] = {
    "ina",     //0
    "uptime",  //1
    "i2cScan", //2
    "Quit",    //3

};

int menuColPointer = 0;
int OLDmenuColPointer = 0;

void mainMenu() //namn på
{
    boolean BTNrelised = true;

    int quitMenu = 0;

    loadSwitching(0);
    while (quitMenu != 1)
    {
        //set all vars to initaial state, define new eatch time?
        //clear the scrren
        //draw menu. use pointer to the array should this be a function, to easlily draw?
        //draw pointers so we know where we are in the menu
        //click enc button to enter menu

        drawMainMenu();
        while (digitalRead(rot_EncBTN) == HIGH)
        {
        }
        lcd.setCursor(0, menuColPointer);
        lcd.print(">");
        lcd.setCursor(19, menuColPointer);
        lcd.print("<");
        while (quitMenu != 1)
        {

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
                    lcd.clear();
                    lcd.print("Status");
                    inaStatus();
                    while (digitalRead(rot_EncBTN) == HIGH)
                    {
                    }
                    while (digitalRead(rot_EncBTN) == LOW)
                    {
                    }
                    drawMainMenu();
                    break;

                case 1:
                    CALmenu();

                    drawMainMenu();
                    break;

                case 2:
                    lcd.clear();
                    lcd.print("Datalogging");
                    while (digitalRead(rot_EncBTN) == LOW)
                    {
                    }
                    drawMainMenu();
                    break;

                case 3:
                    lcd.clear();
                    calDac();
                    break;
                case 4:
                    lcd.clear();
                    quitMenu = 1;
                    break;

                default:
                    break;
                }
            }
        }
    }
    while (digitalRead(rot_EncBTN) == HIGH)
    { //wait for button to be let go before exciting, so we dont go to main screen with button pushed
    }
    delay(100);
}

void CALmenu()
{
    boolean BTNrelised = true;

    int quitMenu = 0;

    /*     char *CALmenuItems[] = {
    "Cal Pots",    //0
    "Cal Voltage", //1
    "Cal Current", //2
    "Quit",        //3

};
 */
    while (quitMenu != 1)
    {
        //set all vars to initaial state, define new eatch time?
        //clear the scrren
        //draw menu. use pointer to the array should this be a function, to easlily draw?
        //draw pointers so we know where we are in the menu
        //click enc button to enter menu

        drawCALmenu();
        while (digitalRead(rot_EncBTN) == HIGH)
        {
        }
        lcd.setCursor(0, menuColPointer);
        lcd.print(">");
        lcd.setCursor(19, menuColPointer);
        lcd.print("<");
        while (quitMenu != 1)
        {

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
                    calPots();
                    drawCALmenu();
                    delay(200);
                    break;
                case 1:
                    lcd.clear();
                    SWvoltageCal();
                    drawCALmenu();
                    delay(500);
                    break;
                case 2:
                    lcd.clear();
                    SWcurrentCal();
                    drawCALmenu();

                    break;
                case 3:
                    lcd.clear();

                    quitMenu = 1;
                    drawMainMenu();
                    break;

                default:
                    break;
                }
            }
        }
    }
    lcd.clear();
}
void drawMainMenu()
{
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(TOPmenuItems[i]);
    }
}
void drawCALmenu()
{
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(CALmenuItems[i]);
    }
}
void drawSTATUSmenu()
{
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(STATUSmenuItems[i]);
    }
}
void drawDATALOGGINGmenu()
{
    lcd.clear();
    for (u_int i = 0; i < 4; i++)
    {
        lcd.setCursor(2, i);
        lcd.print(DATALOGGINGmenuItems[i]);
    }
}