EESchema Schematic File Version 4
LIBS:v0.4.4b-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
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
L IC_Automotive:VNLD5090 U7
U 1 1 5CE9F50F
P 2600 1900
F 0 "U7" H 2700 2467 50  0000 C CNN
F 1 "VNLD5090" H 2700 2376 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2800 1200 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/vnld5090-e.pdf" H 2600 1900 50  0001 C CNN
F 4 "STMicro" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 5 "VNLD5090-E" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 6 "https://www.digikey.com.au/products/en?keywords=VNLD5090-E" H 0   0   50  0001 C CNN "URL"
F 7 "497-18682-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
	1    2600 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R47
U 1 1 5CEA09A6
P 1900 1700
F 0 "R47" V 1693 1700 50  0000 C CNN
F 1 "1k" V 1784 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1830 1700 50  0001 C CNN
F 3 "~" H 1900 1700 50  0001 C CNN
F 4 "311-1.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-071KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-071KL/311-1.00KCRCT-ND/730391" H 0   0   50  0001 C CNN "URL"
	1    1900 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R48
U 1 1 5CEA1B76
P 1900 2000
F 0 "R48" V 1693 2000 50  0000 C CNN
F 1 "1k" V 1784 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1830 2000 50  0001 C CNN
F 3 "~" H 1900 2000 50  0001 C CNN
F 4 "311-1.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-071KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-071KL/311-1.00KCRCT-ND/730391" H 0   0   50  0001 C CNN "URL"
	1    1900 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R50
U 1 1 5CEA1FFF
P 1550 2300
F 0 "R50" H 1480 2254 50  0000 R CNN
F 1 "100k" H 1480 2345 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1480 2300 50  0001 C CNN
F 3 "~" H 1550 2300 50  0001 C CNN
F 4 "311-100KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-07100KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-07100KL/311-100KCRCT-ND/730491" H 0   0   50  0001 C CNN "URL"
	1    1550 2300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R49
U 1 1 5CEA268E
P 1550 1400
F 0 "R49" H 1480 1354 50  0000 R CNN
F 1 "100k" H 1480 1445 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1480 1400 50  0001 C CNN
F 3 "~" H 1550 1400 50  0001 C CNN
F 4 "311-100KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-07100KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-07100KL/311-100KCRCT-ND/730491" H 0   0   50  0001 C CNN "URL"
	1    1550 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR056
U 1 1 5CEA2F94
P 1550 1100
F 0 "#PWR056" H 1550 850 50  0001 C CNN
F 1 "GND" H 1555 927 50  0000 C CNN
F 2 "" H 1550 1100 50  0001 C CNN
F 3 "" H 1550 1100 50  0001 C CNN
	1    1550 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR057
U 1 1 5CEA389B
P 1550 2600
F 0 "#PWR057" H 1550 2350 50  0001 C CNN
F 1 "GND" H 1555 2427 50  0000 C CNN
F 2 "" H 1550 2600 50  0001 C CNN
F 3 "" H 1550 2600 50  0001 C CNN
	1    1550 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2450 1550 2600
Wire Wire Line
	1550 2150 1550 2000
Wire Wire Line
	1550 1550 1550 1700
Wire Wire Line
	1550 1250 1550 1100
Text GLabel 7150 1700 0    50   Input ~ 0
MCU-D5
Text GLabel 1400 1700 0    50   Input ~ 0
MCU-D7
Wire Wire Line
	1750 1700 1550 1700
$Comp
L power:GND #PWR058
U 1 1 5CEA469D
P 3300 1850
F 0 "#PWR058" H 3300 1600 50  0001 C CNN
F 1 "GND" V 3305 1722 50  0000 R CNN
F 2 "" H 3300 1850 50  0001 C CNN
F 3 "" H 3300 1850 50  0001 C CNN
	1    3300 1850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR059
U 1 1 5CEA5183
P 3300 2150
F 0 "#PWR059" H 3300 1900 50  0001 C CNN
F 1 "GND" V 3305 2022 50  0000 R CNN
F 2 "" H 3300 2150 50  0001 C CNN
F 3 "" H 3300 2150 50  0001 C CNN
	1    3300 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 2150 3200 2150
