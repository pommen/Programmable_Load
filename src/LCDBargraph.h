//custom chars till att fulla bargraph med. Borde flyttas till bargraph filen i en egen funktion som kallas under setup():
uint8_t heart[8] = {0x0, 0xa, 0x1f, 0x1f, 0xe, 0x4, 0x0};
uint8_t graph1[] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};
uint8_t graph2[] = {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18};
uint8_t graph3[] = {0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c};
uint8_t graph4[] = {0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e};
uint8_t graph5[] = {0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f};
uint8_t graph6[8] = {0b11100, 0b10100, 0b11100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000}; //symblom för "grader". ex. efter teperatur

void setupLCD(/* arguments */)
{
        lcd.init(); // initialize the lcd
        lcd.backlight();
        lcd.print("Programmable Load");
        lcd.setCursor(0, 0);
        lcd.createChar(0, heart);
        lcd.createChar(1, graph1);
        lcd.createChar(2, graph2);
        lcd.createChar(3, graph3);
        lcd.createChar(4, graph4);
        lcd.createChar(5, graph5);
        lcd.createChar(6, graph6);
}
void bargraph(int length, int row, int full)
{

        //lenght : väarde på dac'en
        //Row: vilken rad ska vi ha grafen på
        //full: Max värde vi kmmer att sända (full rad)
        full = full / 100;
        if (length == 0)
        { //Suddar ut om värdet är noll
                lcd.setCursor(0, row);
                lcd.print("                   ");
                return;
        }
        lastEncVal = length;
        int fullablock = 0;
        int delAvBlock = 0;
        int temp = 0;

        lcd.setCursor(0, row); // set cursor to commanded row
        //  lcd.print("                    ");
        length = length / full; //scale dac resolution to length of row

        fullablock = length / 5; //figure out how many filled we need

        delAvBlock = fullablock * 5; //how many partly filled do we need?
        temp = fullablock * 5;
        delAvBlock = length - temp;

        if (fullablock > 19)
        {
                fullablock = 19;
                delAvBlock = 4;
        }

        if (fullablock > 0)
        { //printa fulla block om det behövs
                for (int i = 0; i < fullablock; i++)
                {
                        lcd.write(5);
                }
                if (fullablock < lastEncVal && fullablock > 0)
                        lcd.print(" ");
                //om vi går bakår så suddar vi ut det som var framför
                lcd.setCursor(fullablock, row);
        }

        if (delAvBlock > 0)
                lcd.write(delAvBlock); //printa pixel om det behövs

        if (fullablock < lastEncVal && fullablock > 0)
        { //sudda ut den gamla om vi går nedåt
                lcd.setCursor(fullablock + 1, row);
                int clear = 19 - fullablock;
                for (int i = 0; i < clear; i++)
                {
                        lcd.print(" ");
                }
        }

        if (fullablock < lastEncVal && fullablock == 0)
        { //sudda ut den näst sista om vi äar på 0 fulla
                lcd.setCursor(1, row);
                lcd.print(" ");
        }

        lastEncVal = fullablock;
}
