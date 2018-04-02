void i2cScanner(){
        int col = 1;

        lcd.clear();
        lcd.print("I2c addresses");
        lcd.setCursor(0,col);
        byte error, address;
        int nDevices;

        nDevices = 0;
        for(address = 1; address < 127; address++ )
        {
                // The i2c_scanner uses the return value of
                // the Write.endTransmisstion to see if
                // a device did acknowledge to the address.
                Wire.beginTransmission(address);
                error = Wire.endTransmission();

                if (error == 0)
                {
                        lcd.print("0x");
                        if (address<16)
                                lcd.print("0");
                        lcd.print(address,HEX);
                        lcd.print(" ");

                        nDevices++;
                }
                else if (error==4)
                {
                        lcd.print("Unknown 0x");
                        if (address<16)
                                lcd.print("0");
                        lcd.println(address,HEX);
                }
                if (nDevices > 3) {
                        col++;
                        lcd.setCursor(0,col);
                        nDevices =1;
                }
        }

        if (nDevices == 0)
                lcd.println("No I2C devices found\n");
        else
                lcd.setCursor(0,3);

        lcd.print("Done Sanning");
        delay(1000);
        while (1) {
                if (digitalRead(rot_EncBTN) == HIGH) {
                        break;
                        /* code */
                }
        }

}
