EESchema Schematic File Version 2
LIBS:ControllerStage-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Peters
LIBS:bluepill_breakouts
LIBS:SN74LVC1G14DBVT
LIBS:ControllerStage-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Programmable Load Mosfet stage"
Date "2017-08-29"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Earth #PWR078
U 1 1 5A105240
P 2900 2800
F 0 "#PWR078" H 2900 2550 50  0001 C CNN
F 1 "Earth" H 2900 2650 50  0001 C CNN
F 2 "" H 2900 2800 50  0001 C CNN
F 3 "" H 2900 2800 50  0001 C CNN
	1    2900 2800
	1    0    0    -1  
$EndComp
$Comp
L STW45NM50 Q3
U 1 1 5A105241
P 4300 5300
F 0 "Q3" H 4500 5375 50  0000 L CNN
F 1 "STW45NM50" V 4650 5100 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-247_TO-3P_Vertical" H 4500 5225 50  0001 L CIN
F 3 "" H 4300 5300 50  0001 L CNN
	1    4300 5300
	1    0    0    -1  
$EndComp
$Comp
L R R28
U 1 1 5A105243
P 3750 5650
F 0 "R28" V 3830 5650 50  0000 C CNN
F 1 "10K" V 3750 5650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3680 5650 50  0001 C CNN
F 3 "" H 3750 5650 50  0001 C CNN
	1    3750 5650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR079
U 1 1 5A105246
P 3750 5850
F 0 "#PWR079" H 3750 5600 50  0001 C CNN
F 1 "Earth" H 3750 5700 50  0001 C CNN
F 2 "" H 3750 5850 50  0001 C CNN
F 3 "" H 3750 5850 50  0001 C CNN
	1    3750 5850
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR080
U 1 1 5A105247
P 2900 5050
F 0 "#PWR080" H 2900 4900 50  0001 C CNN
F 1 "+12V" H 2900 5190 50  0000 C CNN
F 2 "" H 2900 5050 50  0001 C CNN
F 3 "" H 2900 5050 50  0001 C CNN
	1    2900 5050
	1    0    0    -1  
$EndComp
$Comp
L C C29
U 1 1 5A105248
P 3450 5550
F 0 "C29" H 3475 5650 50  0000 L CNN
F 1 "1n" H 3475 5450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3488 5400 50  0001 C CNN
F 3 "" H 3450 5550 50  0001 C CNN
	1    3450 5550
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 5A10524A
P 3450 5850
F 0 "R31" V 3530 5850 50  0000 C CNN
F 1 "1K" V 3450 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3380 5850 50  0001 C CNN
F 3 "" H 3450 5850 50  0001 C CNN
	1    3450 5850
	1    0    0    -1  
$EndComp
$Comp
L C C27
U 1 1 5A10524C
P 3050 6550
F 0 "C27" H 3075 6650 50  0000 L CNN
F 1 "0.1u" H 3075 6450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3088 6400 50  0001 C CNN
F 3 "" H 3050 6550 50  0001 C CNN
	1    3050 6550
	1    0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 5A10524D
P 9750 5250
F 0 "C19" H 9775 5350 50  0000 L CNN
F 1 "0.1u" H 9775 5150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9788 5100 50  0001 C CNN
F 3 "" H 9750 5250 50  0001 C CNN
	1    9750 5250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR081
U 1 1 5A10524E
P 9750 5100
F 0 "#PWR081" H 9750 4950 50  0001 C CNN
F 1 "+5V" H 9750 5240 50  0000 C CNN
F 2 "" H 9750 5100 50  0001 C CNN
F 3 "" H 9750 5100 50  0001 C CNN
	1    9750 5100
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR082
U 1 1 5A10524F
P 3050 6700
F 0 "#PWR082" H 3050 6450 50  0001 C CNN
F 1 "Earth" H 3050 6550 50  0001 C CNN
F 2 "" H 3050 6700 50  0001 C CNN
F 3 "" H 3050 6700 50  0001 C CNN
	1    3050 6700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR083
U 1 1 5A105250
P 9750 5400
F 0 "#PWR083" H 9750 5150 50  0001 C CNN
F 1 "Earth" H 9750 5250 50  0001 C CNN
F 2 "" H 9750 5400 50  0001 C CNN
F 3 "" H 9750 5400 50  0001 C CNN
	1    9750 5400
	1    0    0    -1  
$EndComp
$Comp
L CP1 C28
U 1 1 5A105251
P 3300 6550
F 0 "C28" H 3325 6650 50  0000 L CNN
F 1 "10u" H 3325 6450 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 3300 6550 50  0001 C CNN
F 3 "" H 3300 6550 50  0001 C CNN
	1    3300 6550
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR084
U 1 1 5A105252
P 3300 6700
F 0 "#PWR084" H 3300 6450 50  0001 C CNN
F 1 "Earth" H 3300 6550 50  0001 C CNN
F 2 "" H 3300 6700 50  0001 C CNN
F 3 "" H 3300 6700 50  0001 C CNN
	1    3300 6700
	1    0    0    -1  
$EndComp
$Comp
L TEST TP2
U 1 1 5A105255
P 2050 5150
F 0 "TP2" H 2050 5450 50  0000 C BNN
F 1 "TEST" H 2050 5400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x01_Pitch1.00mm" H 2050 5150 50  0001 C CNN
F 3 "" H 2050 5150 50  0001 C CNN
	1    2050 5150
	1    0    0    -1  
$EndComp
$Comp
L ADS1115 U13
U 1 1 5A105256
P 2900 2500
F 0 "U13" H 3150 3450 60  0000 C CNN
F 1 "ADS1115" H 3200 2200 60  0000 C CNN
F 2 "Libs:ADS1115-Breakout" H 3800 2150 60  0001 C CNN
F 3 "" H 2900 2500 60  0001 C CNN
	1    2900 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR085