Wire Wire Line
	3200 1850 3300 1850
Text GLabel 9550 1700 2    50   Input ~ 0
IDLE-OUT
Text GLabel 4100 1700 2    50   Input ~ 0
BOOST-OUT
Wire Wire Line
	4100 1700 3850 1700
Wire Wire Line
	3200 2000 3850 2000
Text Notes 1850 800  0    78   ~ 0
PWM Idle and Boost outputs
$Comp
L IC_Automotive:VNLD5090 U9
U 1 1 5CEAD71A
P 8350 1900
F 0 "U9" H 8450 2467 50  0000 C CNN
F 1 "VNLD5090" H 8450 2376 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8550 1200 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/vnld5090-e.pdf" H 8350 1900 50  0001 C CNN
F 4 "STMicro" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 5 "VNLD5090-E" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 6 "https://www.digikey.com.au/products/en?keywords=VNLD5090-E" H 0   0   50  0001 C CNN "URL"
F 7 "497-18682-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
	1    8350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R56
U 1 1 5CEAD720
P 7650 1700
F 0 "R56" V 7443 1700 50  0000 C CNN
F 1 "1k" V 7534 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7580 1700 50  0001 C CNN
F 3 "~" H 7650 1700 50  0001 C CNN
F 4 "311-1.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-071KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-071KL/311-1.00KCRCT-ND/730391" H 0   0   50  0001 C CNN "URL"
	1    7650 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R57
U 1 1 5CEAD726
P 7650 2000
F 0 "R57" V 7443 2000 50  0000 C CNN
F 1 "1k" V 7534 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7580 2000 50  0001 C CNN
F 3 "~" H 7650 2000 50  0001 C CNN
F 4 "311-1.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-071KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-071KL/311-1.00KCRCT-ND/730391" H 0   0   50  0001 C CNN "URL"
	1    7650 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R61
U 1 1 5CEAD72C
P 7300 2300
F 0 "R61" H 7230 2254 50  0000 R CNN
F 1 "100k" H 7230 2345 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7230 2300 50  0001 C CNN
F 3 "~" H 7300 2300 50  0001 C CNN
F 4 "311-100KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-07100KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-07100KL/311-100KCRCT-ND/730491" H 0   0   50  0001 C CNN "URL"
	1    7300 2300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R60
U 1 1 5CEAD732
P 7300 1400
F 0 "R60" H 7230 1354 50  0000 R CNN
F 1 "100k" H 7230 1445 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7230 1400 50  0001 C CNN
F 3 "~" H 7300 1400 50  0001 C CNN
F 4 "311-100KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-07100KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-07100KL/311-100KCRCT-ND/730491" H 0   0   50  0001 C CNN "URL"
	1    7300 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR065
U 1 1 5CEAD738
P 7300 1100
F 0 "#PWR065" H 7300 850 50  0001 C CNN
F 1 "GND" H 7305 927 50  0000 C CNN
F 2 "" H 7300 1100 50  0001 C CNN
F 3 "" H 7300 1100 50  0001 C CNN
	1    7300 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR066
U 1 1 5CEAD73E
P 7300 2600
F 0 "#PWR066" H 7300 2350 50  0001 C CNN
F 1 "GND" H 7305 2427 50  0000 C CNN
F 2 "" H 7300 2600 50  0001 C CNN
F 3 "" H 7300 2600 50  0001 C CNN
	1    7300 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2450 7300 2600
Wire Wire Line
	7300 2150 7300 2000
Wire Wire Line
	7300 1550 7300 1700
Wire Wire Line
	7300 1250 7300 1100
Text GLabel 5100 3700 0    50   Input ~ 0
MCU-D47
Text GLabel 5100 4400 0    50   Input ~ 0
MCU-D45
Wire Wire Line
	7500 1700 7300 1700
$Comp
L power:GND #PWR069
U 1 1 5CEAD752
P 9000 1850
F 0 "#PWR069" H 9000 1600 50  0001 C CNN
F 1 "GND" V 9005 1722 50  0000 R CNN
F 2 "" H 9000 1850 50  0001 C CNN
F 3 "" H 9000 1850 50  0001 C CNN
	1    9000 1850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR070
