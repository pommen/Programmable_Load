EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:BLUEPILL
LIBS:v2-cache
EELAYER 25 0
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
Text GLabel 4650 2800 3    60   Input ~ 0
SCL
Text GLabel 4400 2800 3    60   Input ~ 0
SDA
$Comp
L R_Small R27
U 1 1 5ADB7193
P 4400 2700
F 0 "R27" H 4430 2720 50  0000 L CNN
F 1 "1K" H 4430 2660 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4400 2700 50  0001 C CNN
F 3 "" H 4400 2700 50  0001 C CNN
	1    4400 2700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R28
U 1 1 5ADB719A
P 4650 2700
F 0 "R28" H 4680 2720 50  0000 L CNN
F 1 "1K" H 4680 2660 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4650 2700 50  0001 C CNN
F 3 "" H 4650 2700 50  0001 C CNN
	1    4650 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR082
U 1 1 5ADB71A1
P 4400 2550
F 0 "#PWR082" H 4400 2400 50  0001 C CNN
F 1 "+3.3V" H 4400 2690 50  0000 C CNN
F 2 "" H 4400 2550 50  0001 C CNN
F 3 "" H 4400 2550 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR083
U 1 1 5ADB71A7
P 4650 2550
F 0 "#PWR083" H 4650 2400 50  0001 C CNN
F 1 "+3.3V" H 4650 2690 50  0000 C CNN
F 2 "" H 4650 2550 50  0001 C CNN
F 3 "" H 4650 2550 50  0001 C CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR084
U 1 1 5ADB71AD
P 950 3150
F 0 "#PWR084" H 950 2900 50  0001 C CNN
F 1 "GND" H 950 3000 50  0000 C CNN
F 2 "" H 950 3150 50  0001 C CNN
F 3 "" H 950 3150 50  0001 C CNN
	1    950  3150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR085
U 1 1 5ADB71B3
P 3900 850
F 0 "#PWR085" H 3900 600 50  0001 C CNN
F 1 "GND" H 3900 700 50  0000 C CNN
F 2 "" H 3900 850 50  0001 C CNN
F 3 "" H 3900 850 50  0001 C CNN
	1    3900 850 
	1    0    0    -1  
$EndComp
Text GLabel 950  2750 0    60   Input ~ 0
SDA
Text GLabel 950  2650 0    60   Input ~ 0
SCL
Text GLabel 950  2250 0    60   Input ~ 0
encBTN
Text GLabel 950  2450 0    60   Input ~ 0
encB
Text GLabel 950  2350 0    60   Input ~ 0
encA
Text GLabel 3450 1850 2    60   Input ~ 0
OverTemp
$Comp
L GND #PWR086
U 1 1 5ADB71BF
P 4200 1750
F 0 "#PWR086" H 4200 1500 50  0001 C CNN
F 1 "GND" H 4200 1600 50  0000 C CNN
F 2 "" H 4200 1750 50  0001 C CNN
F 3 "" H 4200 1750 50  0001 C CNN
	1    4200 1750
	1    0    0    -1  
$EndComp
Text GLabel 3350 1750 2    60   Input ~ 0
comperator
Text GLabel 950  1950 0    60   Input ~ 0
trig
Text GLabel 950  1750 0    60   Input ~ 0
out1
Text GLabel 950  1850 0    60   Input ~ 0
out2
Wire Wire Line
	3350 1650 4350 1650
Wire Wire Line
	3450 1850 3350 1850
Wire Wire Line
	3900 850  3850 850 
Wire Wire Line
	4650 2600 4650 2550
Wire Wire Line
	4400 2600 4400 2550
Text GLabel 3350 1950 2    60   Input ~ 0
LoadBlockTemp
$Comp
L Bluepill U12
U 1 1 5ADB71CF
P 2100 1900
F 0 "U12" H 2450 2750 60  0000 C CNN
F 1 "Bluepill" H 1850 2800 60  0000 C CNN
F 2 "Libs:Bluepill" H 2000 2050 60  0001 C CNN
F 3 "http://wiki.stm32duino.com/index.php?title=STM32F103_boards" H 2150 3000 60  0001 C CNN
	1    2100 1900
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J10
U 1 1 5ADB71D6
P 4400 1650
F 0 "J10" H 4400 1750 50  0000 C CNN
F 1 "RST" H 4400 1450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4400 1650 50  0001 C CNN
F 3 "" H 4400 1650 50  0001 C CNN
	1    4400 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR087