U 1 1 5A105257
P 2900 1950
F 0 "#PWR085" H 2900 1800 50  0001 C CNN
F 1 "+5V" H 2900 2090 50  0000 C CNN
F 2 "" H 2900 1950 50  0001 C CNN
F 3 "" H 2900 1950 50  0001 C CNN
	1    2900 1950
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR086
U 1 1 5A105258
P 4400 6650
F 0 "#PWR086" H 4400 6400 50  0001 C CNN
F 1 "Earth" H 4400 6500 50  0001 C CNN
F 2 "" H 4400 6650 50  0001 C CNN
F 3 "" H 4400 6650 50  0001 C CNN
	1    4400 6650
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR087
U 1 1 5A105259
P 3800 2300
F 0 "#PWR087" H 3800 2050 50  0001 C CNN
F 1 "Earth" H 3800 2150 50  0001 C CNN
F 2 "" H 3800 2300 50  0001 C CNN
F 3 "" H 3800 2300 50  0001 C CNN
	1    3800 2300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR088
U 1 1 5A10525A
P 3650 3000
F 0 "#PWR088" H 3650 2750 50  0001 C CNN
F 1 "Earth" H 3650 2850 50  0001 C CNN
F 2 "" H 3650 3000 50  0001 C CNN
F 3 "" H 3650 3000 50  0001 C CNN
	1    3650 3000
	1    0    0    -1  
$EndComp
$Comp
L R R33
U 1 1 5A10525B
P 4550 6050
F 0 "R33" V 4630 6050 50  0000 C CNN
F 1 "10K" V 4550 6050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4480 6050 50  0001 C CNN
F 3 "" H 4550 6050 50  0001 C CNN
	1    4550 6050
	0    -1   1    0   
$EndComp
$Comp
L Earth #PWR089
U 1 1 5A10525C
P 6350 6900
F 0 "#PWR089" H 6350 6650 50  0001 C CNN
F 1 "Earth" H 6350 6750 50  0001 C CNN
F 2 "" H 6350 6900 50  0001 C CNN
F 3 "" H 6350 6900 50  0001 C CNN
	1    6350 6900
	-1   0    0    -1  
$EndComp
$Comp
L C C34
U 1 1 5A10525D
P 6350 6600
F 0 "C34" H 6375 6700 50  0000 L CNN
F 1 "0.1u" H 6375 6500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6388 6450 50  0001 C CNN
F 3 "" H 6350 6600 50  0001 C CNN
	1    6350 6600
	-1   0    0    -1  
$EndComp
Text GLabel 6650 5950 2    60   Input ~ 0
Curr
Text GLabel 3950 2150 2    60   Input ~ 0
Curr
$Comp
L +5V #PWR090
U 1 1 5A105260
P 5300 6100
F 0 "#PWR090" H 5300 5950 50  0001 C CNN
F 1 "+5V" H 5300 6240 50  0000 C CNN
F 2 "" H 5300 6100 50  0001 C CNN
F 3 "" H 5300 6100 50  0001 C CNN
	1    5300 6100
	-1   0    0    -1  
$EndComp
$Comp
L -5V #PWR109
U 1 1 5A105261
P 5300 6700
F 0 "#PWR109" H 5300 6800 50  0001 C CNN
F 1 "-5V" H 5300 6850 50  0000 C CNN
F 2 "" H 5300 6700 50  0001 C CNN
F 3 "" H 5300 6700 50  0001 C CNN
	1    5300 6700
	1    0    0    1   
$EndComp
$Comp
L -5V #PWR107
U 1 1 5A105262
P 4900 3100
F 0 "#PWR107" H 4900 3200 50  0001 C CNN
F 1 "-5V" H 4900 3250 50  0000 C CNN
F 2 "" H 4900 3100 50  0001 C CNN
F 3 "" H 4900 3100 50  0001 C CNN
	1    4900 3100
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR091
U 1 1 5A105263
P 4900 2500
F 0 "#PWR091" H 4900 2350 50  0001 C CNN
F 1 "+5V" H 4900 2640 50  0000 C CNN
F 2 "" H 4900 2500 50  0001 C CNN
F 3 "" H 4900 2500 50  0001 C CNN
	1    4900 2500
	1    0    0    -1  
$EndComp
$Comp
L -5V #PWR111
U 1 1 5A105265
P 5350 3250
F 0 "#PWR111" H 5350 3350 50  0001 C CNN
F 1 "-5V" H 5350 3400 50  0000 C CNN
F 2 "" H 5350 3250 50  0001 C CNN
F 3 "" H 5350 3250 50  0001 C CNN
	1    5350 3250
	-1   0    0    1   
$EndComp
$Comp
L C C22
U 1 1 5A105266
P 5350 3100
F 0 "C22" H 5375 3200 50  0000 L CNN
F 1 "0.1u" H 5375 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5388 2950 50  0001 C CNN
F 3 "" H 5350 3100 50  0001 C CNN
	1    5350 3100
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR092
U 1 1 5A105267
P 5350 2950
F 0 "#PWR092" H 5350 2700 50  0001 C CNN
F 1 "Earth" H 5350 2800 50  0001 C CNN
F 2 "" H 5350 2950 50  0001 C CNN
F 3 "" H 5350 2950 50  0001 C CNN
	1    5350 2950
	-1   0    0    1   
$EndComp
$Comp
L -5V #PWR123
U 1 1 5A105268
P 6600 7550
F 0 "#PWR123" H 6600 7650 50  0001 C CNN
F 1 "-5V" H 6600 7700 50  0000 C CNN
F 2 "" H 6600 7550 50  0001 C CNN
F 3 "" H 6600 7550 50  0001 C CNN
	1    6600 7550
	1    0    0    1   
$EndComp
$Comp
L C C35
U 1 1 5A105269
P 6600 7400
F 0 "C35" H 6625 7500 50  0000 L CNN
F 1 "0.1u" H 6625 7300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6638 7250 50  0001 C CNN
F 3 "" H 6600 7400 50  0001 C CNN
	1    6600 7400
	-1   0    0    -1  
