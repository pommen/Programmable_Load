void temperature(){
        if (millis() - temptime >= 1000) {

                lcd.setCursor(17,0);
                lcd.print("  ");
                blockTemp = analogRead(blockTempPin);
                blockTemp = (blockTemp  / 4) /10;
                lcd.setCursor(17,0);
                lcd.print(blockTemp,0);
                lcd.write(6);  //grader symbolen
                //lcd.setCursor(17,1);
                //lcd.print(sensor.temp(),0);   // call to working lm75 function
                //lcd.write(6); //grader symbolen


                temptime=millis();

        }
        if (blockTemp > 30) {

                analogWrite(out1, 255-100);
        }
        if (blockTemp > 35) {

                analogWrite(out1, 255-150);
        }
        if (blockTemp > 40) {

                analogWrite(out1, 255-200);
        }
        if (blockTemp > 45) {

                analogWrite(out1, 0);
        }
        if (blockTemp < 25) {
                analogWrite(out1, 255);
        }

}
