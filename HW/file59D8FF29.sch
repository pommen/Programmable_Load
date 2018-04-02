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
LIBS:ControllerStage-cache
LIBS:MosfetStage-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Rotary_Encoder_Switch SW1
U 1 1 59D91A04
P 7100 3150
F 0 "SW1" H 7100 3410 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 7200 3700 50  0000 C CNN
F 2 "sparkfun:SF-ROTARY-ENCODER" H 7000 3310 50  0001 C CNN
F 3 "" H 7100 3410 50  0001 C CNN
	1    7100 3150
	1    0    0    -1  
$EndComp
$Comp
L 74HC14 U1
U 1 1 59D91A0B
P 4650 2850
F 0 "U1" H 4800 2950 50  0000 C CNN
F 1 "74HC14" H 4850 2750 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4650 2850 50  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
	1    4650 2850
	-1   0    0    1   
$EndComp
$Comp
L 74HC14 U1
U 2 1 59D91A12
P 4650 3550
F 0 "U1" H 4800 3650 50  0000 C CNN
F 1 "74HC14" H 4850 3450 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4650 3550 50  0001 C CNN
F 3 "" H 4650 3550 50  0001 C CNN
	2    4650 3550
	-1   0    0    1   
$EndComp
$Comp
L 74HC14 U1
U 3 1 59D91A19
P 4650 4400
F 0 "U1" H 4800 4500 50  0000 C CNN
F 1 "74HC14" H 4850 4300 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket_LongPads" H 4650 4400 50  0001 C CNN
F 3 "" H 4650 4400 50  0001 C CNN
	3    4650 4400
	-1   0    0    1   
$EndComp
$Comp
L D_ALT D1
U 1 1 59D91A20
P 5500 2850
F 0 "D1" H 5500 2950 50  0000 C CNN
F 1 "D_ALT" H 5500 2750 50  0000 C CNN
F 2 "Diodes_SMD:D_MELF_Handsoldering" H 5500 2850 50  0001 C CNN
F 3 "" H 5500 2850 50  0001 C CNN
	1    5500 2850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 59D91A27
P 5150 3800
F 0 "C5" H 5160 3870 50  0000 L CNN
F 1 "50n" H 4950 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5150 3800 50  0001 C CNN
F 3 "" H 5150 3800 50  0001 C CNN
	1    5150 3800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR049
U 1 1 59D91A2E
P 6050 2650
F 0 "#PWR049" H 6050 2500 50  0001 C CNN
F 1 "+3.3V" H 6050 2790 50  0000 C CNN
F 2 "" H 6050 2650 50  0001 C CNN
F 3 "" H 6050 2650 50  0001 C CNN
	1    6050 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR050
U 1 1 59D91A34
P 7550 3050
F 0 "#PWR050" H 7550 2800 50  0001 C CNN
F 1 "GND" H 7550 2900 50  0000 C CNN
F 2 "" H 7550 3050 50  0001 C CNN
F 3 "" H 7550 3050 50  0001 C CNN
	1    7550 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR051
U 1 1 59D91A3A
P 6550 3150
F 0 "#PWR051" H 6550 2900 50  0001 C CNN
F 1 "GND" H 6550 3000 50  0000 C CNN
F 2 "" H 6550 3150 50  0001 C CNN
F 3 "" H 6550 3150 50  0001 C CNN
	1    6550 3150
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 59D91A40
P 6400 2800
F 0 "R4" H 6430 2820 50  0000 L CNN
F 1 "81K" H 6450 2750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6400 2800 50  0001 C CNN
F 3 "" H 6400 2800 50  0001 C CNN
	1    6400 2800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 59D91A47
P 6050 2800
F 0 "R3" H 6080 2820 50  0000 L CNN
F 1 "81K" H 6100 2750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6050 2800 50  0001 C CNN
F 3 "" H 6050 2800 50  0001 C CNN
	1    6050 2800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR052
U 1 1 59D91A4E
P 6400 2650
F 0 "#PWR052" H 6400 2500 50  0001 C CNN
F 1 "+3.3V" H 6400 2790 50  0000 C CNN
F 2 "" H 6400 2650 50  0001 C CNN
F 3 "" H 6400 2650 50  0001 C CNN
	1    6400 2650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 59D91A54
P 5150 3050
F 0 "C4" H 5160 3120 50  0000 L CNN
F 1 "50n" H 4950 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5150 3050 50  0001 C CNN
F 3 "" H 5150 3050 50  0001 C CNN
	1    5150 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR053
U 1 1 59D91A5B
P 5150 3950
F 0 "#PWR053" H 5150 3700 50  0001 C CNN
F 1 "GND" H 5150 3800 50  0000 C CNN
F 2 "" H 5150 3950 50  0001 C CNN
F 3 "" H 5150 3950 50  0001 C CNN
	1    5150 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR054
U 1 1 59D91A61
P 5150 3200
F 0 "#PWR054" H 5150 2950 50  0001 C CNN
F 1 "GND" H 5150 3050 50  0000 C CNN
F 2 "" H 5150 3200 50  0001 C CNN
F 3 "" H 5150 3200 50  0001 C CNN
	1    5150 3200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 59D91A67
P 5500 3050
F 0 "R5" V 5600 3000 50  0000 L CNN
F 1 "15K" V 5500 3000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5500 3050 50  0001 C CNN
F 3 "" H 5500 3050 50  0001 C CNN
	1    5500 3050
	0    1    1    0   
