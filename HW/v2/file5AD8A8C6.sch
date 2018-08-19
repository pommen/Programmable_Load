EESchema Schematic File Version 4
LIBS:v2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Programmable Load Mosfet stage"
Date "2018-04-19"
Rev "0.2"
Comp "Programmable load"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:Earth #PWR026
U 1 1 5ADA6D6A
P 1550 2300
F 0 "#PWR026" H 1550 2050 50  0001 C CNN
F 1 "Earth" H 1550 2150 50  0001 C CNN
F 2 "" H 1550 2300 50  0001 C CNN
F 3 "" H 1550 2300 50  0001 C CNN
	1    1550 2300
	1    0    0    -1  
$EndComp
$Comp
L Peters:STW45NM50 Q4
U 1 1 5ADA6D6B
P 3700 4700
F 0 "Q4" H 3900 4775 50  0000 L CNN
F 1 "STW45NM50" V 4050 4500 50  0000 L CNN
F 2 "LoadResistor:Load_mosfet" H 3900 4625 50  0001 L CIN
F 3 "" H 3700 4700 50  0001 L CNN
	1    3700 4700
	1    0    0    -1  
$EndComp
$Comp
L device:R R13
U 1 1 5ADA6D6C
P 3350 5050
F 0 "R13" V 3430 5050 50  0000 C CNN
F 1 "10K" V 3350 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3280 5050 50  0001 C CNN
F 3 "" H 3350 5050 50  0001 C CNN
	1    3350 5050
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR027
U 1 1 5ADA6D6D
P 3350 5250
F 0 "#PWR027" H 3350 5000 50  0001 C CNN
F 1 "Earth" H 3350 5100 50  0001 C CNN
F 2 "" H 3350 5250 50  0001 C CNN
F 3 "" H 3350 5250 50  0001 C CNN
	1    3350 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR028
U 1 1 5ADA6D6E
P 2300 4450
F 0 "#PWR028" H 2300 4300 50  0001 C CNN
F 1 "+12V" H 2300 4590 50  0000 C CNN
F 2 "" H 2300 4450 50  0001 C CNN
F 3 "" H 2300 4450 50  0001 C CNN
	1    2300 4450
	1    0    0    -1  
$EndComp
$Comp
L device:C C11
U 1 1 5ADA6D6F
P 2850 4950
F 0 "C11" H 2875 5050 50  0000 L CNN
F 1 "1n" H 2875 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2888 4800 50  0001 C CNN
F 3 "" H 2850 4950 50  0001 C CNN
	1    2850 4950
	1    0    0    -1  
$EndComp
$Comp
L device:R R8
U 1 1 5ADA6D70
P 2850 5250
F 0 "R8" V 2930 5250 50  0000 C CNN
F 1 "1K" V 2850 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2780 5250 50  0001 C CNN
F 3 "" H 2850 5250 50  0001 C CNN
	1    2850 5250
	1    0    0    -1  
$EndComp
$Comp
L device:C C9
U 1 1 5ADA6D71
P 2450 5950
F 0 "C9" H 2475 6050 50  0000 L CNN
F 1 "0.1u" H 2475 5850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 5800 50  0001 C CNN
F 3 "" H 2450 5950 50  0001 C CNN
	1    2450 5950
	1    0    0    -1  
$EndComp
$Comp
L device:C C20
U 1 1 5ADA6D72
P 9900 2050
F 0 "C20" H 9925 2150 50  0000 L CNN
F 1 "0.1u" H 9925 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9938 1900 50  0001 C CNN
F 3 "" H 9900 2050 50  0001 C CNN
	1    9900 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 5ADA6D73
P 9900 1900
F 0 "#PWR029" H 9900 1750 50  0001 C CNN
F 1 "+5V" H 9900 2040 50  0000 C CNN
F 2 "" H 9900 1900 50  0001 C CNN
F 3 "" H 9900 1900 50  0001 C CNN
	1    9900 1900
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR030
U 1 1 5ADA6D74
P 2450 6100
F 0 "#PWR030" H 2450 5850 50  0001 C CNN
F 1 "Earth" H 2450 5950 50  0001 C CNN
F 2 "" H 2450 6100 50  0001 C CNN
F 3 "" H 2450 6100 50  0001 C CNN
	1    2450 6100
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR031
U 1 1 5ADA6D75
P 9900 2200
F 0 "#PWR031" H 9900 1950 50  0001 C CNN
F 1 "Earth" H 9900 2050 50  0001 C CNN
F 2 "" H 9900 2200 50  0001 C CNN
F 3 "" H 9900 2200 50  0001 C CNN
	1    9900 2200
	1    0    0    -1  
$EndComp
$Comp
L device:CP1 C12
U 1 1 5ADA6D76
P 2950 5950
F 0 "C12" H 2975 6050 50  0000 L CNN
F 1 "10u" H 2975 5850 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 2950 5950 50  0001 C CNN
F 3 "" H 2950 5950 50  0001 C CNN
	1    2950 5950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR032
U 1 1 5ADA6D77
P 2950 6100
F 0 "#PWR032" H 2950 5850 50  0001 C CNN
F 1 "Earth" H 2950 5950 50  0001 C CNN
F 2 "" H 2950 6100 50  0001 C CNN
F 3 "" H 2950 6100 50  0001 C CNN
	1    2950 6100
	1    0    0    -1  
$EndComp
$Comp
L TEST TP1
U 1 1 5ADA6D78
P 1450 4550
F 0 "TP1" H 1450 4850 50  0000 C BNN
F 1 "TEST" H 1450 4800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 1450 4550 50  0001 C CNN
F 3 "" H 1450 4550 50  0001 C CNN
	1    1450 4550
	1    0    0    -1  
$EndComp
$Comp
L Peters:ADS1115 U3
U 1 1 5ADA6D79
P 1550 2000
F 0 "U3" H 1800 2950 60  0000 C CNN
F 1 "ADS1115" H 1850 1700 60  0000 C CNN
F 2 "Libs:ADS1115-Breakout" H 2450 1650 60  0001 C CNN
F 3 "" H 1550 2000 60  0001 C CNN
	1    1550 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 5ADA6D7A
P 1550 1450
F 0 "#PWR033" H 1550 1300 50  0001 C CNN
F 1 "+5V" H 1550 1590 50  0000 C CNN
F 2 "" H 1550 1450 50  0001 C CNN
F 3 "" H 1550 1450 50  0001 C CNN
	1    1550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR034
U 1 1 5ADA6D7B
P 3800 5950
F 0 "#PWR034" H 3800 5700 50  0001 C CNN
F 1 "Earth" H 3800 5800 50  0001 C CNN
F 2 "" H 3800 5950 50  0001 C CNN
F 3 "" H 3800 5950 50  0001 C CNN
	1    3800 5950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR035
U 1 1 5ADA6D7C
P 2450 1800
F 0 "#PWR035" H 2450 1550 50  0001 C CNN
F 1 "Earth" H 2450 1650 50  0001 C CNN
F 2 "" H 2450 1800 50  0001 C CNN
F 3 "" H 2450 1800 50  0001 C CNN
	1    2450 1800
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR036
U 1 1 5ADA6D7D
P 2300 2500
F 0 "#PWR036" H 2300 2250 50  0001 C CNN
F 1 "Earth" H 2300 2350 50  0001 C CNN
F 2 "" H 2300 2500 50  0001 C CNN
F 3 "" H 2300 2500 50  0001 C CNN
	1    2300 2500
	1    0    0    -1  
