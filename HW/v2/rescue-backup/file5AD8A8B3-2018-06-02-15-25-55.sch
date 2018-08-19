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
Sheet 4 4
Title ""
Date "2018-04-19"
Rev "0.2"
Comp "Programmable load"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +3.3V #PWR0110
U 1 1 5ADA7C90
P 2100 2300
F 0 "#PWR0110" H 2100 2150 50  0001 C CNN
F 1 "+3.3V" H 2100 2440 50  0000 C CNN
F 2 "" H 2100 2300 50  0001 C CNN
F 3 "" H 2100 2300 50  0001 C CNN
	1    2100 2300
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR0111
U 1 1 5ADA7C91
P 5050 1450
F 0 "#PWR0111" H 5050 1300 50  0001 C CNN
F 1 "+12V" H 5050 1590 50  0000 C CNN
F 2 "" H 5050 1450 50  0001 C CNN
F 3 "" H 5050 1450 50  0001 C CNN
	1    5050 1450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR0112
U 1 1 5ADA7C92
P 6400 1450
F 0 "#PWR0112" H 6400 1300 50  0001 C CNN
F 1 "+5V" H 6400 1590 50  0000 C CNN
F 2 "" H 6400 1450 50  0001 C CNN
F 3 "" H 6400 1450 50  0001 C CNN
	1    6400 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0113
U 1 1 5ADA7C93
P 6000 1850
F 0 "#PWR0113" H 6000 1600 50  0001 C CNN
F 1 "GND" H 6000 1700 50  0000 C CNN
F 2 "" H 6000 1850 50  0001 C CNN
F 3 "" H 6000 1850 50  0001 C CNN
	1    6000 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0114
U 1 1 5ADA7C94
P 5050 1750
F 0 "#PWR0114" H 5050 1500 50  0001 C CNN
F 1 "GND" H 5050 1600 50  0000 C CNN
F 2 "" H 5050 1750 50  0001 C CNN
F 3 "" H 5050 1750 50  0001 C CNN
	1    5050 1750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C35
U 1 1 5ADA7C95
P 5050 1600
F 0 "C35" V 4850 1550 50  0000 L CNN
F 1 "100nF" V 4950 1500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5050 1600 50  0001 C CNN
F 3 "" H 5050 1600 50  0001 C CNN
	1    5050 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0115
U 1 1 5ADA7C96
P 2050 1650
F 0 "#PWR0115" H 2050 1400 50  0001 C CNN
F 1 "GND" H 2050 1500 50  0000 C CNN
F 2 "" H 2050 1650 50  0001 C CNN
F 3 "" H 2050 1650 50  0001 C CNN
	1    2050 1650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C26
U 1 1 5ADA7C97
P 2050 1500
F 0 "C26" H 2060 1570 50  0000 L CNN
F 1 "100n" H 2050 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2050 1500 50  0001 C CNN
F 3 "" H 2050 1500 50  0001 C CNN
	1    2050 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0116
U 1 1 5ADA7C98
P 1700 1650
F 0 "#PWR0116" H 1700 1400 50  0001 C CNN
F 1 "GND" H 1700 1500 50  0000 C CNN
F 2 "" H 1700 1650 50  0001 C CNN
F 3 "" H 1700 1650 50  0001 C CNN
	1    1700 1650
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C25
U 1 1 5ADA7C99
P 1700 1500
F 0 "C25" H 1710 1570 50  0000 L CNN
F 1 "220u" H 1550 1100 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 1700 1500 50  0001 C CNN
F 3 "" H 1700 1500 50  0001 C CNN
	1    1700 1500
	1    0    0    -1  
$EndComp
Text GLabel 2750 2800 3    60   Input ~ 0
SCL
Text GLabel 2650 2800 3    60   Input ~ 0
SDA
$Comp
L GND #PWR0117
U 1 1 5ADA7C9A
P 3000 2350
F 0 "#PWR0117" H 3000 2100 50  0001 C CNN
F 1 "GND" H 3000 2200 50  0000 C CNN
F 2 "" H 3000 2350 50  0001 C CNN
F 3 "" H 3000 2350 50  0001 C CNN
	1    3000 2350
	1    0    0    -1  
