

//add this to void (setup)
//        attachInterrupt(rot_EncB, Rot_enc_ISR, FALLING);

void Rot_enc_ISR(){

        rot_EncA_Value = digitalRead(rot_EncA);

        if (rot_EncA_Value == 0) {
                rot_enc--;
        }
        if (rot_EncA_Value == 1) {
                rot_enc++;
        }
        /*
           lcd.setCursor(0,0);
           lcd.print("yep");
         */

}