U 1 1 5CEAD758
P 9000 2150
F 0 "#PWR070" H 9000 1900 50  0001 C CNN
F 1 "GND" V 9005 2022 50  0000 R CNN
F 2 "" H 9000 2150 50  0001 C CNN
F 3 "" H 9000 2150 50  0001 C CNN
	1    9000 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9000 2150 8950 2150
Wire Wire Line
	8950 1850 9000 1850
Text GLabel 5850 3500 2    50   Input ~ 0
FAN-OUT
Text GLabel 5850 4200 2    50   Input ~ 0
FUELPUMP-OUT
Text Notes 4750 3300 0    78   ~ 0
Fan and Fuel Pump outputs
$Comp
L Device:D D18
U 1 1 5CEC935F
P 3850 2300
F 0 "D18" V 3896 2221 50  0000 R CNN
F 1 "D" V 3805 2221 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323" H 3850 2300 50  0001 C CNN
F 3 "~" H 3850 2300 50  0001 C CNN
F 4 "1N4448WXTPMSCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "MCC" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "1N4448WX-TP" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/micro-commercial-co/1N4448WX-TP/1N4448WXTPMSCT-ND/789338" H 0   0   50  0001 C CNN "URL"
	1    3850 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D17
U 1 1 5CEC9E8B
P 3850 1400
F 0 "D17" V 3804 1479 50  0000 L CNN
F 1 "D" V 3895 1479 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" H 3850 1400 50  0001 C CNN
F 3 "~" H 3850 1400 50  0001 C CNN
F 4 "1N4448WXTPMSCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "MCC" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "1N4448WX-TP" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/micro-commercial-co/1N4448WX-TP/1N4448WXTPMSCT-ND/789338" H 0   0   50  0001 C CNN "URL"
	1    3850 1400
	0    1    1    0   
$EndComp
Text GLabel 3700 2500 0    50   Input ~ 0
12V-SW
Text GLabel 3700 1200 0    50   Input ~ 0
12V-SW
Wire Wire Line
	3700 1200 3850 1200
Wire Wire Line
	3850 1200 3850 1250
Wire Wire Line
	3850 1550 3850 1700
Connection ~ 3850 1700
Wire Wire Line
	3850 1700 3200 1700
Wire Wire Line
	3850 2000 3850 2150
Connection ~ 3850 2000
Wire Wire Line
	3850 2000 4100 2000
Wire Wire Line
	3850 2450 3850 2500
Wire Wire Line
	3850 2500 3700 2500
$Comp
L Device:R R51
U 1 1 5CED3A18
P 2300 4000
F 0 "R51" H 2230 3954 50  0000 R CNN
F 1 "10k" H 2230 4045 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2230 4000 50  0001 C CNN
F 3 "~" H 2300 4000 50  0001 C CNN
F 4 "311-10KARCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805JR-0710KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805JR-0710KL/311-10KARCT-ND/731188" H 0   0   50  0001 C CNN "URL"
	1    2300 4000
	0    1    1    0   
$EndComp
Text GLabel 2200 4200 0    50   Input ~ 0
MCU-D49
Text Notes 2300 3400 0    78   ~ 0
Tacho output
Text GLabel 2000 3800 1    50   Input ~ 0
12V-SW
Wire Wire Line
	2000 3800 2000 4000
Wire Wire Line
	2000 4000 2150 4000
Wire Wire Line
	2450 4000 2650 4000
Text GLabel 3000 4000 2    50   Input ~ 0
TACHO-OUT
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5CEF6605
P 2300 6200
F 0 "J2" H 2600 6100 50  0000 C CNN
F 1 "Conn_01x06" H 2600 6200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2300 6200 50  0001 C CNN
F 3 "~" H 2300 6200 50  0001 C CNN
	1    2300 6200
	-1   0    0    1   