$EndComp
$Comp
L device:R R14
U 1 1 5ADA6D7E
P 3950 5450
F 0 "R14" V 4030 5450 50  0000 C CNN
F 1 "10K" V 3950 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3880 5450 50  0001 C CNN
F 3 "" H 3950 5450 50  0001 C CNN
	1    3950 5450
	0    -1   1    0   
$EndComp
$Comp
L power:Earth #PWR037
U 1 1 5ADA6D7F
P 5750 6300
F 0 "#PWR037" H 5750 6050 50  0001 C CNN
F 1 "Earth" H 5750 6150 50  0001 C CNN
F 2 "" H 5750 6300 50  0001 C CNN
F 3 "" H 5750 6300 50  0001 C CNN
	1    5750 6300
	-1   0    0    -1  
$EndComp
$Comp
L device:C C15
U 1 1 5ADA6D80
P 5750 6000
F 0 "C15" H 5775 6100 50  0000 L CNN
F 1 "0.1u" H 5775 5900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5788 5850 50  0001 C CNN
F 3 "" H 5750 6000 50  0001 C CNN
	1    5750 6000
	-1   0    0    -1  
$EndComp
Text GLabel 5950 5800 2    60   Input ~ 0
Curr
Text GLabel 2600 1650 2    60   Input ~ 0
Curr
$Comp
L power:+5V #PWR038
U 1 1 5ADA6D81
P 4700 5500
F 0 "#PWR038" H 4700 5350 50  0001 C CNN
F 1 "+5V" H 4700 5640 50  0000 C CNN
F 2 "" H 4700 5500 50  0001 C CNN
F 3 "" H 4700 5500 50  0001 C CNN
	1    4700 5500
	-1   0    0    -1  
$EndComp
$Comp
L power:-5V #PWR61
U 1 1 5ADA6D82
P 4700 6100
F 0 "#PWR61" H 4700 6200 50  0001 C CNN
F 1 "-5V" H 4700 6250 50  0000 C CNN
F 2 "" H 4700 6100 50  0001 C CNN
F 3 "" H 4700 6100 50  0001 C CNN
	1    4700 6100
	1    0    0    1   
$EndComp
$Comp
L power:-5V #PWR76
U 1 1 5ADA6D83
P 6000 6950
F 0 "#PWR76" H 6000 7050 50  0001 C CNN
F 1 "-5V" H 6000 7100 50  0000 C CNN
F 2 "" H 6000 6950 50  0001 C CNN
F 3 "" H 6000 6950 50  0001 C CNN
	1    6000 6950
	1    0    0    1   
$EndComp
$Comp
L device:C C16
U 1 1 5ADA6D84
P 6000 6800
F 0 "C16" H 6025 6900 50  0000 L CNN
F 1 "0.1u" H 6025 6700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6038 6650 50  0001 C CNN
F 3 "" H 6000 6800 50  0001 C CNN
	1    6000 6800
	-1   0    0    -1  
$EndComp
$Comp
L power:Earth #PWR039
U 1 1 5ADA6D85
P 6000 6650
F 0 "#PWR039" H 6000 6400 50  0001 C CNN
F 1 "Earth" H 6000 6500 50  0001 C CNN
F 2 "" H 6000 6650 50  0001 C CNN
F 3 "" H 6000 6650 50  0001 C CNN
	1    6000 6650
	1    0    0    1   
$EndComp
$Comp
L device:R R15
U 1 1 5ADA6D86
P 4650 2050
F 0 "R15" V 4730 2050 50  0000 C CNN
F 1 "10K" V 4650 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4580 2050 50  0001 C CNN
F 3 "" H 4650 2050 50  0001 C CNN
	1    4650 2050
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR040
U 1 1 5ADA6D87
P 4650 2250
F 0 "#PWR040" H 4650 2000 50  0001 C CNN
F 1 "Earth" H 4650 2100 50  0001 C CNN
F 2 "" H 4650 2250 50  0001 C CNN
F 3 "" H 4650 2250 50  0001 C CNN
	1    4650 2250
	1    0    0    -1  
$EndComp
$Comp
L device:C C10
U 1 1 5ADA6D88
P 2750 2300
F 0 "C10" H 2775 2400 50  0000 L CNN
F 1 "0.1u" H 2775 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2788 2150 50  0001 C CNN
F 3 "" H 2750 2300 50  0001 C CNN
	1    2750 2300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR041
U 1 1 5ADA6D89
P 2750 2500
F 0 "#PWR041" H 2750 2250 50  0001 C CNN
F 1 "Earth" H 2750 2350 50  0001 C CNN
F 2 "" H 2750 2500 50  0001 C CNN
F 3 "" H 2750 2500 50  0001 C CNN
	1    2750 2500
	1    0    0    -1  
$EndComp
$Comp
L device:R R7
U 1 1 5ADA6D8B
P 2400 1050
F 0 "R7" V 2480 1050 50  0000 C CNN
F 1 "1M8" V 2400 1050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2330 1050 50  0001 C CNN
F 3 "" H 2400 1050 50  0001 C CNN
	1    2400 1050
	-1   0    0    1   
$EndComp
$Comp
L device:R R9
U 1 1 5ADA6D8C
P 3050 1050
F 0 "R9" V 3130 1050 50  0000 C CNN
F 1 "270K" V 3050 1050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2980 1050 50  0001 C CNN
F 3 "" H 3050 1050 50  0001 C CNN
	1    3050 1050
	-1   0    0    1   
$EndComp
$Comp
L power:-5V #PWR51
U 1 1 5ADA6D8D
P 3500 750
F 0 "#PWR51" H 3500 850 50  0001 C CNN
F 1 "-5V" H 3500 900 50  0000 C CNN
F 2 "" H 3500 750 50  0001 C CNN
F 3 "" H 3500 750 50  0001 C CNN
	1    3500 750 
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR042
U 1 1 5ADA6D90
P 5000 4750
F 0 "#PWR042" H 5000 4500 50  0001 C CNN
F 1 "Earth" H 5000 4600 50  0001 C CNN
F 2 "" H 5000 4750 50  0001 C CNN
F 3 "" H 5000 4750 50  0001 C CNN
	1    5000 4750
	1    0    0    -1  
$EndComp
$Comp
L Peters:LM35 U13
U 1 1 5ADA6D91
P 10750 1850
F 0 "U13" H 10900 1950 60  0000 C CNN
F 1 "LM35" H 10800 2050 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 11250 2400 60  0001 C CNN
F 3 "" H 10750 1850 60  0001 C CNN
	1    10750 1850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR043
U 1 1 5ADA6D92
P 10650 2300
F 0 "#PWR043" H 10650 2050 50  0001 C CNN
F 1 "Earth" H 10650 2150 50  0001 C CNN
F 2 "" H 10650 2300 50  0001 C CNN
F 3 "" H 10650 2300 50  0001 C CNN
	1    10650 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR044
U 1 1 5ADA6D93
P 10650 1400
F 0 "#PWR044" H 10650 1250 50  0001 C CNN
F 1 "+5V" H 10650 1540 50  0000 C CNN
F 2 "" H 10650 1400 50  0001 C CNN
F 3 "" H 10650 1400 50  0001 C CNN
	1    10650 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR045