$EndComp
$Comp
L R R32
U 1 1 5ADA7C9B
P 2550 1350
F 0 "R32" V 2630 1350 50  0000 C CNN
F 1 "0R1" V 2550 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2480 1350 50  0001 C CNN
F 3 "" H 2550 1350 50  0001 C CNN
	1    2550 1350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR0118
U 1 1 5ADA7C9D
P 1350 1650
F 0 "#PWR0118" H 1350 1400 50  0001 C CNN
F 1 "GND" H 1350 1500 50  0000 C CNN
F 2 "" H 1350 1650 50  0001 C CNN
F 3 "" H 1350 1650 50  0001 C CNN
	1    1350 1650
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR0119
U 1 1 5ADA7C9E
P 3100 1300
F 0 "#PWR0119" H 3100 1150 50  0001 C CNN
F 1 "+12V" H 3100 1440 50  0000 C CNN
F 2 "" H 3100 1300 50  0001 C CNN
F 3 "" H 3100 1300 50  0001 C CNN
	1    3100 1300
	1    0    0    -1  
$EndComp
$Comp
L INA219 U20
U 1 1 5ADA7C9F
P 2300 2350
F 0 "U20" V 2550 1650 60  0000 C CNN
F 1 "INA219" H 1900 1700 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8_Handsoldering" H 2350 1600 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 2350 1500 60  0001 C CNN
	1    2300 2350
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C41
U 1 1 5ADA7CA0
P 7850 4300
F 0 "C41" H 7860 4370 50  0000 L CNN
F 1 "100n" V 7750 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7850 4300 50  0001 C CNN
F 3 "" H 7850 4300 50  0001 C CNN
	1    7850 4300
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR0120
U 1 1 5ADA7CA1
P 8100 3950
F 0 "#PWR0120" H 8100 3800 50  0001 C CNN
F 1 "+12V" H 8100 4090 50  0000 C CNN
F 2 "" H 8100 3950 50  0001 C CNN
F 3 "" H 8100 3950 50  0001 C CNN
	1    8100 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0121
U 1 1 5ADA7CA2
P 8300 4800
F 0 "#PWR0121" H 8300 4550 50  0001 C CNN
F 1 "GND" H 8300 4650 50  0000 C CNN
F 2 "" H 8300 4800 50  0001 C CNN
F 3 "" H 8300 4800 50  0001 C CNN
	1    8300 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0122
U 1 1 5ADA7CA3
P 4800 2650
F 0 "#PWR0122" H 4800 2400 50  0001 C CNN
F 1 "GND" H 4800 2500 50  0000 C CNN
F 2 "" H 4800 2650 50  0001 C CNN
F 3 "" H 4800 2650 50  0001 C CNN
	1    4800 2650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C34
U 1 1 5ADA7CA4
P 4800 2500
F 0 "C34" H 4810 2570 50  0000 L CNN
F 1 "10u" H 4800 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4800 2500 50  0001 C CNN
F 3 "" H 4800 2500 50  0001 C CNN
	1    4800 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR0123
U 1 1 5ADA7CA5
P 4800 2350
F 0 "#PWR0123" H 4800 2200 50  0001 C CNN
F 1 "+5V" H 4800 2490 50  0000 C CNN
F 2 "" H 4800 2350 50  0001 C CNN
F 3 "" H 4800 2350 50  0001 C CNN
	1    4800 2350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0124
U 1 1 5ADA7CA6
P 6050 2350
F 0 "#PWR0124" H 6050 2200 50  0001 C CNN
F 1 "+3.3V" H 6050 2490 50  0000 C CNN
F 2 "" H 6050 2350 50  0001 C CNN
F 3 "" H 6050 2350 50  0001 C CNN
	1    6050 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0125
