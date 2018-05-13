
/*
MENU ROUTINE enablened by pressing the encoder button for a long time
*/

// Put the menu items here. Remember, the first item will have a 'position' of 0.

void drawMainMenu();

/* void mainMenu();
void drawMainMenu(); */
char *menuItems[] = {
    "Menu 0", //0
    "Menu 1", //1
    "Menu 2", //2
    "Menu 3", //3

};
int menuColPointer = 0;
int OLDmenuColPointer = 0;
boolean BTNrelised = true;
void mainMenu() //namn på
{

       //set all vars to initaial state, define new eatch time?
       //clear the scrren
       //draw menu. use pointer to the array should this be a function, to easlily draw?
       //draw pointers so we know where we are in the menu
       //click enc button to enter menu

       drawMainMenu();
       lcd.setCursor(0, menuColPointer);
       lcd.print(">");
       lcd.setCursor(19, menuColPointer);
       lcd.print("<");
       while (true)
       {
              button.Update();

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

              if (button.clicks == 0)
              {
                     BTNrelised = true;
              }

              if (button.clicks == 1 && BTNrelised == true)
              {

                     switch (menuColPointer)
                     {
                     case 0:
                            lcd.clear();
                            lcd.print("Menu 0 sel");
                            while (rot_EncBTN_Bounced == LOW)
                            {
                            }
                            break;
                     case 1:
                            lcd.clear();
                            lcd.print("Menu 1 sel");
                            while (rot_EncBTN_Bounced == LOW)
                            {
                            }
                            break;
                     case 2:
                            lcd.clear();
                            lcd.print("Menu 2 sel");
                            while (rot_EncBTN_Bounced == LOW)
                            {
                            }
                            break;
                     case 3:
                            lcd.clear();
                            lcd.print("Menu 3 sel");
                            while (rot_EncBTN_Bounced == LOW)
                            {
                            }
                            break;

                     default:
                            break;
                     }
              }
       }
}

void drawMainMenu()
{
       lcd.clear();
       for (u_int i = 0; i < 4; i++)
       {
              lcd.setCursor(2, i);
              lcd.print(menuItems[i]);
       }
}