U 1 1 5ADA6D95
P 9450 1350
F 0 "#PWR045" H 9450 1200 50  0001 C CNN
F 1 "+5V" H 9450 1490 50  0000 C CNN
F 2 "" H 9450 1350 50  0001 C CNN
F 3 "" H 9450 1350 50  0001 C CNN
	1    9450 1350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR046
U 1 1 5ADA6D96
P 9450 2150
F 0 "#PWR046" H 9450 1900 50  0001 C CNN
F 1 "Earth" H 9450 2000 50  0001 C CNN
F 2 "" H 9450 2150 50  0001 C CNN
F 3 "" H 9450 2150 50  0001 C CNN
	1    9450 2150
	1    0    0    -1  
$EndComp
$Comp
L device:R R25
U 1 1 5ADA6D97
P 9650 2750
F 0 "R25" V 9730 2750 50  0000 C CNN
F 1 "10K" V 9650 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9580 2750 50  0001 C CNN
F 3 "" H 9650 2750 50  0001 C CNN
	1    9650 2750
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR047
U 1 1 5ADA6D98
P 9650 3000
F 0 "#PWR047" H 9650 2750 50  0001 C CNN
F 1 "Earth" H 9650 2850 50  0001 C CNN
F 2 "" H 9650 3000 50  0001 C CNN
F 3 "" H 9650 3000 50  0001 C CNN
	1    9650 3000
	1    0    0    -1  
$EndComp
$Comp
L device:R R24
U 1 1 5ADA6D99
P 9450 2450
F 0 "R24" V 9530 2450 50  0000 C CNN
F 1 "20K" V 9450 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9380 2450 50  0001 C CNN
F 3 "" H 9450 2450 50  0001 C CNN
	1    9450 2450
	0    1    1    0   
$EndComp
Text Notes 8500 1650 0    60   ~ 0
150C = 4.5V
$Comp
L power:+5V #PWR048
U 1 1 5ADA6D9A
P 5700 6700
F 0 "#PWR048" H 5700 6550 50  0001 C CNN
F 1 "+5V" H 5700 6840 50  0000 C CNN
F 2 "" H 5700 6700 50  0001 C CNN
F 3 "" H 5700 6700 50  0001 C CNN
	1    5700 6700
	-1   0    0    -1  
$EndComp
$Comp
L device:C C14
U 1 1 5ADA6D9B
P 5700 6850
F 0 "C14" H 5725 6950 50  0000 L CNN
F 1 "0.1u" H 5725 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5738 6700 50  0001 C CNN
F 3 "" H 5700 6850 50  0001 C CNN
	1    5700 6850
	-1   0    0    -1  
$EndComp
$Comp
L power:Earth #PWR049
U 1 1 5ADA6D9C
P 5700 7000
F 0 "#PWR049" H 5700 6750 50  0001 C CNN
F 1 "Earth" H 5700 6850 50  0001 C CNN
F 2 "" H 5700 7000 50  0001 C CNN
F 3 "" H 5700 7000 50  0001 C CNN
	1    5700 7000
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR050
U 1 1 5ADA6D9D
P 1050 1050
F 0 "#PWR050" H 1050 900 50  0001 C CNN
F 1 "+5V" H 1050 1190 50  0000 C CNN
F 2 "" H 1050 1050 50  0001 C CNN
F 3 "" H 1050 1050 50  0001 C CNN
	1    1050 1050
	1    0    0    -1  
$EndComp
$Comp
L device:C C6
U 1 1 5ADA6D9E
P 1050 1200
F 0 "C6" H 1075 1300 50  0000 L CNN
F 1 "0.1u" H 1075 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1088 1050 50  0001 C CNN
F 3 "" H 1050 1200 50  0001 C CNN
	1    1050 1200
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR051
U 1 1 5ADA6D9F
P 1050 1350
F 0 "#PWR051" H 1050 1100 50  0001 C CNN
F 1 "Earth" H 1050 1200 50  0001 C CNN
F 2 "" H 1050 1350 50  0001 C CNN
F 3 "" H 1050 1350 50  0001 C CNN
	1    1050 1350
	1    0    0    -1  
$EndComp
$Comp
L device:R R-shunt1
U 1 1 5ADA6DA0
P 3800 5750
F 0 "R-shunt1" V 3880 5750 50  0000 C CNN
F 1 "0.1" V 3800 5750 50  0000 C CNN
F 2 "LoadResistor:Loadresistor" V 3730 5750 50  0001 C CNN
F 3 "" H 3800 5750 50  0001 C CNN
	1    3800 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR052
U 1 1 5ADA6DA1
P 2950 5800
F 0 "#PWR052" H 2950 5650 50  0001 C CNN
F 1 "+12V" H 2950 5940 50  0000 C CNN
F 2 "" H 2950 5800 50  0001 C CNN
F 3 "" H 2950 5800 50  0001 C CNN
	1    2950 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR053
U 1 1 5ADA6DA2
P 2450 5800
F 0 "#PWR053" H 2450 5650 50  0001 C CNN
F 1 "+12V" H 2450 5940 50  0000 C CNN
F 2 "" H 2450 5800 50  0001 C CNN
F 3 "" H 2450 5800 50  0001 C CNN
	1    2450 5800
	1    0    0    -1  
$EndComp
Text GLabel 1100 1950 0    60   Input ~ 0
SDA
Text GLabel 1100 2100 0    60   Input ~ 0
SCL
Text GLabel 8600 1800 0    60   Input ~ 0
LoadBlockTemp
$Comp
L linear:OP07 U4
U 1 1 5ADA6DA3
P 2400 4750
F 0 "U4" H 2400 5050 50  0000 L CNN
F 1 "Gate DRV" H 2400 4950 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 2450 4800 50  0001 C CNN
F 3 "" H 2450 4900 50  0001 C CNN
	1    2400 4750
	1    0    0    -1  
$EndComp
$Comp
L linear:OP07 U7
U 1 1 5ADA6DA4
P 4800 5800
F 0 "U7" H 4800 6100 50  0000 L CNN
F 1 "Current amp" H 4800 6000 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 4850 5850 50  0001 C CNN
F 3 "" H 4850 5950 50  0001 C CNN
	1    4800 5800
	1    0    0    -1  
$EndComp
$Comp
L device:Fuse F1
U 1 1 5ADA6DA5
P 4800 4250
F 0 "F1" V 4603 4250 50  0000 C CNN
F 1 "Fuse" V 4694 4250 50  0000 C CNN
F 2 "Libs:Fuse_holser_Plastic_ebay" V 4730 4250 50  0001 C CNN
F 3 "" H 4800 4250 50  0001 C CNN
	1    4800 4250
	0    1    1    0   
$EndComp
$Comp
L power:-5V #PWR33
U 1 1 5ADA6DA6
P 1450 5950
F 0 "#PWR33" H 1450 6050 50  0001 C CNN
F 1 "-5V" H 1450 6100 50  0000 C CNN
F 2 "" H 1450 5950 50  0001 C CNN
F 3 "" H 1450 5950 50  0001 C CNN
	1    1450 5950
	-1   0    0    1   