$EndComp
$Comp
L Earth #PWR093
U 1 1 5A10526A
P 6600 7250
F 0 "#PWR093" H 6600 7000 50  0001 C CNN
F 1 "Earth" H 6600 7100 50  0001 C CNN
F 2 "" H 6600 7250 50  0001 C CNN
F 3 "" H 6600 7250 50  0001 C CNN
	1    6600 7250
	1    0    0    1   
$EndComp
$Comp
L R R26
U 1 1 5A10526B
P 6200 2850
F 0 "R26" V 6280 2850 50  0000 C CNN
F 1 "10K" V 6200 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6130 2850 50  0001 C CNN
F 3 "" H 6200 2850 50  0001 C CNN
	1    6200 2850
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR094
U 1 1 5A10526C
P 6200 3100
F 0 "#PWR094" H 6200 2850 50  0001 C CNN
F 1 "Earth" H 6200 2950 50  0001 C CNN
F 2 "" H 6200 3100 50  0001 C CNN
F 3 "" H 6200 3100 50  0001 C CNN
	1    6200 3100
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 5A10526D
P 4100 2800
F 0 "C21" H 4125 2900 50  0000 L CNN
F 1 "0.1u" H 4125 2700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4138 2650 50  0001 C CNN
F 3 "" H 4100 2800 50  0001 C CNN
	1    4100 2800
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR095
U 1 1 5A10526E
P 4100 3000
F 0 "#PWR095" H 4100 2750 50  0001 C CNN
F 1 "Earth" H 4100 2850 50  0001 C CNN
F 2 "" H 4100 3000 50  0001 C CNN
F 3 "" H 4100 3000 50  0001 C CNN
	1    4100 3000
	1    0    0    -1  
$EndComp
$Comp
L POT_TRIM RV2
U 1 1 5A105270
P 5400 7150
F 0 "RV2" V 5500 6950 50  0000 C CNN
F 1 "POT_TRIM" H 5400 7400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h3.8_Vertical_Px3.8mm_Py5.0mm" H 5400 7150 50  0001 C CNN
F 3 "" H 5400 7150 50  0001 C CNN
	1    5400 7150
	0    -1   1    0   
$EndComp
$Comp
L -5V #PWR112
U 1 1 5A105271
P 5400 7350
F 0 "#PWR112" H 5400 7450 50  0001 C CNN
F 1 "-5V" H 5400 7500 50  0000 C CNN
F 2 "" H 5400 7350 50  0001 C CNN
F 3 "" H 5400 7350 50  0001 C CNN
	1    5400 7350
	1    0    0    1   
$EndComp
$Comp
L R R20
U 1 1 5A105273
P 3750 1550
F 0 "R20" V 3830 1550 50  0000 C CNN
F 1 "2M2" V 3750 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3680 1550 50  0001 C CNN
F 3 "" H 3750 1550 50  0001 C CNN
	1    3750 1550
	-1   0    0    1   
$EndComp
$Comp
L R R21
U 1 1 5A105274
P 4400 1550
F 0 "R21" V 4480 1550 50  0000 C CNN
F 1 "270K" V 4400 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4330 1550 50  0001 C CNN
F 3 "" H 4400 1550 50  0001 C CNN
	1    4400 1550
	-1   0    0    1   
$EndComp
$Comp
L -5V #PWR105
U 1 1 5A105275
P 4850 1250
F 0 "#PWR105" H 4850 1350 50  0001 C CNN
F 1 "-5V" H 4850 1400 50  0000 C CNN
F 2 "" H 4850 1250 50  0001 C CNN
F 3 "" H 4850 1250 50  0001 C CNN
	1    4850 1250
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X01 J5
U 1 1 5A105279
P 6400 4800
F 0 "J5" H 6400 4900 50  0000 C CNN
F 1 "Dut+" V 6500 4800 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 6400 4800 50  0001 C CNN
F 3 "" H 6400 4800 50  0001 C CNN
	1    6400 4800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 J7
U 1 1 5A10527A
P 6400 5100
F 0 "J7" H 6400 5200 50  0000 C CNN
F 1 "DUT-" V 6500 5100 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 6400 5100 50  0001 C CNN
F 3 "" H 6400 5100 50  0001 C CNN
	1    6400 5100
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR096
U 1 1 5A10527B
P 6150 5300
F 0 "#PWR096" H 6150 5050 50  0001 C CNN
F 1 "Earth" H 6150 5150 50  0001 C CNN
F 2 "" H 6150 5300 50  0001 C CNN
F 3 "" H 6150 5300 50  0001 C CNN
	1    6150 5300
	1    0    0    -1  
$EndComp
$Comp
L LM35 U12
U 1 1 5A10527E
P 10600 5050
F 0 "U12" H 10750 5150 60  0000 C CNN
F 1 "LM35" H 10650 5250 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 11100 5600 60  0001 C CNN
F 3 "" H 10600 5050 60  0001 C CNN
	1    10600 5050
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR097
U 1 1 5A10527F
P 10500 5500
F 0 "#PWR097" H 10500 5250 50  0001 C CNN
F 1 "Earth" H 10500 5350 50  0001 C CNN
F 2 "" H 10500 5500 50  0001 C CNN
F 3 "" H 10500 5500 50  0001 C CNN
	1    10500 5500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR098
U 1 1 5A105280
P 10500 4600
F 0 "#PWR098" H 10500 4450 50  0001 C CNN
F 1 "+5V" H 10500 4740 50  0000 C CNN
F 2 "" H 10500 4600 50  0001 C CNN
F 3 "" H 10500 4600 50  0001 C CNN
	1    10500 4600
	1    0    0    -1  
