

//add this to void (setup)
//        attachInterrupt(rot_EncB, Rot_enc_ISR, FALLING);

//
void Rot_enc_ISR()
{

        rot_EncA_Value = digitalRead(rot_EncA);
        if (millis() - accelTimer < 2)
        { //acceleration

                if (rot_EncA_Value == 0)
                {
                        rot_enc = rot_enc - 100;
                }
                if (rot_EncA_Value == 1)
                {
                        rot_enc = rot_enc + 100;
                }
        }
        else if (millis() - accelTimer < 5)
        { //acceleration

                if (rot_EncA_Value == 0)
                {
                        rot_enc = rot_enc - 20;
                }
                if (rot_EncA_Value == 1)
                {
                        rot_enc = rot_enc + 20;
                }
        }
        else if (millis() - accelTimer < 10)
        { //acceleration

                if (rot_EncA_Value == 0)
                {
                        rot_enc = rot_enc - 10;
                }
                if (rot_EncA_Value == 1)
                {
                        rot_enc = rot_enc + 10;
                }
        }
        if (rot_EncA_Value == 0)
        {
                rot_enc--;
        }
        if (rot_EncA_Value == 1)
        {
                rot_enc++;
        }
        accelTimer = millis();
}

void read_encoder()
{
        if (rot_enc != rot_encOld) //only update if chaged
        {
                int rotDiff = rot_encOld - rot_enc;
                dacsetVal += rotDiff;
                rot_encOld = rot_enc;
        }

        //make sure that the dac is with in 12 bit range
        if (dacsetVal < 0)
        {
                dacsetVal = 0;
        }
        else if (dacsetVal > 4096)
        {
                dacsetVal = 4095;
        }
}
