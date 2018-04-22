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
Sheet 1 4
Title "Programmable load"
Date "2018-04-19"
Rev "0.2"
Comp "Programmable load"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LM75 U1
U 1 1 5AD8A8BE
P 3250 6200
F 0 "U1" H 3350 6500 60  0000 C CNN
F 1 "LM75" H 3000 6500 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3200 5200 60  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/LM75A.pdf" H 3150 7400 60  0001 C CNN
	1    3250 6200
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5AD8A8BF
P 1950 5700
F 0 "C1" H 1975 5800 50  0000 L CNN
F 1 "0,1u" H 1975 5600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1988 5550 50  0001 C CNN
F 3 "" H 1950 5700 50  0001 C CNN
	1    1950 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5AD8A8C0
P 1950 5950
F 0 "#PWR01" H 1950 5700 50  0001 C CNN
F 1 "GND" H 1950 5800 50  0000 C CNN
F 2 "" H 1950 5950 50  0001 C CNN
F 3 "" H 1950 5950 50  0001 C CNN
	1    1950 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AD8A8C3
P 3250 6650
F 0 "#PWR02" H 3250 6400 50  0001 C CNN
F 1 "GND" H 3250 6500 50  0000 C CNN
F 2 "" H 3250 6650 50  0001 C CNN
F 3 "" H 3250 6650 50  0001 C CNN
	1    3250 6650
	1    0    0    -1  
$EndComp
Text GLabel 2600 6100 0    60   Input ~ 0
SDA
Text GLabel 2600 6200 0    60   Input ~ 0
SCL
Text GLabel 2650 6300 0    60   Input ~ 0
OverTemp
$Sheet
S 1850 3000 1400 650 
U 5AD8A8C6
F0 "Mosfet stage" 60
F1 "file5AD8A8C6.sch" 60
$EndSheet
Text GLabel 6200 1600 0    60   Input ~ 0
encBTN
Text GLabel 6200 1700 0    60   Input ~ 0
encA
Text GLabel 6200 1800 0    60   Input ~ 0
encB
$Comp
L Conn_01x07_Male J2
U 1 1 5AD8A8D0
P 6400 1600
F 0 "J2" H 6400 2000 50  0000 C CNN
F 1 "Encoder and LCD interface" V 6300 1600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 6400 1600 50  0001 C CNN
F 3 "" H 6400 1600 50  0001 C CNN
	1    6400 1600
	-1   0    0    1   
$EndComp
Text GLabel 6200 1400 0    60   Input ~ 0
SDA
$Comp
L GND #PWR03
U 1 1 5AD8A8D1
P 6200 1900
F 0 "#PWR03" H 6200 1650 50  0001 C CNN
F 1 "GND" H 6200 1750 50  0000 C CNN
F 2 "" H 6200 1900 50  0001 C CNN
F 3 "" H 6200 1900 50  0001 C CNN
	1    6200 1900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 5AD8A8D2
P 6200 1300
F 0 "#PWR04" H 6200 1150 50  0001 C CNN
F 1 "+5V" H 6200 1440 50  0000 C CNN
F 2 "" H 6200 1300 50  0001 C CNN
F 3 "" H 6200 1300 50  0001 C CNN
	1    6200 1300
	1    0    0    -1  
$EndComp
Text GLabel 6200 1500 0    60   Input ~ 0
SCL
Wire Notes Line
	1650 6950 1650 5300
Wire Notes Line
	4200 6950 1650 6950
Wire Notes Line
	4200 5300 4200 6950
Wire Notes Line
	1650 5300 4200 5300
Wire Wire Line
	3650 6100 3700 6100
Wire Wire Line
	3650 6300 4000 6300
Wire Wire Line
	4000 6300 4000 6400
Wire Wire Line
	2650 6300 2800 6300
Wire Wire Line
	2600 6200 2800 6200
Wire Wire Line
	2600 6100 2800 6100
Wire Wire Line
	3250 6600 3250 6650