$EndComp
Text GLabel 3100 6400 2    50   Input ~ 0
MCU-D3
$Comp
L power:VDD #PWR061
U 1 1 5CEF9759
P 2650 6300
F 0 "#PWR061" H 2650 6150 50  0001 C CNN
F 1 "VDD" V 2667 6428 50  0000 L CNN
F 2 "" H 2650 6300 50  0001 C CNN
F 3 "" H 2650 6300 50  0001 C CNN
	1    2650 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 6300 2500 6300
$Comp
L power:GND #PWR062
U 1 1 5CEFA4B7
P 2700 6200
F 0 "#PWR062" H 2700 5950 50  0001 C CNN
F 1 "GND" V 2705 6072 50  0000 R CNN
F 2 "" H 2700 6200 50  0001 C CNN
F 3 "" H 2700 6200 50  0001 C CNN
	1    2700 6200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 6200 2500 6200
Text GLabel 3100 6100 2    50   Input ~ 0
MCU-D0
Wire Wire Line
	3100 6100 2500 6100
Wire Wire Line
	2500 6400 3100 6400
Text GLabel 3100 6000 2    50   Input ~ 0
MCU-D1
$Comp
L Device:R R53
U 1 1 5CEFD7D7
P 2900 6000
F 0 "R53" V 2693 6000 50  0000 C CNN
F 1 "1k" V 2784 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 6000 50  0001 C CNN
F 3 "~" H 2900 6000 50  0001 C CNN
F 4 "311-1.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-071KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-071KL/311-1.00KCRCT-ND/730391" H 0   0   50  0001 C CNN "URL"
	1    2900 6000
	0    1    1    0   
$EndComp
$Comp
L Device:R R52
U 1 1 5CEFDFA8
P 2650 5750
F 0 "R52" H 2580 5704 50  0000 R CNN
F 1 "2k" H 2580 5795 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2580 5750 50  0001 C CNN
F 3 "~" H 2650 5750 50  0001 C CNN
F 4 "311-2.00KCRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-072KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-072KL/311-2.00KCRCT-ND/730611" H 0   0   50  0001 C CNN "URL"
	1    2650 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 6000 2650 6000
Wire Wire Line
	3050 6000 3100 6000
Wire Wire Line
	2650 5900 2650 6000
Connection ~ 2650 6000
Wire Wire Line
	2650 6000 2750 6000
$Comp
L power:GND #PWR060
U 1 1 5CF01332
P 2650 5500
F 0 "#PWR060" H 2650 5250 50  0001 C CNN
F 1 "GND" H 2655 5327 50  0000 C CNN
F 2 "" H 2650 5500 50  0001 C CNN
F 3 "" H 2650 5500 50  0001 C CNN
	1    2650 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 5500 2650 5600
Text Notes 1950 5200 0    78   ~ 0
HC-05 Bluetooth Connector
$Comp
L Device:D D19
U 1 1 5CE88F47
P 9350 1500
F 0 "D19" V 9304 1579 50  0000 L CNN
F 1 "D" V 9395 1579 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" H 9350 1500 50  0001 C CNN
F 3 "~" H 9350 1500 50  0001 C CNN
F 4 "1N4448WXTPMSCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "MCC" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "1N4448WX-TP" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/micro-commercial-co/1N4448WX-TP/1N4448WXTPMSCT-ND/789338" H 0   0   50  0001 C CNN "URL"
	1    9350 1500
	0    1    1    0   
$EndComp
Text GLabel 9550 1250 2    50   Input ~ 0
12V-SW
Wire Wire Line
	8950 1700 9350 1700
Wire Wire Line
	9350 1650 9350 1700
Connection ~ 9350 1700
Wire Wire Line
	9350 1700 9550 1700
Wire Wire Line
	9350 1250 9550 1250
Wire Wire Line
	9350 1250 9350 1350
$Comp
L Driver_Motor:Pololu_Breakout_DRV8825 A1
U 1 1 5CFE4B9E
P 8500 4450
F 0 "A1" H 8500 5231 50  0000 C CNN
F 1 "Pololu_Breakout_DRV8825" H 8500 5140 50  0000 C CNN
F 2 "Module:Pololu_Breakout-16_15.2x20.3mm" H 8700 3650 50  0001 L CNN
F 3 "https://www.pololu.com/product/2982" H 8600 4150 50  0001 C CNN
	1    8500 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5CFE6778
