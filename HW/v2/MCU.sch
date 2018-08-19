EESchema Schematic File Version 4
LIBS:v2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 5500 2700 3    60   Input ~ 0
SCL
Text GLabel 5250 2700 3    60   Input ~ 0
SDA
$Comp
L device:R_Small R28
U 1 1 5ADB7193
P 5250 2600
F 0 "R28" H 5280 2620 50  0000 L CNN
F 1 "1K" H 5280 2560 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5250 2600 50  0001 C CNN
F 3 "" H 5250 2600 50  0001 C CNN
	1    5250 2600
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R29
U 1 1 5ADB719A
P 5500 2600
F 0 "R29" H 5530 2620 50  0000 L CNN
F 1 "1K" H 5530 2560 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5500 2600 50  0001 C CNN
F 3 "" H 5500 2600 50  0001 C CNN
	1    5500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR087
U 1 1 5ADB71A1
P 5250 2450
F 0 "#PWR087" H 5250 2300 50  0001 C CNN
F 1 "+3.3V" H 5250 2590 50  0000 C CNN
F 2 "" H 5250 2450 50  0001 C CNN
F 3 "" H 5250 2450 50  0001 C CNN
	1    5250 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR088
U 1 1 5ADB71A7
P 5500 2450
F 0 "#PWR088" H 5500 2300 50  0001 C CNN
F 1 "+3.3V" H 5500 2590 50  0000 C CNN
F 2 "" H 5500 2450 50  0001 C CNN
F 3 "" H 5500 2450 50  0001 C CNN
	1    5500 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR089
U 1 1 5ADB71AD
P 1800 3050
F 0 "#PWR089" H 1800 2800 50  0001 C CNN
F 1 "GND" H 1800 2900 50  0000 C CNN
F 2 "" H 1800 3050 50  0001 C CNN
F 3 "" H 1800 3050 50  0001 C CNN
	1    1800 3050
	0    1    1    0   
$EndComp
Text GLabel 1800 2650 0    60   Input ~ 0
SDA
Text GLabel 1800 2550 0    60   Input ~ 0
SCL
Text GLabel 1800 2150 0    60   Input ~ 0
encBTN
Text GLabel 1800 2350 0    60   Input ~ 0
encB
Text GLabel 1800 2250 0    60   Input ~ 0
encA
Text GLabel 4300 1750 2    60   Input ~ 0
OverTemp
$Comp
L power:GND #PWR090
U 1 1 5ADB71BF
P 5200 1650
F 0 "#PWR090" H 5200 1400 50  0001 C CNN
F 1 "GND" H 5200 1500 50  0000 C CNN
F 2 "" H 5200 1650 50  0001 C CNN
F 3 "" H 5200 1650 50  0001 C CNN
	1    5200 1650
	1    0    0    -1  
$EndComp
Text GLabel 4200 1650 2    60   Input ~ 0
comperator
Text GLabel 1800 1850 0    60   Input ~ 0
trig
Text GLabel 1800 1650 0    60   Input ~ 0
out1
Text GLabel 1800 1750 0    60   Input ~ 0
out2
Wire Wire Line
	4200 1550 5200 1550
Wire Wire Line
	4300 1750 4200 1750
Wire Wire Line
	5500 2500 5500 2450
Wire Wire Line
	5250 2500 5250 2450
Text GLabel 4200 1850 2    60   Input ~ 0
LoadBlockTemp
$Comp
L Peters:Bluepill U15
U 1 1 5ADB71CF
P 2950 1800
F 0 "U15" H 3300 2650 60  0000 C CNN
F 1 "Bluepill" H 2700 2700 60  0000 C CNN
F 2 "Libs:Bluepill" H 2850 1950 60  0001 C CNN
F 3 "http://wiki.stm32duino.com/index.php?title=STM32F103_boards" H 3000 2900 60  0001 C CNN
	1    2950 1800
	1    0    0    -1  
