void bargraph(int length, int row, int full){

        //lenght : väarde på dac'en
        //Row: vilken rad ska vi ha grafen på
        //full: Max värde vi kmmer att sända (full rad)
        full=full/100;
        if (length == 0 ) { //Suddar ut om värdet är noll
                lcd.setCursor(0, row);
                lcd.print(" ");
                return;
        }
        lastEncVal=length;
        int fullablock =0;
        int delAvBlock=0;
        int temp=0;

        lcd.setCursor(0, row);         // set cursor to commanded row
        //  lcd.print("                    ");
        length = length/full;         //scale dac resolution to length of row

        fullablock = length/5;         //figure out how many filled we need

        delAvBlock=fullablock*5;          //how many partly filled do we need?
        temp=fullablock*5;
        delAvBlock=length-temp;


        if (fullablock > 19) {
                fullablock = 19;
                delAvBlock=4;
        }

        if (fullablock >0) {            //printa fulla block om det behövs
                for (int i = 0; i < fullablock; i++) {
                        lcd.write(5);
                }
                if (fullablock<lastEncVal && fullablock>0) lcd.print(" ");
                //om vi går bakår så suddar vi ut det som var framför
                lcd.setCursor(fullablock, row);
        }


        if (delAvBlock>0) lcd.write(delAvBlock);         //printa pixel om det behövs

        if (fullablock<lastEncVal && fullablock>0) {         //sudda ut den gamla om vi går nedåt
                lcd.setCursor(fullablock+1, row);
                int clear =19-fullablock;
                for (size_t i = 0; i < clear; i++) {
                        lcd.print(" ");
                }
        }

        if (fullablock<lastEncVal && fullablock==0) {         //sudda ut den näst sista om vi äar på 0 fulla
                lcd.setCursor(1, row);
                lcd.print(" ");
        }

        lastEncVal=fullablock;

}