P 8800 5350
F 0 "#PWR0110" H 8800 5100 50  0001 C CNN
F 1 "GND" H 8805 5177 50  0000 C CNN
F 2 "" H 8800 5350 50  0001 C CNN
F 3 "" H 8800 5350 50  0001 C CNN
	1    8800 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8800 5350 8600 5350
Wire Wire Line
	8500 5350 8500 5250
Wire Wire Line
	8600 5250 8600 5350
Connection ~ 8600 5350
Wire Wire Line
	8600 5350 8500 5350
Text GLabel 9000 4350 2    50   Input ~ 0
STEP-A1
Text GLabel 9000 4450 2    50   Input ~ 0
STEP-A2
Text GLabel 9000 4650 2    50   Input ~ 0
STEP-B1
Text GLabel 9000 4750 2    50   Input ~ 0
STEP-B2
Text GLabel 9000 3850 2    50   Input ~ 0
12V-SW
Wire Wire Line
	8500 3850 9000 3850
Wire Wire Line
	8900 4350 9000 4350
Wire Wire Line
	9000 4450 8900 4450
Wire Wire Line
	8900 4650 9000 4650
Wire Wire Line
	9000 4750 8900 4750
Text GLabel 8000 4450 0    50   Input ~ 0
MCU-D24
Text GLabel 8000 4550 0    50   Input ~ 0
MCU-D17
Text GLabel 8000 4650 0    50   Input ~ 0
MCU-D16
$Comp
L power:VDD #PWR0111
U 1 1 5CFF33B9
P 8000 4250
F 0 "#PWR0111" H 8000 4100 50  0001 C CNN
F 1 "VDD" V 8017 4378 50  0000 L CNN
F 2 "" H 8000 4250 50  0001 C CNN
F 3 "" H 8000 4250 50  0001 C CNN
	1    8000 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 4250 8100 4250
Wire Wire Line
	8100 4250 8100 4150
Connection ~ 8100 4250
Wire Wire Line
	8000 4450 8100 4450
Wire Wire Line
	8100 4550 8000 4550
Wire Wire Line
	8000 4650 8100 4650
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5D199620
P 2550 4200
F 0 "Q1" H 2756 4246 50  0000 L CNN
F 1 "SSM3K357R" H 2756 4155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2750 4125 50  0001 L CIN
F 3 "https://www.mouser.com/datasheet/2/408/SSM3K357R_datasheet_en_20180124-1316146.pdf" H 2550 4200 50  0001 L CNN
F 4 "SSM3K357RLFCT-ND " H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Toshiba" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "SSM3K357R" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/toshiba-semiconductor-and-storage/SSM3K357RLF/SSM3K357RLFCT-ND/8611183" H 0   0   50  0001 C CNN "URL"
	1    2550 4200
	1    0    0    -1  
$EndComp
Text GLabel 1400 2000 0    50   Input ~ 0
MCU-D6
Text GLabel 4100 2000 2    50   Input ~ 0
HC-1-OUT
Text GLabel 9550 2000 2    50   Input ~ 0
HC-2-OUT
Text GLabel 7150 2000 0    50   Input ~ 0
MCU-D4
$Comp
L Device:D D16
U 1 1 5D1AF048
P 9350 2350
F 0 "D16" V 9304 2429 50  0000 L CNN
F 1 "D" V 9395 2429 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" H 9350 2350 50  0001 C CNN
F 3 "~" H 9350 2350 50  0001 C CNN
F 4 "1N4448WXTPMSCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "MCC" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "1N4448WX-TP" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/micro-commercial-co/1N4448WX-TP/1N4448WXTPMSCT-ND/789338" H 0   0   50  0001 C CNN "URL"
	1    9350 2350
	0    1    -1   0   
$EndComp
Text GLabel 9550 2600 2    50   Input ~ 0
12V-SW
Wire Wire Line
	9350 2600 9550 2600
Wire Wire Line
	9350 2600 9350 2500
Wire Wire Line
	8950 2000 9350 2000