$EndComp
$Comp
L device:C C7
U 1 1 5ADA6DA7
P 1450 5800
F 0 "C7" H 1475 5900 50  0000 L CNN
F 1 "0.1u" H 1475 5700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1488 5650 50  0001 C CNN
F 3 "" H 1450 5800 50  0001 C CNN
	1    1450 5800
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR054
U 1 1 5ADA6DA8
P 1450 5650
F 0 "#PWR054" H 1450 5400 50  0001 C CNN
F 1 "Earth" H 1450 5500 50  0001 C CNN
F 2 "" H 1450 5650 50  0001 C CNN
F 3 "" H 1450 5650 50  0001 C CNN
	1    1450 5650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 5ADA6DA9
P 3450 1350
F 0 "#PWR055" H 3450 1200 50  0001 C CNN
F 1 "+5V" H 3450 1490 50  0000 C CNN
F 2 "" H 3450 1350 50  0001 C CNN
F 3 "" H 3450 1350 50  0001 C CNN
	1    3450 1350
	1    0    0    -1  
$EndComp
$Comp
L device:C C13
U 1 1 5ADA6DAA
P 3450 1500
F 0 "C13" H 3475 1600 50  0000 L CNN
F 1 "0.1u" H 3475 1400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3488 1350 50  0001 C CNN
F 3 "" H 3450 1500 50  0001 C CNN
	1    3450 1500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR056
U 1 1 5ADA6DAB
P 3450 1650
F 0 "#PWR056" H 3450 1400 50  0001 C CNN
F 1 "Earth" H 3450 1500 50  0001 C CNN
F 2 "" H 3450 1650 50  0001 C CNN
F 3 "" H 3450 1650 50  0001 C CNN
	1    3450 1650
	1    0    0    -1  
$EndComp
Text GLabel 1400 4650 0    60   Input ~ 0
CurrentSet
$Comp
L POT_TRIM RV2
U 1 1 5ADA6DAC
P 2450 5200
AR Path="/5ADA6DAC" Ref="RV2"  Part="1" 
AR Path="/5AD8A8C6/5ADA6DAC" Ref="RV2"  Part="1" 
F 0 "RV2" V 2450 5200 50  0000 C CNN
F 1 "POT_TRIM" V 2650 5200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h2.5_Vertical_Px2.5mm_Py5.0mm" H 2450 5200 50  0001 C CNN
F 3 "" H 2450 5200 50  0001 C CNN
	1    2450 5200
	0    -1   1    0   
$EndComp
Text GLabel 1100 1800 0    60   Input ~ 0
comperator
Text Notes 2550 3900 0    60   ~ 0
14 bits = 4096 steps\n1 step=1mV\n1mV@0.1 Ohm = 10mA 
$Comp
L linear:OP07 U8
U 1 1 5ADA6DAD
P 5150 1900
F 0 "U8" H 5200 2150 50  0000 L CNN
F 1 "Volt sense" H 5200 2050 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 5200 1950 50  0001 C CNN
F 3 "" H 5200 2050 50  0001 C CNN
	1    5150 1900
	-1   0    0    -1  
$EndComp
$Comp
L device:R R21
U 1 1 5ADA6DAE
P 6100 1800
F 0 "R21" V 6180 1800 50  0000 C CNN
F 1 "1M" V 6100 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6030 1800 50  0001 C CNN
F 3 "" H 6100 1800 50  0001 C CNN
	1    6100 1800
	0    1    1    0   
$EndComp
$Comp
L device:R R22
U 1 1 5ADA6DAF
P 6100 2000
F 0 "R22" V 6180 2000 50  0000 C CNN
F 1 "1M" V 6100 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6030 2000 50  0001 C CNN
F 3 "" H 6100 2000 50  0001 C CNN
	1    6100 2000
	0    1    1    0   
$EndComp
$Comp
L device:R R16
U 1 1 5ADA6DB0
P 5100 1100
F 0 "R16" V 5000 1100 50  0000 C CNN
F 1 "20K" V 5100 1100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5030 1100 50  0001 C CNN
F 3 "" H 5100 1100 50  0001 C CNN
	1    5100 1100
	0    1    1    0   
$EndComp
$Comp
L device:R R18
U 1 1 5ADA6DB1
P 5550 2150
F 0 "R18" V 5630 2150 50  0000 C CNN
F 1 "20K" V 5550 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5480 2150 50  0001 C CNN
F 3 "" H 5550 2150 50  0001 C CNN
	1    5550 2150
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR057
U 1 1 5ADA6DB2
P 6500 950
F 0 "#PWR057" H 6500 700 50  0001 C CNN
F 1 "Earth" H 6500 800 50  0001 C CNN
F 2 "" H 6500 950 50  0001 C CNN
F 3 "" H 6500 950 50  0001 C CNN
	1    6500 950 
	1    0    0    1   
$EndComp
$Comp
L device:C C18
U 1 1 5ADA6DB3
P 6500 1100
F 0 "C18" H 6525 1200 50  0000 L CNN
F 1 "C" H 6525 1000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6538 950 50  0001 C CNN
F 3 "" H 6500 1100 50  0001 C CNN
	1    6500 1100
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR058
U 1 1 5ADA6DB4
P 4900 2750
F 0 "#PWR058" H 4900 2500 50  0001 C CNN
F 1 "Earth" H 4900 2600 50  0001 C CNN
F 2 "" H 4900 2750 50  0001 C CNN
F 3 "" H 4900 2750 50  0001 C CNN
	1    4900 2750
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR67
U 1 1 5ADA6DB5
P 5250 2250
F 0 "#PWR67" H 5250 2350 50  0001 C CNN
F 1 "-5V" H 5250 2400 50  0000 C CNN
F 2 "" H 5250 2250 50  0001 C CNN
F 3 "" H 5250 2250 50  0001 C CNN
	1    5250 2250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 5ADA6DB6
P 5250 1500
F 0 "#PWR059" H 5250 1350 50  0001 C CNN
F 1 "+5V" H 5250 1640 50  0000 C CNN
F 2 "" H 5250 1500 50  0001 C CNN
F 3 "" H 5250 1500 50  0001 C CNN
	1    5250 1500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR060
U 1 1 5ADA6DB7
P 6200 1250
F 0 "#PWR060" H 6200 1000 50  0001 C CNN
F 1 "Earth" H 6200 1100 50  0001 C CNN
F 2 "" H 6200 1250 50  0001 C CNN
F 3 "" H 6200 1250 50  0001 C CNN
	1    6200 1250
	-1   0    0    -1  
$EndComp
$Comp
L device:C C17
U 1 1 5ADA6DB8
P 6200 1100
F 0 "C17" H 6225 1200 50  0000 L CNN
F 1 "C" H 6225 1000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6238 950 50  0001 C CNN
F 3 "" H 6200 1100 50  0001 C CNN
	1    6200 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR061
U 1 1 5ADA6DB9
P 6200 950
F 0 "#PWR061" H 6200 800 50  0001 C CNN
F 1 "+5V" H 6200 1090 50  0000 C CNN
F 2 "" H 6200 950 50  0001 C CNN
F 3 "" H 6200 950 50  0001 C CNN
	1    6200 950 
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR80
U 1 1 5ADA6DBA
P 6500 1350
F 0 "#PWR80" H 6500 1450 50  0001 C CNN
F 1 "-5V" H 6500 1500 50  0000 C CNN
F 2 "" H 6500 1350 50  0001 C CNN
F 3 "" H 6500 1350 50  0001 C CNN
	1    6500 1350
	-1   0    0    1   
$EndComp
Text Notes 1500 2900 0    60   ~ 0
Remote sense\nGår via en 2x2 pols brytare på fronten.\nAntingen mäter den via banankontakter eller rätt på utgången
Wire Wire Line
	2700 4750 2850 4750