U 1 1 5ADB71DD
P 3350 1350
F 0 "#PWR087" H 3350 1100 50  0001 C CNN
F 1 "GND" H 3350 1200 50  0000 C CNN
F 2 "" H 3350 1350 50  0001 C CNN
F 3 "" H 3350 1350 50  0001 C CNN
	1    3350 1350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR088
U 1 1 5ADB71E3
P 3350 1450
F 0 "#PWR088" H 3350 1200 50  0001 C CNN
F 1 "GND" H 3350 1300 50  0000 C CNN
F 2 "" H 3350 1450 50  0001 C CNN
F 3 "" H 3350 1450 50  0001 C CNN
	1    3350 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 1550 3750 1550
Wire Wire Line
	3750 1550 3750 1500
$Comp
L +3.3V #PWR089
U 1 1 5ADB71EB
P 3750 1500
F 0 "#PWR089" H 3750 1350 50  0001 C CNN
F 1 "+3.3V" H 3750 1640 50  0000 C CNN
F 2 "" H 3750 1500 50  0001 C CNN
F 3 "" H 3750 1500 50  0001 C CNN
	1    3750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2900 4100 2850
Wire Wire Line
	4100 2550 4100 2500
$Comp
L GND #PWR090
U 1 1 5ADB71F3
P 4100 2900
F 0 "#PWR090" H 4100 2650 50  0001 C CNN
F 1 "GND" H 4100 2750 50  0000 C CNN
F 2 "" H 4100 2900 50  0001 C CNN
F 3 "" H 4100 2900 50  0001 C CNN
	1    4100 2900
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 5ADB71F9
P 4100 2700
F 0 "C22" H 4125 2800 50  0000 L CNN
F 1 "100n" H 4125 2600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4138 2550 50  0001 C CNN
F 3 "" H 4100 2700 50  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR091
U 1 1 5ADB7200
P 4100 2500
F 0 "#PWR091" H 4100 2350 50  0001 C CNN
F 1 "+3.3V" H 4100 2640 50  0000 C CNN
F 2 "" H 4100 2500 50  0001 C CNN
F 3 "" H 4100 2500 50  0001 C CNN
	1    4100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2900 3850 2850
Wire Wire Line
	3850 2550 3850 2500
$Comp
L GND #PWR092
U 1 1 5ADB7208
P 3850 2900
F 0 "#PWR092" H 3850 2650 50  0001 C CNN
F 1 "GND" H 3850 2750 50  0000 C CNN
F 2 "" H 3850 2900 50  0001 C CNN
F 3 "" H 3850 2900 50  0001 C CNN
	1    3850 2900
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 5ADB720E
P 3850 2700
F 0 "C21" H 3875 2800 50  0000 L CNN
F 1 "100n" H 3875 2600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3888 2550 50  0001 C CNN
F 3 "" H 3850 2700 50  0001 C CNN
	1    3850 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR093
U 1 1 5ADB7215
P 3850 2500
F 0 "#PWR093" H 3850 2350 50  0001 C CNN
F 1 "+3.3V" H 3850 2640 50  0000 C CNN
F 2 "" H 3850 2500 50  0001 C CNN
F 3 "" H 3850 2500 50  0001 C CNN
	1    3850 2500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR094
U 1 1 5ADB721B
P 650 3250
F 0 "#PWR094" H 650 3100 50  0001 C CNN
F 1 "+3.3V" H 650 3390 50  0000 C CNN
F 2 "" H 650 3250 50  0001 C CNN
F 3 "" H 650 3250 50  0001 C CNN
	1    650  3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3250 650  3250