Wire Wire Line
	9350 2000 9350 2200
Wire Wire Line
	9350 2000 9550 2000
Connection ~ 9350 2000
Text Notes 7650 800  0    78   ~ 0
Spare High Current outputs
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 5D1BC444
P 5450 4400
F 0 "Q3" H 5656 4446 50  0000 L CNN
F 1 "SSM3K357R" H 5656 4355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5650 4325 50  0001 L CIN
F 3 "https://www.mouser.com/datasheet/2/408/SSM3K357R_datasheet_en_20180124-1316146.pdf" H 5450 4400 50  0001 L CNN
F 4 "SSM3K357RLFCT-ND " H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Toshiba" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "SSM3K357R" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/toshiba-semiconductor-and-storage/SSM3K357RLF/SSM3K357RLFCT-ND/8611183" H 0   0   50  0001 C CNN "URL"
	1    5450 4400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5D1C298D
P 5450 3700
F 0 "Q2" H 5656 3746 50  0000 L CNN
F 1 "SSM3K357R" H 5656 3655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5650 3625 50  0001 L CIN
F 3 "https://www.mouser.com/datasheet/2/408/SSM3K357R_datasheet_en_20180124-1316146.pdf" H 5450 3700 50  0001 L CNN
F 4 "SSM3K357RLFCT-ND " H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Toshiba" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "SSM3K357R" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/toshiba-semiconductor-and-storage/SSM3K357RLF/SSM3K357RLFCT-ND/8611183" H 0   0   50  0001 C CNN "URL"
	1    5450 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5D1D2323
P 5500 4050
F 0 "#PWR0113" H 5500 3800 50  0001 C CNN
F 1 "GND" H 5505 3877 50  0000 C CNN
F 2 "" H 5500 4050 50  0001 C CNN
F 3 "" H 5500 4050 50  0001 C CNN
	1    5500 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 3900 5550 4050
Wire Wire Line
	5550 4050 5500 4050
Wire Wire Line
	5550 4600 5550 4750
Wire Wire Line
	5100 3700 5250 3700
Wire Wire Line
	5550 3500 5850 3500
Wire Wire Line
	5550 4200 5850 4200
Wire Wire Line
	2200 4200 2350 4200
$Comp
L power:GND #PWR0114
U 1 1 5D1E74B1
P 2600 4550
F 0 "#PWR0114" H 2600 4300 50  0001 C CNN
F 1 "GND" H 2605 4377 50  0000 C CNN
F 2 "" H 2600 4550 50  0001 C CNN
F 3 "" H 2600 4550 50  0001 C CNN
	1    2600 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 4400 2650 4550
Wire Wire Line
	2650 4550 2600 4550
Wire Wire Line
	2650 4000 3000 4000
Connection ~ 2650 4000
Text Notes 8150 3500 0    78   ~ 0
Stepper Idle
Wire Wire Line
	2050 2000 2200 2000
Wire Wire Line
	2050 1700 2200 1700
Wire Wire Line
	7800 1700 7950 1700
Wire Wire Line
	7800 2000 7950 2000
Connection ~ 7300 1700
Wire Wire Line
	7150 1700 7300 1700
Connection ~ 7300 2000
Wire Wire Line
	7300 2000 7500 2000
Wire Wire Line
	7150 2000 7300 2000
Connection ~ 1550 2000
Wire Wire Line
	1550 2000 1750 2000
Wire Wire Line
	1400 2000 1550 2000
Connection ~ 1550 1700
Wire Wire Line
	1400 1700 1550 1700
Wire Wire Line
	5100 4400 5250 4400
Wire Wire Line
	5550 4750 5500 4750
$Comp
L power:GND #PWR0112
U 1 1 5D1D0B9D
P 5500 4750
F 0 "#PWR0112" H 5500 4500 50  0001 C CNN
F 1 "GND" H 5505 4577 50  0000 C CNN
F 2 "" H 5500 4750 50  0001 C CNN
F 3 "" H 5500 4750 50  0001 C CNN
	1    5500 4750
	0    1    1    0   
$EndComp
$EndSCHEMATC
