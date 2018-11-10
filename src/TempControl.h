void temperature(int silent)
{
        blockTemp = analogRead(blockTempPin);
        blockTemp = (blockTemp / 4) / 10;
        if (millis() - temptime >= 1000 && silent == 0)
        {

                lcd.setCursor(17, 0);
                lcd.print("  ");
                lcd.setCursor(17, 0);
                lcd.print(blockTemp, 0);
                lcd.write(6); //grader symbolen
                //lcd.setCursor(17,1);
                //lcd.print(sensor.temp(),0);   // call to working lm75 function
                //lcd.write(6); //grader symbolen

                temptime = millis();
        }
        if (blockTemp > 45)
        {
                analogWrite(fanPWM, 255);
        }
        else if (blockTemp > 40)
        {
                analogWrite(fanPWM, 200);
        }
        else if (blockTemp > 35)
        {
                analogWrite(fanPWM, 150);
        }
        else if (blockTemp > 30)
        {
                analogWrite(fanPWM, 100);
        }
        else if (blockTemp < 25)
        {
                analogWrite(fanPWM, 0);
        }
}