Wire Wire Line
	3250 4750 3350 4750
Connection ~ 3350 4750
Wire Wire Line
	3350 5250 3350 5200
Wire Wire Line
	3800 4900 3800 5450
Wire Wire Line
	2000 1800 2450 1800
Wire Wire Line
	4000 7000 5100 7000
Wire Wire Line
	5100 7000 5100 5800
Wire Wire Line
	4150 5700 4500 5700
Wire Wire Line
	5600 5800 5750 5800
Wire Wire Line
	5750 5800 5750 5850
Connection ~ 5750 5800
Wire Wire Line
	5750 6300 5750 6150
Wire Wire Line
	4650 2250 4650 2200
Wire Wire Line
	2000 1950 2750 1950
Wire Wire Line
	2750 2150 2750 1950
Connection ~ 2750 1950
Wire Wire Line
	2750 2500 2750 2450
Wire Wire Line
	2000 1650 2400 1650
Wire Wire Line
	2400 1200 2400 1650
Connection ~ 2400 1650
Wire Wire Line
	3050 1200 3050 1950
Connection ~ 3050 1950
Wire Wire Line
	2400 900  2400 650 
Wire Wire Line
	2400 650  3050 650 
Wire Wire Line
	3500 650  3500 750 
Wire Wire Line
	3050 900  3050 650 
Connection ~ 3050 650 
Wire Wire Line
	5050 4550 5000 4550
Wire Wire Line
	5000 4550 5000 4750
Wire Wire Line
	10650 1550 10650 1400
Wire Wire Line
	9450 1500 9450 1350
Wire Wire Line
	9450 2150 9450 2100
Wire Wire Line
	9650 1900 9650 2450
Wire Wire Line
	8950 2450 8950 1800
Wire Wire Line
	8600 1800 8950 1800
Connection ~ 8950 1800
Wire Wire Line
	10350 1900 10350 1700
Wire Wire Line
	10350 1700 9650 1700
Wire Wire Line
	8950 2450 9300 2450
Wire Wire Line
	9650 2450 9600 2450
Connection ~ 9650 2450
Wire Wire Line
	9650 3000 9650 2900
Wire Wire Line
	2850 4750 2850 4800
Connection ~ 2850 4750
Wire Wire Line
	3350 4750 3350 4900
Connection ~ 1600 5250
Wire Wire Line
	1600 4850 2100 4850
Wire Wire Line
	3800 5950 3800 5900
Wire Wire Line
	4300 4300 4300 4250
Connection ~ 4300 4250
Wire Wire Line
	4950 4250 5050 4250
Wire Wire Line
	1400 4650 1450 4650
Wire Wire Line
	1450 4650 1450 4550
Connection ~ 1450 4650
Wire Wire Line
	1600 4850 1600 5250
Connection ~ 3800 5450
Wire Wire Line
	4150 5700 4150 5450
Wire Wire Line
	4150 5450 4100 5450
Wire Wire Line
	2850 5400 2850 5450
Connection ~ 2850 5450
Wire Wire Line
	2450 5350 2150 5350
Wire Wire Line
	2300 5200 2300 5100
Wire Wire Line
	2300 5100 2400 5100
Wire Wire Line
	2400 5100 2400 5050
Wire Wire Line
	2600 5100 2600 5200
Wire Wire Line
	2600 5100 2500 5100
Wire Wire Line
	2500 5100 2500 5050
Wire Wire Line
	2000 2100 2300 2100
Wire Wire Line
	2300 2100 2300 2500
Wire Wire Line
	5450 1800 5550 1800
Wire Wire Line
	5450 2000 5550 2000
Connection ~ 5550 2000
Wire Wire Line
	6500 1250 6500 1350
Wire Wire Line
	5250 1100 5550 1100
Wire Wire Line
	5550 1100 5550 1800
Connection ~ 5550 1800
Wire Wire Line
	6500 1800 6250 1800
Wire Wire Line
	6500 2000 6250 2000
Connection ~ 4650 1900
$Comp
L device:R R11
U 1 1 5ADA6DBD
P 3300 1950
F 0 "R11" V 3380 1950 50  0000 C CNN
F 1 "100R" V 3300 1950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3230 1950 50  0001 C CNN
F 3 "" H 3300 1950 50  0001 C CNN
	1    3300 1950
	0    1    1    0   
$EndComp
Text Notes 2550 1150 1    60   ~ 0
nc?
$Comp
L power:+5V #PWR062
U 1 1 5ADA6DBE
P 650 1050
F 0 "#PWR062" H 650 900 50  0001 C CNN
F 1 "+5V" H 650 1190 50  0000 C CNN
F 2 "" H 650 1050 50  0001 C CNN
F 3 "" H 650 1050 50  0001 C CNN
	1    650  1050
	1    0    0    -1  
$EndComp
$Comp
L device:C C5
U 1 1 5ADA6DBF
P 650 1200
F 0 "C5" H 675 1300 50  0000 L CNN
F 1 "10u" H 675 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 688 1050 50  0001 C CNN
F 3 "" H 650 1200 50  0001 C CNN
	1    650  1200
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR063
U 1 1 5ADA6DC0
P 650 1350
F 0 "#PWR063" H 650 1100 50  0001 C CNN
F 1 "Earth" H 650 1200 50  0001 C CNN
F 2 "" H 650 1350 50  0001 C CNN
F 3 "" H 650 1350 50  0001 C CNN
	1    650  1350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR064
U 1 1 5ADA6DC1
P 7800 2700
F 0 "#PWR064" H 7800 2450 50  0001 C CNN
F 1 "Earth" H 7800 2550 50  0001 C CNN
F 2 "" H 7800 2700 50  0001 C CNN
F 3 "" H 7800 2700 50  0001 C CNN
	1    7800 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR065
U 1 1 5ADA6DC2
P 8000 2700
F 0 "#PWR065" H 8000 2450 50  0001 C CNN
F 1 "GND" H 8000 2550 50  0000 C CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "" H 8000 2700 50  0001 C CNN
	1    8000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2700 8000 2650
Wire Wire Line
	8000 2650 7800 2650
Wire Wire Line
	7800 2650 7800 2700
$Comp
L POT_TRIM RV1
U 1 1 5ADA6DC3
P 700 5250
AR Path="/5ADA6DC3" Ref="RV1"  Part="1" 
AR Path="/5AD8A8C6/5ADA6DC3" Ref="RV1"  Part="1" 
F 0 "RV1" V 800 5050 50  0000 C CNN
F 1 "Null cal" H 750 5500 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h2.5_Vertical_Px2.5mm_Py5.0mm" H 700 5250 50  0001 C CNN
F 3 "" H 700 5250 50  0001 C CNN
	1    700  5250
	1    0    0    1   
$EndComp
Text GLabel 700  5000 1    60   Input ~ 0
4.096V
$Comp
L power:Earth #PWR066
U 1 1 5ADA6DC4
P 1050 6600
F 0 "#PWR066" H 1050 6350 50  0001 C CNN
F 1 "Earth" H 1050 6450 50  0001 C CNN
F 2 "" H 1050 6600 50  0001 C CNN
F 3 "" H 1050 6600 50  0001 C CNN
	1    1050 6600
	1    0    0    -1  