U 1 1 5ADA7CA7
P 6050 2700
F 0 "#PWR0125" H 6050 2450 50  0001 C CNN
F 1 "GND" H 6050 2550 50  0000 C CNN
F 2 "" H 6050 2700 50  0001 C CNN
F 3 "" H 6050 2700 50  0001 C CNN
	1    6050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2300 2100 2400
Wire Wire Line
	5050 1500 5050 1450
Wire Wire Line
	5050 1500 5250 1500
Wire Wire Line
	5850 1500 6100 1500
Wire Wire Line
	5050 1750 5050 1700
Wire Wire Line
	2050 1650 2050 1600
Connection ~ 2050 1350
Wire Wire Line
	2050 1350 2050 1400
Connection ~ 1700 1350
Wire Wire Line
	1700 1400 1700 1350
Wire Wire Line
	1700 1650 1700 1600
Wire Wire Line
	2950 2350 3000 2350
Wire Wire Line
	2200 2350 2100 2350
Wire Wire Line
	1200 1350 2400 1350
Wire Wire Line
	2700 1350 2800 1350
Wire Wire Line
	2700 1950 2650 1950
Wire Wire Line
	2700 1200 2700 1950
Wire Wire Line
	2400 1200 2400 1750
Wire Wire Line
	2400 1750 2450 1750
Wire Wire Line
	2450 1750 2450 1950
Wire Wire Line
	1350 1450 1350 1650
Wire Wire Line
	1200 1450 1350 1450
Wire Wire Line
	4800 2400 4800 2350
Wire Wire Line
	4800 2400 5100 2400
Wire Wire Line
	4800 2650 4800 2600
Wire Wire Line
	5700 2400 6050 2400
Wire Wire Line
	6050 2350 6050 2450
Wire Wire Line
	6050 2650 6050 2700
$Comp
L GND #PWR0126
U 1 1 5ADA7CA9
P 5400 2700
F 0 "#PWR0126" H 5400 2450 50  0001 C CNN
F 1 "GND" H 5400 2550 50  0000 C CNN
F 2 "" H 5400 2700 50  0001 C CNN
F 3 "" H 5400 2700 50  0001 C CNN
	1    5400 2700
	1    0    0    -1  
$EndComp
$Comp
L -5V #PWR130
U 1 1 5ADA7CAA
P 3050 6200
F 0 "#PWR130" H 3050 6300 50  0001 C CNN
F 1 "-5V" H 3050 6350 50  0000 C CNN
F 2 "" H 3050 6200 50  0001 C CNN
F 3 "" H 3050 6200 50  0001 C CNN
	1    3050 6200
	-1   0    0    1   
$EndComp
$Comp
L LT1054 U19
U 1 1 5ADA7CAB
P 2100 6000
F 0 "U19" H 2500 6550 60  0000 C CNN
F 1 "LT1054 neg5v" H 1800 6500 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 2300 5550 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lt1054.pdf" H 2450 5650 60  0001 C CNN
	1    2100 6000
	1    0    0    -1  
$EndComp
$Comp
L CP1 C24
U 1 1 5ADA7CAC
P 1000 5850
F 0 "C24" H 1025 5950 50  0000 L CNN
F 1 "10u" H 1025 5750 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 1000 5850 50  0001 C CNN
F 3 "" H 1000 5850 50  0001 C CNN
	1    1000 5850
	1    0    0    -1  
$EndComp
$Comp
L R R33
U 1 1 5ADA7CAD
P 3000 5800
F 0 "R33" V 3080 5800 50  0000 C CNN
F 1 "20K" V 3000 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2930 5800 50  0001 C CNN
F 3 "" H 3000 5800 50  0001 C CNN
	1    3000 5800
	0    1    1    0   