$EndComp
$Comp
L LM321 U11
U 1 1 5A105281
P 9200 5000
F 0 "U11" H 9200 5300 50  0000 L CNN
F 1 "LM321" H 9200 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 9200 4850 50  0001 L CNN
F 3 "" H 9200 5000 50  0001 C CNN
	1    9200 5000
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR099
U 1 1 5A105282
P 9300 4550
F 0 "#PWR099" H 9300 4400 50  0001 C CNN
F 1 "+5V" H 9300 4690 50  0000 C CNN
F 2 "" H 9300 4550 50  0001 C CNN
F 3 "" H 9300 4550 50  0001 C CNN
	1    9300 4550
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0100
U 1 1 5A105283
P 9300 5350
F 0 "#PWR0100" H 9300 5100 50  0001 C CNN
F 1 "Earth" H 9300 5200 50  0001 C CNN
F 2 "" H 9300 5350 50  0001 C CNN
F 3 "" H 9300 5350 50  0001 C CNN
	1    9300 5350
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 5A105285
P 9500 5950
F 0 "R24" V 9580 5950 50  0000 C CNN
F 1 "10K" V 9500 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9430 5950 50  0001 C CNN
F 3 "" H 9500 5950 50  0001 C CNN
	1    9500 5950
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR0101
U 1 1 5A105286
P 9500 6200
F 0 "#PWR0101" H 9500 5950 50  0001 C CNN
F 1 "Earth" H 9500 6050 50  0001 C CNN
F 2 "" H 9500 6200 50  0001 C CNN
F 3 "" H 9500 6200 50  0001 C CNN
	1    9500 6200
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5A105287
P 9300 5650
F 0 "R23" V 9380 5650 50  0000 C CNN
F 1 "20K" V 9300 5650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9230 5650 50  0001 C CNN
F 3 "" H 9300 5650 50  0001 C CNN
	1    9300 5650
	0    1    1    0   
$EndComp
Text Notes 8350 4850 0    60   ~ 0
150C = 4.5V
$Comp
L +5V #PWR0102
U 1 1 5A105294
P 6300 7300
F 0 "#PWR0102" H 6300 7150 50  0001 C CNN
F 1 "+5V" H 6300 7440 50  0000 C CNN
F 2 "" H 6300 7300 50  0001 C CNN
F 3 "" H 6300 7300 50  0001 C CNN
	1    6300 7300
	-1   0    0    -1  
$EndComp
$Comp
L C C36
U 1 1 5A105295
P 6300 7450
F 0 "C36" H 6325 7550 50  0000 L CNN
F 1 "0.1u" H 6325 7350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6338 7300 50  0001 C CNN
F 3 "" H 6300 7450 50  0001 C CNN
	1    6300 7450
	-1   0    0    -1  
$EndComp
$Comp
L Earth #PWR0103
U 1 1 5A105296
P 6300 7600
F 0 "#PWR0103" H 6300 7350 50  0001 C CNN
F 1 "Earth" H 6300 7450 50  0001 C CNN
F 2 "" H 6300 7600 50  0001 C CNN
F 3 "" H 6300 7600 50  0001 C CNN
	1    6300 7600
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR0104
U 1 1 5A105297
P 5600 3000
F 0 "#PWR0104" H 5600 2850 50  0001 C CNN
F 1 "+5V" H 5600 3140 50  0000 C CNN
F 2 "" H 5600 3000 50  0001 C CNN
F 3 "" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 5A105298
P 5600 3150
F 0 "C23" H 5625 3250 50  0000 L CNN
F 1 "0.1u" H 5625 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5638 3000 50  0001 C CNN
F 3 "" H 5600 3150 50  0001 C CNN
	1    5600 3150
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0105
U 1 1 5A105299
P 5600 3300
F 0 "#PWR0105" H 5600 3050 50  0001 C CNN
F 1 "Earth" H 5600 3150 50  0001 C CNN
F 2 "" H 5600 3300 50  0001 C CNN
F 3 "" H 5600 3300 50  0001 C CNN
	1    5600 3300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR0106
U 1 1 5A10529A
P 2400 1550
F 0 "#PWR0106" H 2400 1400 50  0001 C CNN
F 1 "+5V" H 2400 1690 50  0000 C CNN
F 2 "" H 2400 1550 50  0001 C CNN
F 3 "" H 2400 1550 50  0001 C CNN
	1    2400 1550
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 5A10529B
P 2400 1700
F 0 "C20" H 2425 1800 50  0000 L CNN
F 1 "0.1u" H 2425 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2438 1550 50  0001 C CNN
F 3 "" H 2400 1700 50  0001 C CNN
	1    2400 1700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0107
U 1 1 5A10529C
P 2400 1850
F 0 "#PWR0107" H 2400 1600 50  0001 C CNN
F 1 "Earth" H 2400 1700 50  0001 C CNN
F 2 "" H 2400 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
$Comp
L R R34
U 1 1 5A1052B1
P 4400 6450
F 0 "R34" V 4480 6450 50  0000 C CNN
F 1 "0.1" V 4400 6450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 4330 6450 50  0001 C CNN
F 3 "" H 4400 6450 50  0001 C CNN
	1    4400 6450
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR0108
U 1 1 5A1052BD
P 3300 6400
F 0 "#PWR0108" H 3300 6250 50  0001 C CNN
F 1 "+12V" H 3300 6540 50  0000 C CNN
F 2 "" H 3300 6400 50  0001 C CNN
F 3 "" H 3300 6400 50  0001 C CNN
	1    3300 6400
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR0109
U 1 1 5A1052BE
P 3050 6400
F 0 "#PWR0109" H 3050 6250 50  0001 C CNN
F 1 "+12V" H 3050 6540 50  0000 C CNN
F 2 "" H 3050 6400 50  0001 C CNN
F 3 "" H 3050 6400 50  0001 C CNN
	1    3050 6400
	1    0    0    -1  
$EndComp
Text GLabel 2450 2450 0    60   Input ~ 0
SDA
Text GLabel 2450 2600 0    60   Input ~ 0
SCL
Text GLabel 8450 5000 0    60   Input ~ 0
LoadBlockTemp
$Comp
L OP07 U14
U 1 1 5A10C2AF
P 4800 2800
F 0 "U14" H 5141 2846 50  0000 L CNN
F 1 "OP07" H 5141 2755 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 4850 2850 50  0001 C CNN
F 3 "" H 4850 2950 50  0001 C CNN
	1    4800 2800
	-1   0    0    -1  