$EndComp
$Comp
L conn:Conn_01x02 J11
U 1 1 5ADB71D6
P 5400 1550
F 0 "J11" H 5400 1650 50  0000 C CNN
F 1 "RST" H 5400 1350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5400 1550 50  0001 C CNN
F 3 "" H 5400 1550 50  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR091
U 1 1 5ADB71DD
P 4200 1250
F 0 "#PWR091" H 4200 1000 50  0001 C CNN
F 1 "GND" H 4200 1100 50  0000 C CNN
F 2 "" H 4200 1250 50  0001 C CNN
F 3 "" H 4200 1250 50  0001 C CNN
	1    4200 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR092
U 1 1 5ADB71E3
P 4200 1350
F 0 "#PWR092" H 4200 1100 50  0001 C CNN
F 1 "GND" H 4200 1200 50  0000 C CNN
F 2 "" H 4200 1350 50  0001 C CNN
F 3 "" H 4200 1350 50  0001 C CNN
	1    4200 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 1450 4600 1450
Wire Wire Line
	4600 1450 4600 1400
$Comp
L power:+3.3V #PWR093
U 1 1 5ADB71EB
P 4600 1400
F 0 "#PWR093" H 4600 1250 50  0001 C CNN
F 1 "+3.3V" H 4600 1540 50  0000 C CNN
F 2 "" H 4600 1400 50  0001 C CNN
F 3 "" H 4600 1400 50  0001 C CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2800 4950 2750
Wire Wire Line
	4950 2450 4950 2400
$Comp
L power:GND #PWR094
U 1 1 5ADB71F3
P 4950 2800
F 0 "#PWR094" H 4950 2550 50  0001 C CNN
F 1 "GND" H 4950 2650 50  0000 C CNN
F 2 "" H 4950 2800 50  0001 C CNN
F 3 "" H 4950 2800 50  0001 C CNN
	1    4950 2800
	1    0    0    -1  
$EndComp
$Comp
L device:C C23
U 1 1 5ADB71F9
P 4950 2600
F 0 "C23" H 4975 2700 50  0000 L CNN
F 1 "100n" H 4975 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4988 2450 50  0001 C CNN
F 3 "" H 4950 2600 50  0001 C CNN
	1    4950 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR095
U 1 1 5ADB7200
P 4950 2400
F 0 "#PWR095" H 4950 2250 50  0001 C CNN
F 1 "+3.3V" H 4950 2540 50  0000 C CNN
F 2 "" H 4950 2400 50  0001 C CNN
F 3 "" H 4950 2400 50  0001 C CNN
	1    4950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2800 4700 2750
Wire Wire Line
	4700 2450 4700 2400
$Comp
L power:GND #PWR096
U 1 1 5ADB7208
P 4700 2800
F 0 "#PWR096" H 4700 2550 50  0001 C CNN
F 1 "GND" H 4700 2650 50  0000 C CNN
F 2 "" H 4700 2800 50  0001 C CNN
F 3 "" H 4700 2800 50  0001 C CNN
	1    4700 2800
	1    0    0    -1  
$EndComp
$Comp
L device:C C22
U 1 1 5ADB720E
P 4700 2600
F 0 "C22" H 4725 2700 50  0000 L CNN
F 1 "100n" H 4725 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4738 2450 50  0001 C CNN
F 3 "" H 4700 2600 50  0001 C CNN
	1    4700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR097
U 1 1 5ADB7215
P 4700 2400
F 0 "#PWR097" H 4700 2250 50  0001 C CNN
F 1 "+3.3V" H 4700 2540 50  0000 C CNN
F 2 "" H 4700 2400 50  0001 C CNN
F 3 "" H 4700 2400 50  0001 C CNN
	1    4700 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR098
U 1 1 5ADB721B
P 1500 3150
F 0 "#PWR098" H 1500 3000 50  0001 C CNN
F 1 "+3.3V" H 1500 3290 50  0000 C CNN
F 2 "" H 1500 3150 50  0001 C CNN
F 3 "" H 1500 3150 50  0001 C CNN
	1    1500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3150 1500 3150