NoConn ~ 950  2150
NoConn ~ 950  2050
Text GLabel 3350 2150 2    60   Input ~ 0
MOSI
Text GLabel 3350 2250 2    60   Input ~ 0
MISO
Text GLabel 3350 2350 2    60   Input ~ 0
SCK
Text GLabel 3350 2450 2    60   Input ~ 0
SS
Text GLabel 3350 2050 2    60   Input ~ 0
fan_PWM
$Comp
L Conn_01x02 J9
U 1 1 5ADB7229
P 3550 2750
F 0 "J9" H 3550 2850 50  0000 C CNN
F 1 "GPIO" H 3550 2550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3550 2750 50  0001 C CNN
F 3 "" H 3550 2750 50  0001 C CNN
	1    3550 2750
	1    0    0    -1  
$EndComp
$Comp
L PC817 U16
U 1 1 5ADB8458
P 9300 1350
F 0 "U16" H 9100 1550 50  0000 L CNN
F 1 "PC817" H 9300 1550 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 9100 1150 50  0001 L CIN
F 3 "" H 9300 1350 50  0001 L CNN
	1    9300 1350
	-1   0    0    -1  
$EndComp
$Comp
L 1N4148 D4
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
L R R30
U 1 1 5ADB8466
P 10250 1450
F 0 "R30" V 10330 1450 50  0000 C CNN
F 1 "100R" V 10250 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10180 1450 50  0001 C CNN
F 3 "" H 10250 1450 50  0001 C CNN
	1    10250 1450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J13
U 1 1 5ADB846D
P 10150 2050
F 0 "J13" H 10150 2150 50  0000 C CNN
F 1 "External trigger" V 10300 1950 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 10150 2050 50  0001 C CNN
F 3 "" H 10150 2050 50  0001 C CNN
	1    10150 2050
	0    1    1    0   
$EndComp
$Comp
L R R29
U 1 1 5ADB8474
P 9000 1800
F 0 "R29" V 9080 1800 50  0000 C CNN
F 1 "R" V 9000 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8930 1800 50  0001 C CNN
F 3 "" H 9000 1800 50  0001 C CNN
	1    9000 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR095
U 1 1 5ADB847B
P 9000 2100
F 0 "#PWR095" H 9000 1850 50  0001 C CNN
F 1 "GND" H 9000 1950 50  0000 C CNN
F 2 "" H 9000 2100 50  0001 C CNN
F 3 "" H 9000 2100 50  0001 C CNN
	1    9000 2100
	1    0    0    -1  
$EndComp
Text GLabel 7850 1200 0    60   Input ~ 0
trig
$Comp
L Conn_01x02 J11
U 1 1 5ADB8482
P 6300 1600
F 0 "J11" H 6300 1700 50  0000 C CNN
F 1 "ScopeTest" V 6450 1500 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 6300 1600 50  0001 C CNN
F 3 "" H 6300 1600 50  0001 C CNN
	1    6300 1600
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x02 J12
U 1 1 5ADB8489
P 8450 1100
F 0 "J12" H 8450 1200 50  0000 C CNN
F 1 "Trigger BTN" V 8600 1000 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 8450 1100 50  0001 C CNN
F 3 "" H 8450 1100 50  0001 C CNN
	1    8450 1100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR096
U 1 1 5ADB8490
P 8350 1950
F 0 "#PWR096" H 8350 1700 50  0001 C CNN
F 1 "GND" H 8350 1800 50  0000 C CNN
F 2 "" H 8350 1950 50  0001 C CNN
F 3 "" H 8350 1950 50  0001 C CNN
	1    8350 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR097
U 1 1 5ADB8496
P 7400 1700
F 0 "#PWR097" H 7400 1450 50  0001 C CNN
F 1 "GND" H 7400 1550 50  0000 C CNN
F 2 "" H 7400 1700 50  0001 C CNN
F 3 "" H 7400 1700 50  0001 C CNN
	1    7400 1700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR098
U 1 1 5ADB849C
P 7400 1300
F 0 "#PWR098" H 7400 1150 50  0001 C CNN
F 1 "+3.3V" H 7400 1440 50  0000 C CNN
F 2 "" H 7400 1300 50  0001 C CNN
F 3 "" H 7400 1300 50  0001 C CNN
	1    7400 1300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR099
U 1 1 5ADB84A2
P 8350 1550
F 0 "#PWR099" H 8350 1400 50  0001 C CNN
F 1 "+3.3V" H 8350 1690 50  0000 C CNN
F 2 "" H 8350 1550 50  0001 C CNN
F 3 "" H 8350 1550 50  0001 C CNN
	1    8350 1550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0100
