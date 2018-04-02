

//add this to void (setup)
//        attachInterrupt(rot_EncA, Rot_enc_ISR, FALLING);

void Rot_enc_ISR(){

        int rot_EncB_Value = digitalRead(rot_EncB);

        if (rot_EncB_Value == 0) {
                rot_enc--;
        }
        if (rot_EncB_Value == 1) {
                rot_enc++;
        }

}