NoConn ~ 1800 2050
NoConn ~ 1800 1950
Text GLabel 4200 2050 2    60   Input ~ 0
MOSI
Text GLabel 4200 2150 2    60   Input ~ 0
MISO
Text GLabel 4200 2250 2    60   Input ~ 0
SCK
Text GLabel 4200 2350 2    60   Input ~ 0
SS
Text GLabel 4200 1950 2    60   Input ~ 0
fan_PWM
$Comp
L conn:Conn_01x02 J10
U 1 1 5ADB7229
P 4400 2650
F 0 "J10" H 4400 2750 50  0000 C CNN
F 1 "GPIO" H 4400 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4400 2650 50  0001 C CNN
F 3 "" H 4400 2650 50  0001 C CNN
	1    4400 2650
	1    0    0    -1  
$EndComp
$Comp
L opto:PC817 U18
U 1 1 5ADB8458
P 9300 1350
F 0 "U18" H 9100 1550 50  0000 L CNN
F 1 "PC817" H 9300 1550 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 9100 1150 50  0001 L CIN
F 3 "" H 9300 1350 50  0001 L CNN
	1    9300 1350
	-1   0    0    -1  
$EndComp
$Comp
L Peters:1N4148 D4
U 1 1 5ADB845F
P 9500 1400
F 0 "D4" H 9450 1100 60  0000 C CNN
F 1 "1N4148" H 9500 850 60  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9350 1000 60  0001 C CNN
F 3 "https://www.vishay.com/docs/81857/1n4148.pdf" H 9450 1100 60  0001 C CNN
	1    9500 1400
	0    -1   -1   0   
$EndComp
$Comp
L device:R R31
U 1 1 5ADB8466
P 10250 1450
F 0 "R31" V 10330 1450 50  0000 C CNN
F 1 "100R" V 10250 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10180 1450 50  0001 C CNN
F 3 "" H 10250 1450 50  0001 C CNN
	1    10250 1450
	1    0    0    -1  
$EndComp
$Comp
L conn:Conn_01x02 J14
U 1 1 5ADB846D
P 10150 2050
F 0 "J14" H 10150 2150 50  0000 C CNN
F 1 "External trigger" V 10300 1950 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 10150 2050 50  0001 C CNN
F 3 "" H 10150 2050 50  0001 C CNN
	1    10150 2050
	0    1    1    0   
$EndComp
$Comp
L device:R R30
U 1 1 5ADB8474
P 9000 1800
F 0 "R30" V 9080 1800 50  0000 C CNN
F 1 "R" V 9000 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8930 1800 50  0001 C CNN
F 3 "" H 9000 1800 50  0001 C CNN
	1    9000 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR099
U 1 1 5ADB847B
P 9000 2100
F 0 "#PWR099" H 9000 1850 50  0001 C CNN
F 1 "GND" H 9000 1950 50  0000 C CNN
F 2 "" H 9000 2100 50  0001 C CNN
F 3 "" H 9000 2100 50  0001 C CNN
	1    9000 2100
	1    0    0    -1  
$EndComp
Text GLabel 7850 1200 0    60   Input ~ 0
trig
$Comp
L conn:Conn_01x02 J12
U 1 1 5ADB8482
P 6300 1600
F 0 "J12" H 6300 1700 50  0000 C CNN
F 1 "ScopeTest" V 6450 1500 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 6300 1600 50  0001 C CNN
F 3 "" H 6300 1600 50  0001 C CNN
	1    6300 1600
	-1   0    0    1   
$EndComp
$Comp
L conn:Conn_01x02 J13
U 1 1 5ADB8489
P 8450 1100
F 0 "J13" H 8450 1200 50  0000 C CNN
F 1 "Trigger BTN" V 8600 1000 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 8450 1100 50  0001 C CNN
F 3 "" H 8450 1100 50  0001 C CNN
	1    8450 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 5ADB8490
P 8350 1950
F 0 "#PWR0100" H 8350 1700 50  0001 C CNN
F 1 "GND" H 8350 1800 50  0000 C CNN
F 2 "" H 8350 1950 50  0001 C CNN
F 3 "" H 8350 1950 50  0001 C CNN
	1    8350 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5ADB8496