$EndComp
$Comp
L R R34
U 1 1 5ADA7CAE
P 3000 5900
F 0 "R34" V 3080 5900 50  0000 C CNN
F 1 "100K" V 3000 5900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2930 5900 50  0001 C CNN
F 3 "" H 3000 5900 50  0001 C CNN
	1    3000 5900
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR0127
U 1 1 5ADA7CAF
P 2100 5300
F 0 "#PWR0127" H 2100 5150 50  0001 C CNN
F 1 "+5V" H 2100 5440 50  0000 C CNN
F 2 "" H 2100 5300 50  0001 C CNN
F 3 "" H 2100 5300 50  0001 C CNN
	1    2100 5300
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR0128
U 1 1 5ADA7CB0
P 2100 6250
F 0 "#PWR0128" H 2100 6000 50  0001 C CNN
F 1 "Earth" H 2100 6100 50  0001 C CNN
F 2 "" H 2100 6250 50  0001 C CNN
F 3 "" H 2100 6250 50  0001 C CNN
	1    2100 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5900 1550 6000
Wire Wire Line
	1550 6000 1000 6000
Wire Wire Line
	1550 5800 1200 5800
Wire Wire Line
	1200 5800 1200 5700
Wire Wire Line
	1200 5700 1000 5700
Wire Wire Line
	1550 5700 1550 5100
Wire Wire Line
	1550 5100 3150 5100
Wire Wire Line
	3150 5100 3150 5900
Connection ~ 3150 5800
Wire Wire Line
	2600 5800 2850 5800
Wire Wire Line
	2600 5900 2850 5900
Wire Wire Line
	2700 5900 2700 6350
Connection ~ 2700 5900
$Comp
L CP1 C29
U 1 1 5ADA7CB1
P 2700 6500
F 0 "C29" H 2725 6600 50  0000 L CNN
F 1 "100u" H 2725 6400 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 2700 6500 50  0001 C CNN
F 3 "" H 2700 6500 50  0001 C CNN
	1    2700 6500
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR0129
U 1 1 5ADA7CB2
P 2700 6700
F 0 "#PWR0129" H 2700 6450 50  0001 C CNN
F 1 "Earth" H 2700 6550 50  0001 C CNN
F 2 "" H 2700 6700 50  0001 C CNN
F 3 "" H 2700 6700 50  0001 C CNN
	1    2700 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6700 2700 6650
Wire Wire Line
	2700 6200 3200 6200
Connection ~ 2700 6200
$Comp
L C C32
U 1 1 5ADA7CB3
P 3400 6150
F 0 "C32" H 3425 6250 50  0000 L CNN
F 1 "2n" H 3425 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3438 6000 50  0001 C CNN
F 3 "" H 3400 6150 50  0001 C CNN
	1    3400 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5900 3400 5900
Wire Wire Line
	3400 5900 3400 6000
Wire Wire Line
	3200 6200 3200 6300
Wire Wire Line
	3200 6300 3400 6300
Connection ~ 3050 6200
$Comp
L C C30
U 1 1 5ADA7CB4
P 2750 5450
F 0 "C30" H 2775 5550 50  0000 L CNN
F 1 "2.2u" H 2775 5350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2788 5300 50  0001 C CNN
F 3 "" H 2750 5450 50  0001 C CNN
	1    2750 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5300 2100 5400
Wire Wire Line
	2750 5300 2100 5300
$Comp
L Earth #PWR0130
U 1 1 5ADA7CB5
P 2750 5600
F 0 "#PWR0130" H 2750 5350 50  0001 C CNN
F 1 "Earth" H 2750 5450 50  0001 C CNN
F 2 "" H 2750 5600 50  0001 C CNN
F 3 "" H 2750 5600 50  0001 C CNN
	1    2750 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1750 6000 1850
$Comp
L MAX6241 U24
U 1 1 5ADA7CB8
P 8750 3800
F 0 "U24" H 8650 3700 60  0000 C CNN
F 1 "Vref" H 8700 3550 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 8650 3700 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX6225-MAX6250.pdf" H 8750 3800 60  0001 C CNN
	1    8750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4200 8300 4200
Wire Wire Line
	8100 3950 8100 4200
Wire Wire Line
	8300 4500 8300 4800
