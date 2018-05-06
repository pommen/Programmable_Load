#include <LiquidCrystal_I2C.h>

void setupPots()
{
	potVcal = EEPROM.read(potVcalAddr); //load old calibration data for balance pots
	delay(5);
	potIcal = EEPROM.read(potIcalAddr);
	lcd.clear();
	lcd.setCursor(0, 0);
	lcd.print("Cal Values:");
	lcd.setCursor(0, 1);
	lcd.print("V cal: ");
	lcd.print(potVcal);
	lcd.setCursor(0, 2);
	lcd.print("i cal: ");
	lcd.print(potIcal);
	delay(200);
	i2cPot(potVcal, 1);
	delay(100);
	i2cPot(potIcal, 0);
	delay(100);
}
void calPots()
{
	//vi börjar med att kolla/kaliberar Volt
	Vin = ads.readADC_Differential_2_3();
	vDisp = (Vin * 0.625) / 400; //0.0625mV / bit
	if (vDisp != 10.00)
	{
		lcd.clear();
		lcd.setCursor(0, 0);
		lcd.print("V-pot need CAL");
		lcd.setCursor(0, 1);
		lcd.print("Set 10V");
		lcd.setCursor(0, 2);
		lcd.print("Set Vsense to local");
		lcd.setCursor(0, 3);
		lcd.print("Press BTN to start");
		while (digitalRead(rot_EncBTN) == LOW)
		{
		}
		lcd.clear();
		for (size_t i = 0; i < 255; i++)
		{
			i2cPot(i, 0); //0=vsense, 1 = isense
			delay(50);
			Vin = ads.readADC_Differential_2_3();
			vDisp = (Vin * 0.625) / 400; //0.0625mV / bit
			lcd.setCursor(0, 0);
			lcd.print(vDisp, 3);
			lcd.print("  step: ");
			lcd.print(i);
			delay(100);
			if (vDisp == 10.00)
			{
				EEPROM.write(potVcalAddr, i);
				lcd.setCursor(0, 2);
				lcd.print("cal val: ");
				lcd.print(i);
				lcd.setCursor(0, 3);
				lcd.print("Stored Val: ");
				lcd.print(EEPROM.read(potVcalAddr));
				break;
				//return;
			}
			if (i == 255)
			{
				lcd.clear();
				lcd.setCursor(0, 1);
				lcd.print("V Calibration Failed");
				while (true)
				{
				}
			}
		}
	}

	//och sen tar vi stömmen
	currentDraw = ads.readADC_Differential_0_1() * 0.625;

	if (currentDraw != 100.00)
	{
		lcd.clear();
		lcd.setCursor(0, 0);
		lcd.print("I-pot need CAL");
		lcd.setCursor(0, 1);
		lcd.print("Set 100 mA");
		lcd.setCursor(0, 2);
		lcd.print("Press BTN to start");
		while (digitalRead(rot_EncBTN) == LOW)
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
			dac.setVoltage(dacsetVal, false);
			bargraph(dacsetVal, 3, 4096); //prints the bargrapg to the 3 row
		}
		lcd.clear();
		for (size_t i = 0; i < 255; i++)
		{
			i2cPot(i, 1); //0=vsense, 1 = isense
			delay(50);
			currentDraw = ads.readADC_Differential_0_1() * 0.625;
			lcd.setCursor(0, 0);
			lcd.print(currentDraw, 3);
			lcd.print("  step: ");
			lcd.print(i);
			delay(100);
			if (currentDraw == 100.00)
			{
				EEPROM.write(potIcalAddr, i);
				lcd.setCursor(0, 2);
				lcd.print("cal val: ");
				lcd.print(i);
				lcd.setCursor(0, 3);
				lcd.print("Stored Val: ");
				lcd.print(EEPROM.read(potIcalAddr));
				break;
				//return;
			}
			if (i == 255)
			{
				lcd.clear();
				lcd.setCursor(0, 1);
				lcd.print(" I Calibration Failed");
				while (true)
				{
				}
			}
		}
		dacsetVal = 0;
		dac.setVoltage(dacsetVal, false);
	}
}