$EndComp
$Comp
L R_Small R6
U 1 1 59D91A6E
P 5500 3250
F 0 "R6" V 5600 3200 50  0000 L CNN
F 1 "15K" V 5500 3200 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5500 3250 50  0001 C CNN
F 3 "" H 5500 3250 50  0001 C CNN
	1    5500 3250
	0    1    1    0   
$EndComp
$Comp
L D_ALT D2
U 1 1 59D91A75
P 5500 3550
F 0 "D2" H 5500 3650 50  0000 C CNN
F 1 "D_ALT" H 5500 3450 50  0000 C CNN
F 2 "Diodes_SMD:D_MELF_Handsoldering" H 5500 3550 50  0001 C CNN
F 3 "" H 5500 3550 50  0001 C CNN
	1    5500 3550
	1    0    0    -1  
$EndComp
$Comp
L D_ALT D3
U 1 1 59D91A7C
P 5700 4150
F 0 "D3" H 5700 4250 50  0000 C CNN
F 1 "D_ALT" H 5700 4050 50  0000 C CNN
F 2 "Diodes_SMD:D_MELF_Handsoldering" H 5700 4150 50  0001 C CNN
F 3 "" H 5700 4150 50  0001 C CNN
	1    5700 4150
	1    0    0    -1  
$EndComp
$Comp
L R_Small R7
U 1 1 59D91A83
P 6100 3950
F 0 "R7" H 6130 3970 50  0000 L CNN
F 1 "81K" H 6150 3900 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6100 3950 50  0001 C CNN
F 3 "" H 6100 3950 50  0001 C CNN
	1    6100 3950
	1    0    0    -1  
$EndComp
$Comp
L R_Small R16
U 1 1 59D91A8A
P 5700 4400
F 0 "R16" V 5800 4350 50  0000 L CNN
F 1 "15K" V 5700 4350 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5700 4400 50  0001 C CNN
F 3 "" H 5700 4400 50  0001 C CNN
	1    5700 4400
	0    1    1    0   
$EndComp
$Comp
L C_Small C6
U 1 1 59D91A91
P 5200 4650
F 0 "C6" H 5210 4720 50  0000 L CNN
F 1 "50n" H 5000 4650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5200 4650 50  0001 C CNN
F 3 "" H 5200 4650 50  0001 C CNN
	1    5200 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR055
U 1 1 59D91A98
P 5200 4800
F 0 "#PWR055" H 5200 4550 50  0001 C CNN
F 1 "GND" H 5200 4650 50  0000 C CNN
F 2 "" H 5200 4800 50  0001 C CNN
F 3 "" H 5200 4800 50  0001 C CNN
	1    5200 4800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR056
U 1 1 59D91A9E
P 6100 3800
F 0 "#PWR056" H 6100 3650 50  0001 C CNN
F 1 "+3.3V" H 6100 3940 50  0000 C CNN
F 2 "" H 6100 3800 50  0001 C CNN
F 3 "" H 6100 3800 50  0001 C CNN
	1    6100 3800
	1    0    0    -1  
$EndComp
Text GLabel 4200 4400 0    60   Input ~ 0
encBTN
Text GLabel 4100 2850 0    60   Input ~ 0
encA
Text GLabel 4100 3550 0    60   Input ~ 0
encB
Wire Wire Line
	7400 3050 7550 3050
Wire Wire Line
	6800 3150 6550 3150
Wire Wire Line
	6400 2650 6400 2700
Wire Wire Line
	5600 3050 6800 3050
Wire Wire Line
	5600 3250 6800 3250
Wire Wire Line
	6050 2700 6050 2650
Wire Wire Line
	5650 3550 5650 3250
Connection ~ 5650 3250
Wire Wire Line
	5400 3250 5350 3250
Wire Wire Line
	5350 3250 5350 3550
Wire Wire Line
	5350 3550 5100 3550
Wire Wire Line
	5650 2850 5650 3050
Connection ~ 5650 3050
Wire Wire Line
	5400 3050 5350 3050
Wire Wire Line
	5350 3050 5350 2850
Wire Wire Line
	5350 2850 5100 2850
Wire Wire Line
	5150 3950 5150 3900
Wire Wire Line
	5150 3700 5150 3550
Connection ~ 5150 3550
Wire Wire Line
	5150 3200 5150 3150
Wire Wire Line
	5150 2950 5150 2850
Connection ~ 5150 2850
Wire Wire Line
	6050 2900 6050 3050
Connection ~ 6050 3050
Wire Wire Line
	6400 2900 6400 3250
Connection ~ 6400 3250
Wire Wire Line
	5100 4400 5600 4400
Wire Wire Line
	5200 4550 5200 4400
Connection ~ 5200 4400
Wire Wire Line
	5200 4800 5200 4750
Wire Wire Line
	5550 4150 5550 4400
Connection ~ 5550 4400
Wire Wire Line
	5800 4400 7400 4400
Wire Wire Line
	5900 4400 5900 4150
Wire Wire Line
	6100 3850 6100 3800
Wire Wire Line
	6100 4050 6100 4400
Wire Wire Line
	7400 4400 7400 3250
Connection ~ 5900 4400
Connection ~ 6100 4400
Wire Wire Line
	5900 4150 5850 4150
Wire Wire Line
	4100 2850 4200 2850
Wire Wire Line
	4100 3550 4200 3550
Text Label 6550 3050 0    60   ~ 0
enc1
Text Label 6650 3400 0    60   ~ 0
enb2
$EndSCHEMATC