$EndComp
$Comp
L OP07 U15
U 1 1 5A10D231
P 3000 5350
F 0 "U15" H 3000 5650 50  0000 L CNN
F 1 "OP07" H 3000 5550 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 3050 5400 50  0001 C CNN
F 3 "" H 3050 5500 50  0001 C CNN
	1    3000 5350
	1    0    0    -1  
$EndComp
$Comp
L OP07 U17
U 1 1 5A10D2DB
P 5400 6400
F 0 "U17" H 5741 6446 50  0000 L CNN
F 1 "OP07" H 5741 6355 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 5450 6450 50  0001 C CNN
F 3 "" H 5450 6550 50  0001 C CNN
	1    5400 6400
	1    0    0    -1  
$EndComp
$Comp
L Fuse F1
U 1 1 5A10E0E7
P 5950 4800
F 0 "F1" V 5753 4800 50  0000 C CNN
F 1 "Fuse" V 5844 4800 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_universal_Type-III" V 5880 4800 50  0001 C CNN
F 3 "" H 5950 4800 50  0001 C CNN
	1    5950 4800
	0    1    1    0   
$EndComp
$Comp
L -5V #PWR90
U 1 1 5A11325E
P 2650 5650
F 0 "#PWR90" H 2650 5750 50  0001 C CNN
F 1 "-5V" H 2650 5800 50  0000 C CNN
F 2 "" H 2650 5650 50  0001 C CNN
F 3 "" H 2650 5650 50  0001 C CNN
	1    2650 5650
	-1   0    0    1   
$EndComp
$Comp
L -5V #PWR89
U 1 1 5A113842
P 2450 6650
F 0 "#PWR89" H 2450 6750 50  0001 C CNN
F 1 "-5V" H 2450 6800 50  0000 C CNN
F 2 "" H 2450 6650 50  0001 C CNN
F 3 "" H 2450 6650 50  0001 C CNN
	1    2450 6650
	-1   0    0    1   
$EndComp
$Comp
L C C24
U 1 1 5A113848
P 2450 6500
F 0 "C24" H 2475 6600 50  0000 L CNN
F 1 "0.1u" H 2475 6400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 6350 50  0001 C CNN
F 3 "" H 2450 6500 50  0001 C CNN
	1    2450 6500
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0110
U 1 1 5A11384F
P 2450 6350
F 0 "#PWR0110" H 2450 6100 50  0001 C CNN
F 1 "Earth" H 2450 6200 50  0001 C CNN
F 2 "" H 2450 6350 50  0001 C CNN
F 3 "" H 2450 6350 50  0001 C CNN
	1    2450 6350
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR0111
U 1 1 5A113855
P 2750 6400
F 0 "#PWR0111" H 2750 6250 50  0001 C CNN
F 1 "+5V" H 2750 6540 50  0000 C CNN
F 2 "" H 2750 6400 50  0001 C CNN
F 3 "" H 2750 6400 50  0001 C CNN
	1    2750 6400
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 5A11385B
P 2750 6550
F 0 "C26" H 2775 6650 50  0000 L CNN
F 1 "0.1u" H 2775 6450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2788 6400 50  0001 C CNN
F 3 "" H 2750 6550 50  0001 C CNN
	1    2750 6550
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0112
U 1 1 5A113862
P 2750 6700
F 0 "#PWR0112" H 2750 6450 50  0001 C CNN
F 1 "Earth" H 2750 6550 50  0001 C CNN
F 2 "" H 2750 6700 50  0001 C CNN
F 3 "" H 2750 6700 50  0001 C CNN
	1    2750 6700
	1    0    0    -1  
$EndComp
Text GLabel 2000 5250 0    60   Input ~ 0
CurrentSet
$Comp
L POT_TRIM RV3
U 1 1 5ABBF230
P 3050 5800
F 0 "RV3" V 3150 5600 50  0000 C CNN
F 1 "POT_TRIM" V 3450 5850 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h3.8_Vertical_Px3.8mm_Py5.0mm" H 3050 5800 50  0001 C CNN
F 3 "" H 3050 5800 50  0001 C CNN
	1    3050 5800
	0    -1   1    0   
$EndComp
Text GLabel 2450 2300 0    60   Input ~ 0
comperator
Text Notes 3150 4500 0    60   ~ 0
14 bits = 4096 steps\n1 step=1mV\n1mV@0.1 Ohm = 10mA 
Text GLabel 900  5400 0    60   Input ~ 0
loadOff
$Comp
L OP07 U18
U 1 1 5ABC926F
P 6550 2700
F 0 "U18" H 6600 2950 50  0000 L CNN
F 1 "OP07" H 6600 2850 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6600 2750 50  0001 C CNN
F 3 "" H 6600 2850 50  0001 C CNN
	1    6550 2700
	-1   0    0    1   
$EndComp
$Comp
L R R40
U 1 1 5ABC9949
P 7150 2600
F 0 "R40" V 7230 2600 50  0000 C CNN
F 1 "1M" V 7150 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7080 2600 50  0001 C CNN
F 3 "" H 7150 2600 50  0001 C CNN
	1    7150 2600
	0    1    1    0   
$EndComp
$Comp
L R R41
U 1 1 5ABC9AA1
P 7150 2800
F 0 "R41" V 7230 2800 50  0000 C CNN
F 1 "1M" V 7150 2800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7080 2800 50  0001 C CNN
F 3 "" H 7150 2800 50  0001 C CNN
	1    7150 2800
	0    1    1    0   
$EndComp
$Comp
L R R36
U 1 1 5ABC9B50
P 6600 1650
F 0 "R36" V 6500 1650 50  0000 C CNN
F 1 "20K" V 6600 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6530 1650 50  0001 C CNN
F 3 "" H 6600 1650 50  0001 C CNN
	1    6600 1650
	0    1    1    0   
$EndComp
$Comp
L R R37
U 1 1 5ABC9D7C
P 6950 3150
F 0 "R37" V 7030 3150 50  0000 C CNN
F 1 "20K" V 6950 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6880 3150 50  0001 C CNN
F 3 "" H 6950 3150 50  0001 C CNN
	1    6950 3150
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR0113
U 1 1 5ABCA1D8
P 7450 1550
F 0 "#PWR0113" H 7450 1300 50  0001 C CNN
F 1 "Earth" H 7450 1400 50  0001 C CNN
F 2 "" H 7450 1550 50  0001 C CNN
F 3 "" H 7450 1550 50  0001 C CNN
	1    7450 1550
	1    0    0    1   