Wire Wire Line
	7850 4050 7850 4200
Wire Wire Line
	7400 4050 8100 4050
Connection ~ 8100 4050
$Comp
L C C42
U 1 1 5ADA7CB9
P 8100 4500
F 0 "C42" H 8125 4600 50  0000 L CNN
F 1 "1uF" H 8125 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8138 4350 50  0001 C CNN
F 3 "" H 8100 4500 50  0001 C CNN
	1    8100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4750 8100 4650
Wire Wire Line
	7400 4750 8300 4750
Connection ~ 8300 4750
Wire Wire Line
	8300 4350 8100 4350
Connection ~ 8100 4750
Wire Wire Line
	7850 4400 7850 4750
Wire Wire Line
	9150 4200 9800 4200
Text GLabel 10500 4300 2    60   Input ~ 0
4.096V
$Comp
L C C27
U 1 1 5ADA7CBD
P 2100 2550
F 0 "C27" H 2125 2650 50  0000 L CNN
F 1 "100n" H 2125 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2138 2400 50  0001 C CNN
F 3 "" H 2100 2550 50  0001 C CNN
	1    2100 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0131
U 1 1 5ADA7CBE
P 2100 2800
F 0 "#PWR0131" H 2100 2550 50  0001 C CNN
F 1 "GND" H 2100 2650 50  0000 C CNN
F 2 "" H 2100 2800 50  0001 C CNN
F 3 "" H 2100 2800 50  0001 C CNN
	1    2100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2700 2100 2800
Text GLabel 2550 2800 3    60   Input ~ 0
SDA
Text GLabel 2450 2800 3    60   Input ~ 0
SDA
Connection ~ 2100 2350
$Comp
L Barrel_Jack J15
U 1 1 5ADA831E
P 900 1450
F 0 "J15" H 900 1660 50  0000 C CNN
F 1 "Barrel_Jack" H 900 1275 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 950 1410 50  0001 C CNN
F 3 "" H 950 1410 50  0001 C CNN
	1    900  1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0144
U 1 1 5ADA843B
P 1200 1550
F 0 "#PWR0144" H 1200 1300 50  0001 C CNN
F 1 "GND" H 1200 1400 50  0000 C CNN
F 2 "" H 1200 1550 50  0001 C CNN
F 3 "" H 1200 1550 50  0001 C CNN
	1    1200 1550
	1    0    0    -1  
$EndComp
$Comp
L POT_TRIM RV4
U 1 1 5ADA8DAF
P 9400 4500
F 0 "RV4" V 9225 4500 50  0000 C CNN
F 1 "10K" V 9300 4500 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h2.5_Vertical_Px2.5mm_Py5.0mm" H 9400 4500 50  0001 C CNN
F 3 "" H 9400 4500 50  0001 C CNN
	1    9400 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9400 4050 9400 4350
Wire Wire Line
	9250 4500 9150 4500
$Comp
L GND #PWR0145
U 1 1 5ADA8F5A
P 9400 4700
F 0 "#PWR0145" H 9400 4450 50  0001 C CNN
F 1 "GND" H 9400 4550 50  0000 C CNN
F 2 "" H 9400 4700 50  0001 C CNN
F 3 "" H 9400 4700 50  0001 C CNN
	1    9400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4650 9400 4700
$Comp
L C_Small C40
U 1 1 5ADA9080
P 7600 4300
F 0 "C40" H 7610 4370 50  0000 L CNN
F 1 "2.2uF" V 7500 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7600 4300 50  0001 C CNN
F 3 "" H 7600 4300 50  0001 C CNN
	1    7600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 4050 7600 4200
Connection ~ 7850 4050
Wire Wire Line
	7600 4750 7600 4400
Connection ~ 7850 4750
Wire Wire Line
	7400 4050 7400 4200
Connection ~ 7600 4050
Wire Wire Line
	7400 4750 7400 4400