P 7400 1700
F 0 "#PWR0101" H 7400 1450 50  0001 C CNN
F 1 "GND" H 7400 1550 50  0000 C CNN
F 2 "" H 7400 1700 50  0001 C CNN
F 3 "" H 7400 1700 50  0001 C CNN
	1    7400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5ADB849C
P 7400 1300
F 0 "#PWR0102" H 7400 1150 50  0001 C CNN
F 1 "+3.3V" H 7400 1440 50  0000 C CNN
F 2 "" H 7400 1300 50  0001 C CNN
F 3 "" H 7400 1300 50  0001 C CNN
	1    7400 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 5ADB84A2
P 8350 1550
F 0 "#PWR0103" H 8350 1400 50  0001 C CNN
F 1 "+3.3V" H 8350 1690 50  0000 C CNN
F 2 "" H 8350 1550 50  0001 C CNN
F 3 "" H 8350 1550 50  0001 C CNN
	1    8350 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 5ADB84A8
P 8650 1000
F 0 "#PWR0104" H 8650 850 50  0001 C CNN
F 1 "+3.3V" H 8650 1140 50  0000 C CNN
F 2 "" H 8650 1000 50  0001 C CNN
F 3 "" H 8650 1000 50  0001 C CNN
	1    8650 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0105
U 1 1 5ADB84AE
P 8950 1150
F 0 "#PWR0105" H 8950 1000 50  0001 C CNN
F 1 "+3.3V" H 8950 1290 50  0000 C CNN
F 2 "" H 8950 1150 50  0001 C CNN
F 3 "" H 8950 1150 50  0001 C CNN
	1    8950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1500 8000 1750
Connection ~ 8800 1500
Wire Wire Line
	8800 1750 8700 1750
Wire Notes Line
	10700 800  6100 800 
Wire Notes Line
	10700 2350 10700 800 
Wire Notes Line
	6100 2350 10700 2350
Wire Notes Line
	6100 800  6100 2350
Wire Wire Line
	8800 1100 8800 1750
Wire Wire Line
	8650 1100 8800 1100
Wire Wire Line
	6500 2200 6500 1600
Wire Wire Line
	6500 1500 7050 1500
Connection ~ 7900 1500
Wire Wire Line
	7900 2200 6500 2200
Wire Wire Line
	7900 1200 7850 1200
Wire Wire Line
	7900 1200 7900 2200
Wire Wire Line
	7750 1500 8000 1500
Wire Wire Line
	9000 1500 8800 1500
Connection ~ 9000 1500
Wire Wire Line
	9000 1950 9000 2100
Wire Wire Line
	9000 1450 9000 1650
Wire Wire Line
	8950 1250 8950 1150
Wire Wire Line
	9000 1250 8950 1250
Wire Wire Line
	9950 1850 10050 1850
Wire Wire Line
	10250 1850 10150 1850
Wire Wire Line
	10250 1600 10250 1850
Wire Wire Line
	9950 1600 9950 1850
Connection ~ 9950 1250
Wire Wire Line
	10250 1250 10250 1300
Wire Wire Line
	9600 1250 10250 1250
Wire Wire Line
	9650 1450 9600 1450
Wire Wire Line
	9650 1600 9650 1450
Wire Wire Line
	9950 1600 9650 1600
$Comp
L Peters:SN74LVC2G14 U16
U 1 1 5ADB84D4
P 7400 1550
F 0 "U16" H 7100 1450 60  0000 C CNN
F 1 "TRIG" H 7800 1400 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 7400 2300 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 7400 2150 60  0001 C CNN
	1    7400 1550
	-1   0    0    -1  
$EndComp
$Comp
L Peters:SN74LVC2G14 U16
U 2 1 5ADB84DB
P 8350 1800
F 0 "U16" H 8000 1700 60  0000 C CNN
F 1 "TRIG" H 8750 1650 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 8350 2550 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 8350 2400 60  0001 C CNN
	2    8350 1800
	-1   0    0    -1  