$EndComp
$Comp
L C C32
U 1 1 5ABCA9A1
P 7450 1700
F 0 "C32" H 7475 1800 50  0000 L CNN
F 1 "C" H 7475 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7488 1550 50  0001 C CNN
F 3 "" H 7450 1700 50  0001 C CNN
	1    7450 1700
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR0114
U 1 1 5ABCB1FF
P 6950 3500
F 0 "#PWR0114" H 6950 3250 50  0001 C CNN
F 1 "Earth" H 6950 3350 50  0001 C CNN
F 2 "" H 6950 3500 50  0001 C CNN
F 3 "" H 6950 3500 50  0001 C CNN
	1    6950 3500
	1    0    0    -1  
$EndComp
$Comp
L -5V #PWR125
U 1 1 5ABCB57F
P 6850 2350
F 0 "#PWR125" H 6850 2450 50  0001 C CNN
F 1 "-5V" H 6850 2500 50  0000 C CNN
F 2 "" H 6850 2350 50  0001 C CNN
F 3 "" H 6850 2350 50  0001 C CNN
	1    6850 2350
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR0115
U 1 1 5ABCBD38
P 6650 3000
F 0 "#PWR0115" H 6650 2850 50  0001 C CNN
F 1 "+5V" H 6650 3140 50  0000 C CNN
F 2 "" H 6650 3000 50  0001 C CNN
F 3 "" H 6650 3000 50  0001 C CNN
	1    6650 3000
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR0116
U 1 1 5ABCC64C
P 7150 1850
F 0 "#PWR0116" H 7150 1600 50  0001 C CNN
F 1 "Earth" H 7150 1700 50  0001 C CNN
F 2 "" H 7150 1850 50  0001 C CNN
F 3 "" H 7150 1850 50  0001 C CNN
	1    7150 1850
	-1   0    0    -1  
$EndComp
$Comp
L C C31
U 1 1 5ABCC652
P 7150 1700
F 0 "C31" H 7175 1800 50  0000 L CNN
F 1 "C" H 7175 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7188 1550 50  0001 C CNN
F 3 "" H 7150 1700 50  0001 C CNN
	1    7150 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR0117
U 1 1 5ABCC658
P 7150 1550
F 0 "#PWR0117" H 7150 1400 50  0001 C CNN
F 1 "+5V" H 7150 1690 50  0000 C CNN
F 2 "" H 7150 1550 50  0001 C CNN
F 3 "" H 7150 1550 50  0001 C CNN
	1    7150 1550
	1    0    0    -1  
$EndComp
$Comp
L -5V #PWR130
U 1 1 5ABCC765
P 7450 1950
F 0 "#PWR130" H 7450 2050 50  0001 C CNN
F 1 "-5V" H 7450 2100 50  0000 C CNN
F 2 "" H 7450 1950 50  0001 C CNN
F 3 "" H 7450 1950 50  0001 C CNN
	1    7450 1950
	-1   0    0    1   
$EndComp
Text Notes 7950 2350 0    60   ~ 0
Remote sense\nGår via en 2x2 pols brytare på fronten.\nAntingen mäter den via banankontakter eller rätt på utgången
$Comp
L POT_TRIM RV1
U 1 1 5A10526F
P 6500 2200
F 0 "RV1" V 6600 2300 50  0000 C CNN
F 1 "POT_TRIM" V 6400 2200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h3.8_Vertical_Px3.8mm_Py5.0mm" H 6500 2200 50  0001 C CNN
F 3 "" H 6500 2200 50  0001 C CNN
	1    6500 2200
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR0118
U 1 1 5ABD6BD5
P 6500 1900
F 0 "#PWR0118" H 6500 1750 50  0001 C CNN
F 1 "+5V" H 6500 2040 50  0000 C CNN
F 2 "" H 6500 1900 50  0001 C CNN
F 3 "" H 6500 1900 50  0001 C CNN
	1    6500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 4100 5350
Connection ~ 3750 5350
Wire Wire Line
	3750 5850 3750 5800
Wire Wire Line
	4400 5500 4400 6300
Wire Wire Line
	3350 2300 3800 2300
Wire Wire Line
	5100 6500 5100 7600
Wire Wire Line
	5100 7600 5700 7600
Wire Wire Line
	5700 7600 5700 6400
Wire Wire Line
	4750 6300 5100 6300
Wire Wire Line
	6350 5950 6350 6450
Connection ~ 6350 6400
Wire Wire Line
	6350 6900 6350 6750
Wire Wire Line
	5150 2900 5150 3300
Wire Wire Line
	5150 3300 4500 3300
Wire Wire Line
	5100 2700 6250 2700
Connection ~ 5150 2900
Wire Wire Line
	6200 3100 6200 3000
Wire Wire Line
	3350 2450 4500 2450
Connection ~ 4500 2800
Wire Wire Line
	4100 2650 4100 2450
Connection ~ 4100 2450
Wire Wire Line
	4100 3000 4100 2950
Wire Wire Line
	3350 2150 3950 2150
Wire Wire Line
	3750 1700 3750 2150
Connection ~ 3750 2150
Wire Wire Line
	4400 1700 4400 2450
Connection ~ 4400 2450
Wire Wire Line
	3750 1400 3750 1150
Wire Wire Line
	3750 1150 4850 1150
Wire Wire Line
	4850 1150 4850 1250
Wire Wire Line
	4400 1400 4400 1150
Connection ~ 4400 1150
Connection ~ 6250 2700
Wire Wire Line
	6200 5100 6150 5100
Wire Wire Line
	6150 5100 6150 5300
Wire Wire Line
	10500 4750 10500 4600
Wire Wire Line
	9300 4700 9300 4550
Wire Wire Line
	9300 5350 9300 5300
