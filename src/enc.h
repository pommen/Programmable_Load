

//add this to void (setup)
//        attachInterrupt(rot_EncB, Rot_enc_ISR, FALLING);



//
void Rot_enc_ISR(){
        rot_EncA_Value = digitalRead(rot_EncA);
        if (millis()  - accelTimer < 2) { //acceleration

                if (rot_EncA_Value == 0) {
                        rot_enc=rot_enc - 30;
                }
                if (rot_EncA_Value == 1) {
                        rot_enc= rot_enc + 30;
                }
        }
        else
        if (millis()  - accelTimer < 5) { //acceleration

                if (rot_EncA_Value == 0) {
                        rot_enc=rot_enc - 10;
                }
                if (rot_EncA_Value == 1) {
                        rot_enc= rot_enc + 10;
                }
        }
        else
        if (millis()  - accelTimer < 10) { //acceleration

                if (rot_EncA_Value == 0) {
                        rot_enc=rot_enc - 5;
                }
                if (rot_EncA_Value == 1) {
                        rot_enc= rot_enc + 5;
                }
        }
        if (rot_EncA_Value == 0) {
                rot_enc--;
        }
        if (rot_EncA_Value == 1) {
                rot_enc++;
        }
        accelTimer=millis();


}