$EndComp
$Comp
L Peters:TL431A U2
U 1 1 5ADA6DC5
P 1050 6300
F 0 "U2" H 900 6450 60  0000 C CNN
F 1 "TL431A" V 1300 6300 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 450 6600 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl432a.pdf" H 550 6700 60  0001 C CNN
	1    1050 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 6250 1350 6550
Wire Wire Line
	1350 6550 1050 6550
Wire Wire Line
	1050 6550 1050 6600
$Comp
L device:R R5
U 1 1 5ADA6DC6
P 1050 5800
F 0 "R5" V 1130 5800 50  0000 C CNN
F 1 "2K2" V 1050 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 980 5800 50  0001 C CNN
F 3 "" H 1050 5800 50  0001 C CNN
	1    1050 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6000 1050 5950
$Comp
L power:-5V #PWR30
U 1 1 5ADA6DC7
P 1050 5550
F 0 "#PWR30" H 1050 5650 50  0001 C CNN
F 1 "-5V" H 1050 5700 50  0000 C CNN
F 2 "" H 1050 5550 50  0001 C CNN
F 3 "" H 1050 5550 50  0001 C CNN
	1    1050 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5650 1050 5550
Wire Wire Line
	700  5400 700  6000
Wire Wire Line
	850  5250 1200 5250
$Comp
L device:R R6
U 1 1 5ADA6DC8
P 1350 5250
F 0 "R6" V 1430 5250 50  0000 C CNN
F 1 "4M7" V 1350 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1280 5250 50  0001 C CNN
F 3 "" H 1350 5250 50  0001 C CNN
	1    1350 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 5250 1600 5250
$Comp
L power:Earth #PWR067
U 1 1 5ADA6DC9
P 4300 4600
F 0 "#PWR067" H 4300 4350 50  0001 C CNN
F 1 "Earth" H 4300 4450 50  0001 C CNN
F 2 "" H 4300 4600 50  0001 C CNN
F 3 "" H 4300 4600 50  0001 C CNN
	1    4300 4600
	1    0    0    -1  
$EndComp
$Comp
L device:D_Schottky D3
U 1 1 5ADA6DCA
P 4300 4450
F 0 "D3" H 4300 4550 50  0000 C CNN
F 1 "D_Schottky" H 4300 4350 50  0000 C CNN
F 2 "Diodes_SMD:D_SMB-SMC_Universal_Handsoldering" H 4300 4450 50  0001 C CNN
F 3 "" H 4300 4450 50  0001 C CNN
	1    4300 4450
	0    1    1    0   
$EndComp
Text Label 3450 3350 0    60   ~ 0
Dut+
Text Label 5000 4250 0    60   ~ 0
Dut+_efter_säkring
$Comp
L conn:Conn_01x02 J8
U 1 1 5ADA6DCB
P 6700 1850
F 0 "J8" H 6700 1950 50  0000 C CNN
F 1 "Remote_sense" H 6700 1650 50  0000 C CNN
F 2 "Libs:JUMPER_5MM" H 6700 1850 50  0001 C CNN
F 3 "" H 6700 1850 50  0001 C CNN
	1    6700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1850 6500 1800
Wire Wire Line
	6500 1950 6500 2000
Wire Wire Line
	700  5000 700  5100
$Comp
L device:R R19
U 1 1 5ADA6DCC
P 5800 1650
F 0 "R19" V 5880 1650 50  0000 C CNN
F 1 "1M" V 5800 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5730 1650 50  0001 C CNN
F 3 "" H 5800 1650 50  0001 C CNN
	1    5800 1650
	-1   0    0    1   
$EndComp
$Comp
L device:R R20
U 1 1 5ADA6DCD
P 5850 2150
F 0 "R20" V 5930 2150 50  0000 C CNN
F 1 "1M" V 5850 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5780 2150 50  0001 C CNN
F 3 "" H 5850 2150 50  0001 C CNN
	1    5850 2150
	-1   0    0    1   
$EndComp
$Comp
L power:Earth #PWR068
U 1 1 5ADA6DCE
P 6000 1500
F 0 "#PWR068" H 6000 1250 50  0001 C CNN
F 1 "Earth" H 6000 1350 50  0001 C CNN
F 2 "" H 6000 1500 50  0001 C CNN
F 3 "" H 6000 1500 50  0001 C CNN
	1    6000 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1500 6000 1500
Wire Wire Line
	4200 1900 4650 1900
$Comp
L power:+5V #PWR069
U 1 1 5ADA6DCF
P 4750 6400
F 0 "#PWR069" H 4750 6250 50  0001 C CNN
F 1 "+5V" H 4800 6550 50  0000 C CNN
F 2 "" H 4750 6400 50  0001 C CNN
F 3 "" H 4750 6400 50  0001 C CNN
	1    4750 6400
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR070
U 1 1 5ADA6DD0
P 2150 5350
F 0 "#PWR070" H 2150 5200 50  0001 C CNN
F 1 "+12V" H 2150 5490 50  0000 C CNN
F 2 "" H 2150 5350 50  0001 C CNN
F 3 "" H 2150 5350 50  0001 C CNN
	1    2150 5350
	0    -1   -1   0   
$EndComp
$Comp
L device:R R10
U 1 1 5ADA6DD1
P 3100 4750
F 0 "R10" V 3180 4750 50  0000 C CNN
F 1 "100R" V 3100 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3030 4750 50  0001 C CNN
F 3 "" H 3100 4750 50  0001 C CNN
	1    3100 4750
	0    1    1    0   
$EndComp
$Comp
L linear:LM321 U12
U 1 1 5ADAE55C
P 9350 1800
F 0 "U12" H 9350 2100 50  0000 L CNN
F 1 "Temp amp" H 8700 2150 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 9350 1800 50  0001 C CNN
F 3 "" H 9350 1800 50  0001 C CNN
	1    9350 1800
	-1   0    0    -1  
$EndComp
$Comp
L power:Earth #PWR071
U 1 1 5ADAEA7E
P 5550 2300
F 0 "#PWR071" H 5550 2050 50  0001 C CNN
F 1 "Earth" H 5550 2150 50  0001 C CNN
F 2 "" H 5550 2300 50  0001 C CNN
F 3 "" H 5550 2300 50  0001 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR072
U 1 1 5ADAF38B
P 5850 2300
F 0 "#PWR072" H 5850 2050 50  0001 C CNN
F 1 "Earth" H 5850 2150 50  0001 C CNN
F 2 "" H 5850 2300 50  0001 C CNN
F 3 "" H 5850 2300 50  0001 C CNN
	1    5850 2300
	1    0    0    -1  
$EndComp
Connection ~ 5850 2000
Connection ~ 5800 1800
$Comp
L conn:Conn_01x01 J6
U 1 1 5ADAFD20
P 5250 4250
F 0 "J6" H 5250 4350 50  0000 C CNN
F 1 "DUT+" H 5250 4150 50  0000 C CNN
F 2 "Connectors:Banana_Jack_1Pin" H 5250 4250 50  0001 C CNN
F 3 "" H 5250 4250 50  0001 C CNN
	1    5250 4250
	1    0    0    -1  
$EndComp
$Comp
L conn:Conn_01x01 J7
U 1 1 5ADAFFD1
P 5250 4550
F 0 "J7" H 5250 4650 50  0000 C CNN
F 1 "DUT-" H 5250 4450 50  0000 C CNN
F 2 "Connectors:Banana_Jack_1Pin" H 5250 4550 50  0001 C CNN
F 3 "" H 5250 4550 50  0001 C CNN
	1    5250 4550
	1    0    0    -1  