Wire Wire Line
	9500 5100 9500 5800
Wire Wire Line
	8800 5650 8800 5000
Wire Wire Line
	8450 5000 8900 5000
Connection ~ 8800 5000
Wire Wire Line
	10200 5100 10200 4900
Wire Wire Line
	10200 4900 9500 4900
Wire Wire Line
	8800 5650 9150 5650
Wire Wire Line
	9500 5650 9450 5650
Connection ~ 9500 5650
Wire Wire Line
	9500 6200 9500 6100
Wire Wire Line
	3450 5700 3450 5700
Wire Wire Line
	3450 5400 3450 5350
Connection ~ 3450 5350
Wire Wire Line
	3750 5350 3750 5500
Connection ~ 2200 5850
Wire Wire Line
	2200 5450 2700 5450
Wire Wire Line
	6650 5950 6350 5950
Wire Wire Line
	5700 6400 6350 6400
Wire Wire Line
	4400 6650 4400 6600
Wire Wire Line
	5100 2900 5150 2900
Wire Wire Line
	5450 4850 5450 4800
Connection ~ 5450 4800
Wire Wire Line
	6100 4800 6200 4800
Wire Wire Line
	5550 6700 5500 6700
Wire Wire Line
	5400 6700 5400 7000
Wire Wire Line
	5400 7000 5250 7000
Wire Wire Line
	5250 7000 5250 7150
Wire Wire Line
	5400 7300 5400 7350
Wire Wire Line
	5550 7150 5550 6700
Wire Wire Line
	6500 2050 6500 1900
Wire Wire Line
	2000 5250 2700 5250
Wire Wire Line
	2050 5250 2050 5150
Connection ~ 2050 5250
Wire Wire Line
	2200 5450 2200 6050
Connection ~ 4400 6050
Wire Wire Line
	4750 6300 4750 6050
Wire Wire Line
	4750 6050 4700 6050
Wire Wire Line
	3450 6000 3450 6050
Connection ~ 3450 6050
Wire Wire Line
	2650 5650 2900 5650
Wire Wire Line
	3050 5950 2750 5950
Wire Wire Line
	2750 5950 2750 5650
Connection ~ 2750 5650
Wire Wire Line
	2900 5800 2900 5700
Wire Wire Line
	2900 5700 3000 5700
Wire Wire Line
	3000 5700 3000 5650
Wire Wire Line
	3200 5700 3200 5800
Wire Wire Line
	3200 5700 3100 5700
Wire Wire Line
	3100 5700 3100 5650
Wire Wire Line
	3350 2600 3650 2600
Wire Wire Line
	3650 2600 3650 3000
Wire Wire Line
	4400 4800 5800 4800
Wire Wire Line
	6850 2600 7000 2600
Wire Wire Line
	6850 2800 7000 2800
Wire Wire Line
	6950 3000 6950 2800
Connection ~ 6950 2800
Wire Wire Line
	6950 3500 6950 3300
Wire Wire Line
	6850 2350 6650 2350
Wire Wire Line
	6650 2350 6650 2400
Wire Wire Line
	7450 1850 7450 1950
Wire Wire Line
	6250 2700 6250 1650
Wire Wire Line
	6750 1650 6950 1650
Wire Wire Line
	6950 1650 6950 2600
Connection ~ 6950 2600
Wire Wire Line
	7550 2600 7300 2600
Wire Wire Line
	7550 2800 7300 2800
Wire Wire Line
	4400 5100 4400 4800
Wire Wire Line
	2200 6050 4400 6050
Wire Wire Line
	6250 1650 6450 1650
Wire Wire Line
	6350 2200 6350 2400
Wire Wire Line
	6350 2400 6450 2400
Wire Wire Line
	6650 2200 6650 2300
Wire Wire Line
	6650 2300 6550 2300
Wire Wire Line
	6550 2300 6550 2400
Connection ~ 6200 2700
$Comp
L R R35
U 1 1 5ABD9C69
P 4500 2600
F 0 "R35" V 4580 2600 50  0000 C CNN
F 1 "100R" V 4500 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4430 2600 50  0001 C CNN
F 3 "" H 4500 2600 50  0001 C CNN
	1    4500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3300 4500 2750
Text Notes 3900 1650 1    60   ~ 0
nc?
$Comp
L +5V #PWR0119
U 1 1 5ABDA9DC
P 2000 1550
F 0 "#PWR0119" H 2000 1400 50  0001 C CNN
F 1 "+5V" H 2000 1690 50  0000 C CNN
F 2 "" H 2000 1550 50  0001 C CNN
F 3 "" H 2000 1550 50  0001 C CNN
	1    2000 1550
	1    0    0    -1  
$EndComp
$Comp
L C C30
U 1 1 5ABDA9E2
P 2000 1700
F 0 "C30" H 2025 1800 50  0000 L CNN
F 1 "10u" H 2025 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2038 1550 50  0001 C CNN
F 3 "" H 2000 1700 50  0001 C CNN
	1    2000 1700
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0120
U 1 1 5ABDA9E8
P 2000 1850
F 0 "#PWR0120" H 2000 1600 50  0001 C CNN
F 1 "Earth" H 2000 1700 50  0001 C CNN
F 2 "" H 2000 1850 50  0001 C CNN
F 3 "" H 2000 1850 50  0001 C CNN
	1    2000 1850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0121
U 1 1 5ABDB91D
P 7650 5900
F 0 "#PWR0121" H 7650 5650 50  0001 C CNN
F 1 "Earth" H 7650 5750 50  0001 C CNN
F 2 "" H 7650 5900 50  0001 C CNN
F 3 "" H 7650 5900 50  0001 C CNN
	1    7650 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0122
U 1 1 5ABDB992
P 7850 5900
F 0 "#PWR0122" H 7850 5650 50  0001 C CNN
F 1 "GND" H 7850 5750 50  0000 C CNN
F 2 "" H 7850 5900 50  0001 C CNN
F 3 "" H 7850 5900 50  0001 C CNN
	1    7850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5900 7850 5850
