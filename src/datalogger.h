
void setupSD()
{
       DateTime now = rtc.now();

fileName[0] = (now.year()/1000)%10 + '0'; //To get 1st digit from year()
fileName[1] = (now.year()/100)%10 + '0'; //To get 2nd digit from year()
fileName[2] = (now.year()/10)%10 + '0'; //To get 3rd digit from year()
fileName[3] = now.year()%10 + '0'; //To get 4th digit from year()
fileName[4] = now.month()/10 + '0'; //To get 1st digit from month()
fileName[5] = now.month()%10 + '0'; //To get 2nd digit from month()
fileName[6] = now.day()/10 + '0'; //To get 1st digit from day()
fileName[7] = now.day()%10 + '0'; //To get 2nd digit from day()
fileName[8] = now.hour()/10 + '0'; //To get 1st digit from day()
fileName[9] = now.hour()%10 + '0'; //To get 2nd digit from day()
fileName[10] = now.minute()/10 + '0'; //To get 1st digit from day()
fileName[11] = now.minute()%10 + '0'; //To get 2nd digit from day()
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

void startLoggging()
{
       // open the file. note that only one file can be open at a time,
       // so you have to close this one before opening another.
       //fileName = "123456790";
       File dataFile = SD.open(fileName, FILE_WRITE);

       // if the file is available, write to it:
       if (dataFile)
       {
              String head = "U1;I1;U2;I2;U3;I3;MS;";

              dataFile.print(head);
              dataFile.println(millis());
              dataFile.println();
              dataFile.close();
       }
}
