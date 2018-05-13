/*




*/
float voltageRangeCal[] = {
    1.00,  //
    2.00,  //
    3.00,  //
    4.00,  //
    5.00,  //
    6.00,  //
    7.00,  //
    8.00,  //
    9.00,  //
    10.00, //
    11.00, //
    12.00, //
    13.00, //
    14.00, //
    15.00, //
    16.00, //
    17.00, //
    18.00, //
    19.00, //
    20.00, //
    21.00, //
    22.00, //
    23.00, //
    24.00, //
};
float voltageRange[] = {
    1.00,  //
    2.00,  //
    3.00,  //
    4.00,  //
    5.00,  //
    6.00,  //
    7.00,  //
    8.00,  //
    9.00,  //
    10.00, //
    11.00, //
    12.00, //
    13.00, //
    14.00, //
    15.00, //
    16.00, //
    17.00, //
    18.00, //
    19.00, //
    20.00, //
    21.00, //
    22.00, //
    23.00, //
    24.00, //

};
float currantRangeCal[] = {
    0.00, //0-10 mA
    0.00, //10,1-50 mA
    0.00, //50,1-100 mA
    0.00, //100,1-200 mA
    0.00, //200,1-500 mA
    0.00, //500,1-800 mA
    0.00, //800,1-950 mA
    0.00, //950,1-1050 mA
    0.00, //1050,1-1200 mA
    0.00, //1200,1-1500 mA
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
    0.00, //
};

void SWvoltageCal();

void SWvoltageCal()
{

       for (int i = 0; i < 19; i++)
       {
              /* code */
              lcd.setCursor(0, 0);
              lcd.print("                  ");
              lcd.setCursor(0, 0);
              lcd.print("Set voltage to ");
              lcd.setCursor(0, 1);
              lcd.print(voltageRange[i]);
              lcd.setCursor(0, 2);
              lcd.print("Press BTN ");
              lcd.setCursor(0, 3);
              lcd.print("                  ");
              lcd.setCursor(0, 3);

              //lcd.print("to continue");
              delay(10);
              Vin = 0;
              for (int k = 0; i < 9; i++)
              {
                     int temp = ads.readADC_Differential_2_3();
                     Vin = Vin + temp;
                     delay(100);
              }
              Vin = Vin / 10;
              vDisp = (Vin * 0.625) / 400; //0.0625mV / voltage divider
              lcd.print(vDisp);
              float temp = voltageRange[i] / vDisp;
              temp = temp - voltageRange[i];
              voltageRangeCal[i] = temp;
              lcd.print(voltageRangeCal[i]);
              while (digitalRead(rot_EncBTN) == HIGH)
              {
              }
              while (digitalRead(rot_EncBTN) == LOW)
              {
              }
       }
       lcd.clear();
       lcd.print("DONE!");
       delay(5000);
}