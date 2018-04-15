void setupRTC(/* arguments */) {
        if (!rtc.begin()) {
                lcd.setCursor(2,0);
                lcd.print("Couldn't find RTC");
                delay(3000);
        }

        if (rtc.lostPower()) {
                lcd.setCursor(1, 0);
                lcd.print("RTC lost power, lets set the time!");
                // following line sets the RTC to the date & time this sketch was compiled
                rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
                // This line sets the RTC with an explicit date & time, for example to set
                // January 21, 2014 at 3am you would call:
                // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
        }
}



void printTime(){
        DateTime now = rtc.now();
        lcd.setCursor(1,0);
        lcd.print(now.year(), DEC);
        lcd.print('/');
        lcd.print(now.month(), DEC);
        lcd.print('/');
        lcd.print(now.day(), DEC);
        lcd.print(" (");
        lcd.print(daysOfTheWeek[now.dayOfTheWeek()]);
        lcd.print(") ");
        lcd.print(now.hour(), DEC);
        lcd.print(':');
        lcd.print(now.minute(), DEC);
        lcd.print(':');
        lcd.print(now.second(), DEC);
}