Wire Wire Line
	7850 5850 7650 5850
Wire Wire Line
	7650 5850 7650 5900
$Comp
L POT_TRIM RV4
U 1 1 5ABE7298
P 1200 6700
F 0 "RV4" V 1300 6500 50  0000 C CNN
F 1 "Null cal" H 1250 6950 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h3.8_Vertical_Px3.8mm_Py5.0mm" H 1200 6700 50  0001 C CNN
F 3 "" H 1200 6700 50  0001 C CNN
	1    1200 6700
	1    0    0    1   
$EndComp
Text GLabel 1200 6550 1    60   Input ~ 0
4.096V
$Comp
L Earth #PWR0123
U 1 1 5ABE84AA
P 1700 7600
F 0 "#PWR0123" H 1700 7350 50  0001 C CNN
F 1 "Earth" H 1700 7450 50  0001 C CNN
F 2 "" H 1700 7600 50  0001 C CNN
F 3 "" H 1700 7600 50  0001 C CNN
	1    1700 7600
	1    0    0    -1  
$EndComp
$Comp
L TL431A U20
U 1 1 5ABE87E4
P 1700 7300
F 0 "U20" H 1200 7700 60  0000 C CNN
F 1 "TL431A" H 2100 7600 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 1100 7600 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl432a.pdf" H 1200 7700 60  0001 C CNN
	1    1700 7300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 7250 2000 7550
Wire Wire Line
	2000 7550 1700 7550
Wire Wire Line
	1700 7550 1700 7600
$Comp
L R R42
U 1 1 5ABE8DC8
P 1700 6800
F 0 "R42" V 1780 6800 50  0000 C CNN
F 1 "R" V 1700 6800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1630 6800 50  0001 C CNN
F 3 "" H 1700 6800 50  0001 C CNN
	1    1700 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 7000 1700 6950
$Comp
L -5V #PWR82
U 1 1 5ABE8F5D
P 1700 6550
F 0 "#PWR82" H 1700 6650 50  0001 C CNN
F 1 "-5V" H 1700 6700 50  0000 C CNN
F 2 "" H 1700 6550 50  0001 C CNN
F 3 "" H 1700 6550 50  0001 C CNN
	1    1700 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6650 1700 6550
Wire Wire Line
	1700 7000 1200 7000
Wire Wire Line
	1200 7000 1200 6850
Wire Wire Line
	1350 6700 1550 6700
Wire Wire Line
	1550 6700 1550 5850
Wire Wire Line
	1550 5850 1700 5850
$Comp
L R R43
U 1 1 5ABE944E
P 1850 5850
F 0 "R43" V 1930 5850 50  0000 C CNN
F 1 "4M7" V 1850 5850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1780 5850 50  0001 C CNN
F 3 "" H 1850 5850 50  0001 C CNN
	1    1850 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 5850 2200 5850
$Comp
L LM321 U19
U 1 1 5ABE9BAF
P 1300 5500
F 0 "U19" H 1300 5800 50  0000 L CNN
F 1 "LM321" H 1300 5700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 1300 5500 50  0001 C CNN
F 3 "" H 1300 5500 50  0001 C CNN
	1    1300 5500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR0124
U 1 1 5ABEA25C
P 1200 5200
F 0 "#PWR0124" H 1200 5050 50  0001 C CNN
F 1 "+5V" H 1200 5340 50  0000 C CNN
F 2 "" H 1200 5200 50  0001 C CNN
F 3 "" H 1200 5200 50  0001 C CNN
	1    1200 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5400 900  5400
Connection ~ 2200 5500
$Comp
L Earth #PWR0125
U 1 1 5ABEA8D4
P 1200 5800
F 0 "#PWR0125" H 1200 5550 50  0001 C CNN
F 1 "Earth" H 1200 5650 50  0001 C CNN
F 2 "" H 1200 5800 50  0001 C CNN
F 3 "" H 1200 5800 50  0001 C CNN
	1    1200 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5600 1000 5950
Wire Wire Line
	1000 5950 1500 5950
Wire Wire Line
	1500 5950 1500 5550
Wire Wire Line
	1500 5550 1650 5550
Wire Wire Line
	1650 5550 1650 5500
Connection ~ 1650 5500
$Comp
L R R44
U 1 1 5ABEAC70
P 1900 5500
F 0 "R44" V 1980 5500 50  0000 C CNN
F 1 "4M7" V 1900 5500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1830 5500 50  0001 C CNN
F 3 "" H 1900 5500 50  0001 C CNN
	1    1900 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 5500 1750 5500
Wire Wire Line
	2050 5500 2200 5500
Text Notes 550  4650 0    60   ~ 0
Goes +3v3 to force output LOW
$Comp
L Earth #PWR0126
U 1 1 5ABEB605
P 5450 5150
F 0 "#PWR0126" H 5450 4900 50  0001 C CNN
F 1 "Earth" H 5450 5000 50  0001 C CNN
F 2 "" H 5450 5150 50  0001 C CNN
F 3 "" H 5450 5150 50  0001 C CNN
	1    5450 5150
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 5ABE354B
P 5450 5000
F 0 "D1" H 5450 5100 50  0000 C CNN
F 1 "D_Schottky" H 5450 4900 50  0000 C CNN
F 2 "Diodes_SMD:D_SMB-SMC_Universal_Handsoldering" H 5450 5000 50  0001 C CNN
F 3 "" H 5450 5000 50  0001 C CNN
	1    5450 5000
	0    1    1    0   
$EndComp
Text Label 6200 4700 0    60   ~ 0
Dut+
Text Label 6150 4800 0    60   ~ 0
Dut+_efter_säkring
$Comp
L Conn_01x02 J12
U 1 1 5ABE59E3
P 7750 2650
F 0 "J12" H 7750 2750 50  0000 C CNN
F 1 "Remote_sense" H 7750 2450 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 7750 2650 50  0001 C CNN
F 3 "" H 7750 2650 50  0001 C CNN
	1    7750 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2650 7550 2600
Wire Wire Line
	7550 2750 7550 2800
$EndSCHEMATC