Wire Wire Line
	3250 5800 3250 5750
Wire Wire Line
	1950 5500 1950 5550
Wire Wire Line
	1950 5850 1950 5950
$Comp
L +5V #PWR013
U 1 1 5AD8A8F7
P 3250 5750
F 0 "#PWR013" H 3250 5600 50  0001 C CNN
F 1 "+5V" H 3250 5890 50  0000 C CNN
F 2 "" H 3250 5750 50  0001 C CNN
F 3 "" H 3250 5750 50  0001 C CNN
	1    3250 5750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 5AD8A8F8
P 1950 5500
F 0 "#PWR014" H 1950 5350 50  0001 C CNN
F 1 "+5V" H 1950 5640 50  0000 C CNN
F 2 "" H 1950 5500 50  0001 C CNN
F 3 "" H 1950 5500 50  0001 C CNN
	1    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5AD8A8F9
P 4000 6400
F 0 "#PWR015" H 4000 6150 50  0001 C CNN
F 1 "GND" H 4000 6250 50  0000 C CNN
F 2 "" H 4000 6400 50  0001 C CNN
F 3 "" H 4000 6400 50  0001 C CNN
	1    4000 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6200 3700 6200
Wire Wire Line
	3700 6100 3700 6300
Connection ~ 3700 6300
Connection ~ 3700 6200
Text GLabel 5900 2450 0    60   Input ~ 0
fan_PWM
$Comp
L Conn_01x04_Male J1
U 1 1 5ADA285E
P 6100 2650
F 0 "J1" H 6100 2850 50  0000 C CNN
F 1 "Fan_conn" H 6100 2350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6100 2650 50  0001 C CNN
F 3 "" H 6100 2650 50  0001 C CNN
	1    6100 2650
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR016
U 1 1 5ADA2B19
P 5900 2650
F 0 "#PWR016" H 5900 2500 50  0001 C CNN
F 1 "+12V" H 5900 2790 50  0000 C CNN
F 2 "" H 5900 2650 50  0001 C CNN
F 3 "" H 5900 2650 50  0001 C CNN
	1    5900 2650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 5ADA2C43
P 5900 2750
F 0 "#PWR017" H 5900 2500 50  0001 C CNN
F 1 "GND" H 5900 2600 50  0000 C CNN
F 2 "" H 5900 2750 50  0001 C CNN
F 3 "" H 5900 2750 50  0001 C CNN
	1    5900 2750
	1    0    0    -1  
$EndComp
Text GLabel 5900 2550 0    60   Input ~ 0
fan_tach
$Comp
L Conn_01x06_Male J3
U 1 1 5ADA41A2
P 7400 1650
F 0 "J3" H 7400 1950 50  0000 C CNN
F 1 "SDcardHeader" H 7550 1150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 7400 1650 50  0001 C CNN
F 3 "" H 7400 1650 50  0001 C CNN
	1    7400 1650
	-1   0    0    1   
$EndComp
Text GLabel 7200 1350 0    60   Input ~ 0
SS
Text GLabel 7200 1450 0    60   Input ~ 0
SCK
Text GLabel 7200 1650 0    60   Input ~ 0
MISO
Text GLabel 7200 1550 0    60   Input ~ 0
MOSI
$Comp
L C C4
U 1 1 5ADA4B5E
P 7650 1650
F 0 "C4" H 7675 1750 50  0000 L CNN
F 1 "0,1u" H 7675 1550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7688 1500 50  0001 C CNN
F 3 "" H 7650 1650 50  0001 C CNN
	1    7650 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 5ADA4B64
P 7650 1900
F 0 "#PWR018" H 7650 1650 50  0001 C CNN
F 1 "GND" H 7650 1750 50  0000 C CNN
F 2 "" H 7650 1900 50  0001 C CNN
F 3 "" H 7650 1900 50  0001 C CNN
	1    7650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1450 7650 1500