Connection ~ 7600 4750
$Comp
L CP1_Small C39
U 1 1 5ADA99FF
P 7400 4300
F 0 "C39" H 7410 4370 50  0000 L CNN
F 1 "220u" H 7250 3900 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 7400 4300 50  0001 C CNN
F 3 "" H 7400 4300 50  0001 C CNN
	1    7400 4300
	1    0    0    -1  
$EndComp
$Comp
L AD8628 U25
U 1 1 5ADAAA51
P 10100 4300
F 0 "U25" H 10100 4500 50  0000 L CNN
F 1 "AD8628" H 10100 4100 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 11700 3750 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/AD8628_8629_8630.pdf" H 10350 3900 50  0001 C CNN
	1    10100 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0146
U 1 1 5ADAAC56
P 10050 4600
F 0 "#PWR0146" H 10050 4350 50  0001 C CNN
F 1 "GND" H 10050 4450 50  0000 C CNN
F 2 "" H 10050 4600 50  0001 C CNN
F 3 "" H 10050 4600 50  0001 C CNN
	1    10050 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4400 9700 4400
Wire Wire Line
	9700 4400 9700 4950
Wire Wire Line
	9700 4950 10400 4950
Wire Wire Line
	10400 4950 10400 4300
Wire Wire Line
	10400 4300 10500 4300
Connection ~ 9400 4200
$Comp
L +5V #PWR0147
U 1 1 5ADAAFA1
P 10050 4000
F 0 "#PWR0147" H 10050 3850 50  0001 C CNN
F 1 "+5V" H 10050 4140 50  0000 C CNN
F 2 "" H 10050 4000 50  0001 C CNN
F 3 "" H 10050 4000 50  0001 C CNN
	1    10050 4000
	1    0    0    -1  
$EndComp
$Comp
L LM1117-3.3 U21
U 1 1 5ADAB666
P 5400 2400
F 0 "U21" H 5250 2525 50  0000 C CNN
F 1 "LM1117-3.3" H 5400 2525 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 5400 2400 50  0001 C CNN
F 3 "" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C37
U 1 1 5ADABA11
P 6050 2550
F 0 "C37" H 6060 2620 50  0000 L CNN
F 1 "100u" H 6060 2470 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 6050 2550 50  0001 C CNN
F 3 "" H 6050 2550 50  0001 C CNN
	1    6050 2550
	1    0    0    -1  
$EndComp
Connection ~ 6050 2400
$Comp
L LM7805_TO220 U22
U 1 1 5ADABE82
P 5550 1500
F 0 "U22" H 5400 1625 50  0000 C CNN
F 1 "LM7805" H 5550 1625 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5550 1725 50  0001 C CIN
F 3 "" H 5550 1450 50  0001 C CNN
	1    5550 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C28
U 1 1 5ADABF9E
P 2550 1200
F 0 "C28" V 2350 1150 50  0000 L CNN
F 1 "100nF" V 2450 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2550 1200 50  0001 C CNN
F 3 "" H 2550 1200 50  0001 C CNN
	1    2550 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1200 2400 1200
Connection ~ 2400 1350
Wire Wire Line
	2650 1200 2700 1200
Connection ~ 2700 1350
$Comp
L C_Small C36
U 1 1 5ADAC218
P 6000 1650
F 0 "C36" V 5800 1600 50  0000 L CNN
F 1 "10u" V 5900 1550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6000 1650 50  0001 C CNN
F 3 "" H 6000 1650 50  0001 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L CP C33
U 1 1 5ADAC477
P 4700 1600
F 0 "C33" H 4725 1700 50  0000 L CNN
F 1 "22u" H 4725 1500 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 4738 1450 50  0001 C CNN
F 3 "" H 4700 1600 50  0001 C CNN
	1    4700 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0148
U 1 1 5ADAC5F2
P 4700 1750
F 0 "#PWR0148" H 4700 1500 50  0001 C CNN
F 1 "GND" H 4700 1600 50  0000 C CNN
F 2 "" H 4700 1750 50  0001 C CNN
F 3 "" H 4700 1750 50  0001 C CNN
	1    4700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1450 4700 1450