$EndComp
$Comp
L Peters:MCP4725 U10
U 1 1 5ADB9286
P 7750 4950
F 0 "U10" H 7300 5250 50  0000 L CNN
F 1 "MCP4725" H 7750 5250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23-6_HandSoldering" H 8750 4550 50  0001 C CIN
F 3 "" H 7750 4950 50  0001 C CNN
	1    7750 4950
	1    0    0    -1  
$EndComp
Text GLabel 7150 4800 0    60   Input ~ 0
SCL
Text GLabel 7150 4950 0    60   Input ~ 0
SDA
$Comp
L power:GND #PWR073
U 1 1 5ADB928F
P 7650 5400
F 0 "#PWR073" H 7650 5150 50  0001 C CNN
F 1 "GND" H 7650 5250 50  0000 C CNN
F 2 "" H 7650 5400 50  0001 C CNN
F 3 "" H 7650 5400 50  0001 C CNN
	1    7650 5400
	1    0    0    -1  
$EndComp
Text GLabel 10400 5050 2    60   Input ~ 0
CurrentSet
$Comp
L device:C C19
U 1 1 5ADB9296
P 8450 4400
F 0 "C19" H 8475 4500 50  0000 L CNN
F 1 "100nF" H 8475 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8488 4250 50  0001 C CNN
F 3 "" H 8450 4400 50  0001 C CNN
	1    8450 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR074
U 1 1 5ADB929D
P 8450 4550
F 0 "#PWR074" H 8450 4300 50  0001 C CNN
F 1 "GND" H 8450 4400 50  0000 C CNN
F 2 "" H 8450 4550 50  0001 C CNN
F 3 "" H 8450 4550 50  0001 C CNN
	1    8450 4550
	1    0    0    -1  
$EndComp
Text GLabel 7650 4500 0    60   Input ~ 0
4.096V
Text GLabel 8450 4250 0    60   Input ~ 0
4.096V
Text Notes 6950 4300 0    60   ~ 0
14 bits = 4096 steps\n1 step=1mV\n\nDivide to 0-1.1 V = 1100mv / 4095 = 0,2686 mv /step\n1mV@0.1 Ohm = 10mA \n40AMAX
Wire Wire Line
	8350 4950 8450 4950
Wire Wire Line
	7650 5400 7650 5350
Wire Wire Line
	7650 4550 7650 4500
$Comp
L Peters:AD8628 U11
U 1 1 5ADB92A9
P 9250 5050
F 0 "U11" H 9250 5250 50  0000 L CNN
F 1 "AD8628" H 9250 4850 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 10850 4500 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/AD8628_8629_8630.pdf" H 9500 4650 50  0001 C CNN
	1    9250 5050
	1    0    0    -1  
$EndComp
$Comp
L device:R R23
U 1 1 5ADB92B0
P 8450 5100
F 0 "R23" V 8530 5100 50  0000 C CNN
F 1 "10K" V 8450 5100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8380 5100 50  0001 C CNN
F 3 "" H 8450 5100 50  0001 C CNN
	1    8450 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR075
U 1 1 5ADB92B7
P 8450 5400
F 0 "#PWR075" H 8450 5150 50  0001 C CNN
F 1 "GND" H 8450 5250 50  0000 C CNN
F 2 "" H 8450 5400 50  0001 C CNN
F 3 "" H 8450 5400 50  0001 C CNN
	1    8450 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5400 8450 5250
Connection ~ 8450 4950
$Comp
L power:GND #PWR076
U 1 1 5ADB92BF
P 9200 5350
F 0 "#PWR076" H 9200 5100 50  0001 C CNN
F 1 "GND" H 9200 5200 50  0000 C CNN
F 2 "" H 9200 5350 50  0001 C CNN
F 3 "" H 9200 5350 50  0001 C CNN
	1    9200 5350
	1    0    0    -1  
$EndComp
Text GLabel 9200 4750 1    60   Input ~ 0
4.096V
Wire Wire Line
	8950 5150 8850 5150
Wire Wire Line
	8850 5150 8850 5650
Wire Wire Line
	8850 5650 9650 5650
Wire Wire Line
	9650 5650 9650 5050
Connection ~ 9650 5050
$Comp
L device:R R26
U 1 1 5ADB92CB
P 9900 5050
F 0 "R26" V 9980 5050 50  0000 C CNN
F 1 "20K" V 9900 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9830 5050 50  0001 C CNN
F 3 "" H 9900 5050 50  0001 C CNN
	1    9900 5050
	0    1    1    0   
$EndComp
$Comp
L device:R R27
U 1 1 5ADB92D2
P 10150 5200
F 0 "R27" V 10230 5200 50  0000 C CNN
F 1 "2K" V 10150 5200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 5200 50  0001 C CNN
F 3 "" H 10150 5200 50  0001 C CNN
	1    10150 5200
	1    0    0    -1  
$EndComp
$Comp
L POT_TRIM RV3
U 1 1 5ADB92D9
P 10150 5550
AR Path="/5ADB92D9" Ref="RV3"  Part="1" 
AR Path="/5AD8A8C6/5ADB92D9" Ref="RV3"  Part="1" 
F 0 "RV3" V 9975 5550 50  0000 C CNN
F 1 "5K" V 10050 5550 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_ACP_CA9h2.5_Vertical_Px2.5mm_Py5.0mm" H 10150 5550 50  0001 C CNN
F 3 "" H 10150 5550 50  0001 C CNN
	1    10150 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5550 10300 5750
Wire Wire Line
	10300 5750 10150 5750
Wire Wire Line
	10150 5750 10150 5700
Wire Wire Line
	10150 5400 10150 5350
Wire Wire Line
	10050 5050 10150 5050
Wire Wire Line
	9550 5050 9650 5050
Connection ~ 10150 5050
$Comp
L power:GND #PWR077
U 1 1 5ADB92E7
P 10150 5750
F 0 "#PWR077" H 10150 5500 50  0001 C CNN
F 1 "GND" H 10150 5600 50  0000 C CNN
F 2 "" H 10150 5750 50  0001 C CNN
F 3 "" H 10150 5750 50  0001 C CNN
	1    10150 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR078
U 1 1 5ADB92ED
P 7150 5150
F 0 "#PWR078" H 7150 4900 50  0001 C CNN
F 1 "GND" H 7150 5000 50  0000 C CNN
F 2 "" H 7150 5150 50  0001 C CNN
F 3 "" H 7150 5150 50  0001 C CNN
	1    7150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5100 7150 5150
Wire Notes Line
	6850 3700 6850 6050
Wire Notes Line
	6850 6050 11000 6050
Wire Notes Line
	11000 6050 11000 3700
Wire Notes Line
	11000 3700 6850 3700
Text Notes 9500 4850 0    60   ~ 0
Cal to 1100mV@step 4095
Wire Wire Line
	3800 4250 4300 4250
Wire Wire Line
	3800 4250 3800 4500
Wire Wire Line
	700  6000 1050 6000
$Comp
L device:R R12
U 1 1 5ADB3013
P 3300 5450
F 0 "R12" V 3380 5450 50  0000 C CNN
F 1 "10K" V 3300 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3230 5450 50  0001 C CNN
F 3 "" H 3300 5450 50  0001 C CNN
	1    3300 5450
	0    -1   1    0   