U 1 1 5ADB84A8
P 8650 1000
F 0 "#PWR0100" H 8650 850 50  0001 C CNN
F 1 "+3.3V" H 8650 1140 50  0000 C CNN
F 2 "" H 8650 1000 50  0001 C CNN
F 3 "" H 8650 1000 50  0001 C CNN
	1    8650 1000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0101
U 1 1 5ADB84AE
P 8950 1150
F 0 "#PWR0101" H 8950 1000 50  0001 C CNN
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
L SN74LVC2G14 U14
U 1 1 5ADB84D4
P 7400 1550
F 0 "U14" H 7550 1800 60  0000 C CNN
F 1 "TRIG" H 7800 1400 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 7400 2300 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 7400 2150 60  0001 C CNN
	1    7400 1550
	-1   0    0    -1  
$EndComp
$Comp
L SN74LVC2G14 U15
U 2 1 5ADB84DB
P 8350 1800
F 0 "U15" H 8500 2050 60  0000 C CNN
F 1 "SN74LVC2G14" H 8750 1650 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 8350 2550 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g14.pdf" H 8350 2400 60  0001 C CNN
	2    8350 1800
	-1   0    0    -1  
$EndComp
Text Notes 10000 950  0    60   ~ 0
Trigger
$Comp
L Battery_Cell BT1
U 1 1 5ADB8A71
P 3100 5050
F 0 "BT1" H 3200 5150 50  0000 L CNN
F 1 "Battery_Cell" H 3200 5050 50  0000 L CNN
F 2 "Battery_Holders:Keystone_3008_1x2450-CoinCell" V 3100 5110 50  0001 C CNN
F 3 "" V 3100 5110 50  0001 C CNN
	1    3100 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0102
U 1 1 5ADB8A78
P 3100 5200
F 0 "#PWR0102" H 3100 4950 50  0001 C CNN
F 1 "GND" H 3100 5050 50  0000 C CNN
F 2 "" H 3100 5200 50  0001 C CNN
F 3 "" H 3100 5200 50  0001 C CNN
	1    3100 5200
	1    0    0    -1  
$EndComp
$Comp
L DS3231 U13
U 1 1 5ADB8A7E
P 2550 5250
F 0 "U13" H 2400 6050 60  0000 C CNN
F 1 "DS3231 RTC" H 2400 5250 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16W_7.5x10.3mm_Pitch1.27mm" H 2650 5250 60  0001 C CNN
F 3 "" H 2650 5250 60  0001 C CNN
	1    2550 5250
	1    0    0    -1  
$EndComp
Text GLabel 2900 4650 2    60   Input ~ 0
SCL
Text GLabel 2900 4750 2    60   Input ~ 0
SDA
$Comp
L +3.3V #PWR0103
U 1 1 5ADB8A87
P 1700 4750
F 0 "#PWR0103" H 1700 4600 50  0001 C CNN
F 1 "+3.3V" H 1700 4890 50  0000 C CNN
F 2 "" H 1700 4750 50  0001 C CNN
F 3 "" H 1700 4750 50  0001 C CNN
	1    1700 4750
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 5ADB8A8D
P 1700 4900
F 0 "C20" H 1725 5000 50  0000 L CNN
F 1 "100n" H 1725 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1738 4750 50  0001 C CNN
F 3 "" H 1700 4900 50  0001 C CNN
	1    1700 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0104
U 1 1 5ADB8A94
P 1700 5100
F 0 "#PWR0104" H 1700 4850 50  0001 C CNN
F 1 "GND" H 1700 4950 50  0000 C CNN
F 2 "" H 1700 5100 50  0001 C CNN
F 3 "" H 1700 5100 50  0001 C CNN
	1    1700 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5100 1700 5050
Wire Wire Line
	1850 4750 1700 4750
Wire Wire Line
	2900 5150 3100 5150
Wire Wire Line
	2900 4950 2900 5150
Wire Wire Line
	3100 5150 3100 5200
Wire Wire Line
	3100 4850 2900 4850
$EndSCHEMATC