$Comp
L GND #PWR0149
U 1 1 5ADAC870
P 5550 1800
F 0 "#PWR0149" H 5550 1550 50  0001 C CNN
F 1 "GND" H 5550 1650 50  0000 C CNN
F 2 "" H 5550 1800 50  0001 C CNN
F 3 "" H 5550 1800 50  0001 C CNN
	1    5550 1800
	1    0    0    -1  
$EndComp
$Comp
L L L2
U 1 1 5ADAC8CD
P 6250 1500
F 0 "L2" V 6200 1500 50  0000 C CNN
F 1 "10-47 uH" V 6325 1500 50  0000 C CNN
F 2 "Inductors_SMD:L_Taiyo-Yuden_NR-60xx_HandSoldering" H 6250 1500 50  0001 C CNN
F 3 "" H 6250 1500 50  0001 C CNN
	1    6250 1500
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C38
U 1 1 5ADAC999
P 6400 1700
F 0 "C38" V 6200 1650 50  0000 L CNN
F 1 "22u" V 6300 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6400 1700 50  0001 C CNN
F 3 "" H 6400 1700 50  0001 C CNN
	1    6400 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0150
U 1 1 5ADACA3B
P 6400 1850
F 0 "#PWR0150" H 6400 1600 50  0001 C CNN
F 1 "GND" H 6400 1700 50  0000 C CNN
F 2 "" H 6400 1850 50  0001 C CNN
F 3 "" H 6400 1850 50  0001 C CNN
	1    6400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1450 6400 1600
Wire Wire Line
	6400 1800 6400 1850
Connection ~ 6400 1500
Wire Wire Line
	6000 1550 6000 1500
Connection ~ 6000 1500
$Comp
L TEST TP2
U 1 1 5ADAD8A0
P 9400 4050
F 0 "TP2" H 9400 4350 50  0000 C BNN
F 1 "TEST" H 9400 4300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 9400 4050 50  0001 C CNN
F 3 "" H 9400 4050 50  0001 C CNN
	1    9400 4050
	1    0    0    -1  
$EndComp
$Comp
L L L1
U 1 1 5ADB4139
P 2950 1350
F 0 "L1" V 2900 1350 50  0000 C CNN
F 1 "10-47 uH" V 3050 1300 50  0000 C CNN
F 2 "Inductors_SMD:L_Taiyo-Yuden_NR-60xx_HandSoldering" H 2950 1350 50  0001 C CNN
F 3 "" H 2950 1350 50  0001 C CNN
	1    2950 1350
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C31
U 1 1 5ADB413F
P 3100 1550
F 0 "C31" V 2900 1500 50  0000 L CNN
F 1 "22u" V 3000 1450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3100 1550 50  0001 C CNN
F 3 "" H 3100 1550 50  0001 C CNN
	1    3100 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0151
U 1 1 5ADB4145
P 3100 1700
F 0 "#PWR0151" H 3100 1450 50  0001 C CNN
F 1 "GND" H 3100 1550 50  0000 C CNN
F 2 "" H 3100 1700 50  0001 C CNN
F 3 "" H 3100 1700 50  0001 C CNN
	1    3100 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1300 3100 1450
Wire Wire Line
	3100 1650 3100 1700
Connection ~ 3100 1350
Wire Notes Line
	7150 3450 7150 6450
Wire Notes Line
	7150 6450 11050 6450
Wire Notes Line
	11050 6450 11050 3450
Wire Notes Line
	11050 3450 7150 3450
Text Notes 10650 3650 0    60   ~ 0
vREF
Wire Notes Line
	850  4650 850  6900
Wire Notes Line
	850  6900 3800 6900
Wire Notes Line
	3800 6900 3800 4650
Wire Notes Line
	3800 4650 850  4650
Text Notes 3150 4800 0    60   ~ 0
Neg supply
NoConn ~ 2600 5700
$EndSCHEMATC