$EndComp
Text Notes 10000 950  0    60   ~ 0
Trigger
$Comp
L device:Battery_Cell BT1
U 1 1 5ADB8A71
P 2750 4400
F 0 "BT1" H 2850 4500 50  0000 L CNN
F 1 "Battery_Cell" H 2850 4400 50  0000 L CNN
F 2 "Libs:JUMPER_5MM" V 2750 4460 50  0001 C CNN
F 3 "" V 2750 4460 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5ADB8A78
P 2750 4550
F 0 "#PWR0106" H 2750 4300 50  0001 C CNN
F 1 "GND" H 2750 4400 50  0000 C CNN
F 2 "" H 2750 4550 50  0001 C CNN
F 3 "" H 2750 4550 50  0001 C CNN
	1    2750 4550
	1    0    0    -1  
$EndComp
$Comp
L Peters:DS3231 U14
U 1 1 5ADB8A7E
P 2200 4600
F 0 "U14" H 2050 5400 60  0000 C CNN
F 1 "DS3231 RTC" H 2050 4600 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16W_7.5x10.3mm_Pitch1.27mm" H 2300 4600 60  0001 C CNN
F 3 "" H 2300 4600 60  0001 C CNN
	1    2200 4600
	1    0    0    -1  
$EndComp
Text GLabel 2550 4000 2    60   Input ~ 0
SCL
Text GLabel 2550 4100 2    60   Input ~ 0
SDA
$Comp
L power:+3.3V #PWR0107
U 1 1 5ADB8A87
P 1350 4100
F 0 "#PWR0107" H 1350 3950 50  0001 C CNN
F 1 "+3.3V" H 1350 4240 50  0000 C CNN
F 2 "" H 1350 4100 50  0001 C CNN
F 3 "" H 1350 4100 50  0001 C CNN
	1    1350 4100
	1    0    0    -1  
$EndComp
$Comp
L device:C C21
U 1 1 5ADB8A8D
P 1350 4250
F 0 "C21" H 1375 4350 50  0000 L CNN
F 1 "100n" H 1375 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1388 4100 50  0001 C CNN
F 3 "" H 1350 4250 50  0001 C CNN
	1    1350 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5ADB8A94
P 1350 4450
F 0 "#PWR0108" H 1350 4200 50  0001 C CNN
F 1 "GND" H 1350 4300 50  0000 C CNN
F 2 "" H 1350 4450 50  0001 C CNN
F 3 "" H 1350 4450 50  0001 C CNN
	1    1350 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 4450 1350 4400
Wire Wire Line
	1500 4100 1350 4100
Wire Wire Line
	2550 4500 2750 4500
Wire Wire Line
	2550 4300 2550 4500
Wire Wire Line
	2750 4500 2750 4550
Wire Wire Line
	2750 4200 2550 4200
$Comp
L conn:Conn_01x02 J9
U 1 1 5ADC9E0D
P 950 2850
F 0 "J9" H 950 2950 50  0000 C CNN
F 1 "Load_on_switch" H 950 2650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 950 2850 50  0001 C CNN
F 3 "" H 950 2850 50  0001 C CNN
	1    950  2850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5ADC9FA5
P 1150 3000
F 0 "#PWR0109" H 1150 2750 50  0001 C CNN
F 1 "GND" H 1150 2850 50  0000 C CNN
F 2 "" H 1150 3000 50  0001 C CNN
F 3 "" H 1150 3000 50  0001 C CNN
	1    1150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 2850 1150 3000
Wire Wire Line
	1150 2750 1800 2750
Text GLabel 1800 2450 0    60   Input ~ 0
fan_tach
NoConn ~ 1800 1550
NoConn ~ 1800 1450
NoConn ~ 1800 1350
NoConn ~ 1800 1250
NoConn ~ 1800 2850
NoConn ~ 1800 2950
NoConn ~ 4200 3150
NoConn ~ 4200 3050
NoConn ~ 4200 2950
NoConn ~ 4200 2850
NoConn ~ 4200 2550
NoConn ~ 4200 2450
NoConn ~ 1500 4000
NoConn ~ 1500 4200
NoConn ~ 1500 4300
$EndSCHEMATC