Wire Wire Line
	7650 1800 7650 1900
$Comp
L +5V #PWR019
U 1 1 5ADA4B6C
P 7650 1450
F 0 "#PWR019" H 7650 1300 50  0001 C CNN
F 1 "+5V" H 7650 1590 50  0000 C CNN
F 2 "" H 7650 1450 50  0001 C CNN
F 3 "" H 7650 1450 50  0001 C CNN
	1    7650 1450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR020
U 1 1 5ADA5188
P 7200 1750
F 0 "#PWR020" H 7200 1600 50  0001 C CNN
F 1 "+5V" H 7200 1890 50  0000 C CNN
F 2 "" H 7200 1750 50  0001 C CNN
F 3 "" H 7200 1750 50  0001 C CNN
	1    7200 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR021
U 1 1 5ADA5217
P 7200 1850
F 0 "#PWR021" H 7200 1600 50  0001 C CNN
F 1 "GND" H 7200 1700 50  0000 C CNN
F 2 "" H 7200 1850 50  0001 C CNN
F 3 "" H 7200 1850 50  0001 C CNN
	1    7200 1850
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 5ADB1B22
P 6400 2650
F 0 "C3" H 6425 2750 50  0000 L CNN
F 1 "220u" H 6425 2550 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 6438 2500 50  0001 C CNN
F 3 "" H 6400 2650 50  0001 C CNN
	1    6400 2650
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR022
U 1 1 5ADB1BE0
P 6400 2450
F 0 "#PWR022" H 6400 2300 50  0001 C CNN
F 1 "+12V" H 6400 2590 50  0000 C CNN
F 2 "" H 6400 2450 50  0001 C CNN
F 3 "" H 6400 2450 50  0001 C CNN
	1    6400 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 5ADB1D03
P 6400 2850
F 0 "#PWR023" H 6400 2600 50  0001 C CNN
F 1 "GND" H 6400 2700 50  0000 C CNN
F 2 "" H 6400 2850 50  0001 C CNN
F 3 "" H 6400 2850 50  0001 C CNN
	1    6400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2800 6400 2850
Wire Wire Line
	6400 2500 6400 2450
$Comp
L CP C2
U 1 1 5ADB20C3
P 5600 1600
F 0 "C2" H 5625 1700 50  0000 L CNN
F 1 "220u" H 5625 1500 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-C_EIA-6032-28_Hand" H 5638 1450 50  0001 C CNN
F 3 "" H 5600 1600 50  0001 C CNN
	1    5600 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 5ADB20CF
P 5600 1800
F 0 "#PWR024" H 5600 1550 50  0001 C CNN
F 1 "GND" H 5600 1650 50  0000 C CNN
F 2 "" H 5600 1800 50  0001 C CNN
F 3 "" H 5600 1800 50  0001 C CNN
	1    5600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1750 5600 1800
Wire Wire Line
	5600 1450 5600 1400
$Comp
L +5V #PWR025
U 1 1 5ADB21EC
P 5600 1400
F 0 "#PWR025" H 5600 1250 50  0001 C CNN
F 1 "+5V" H 5600 1540 50  0000 C CNN
F 2 "" H 5600 1400 50  0001 C CNN
F 3 "" H 5600 1400 50  0001 C CNN
	1    5600 1400
	1    0    0    -1  
$EndComp
Wire Notes Line
	5350 950  7750 950 
Wire Notes Line
	7750 950  7750 3250
Wire Notes Line
	7750 3250 5350 3250
Wire Notes Line
	5350 3250 5350 950 
Text Notes 6000 3400 0    60   ~ 0
Connectors
$Sheet
S 1850 1300 1400 650 
U 5ADB562B
F0 "MCU" 60
F1 "MCU.sch" 60
$EndSheet
$Sheet
S 1850 2150 1400 600 
U 5AD8A8B3
F0 "Power" 60
F1 "file5AD8A8B3.sch" 60
$EndSheet
$EndSCHEMATC
