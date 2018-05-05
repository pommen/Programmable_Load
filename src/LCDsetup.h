//custom chars till att fulla bargraph med. Borde flyttas till bargraph filen i en egen funktion som kallas under setup():
uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};
uint8_t graph1[] = {0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10};
uint8_t graph2[] = {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18};
uint8_t graph3[] = {0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c};
uint8_t graph4[] = {0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1e};
uint8_t graph5[] = {0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f};
uint8_t graph6[8] = { 0b11100, 0b10100, 0b11100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000}; //symblom för "grader". ex. efter teperatur


void setupLCD(/* arguments */) {
        lcd.init(); // initialize the lcd
        lcd.backlight();
        lcd.print("Programmable Load");
        lcd.setCursor(0, 0 );
        lcd.createChar(0, heart);
        lcd.createChar(1, graph1);
        lcd.createChar(2, graph2);
        lcd.createChar(3, graph3);
        lcd.createChar(4, graph4);
        lcd.createChar(5, graph5);
        lcd.createChar(6, graph6);
}