$EndComp
Wire Wire Line
	3800 5450 3450 5450
Wire Wire Line
	1600 5450 2850 5450
$Comp
L Peters:AD5245 U6
U 1 1 5ADB64E9
P 4500 6550
F 0 "U6" H 4600 6300 60  0000 C CNN
F 1 "AD5245" H 4250 6250 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8_Handsoldering" H 4350 6800 60  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/AD5245.pdf" H 4350 6800 60  0001 C CNN
	1    4500 6550
	1    0    0    -1  
$EndComp
$Comp
L Peters:AD5245 U9
U 1 1 5ADB65D9
P 5150 2750
F 0 "U9" H 5250 2500 60  0000 C CNN
F 1 "AD5245" V 5100 2200 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-8_Handsoldering" H 5000 3000 60  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/AD5245.pdf" H 5000 3000 60  0001 C CNN
	1    5150 2750
	0    1    -1   0   
$EndComp
Wire Wire Line
	4000 7000 4000 5900
Wire Wire Line
	4000 5900 4500 5900
Wire Wire Line
	4750 6550 4800 6550
Wire Wire Line
	4800 6550 4800 6100
Wire Wire Line
	4750 6650 4900 6650
Wire Wire Line
	4900 6650 4900 6100
Wire Wire Line
	4750 6450 4750 6400
$Comp
L power:+5V #PWR081
U 1 1 5ADB81E1
P 4500 6300
F 0 "#PWR081" H 4500 6150 50  0001 C CNN
F 1 "+5V" H 4550 6450 50  0000 C CNN
F 2 "" H 4500 6300 50  0001 C CNN
F 3 "" H 4500 6300 50  0001 C CNN
	1    4500 6300
	-1   0    0    -1  
$EndComp
$Comp
L power:Earth #PWR082
U 1 1 5ADB85F9
P 4500 6850
F 0 "#PWR082" H 4500 6600 50  0001 C CNN
F 1 "Earth" H 4500 6700 50  0001 C CNN
F 2 "" H 4500 6850 50  0001 C CNN
F 3 "" H 4500 6850 50  0001 C CNN
	1    4500 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6850 4500 6800
$Comp
L power:Earth #PWR083
U 1 1 5ADB89B8
P 4200 6700
F 0 "#PWR083" H 4200 6450 50  0001 C CNN
F 1 "Earth" H 4200 6550 50  0001 C CNN
F 2 "" H 4200 6700 50  0001 C CNN
F 3 "" H 4200 6700 50  0001 C CNN
	1    4200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6650 4200 6700
Text GLabel 4200 6550 0    60   Input ~ 0
SDA
Text GLabel 4200 6450 0    60   Input ~ 0
SCL
Wire Wire Line
	4950 1100 4650 1100
Wire Wire Line
	4650 1100 4650 1900
$Comp
L power:+5V #PWR084
U 1 1 5ADBC4D9
P 5050 3050
F 0 "#PWR084" H 5050 2900 50  0001 C CNN
F 1 "+5V" H 5050 3190 50  0000 C CNN
F 2 "" H 5050 3050 50  0001 C CNN
F 3 "" H 5050 3050 50  0001 C CNN
	1    5050 3050
	-1   0    0    1   
$EndComp
Text GLabel 5150 3050 3    60   Input ~ 0
SDA
Text GLabel 5250 3050 3    60   Input ~ 0
SCL
Wire Wire Line
	5250 1600 5250 1500
Wire Wire Line
	5250 2200 5250 2250
$Comp
L power:+5V #PWR085
U 1 1 5ADC1C7B
P 5500 2700
F 0 "#PWR085" H 5500 2550 50  0001 C CNN
F 1 "+5V" H 5500 2840 50  0000 C CNN
F 2 "" H 5500 2700 50  0001 C CNN
F 3 "" H 5500 2700 50  0001 C CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
$Comp
L device:R R17
U 1 1 5ADC32DA
P 5450 5800
F 0 "R17" V 5530 5800 50  0000 C CNN
F 1 "100R" V 5450 5800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5380 5800 50  0001 C CNN
F 3 "" H 5450 5800 50  0001 C CNN
	1    5450 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 5800 5300 5800
$Comp
L power:-5V #PWR38
U 1 1 5ADCFA13
P 2100 5050
F 0 "#PWR38" H 2100 5150 50  0001 C CNN
F 1 "-5V" H 2100 5200 50  0000 C CNN
F 2 "" H 2100 5050 50  0001 C CNN
F 3 "" H 2100 5050 50  0001 C CNN
	1    2100 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 5050 2100 5050
$Comp
L power:-5V #PWR37
U 1 1 5ADD06BF
P 2000 6000
F 0 "#PWR37" H 2000 6100 50  0001 C CNN
F 1 "-5V" H 2000 6150 50  0000 C CNN
F 2 "" H 2000 6000 50  0001 C CNN
F 3 "" H 2000 6000 50  0001 C CNN
	1    2000 6000
	-1   0    0    1   
$EndComp
$Comp
L device:C C8
U 1 1 5ADD06C5
P 2000 5850
F 0 "C8" H 2025 5950 50  0000 L CNN
F 1 "0.1u" H 2025 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2038 5700 50  0001 C CNN
F 3 "" H 2000 5850 50  0001 C CNN
	1    2000 5850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR086
U 1 1 5ADD06CB
P 2000 5700
F 0 "#PWR086" H 2000 5450 50  0001 C CNN
F 1 "Earth" H 2000 5550 50  0001 C CNN
F 2 "" H 2000 5700 50  0001 C CNN
F 3 "" H 2000 5700 50  0001 C CNN
	1    2000 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5150 2500 5150 2200
Wire Wire Line
	5050 2500 5050 2200
Wire Wire Line
	5400 2750 5450 2750
Wire Wire Line
	5500 2750 5500 2700
Wire Wire Line
	5250 2500 5450 2500
Wire Wire Line
	5450 2500 5450 2750
Connection ~ 5450 2750
Wire Wire Line
	3350 4750 3500 4750
Wire Wire Line
	5750 5800 5950 5800
Wire Wire Line
	2750 1950 3050 1950
Wire Wire Line
	2400 1650 2600 1650
Wire Wire Line
	3050 1950 3150 1950
Wire Wire Line
	3050 650  3500 650 
Wire Wire Line
	8950 1800 9050 1800
Wire Wire Line
	9650 2450 9650 2600
Wire Wire Line
	2850 4750 2950 4750
Wire Wire Line
	1600 5250 1600 5450
Wire Wire Line
	4300 4250 4650 4250
Wire Wire Line
	1450 4650 2100 4650
Wire Wire Line
	3800 5450 3800 5600
Wire Wire Line
	2850 5450 3150 5450
Wire Wire Line
	5550 2000 5850 2000
Wire Wire Line
	5550 1800 5800 1800
Wire Wire Line
	4650 1900 4850 1900
Wire Wire Line
	5850 2000 5950 2000
Wire Wire Line
	5800 1800 5950 1800
Wire Wire Line
	8450 4950 8950 4950
Wire Wire Line
	9650 5050 9750 5050
Wire Wire Line
	10150 5050 10400 5050
Wire Wire Line
	5450 2750 5500 2750
Wire Wire Line
	4200 1950 4200 1900
Wire Wire Line
	3450 1950 4200 1950
$EndSCHEMATC
