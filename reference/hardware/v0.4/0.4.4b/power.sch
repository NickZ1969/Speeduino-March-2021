EESchema Schematic File Version 4
LIBS:v0.4.4b-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
L Device:Varistor RV1
U 1 1 5CD230CD
P 4500 2850
F 0 "RV1" H 4603 2896 50  0000 L CNN
F 1 "Varistor" H 4603 2805 50  0000 L CNN
F 2 "Varistor:RV_Disc_D15.5mm_W4.7mm_P7.5mm" V 4430 2850 50  0001 C CNN
F 3 "~" H 4500 2850 50  0001 C CNN
F 4 "MOV-14D220K-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Bournes Inc" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "MOV-14D220K" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/bourns-inc/MOV-14D220K/MOV-14D220K-ND/2799109" H 0   0   50  0001 C CNN "URL"
	1    4500 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5CD23BD5
P 5500 2850
F 0 "C18" H 5615 2941 50  0000 L CNN
F 1 "0.1uF" H 5615 2850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5538 2700 50  0001 C CNN
F 3 "~" H 5500 2850 50  0001 C CNN
F 4 "50v" H 5615 2759 50  0000 L CNN "Voltage"
F 5 "311-1140-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 6 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 7 "CC0805KRX7R9BB104" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 8 "https://www.digikey.com.au/product-detail/en/yageo/CC0805KRX7R9BB104/311-1140-1-ND/303050" H 0   0   50  0001 C CNN "URL"
	1    5500 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C17
U 1 1 5CD2461D
P 5050 2850
F 0 "C17" H 5165 2896 50  0000 L CNN
F 1 "10uF" H 5165 2805 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-31_Kemet-D" H 5050 2850 50  0001 C CNN
F 3 "~" H 5050 2850 50  0001 C CNN
F 4 "35v" H 5050 2850 50  0001 C CNN "Voltage"
F 5 "399-8361-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 6 "Kemet" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 7 "T491D106K050AT" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 8 "https://www.digikey.com/product-detail/en/kemet/T491D106K050AT/399-8361-1-ND/3472084" H 0   0   50  0001 C CNN "URL"
	1    5050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2700 5050 2700
Wire Wire Line
	5050 2700 5500 2700
Connection ~ 5050 2700
$Comp
L Device:D_Schottky D14
U 1 1 5CD266C1
P 5700 2450
F 0 "D14" H 5700 2234 50  0000 C CNN
F 1 "B130-13-F" H 5700 2325 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 5700 2450 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/115/ds13002-60388.pdf" H 5700 2450 50  0001 C CNN
F 4 "B130-FDICT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Diodes Inc" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "B130-13-F" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/diodes-incorporated/B130-13-F/B130-FDICT-ND/815318" H 0   0   50  0001 C CNN "URL"
	1    5700 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 2700 5500 2450
Wire Wire Line
	5500 2450 5550 2450
Connection ~ 5500 2700
Text GLabel 6100 2050 2    50   Input ~ 0
VRegIn
Wire Wire Line
	6050 2450 5950 2450
$Comp
L Device:C C20
U 1 1 5CD284E9
P 6900 2850
F 0 "C20" H 6700 2900 50  0000 L CNN
F 1 "0.1uF" H 6600 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6938 2700 50  0001 C CNN
F 3 "~" H 6900 2850 50  0001 C CNN
F 4 "311-1140-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "CC0805KRX7R9BB104" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/yageo/CC0805KRX7R9BB104/311-1140-1-ND/303050" H 0   0   50  0001 C CNN "URL"
	1    6900 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C21
U 1 1 5CD2925E
P 7250 2850
F 0 "C21" H 7365 2941 50  0000 L CNN
F 1 "47uF" H 7365 2850 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B" H 7250 2850 50  0001 C CNN
F 3 "~" H 7250 2850 50  0001 C CNN
F 4 "10v" H 7365 2759 50  0000 L CNN "Voltage"
F 5 "478-1692-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 6 "AVX" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 7 "TAJB476K006RNJ" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 8 "https://www.digikey.com/product-detail/en/avx-corporation/TAJB476K006RNJ/478-1692-1-ND/564724" H 0   0   50  0001 C CNN "URL"
	1    7250 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D15
U 1 1 5CD29D83
P 7600 2850
AR Path="/5CD18EC3/5CD29D83" Ref="D15"  Part="1" 
AR Path="/5CD29D83" Ref="D15"  Part="1" 
F 0 "D15" V 7554 2929 50  0000 L CNN
F 1 "1SMB5919BT3G" V 7645 2929 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 7600 2850 50  0001 C CNN
F 3 "~" H 7600 2850 50  0001 C CNN
F 4 "1SMB5919BT3GOSCT-ND " H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "On Semi" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "1SMB5919BT3G" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/on-semiconductor/1SMB5919BT3G/1SMB5919BT3GOSCT-ND/917722" H 0   0   50  0001 C CNN "URL"
	1    7600 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 2700 7250 2700
Wire Wire Line
	7600 2700 7250 2700
Connection ~ 7250 2700
Wire Wire Line
	6650 2450 6950 2450
Wire Wire Line
	7250 2450 7250 2700
$Comp
L power:GND #PWR046
U 1 1 5CD2AE08
P 6350 3100
F 0 "#PWR046" H 6350 2850 50  0001 C CNN
F 1 "GND" H 6355 2927 50  0000 C CNN
F 2 "" H 6350 3100 50  0001 C CNN
F 3 "" H 6350 3100 50  0001 C CNN
	1    6350 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3000 4500 3100
Wire Wire Line
	4500 3100 5050 3100
Wire Wire Line
	5050 3000 5050 3100
Connection ~ 5050 3100
Wire Wire Line
	5050 3100 5500 3100
Wire Wire Line
	5500 3000 5500 3100
Connection ~ 5500 3100
Wire Wire Line
	5500 3100 6350 3100
Wire Wire Line
	7600 3000 7600 3100
Wire Wire Line
	7600 3100 7250 3100
Connection ~ 6350 3100
Wire Wire Line
	7250 3000 7250 3100
Connection ~ 7250 3100
Wire Wire Line
	7250 3100 6900 3100
Wire Wire Line
	6900 3000 6900 3100
Connection ~ 6900 3100
Wire Wire Line
	6900 3100 6350 3100
Text Notes 5700 1900 0    89   ~ 0
Power Regulator
Text GLabel 4850 2450 0    50   Input ~ 0
12V-SW
Wire Wire Line
	4850 2450 5050 2450
Wire Wire Line
	5050 2450 5050 2700
Text Notes 5650 4050 0    89   ~ 0
Reset Protection
Text Notes 5500 4200 0    58   ~ 0
Refer AVR040 Application Note
$Comp
L Device:C C19
U 1 1 5CF0AAD4
P 5700 4950
F 0 "C19" V 5550 4750 50  0000 L CNN
F 1 "22uF" V 5650 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 4800 50  0001 C CNN
F 3 "~" H 5700 4950 50  0001 C CNN
F 4 "1276-6687-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Samsung" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "CL21A226KQCLRNC" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/samsung-electro-mechanics/CL21A226KQCLRNC/1276-6687-1-ND/5961546" H 0   0   50  0001 C CNN "URL"
	1    5700 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R46
U 1 1 5CF13C09
P 5950 4700
F 0 "R46" H 6000 4750 50  0000 L CNN
F 1 "120R" H 6000 4650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5880 4700 50  0001 C CNN
F 3 "~" H 5950 4700 50  0001 C CNN
F 4 "311-120CRCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805FR-07120RL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805FR-07120RL/311-120CRCT-ND/730522" H 0   0   50  0001 C CNN "URL"
	1    5950 4700
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR045
U 1 1 5CF1825D
P 6150 4550
F 0 "#PWR045" H 6150 4400 50  0001 C CNN
F 1 "VDD" H 6167 4723 50  0000 C CNN
F 2 "" H 6150 4550 50  0001 C CNN
F 3 "" H 6150 4550 50  0001 C CNN
	1    6150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5CF1EB2F
P 5450 4950
F 0 "#PWR043" H 5450 4700 50  0001 C CNN
F 1 "GND" V 5455 4822 50  0000 R CNN
F 2 "" H 5450 4950 50  0001 C CNN
F 3 "" H 5450 4950 50  0001 C CNN
	1    5450 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	5450 4950 5550 4950
Wire Wire Line
	5950 5050 5950 4950
Wire Wire Line
	5850 4950 5950 4950
Connection ~ 5950 4950
Wire Wire Line
	5950 4950 5950 4850
Wire Wire Line
	5950 4550 6150 4550
$Comp
L Misc:AYZ0202AGRLC S1
U 1 1 5CDDD447
P 6000 5050
F 0 "S1" H 6550 5315 50  0000 C CNN
F 1 "AYZ0202AGRLC" H 6550 5224 50  0000 C CNN
F 2 "Misc:AYZ0202AGRLC" H 6950 5150 50  0001 L CNN
F 3 "" H 6950 5050 50  0001 L CNN
F 4 "AYZ0202AGRLC (Slide Switches)" H 6950 4950 50  0001 L CNN "Description"
F 5 "7931504P" H 6950 4750 50  0001 L CNN "RS Part Number"
F 6 "http://uk.rs-online.com/web/p/products/7931504P" H 6950 4650 50  0001 L CNN "RS Price/Stock"
F 7 "C & K COMPONENTS" H 6950 4550 50  0001 L CNN "Manufacturer_Name"
F 8 "AYZ0202AGRLC" H 6950 4450 50  0001 L CNN "Manufacturer_Part_Number"
F 9 "70417470" H 6950 4350 50  0001 L CNN "Allied_Number"
F 10 "401-2013-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 11 "https://www.digikey.com.au/product-detail/en/c-k/AYZ0202AGRLC/401-2013-1-ND/1640122" H 0   0   50  0001 C CNN "URL"
	1    6000 5050
	1    0    0    -1  
$EndComp
Text GLabel 5900 5150 0    50   Input ~ 0
RESET
Wire Wire Line
	5900 5150 6000 5150
Wire Wire Line
	5950 5050 6000 5050
$Comp
L Device:R R45
U 1 1 5CE55978
P 5750 5250
F 0 "R45" H 5800 5300 50  0000 L CNN
F 1 "10k" H 5800 5200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5680 5250 50  0001 C CNN
F 3 "~" H 5750 5250 50  0001 C CNN
F 4 "311-10KARCT-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Yageo" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "RC0805JR-0710KL" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com/product-detail/en/yageo/RC0805JR-0710KL/311-10KARCT-ND/731188" H 0   0   50  0001 C CNN "URL"
	1    5750 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 5250 6000 5250
$Comp
L power:VDD #PWR044
U 1 1 5CE5E61D
P 5500 5250
F 0 "#PWR044" H 5500 5100 50  0001 C CNN
F 1 "VDD" H 5517 5423 50  0000 C CNN
F 2 "" H 5500 5250 50  0001 C CNN
F 3 "" H 5500 5250 50  0001 C CNN
	1    5500 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 5250 5600 5250
$Comp
L Regulator_Linear:LM2937xS U8
U 1 1 5CFC6620
P 6350 2450
F 0 "U8" H 6350 2692 50  0000 C CNN
F 1 "LM2940S-5.0/NOPB" H 6350 2601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 6350 2675 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2940-n.pdf" H 6350 2400 50  0001 C CNN
F 4 "LM2940SX-5.0/NOPB" H 6350 2450 50  0001 C CNN "TR PN"
F 5 "LM2940S-5.0/NOPB" H 6350 2450 50  0001 C CNN "Tube PN"
F 6 "LM2940S-5.0/NOPB-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 7 "TI" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 8 "LM2940S-5.0/NOPB" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 9 "https://www.digikey.com.au/products/en?keywords=LM2940S-5.0%2FNOPB" H 0   0   50  0001 C CNN "URL"
	1    6350 2450
	1    0    0    -1  
$EndComp
Connection ~ 6950 2450
Wire Wire Line
	6950 2450 7100 2450
Wire Wire Line
	6350 2750 6350 3100
Wire Wire Line
	5950 2050 5950 2450
Connection ~ 5950 2450
Wire Wire Line
	5950 2450 5850 2450
Wire Wire Line
	6100 2050 5950 2050
$Comp
L power:VDDA #PWR0108
U 1 1 5CFDB7BC
P 7100 2150
F 0 "#PWR0108" H 7100 2000 50  0001 C CNN
F 1 "VDDA" V 7100 2300 50  0000 L CNN
F 2 "" H 7100 2150 50  0001 C CNN
F 3 "" H 7100 2150 50  0001 C CNN
	1    7100 2150
	1    0    0    -1  
$EndComp
Connection ~ 7100 2450
Wire Wire Line
	7100 2450 7250 2450
$Comp
L power:VDD #PWR047
U 1 1 5CD27956
P 6950 2450
F 0 "#PWR047" H 6950 2300 50  0001 C CNN
F 1 "VDD" V 6950 2600 50  0000 L CNN
F 2 "" H 6950 2450 50  0001 C CNN
F 3 "" H 6950 2450 50  0001 C CNN
	1    6950 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:Polyfuse F1
U 1 1 5D777946
P 7100 2300
F 0 "F1" H 7188 2346 50  0000 L CNN
F 1 "Polyfuse" H 7188 2255 50  0000 L CNN
F 2 "Fuse:Fuse_1812_4532Metric" H 7150 2100 50  0001 L CNN
F 3 "~" H 7100 2300 50  0001 C CNN
F 4 "507-1361-1-ND" H 0   0   50  0001 C CNN "Digikey Part Number"
F 5 "Bel Fuse" H 0   0   50  0001 C CNN "Manufacturer_Name"
F 6 "0ZCC0050FF2C" H 0   0   50  0001 C CNN "Manufacturer_Part_Number"
F 7 "https://www.digikey.com.au/product-detail/en/bel-fuse-inc/0ZCC0050FF2C/507-1361-1-ND/1560228" H 0   0   50  0001 C CNN "URL"
	1    7100 2300
	1    0    0    -1  
$EndComp
NoConn ~ 8400 2200
$EndSCHEMATC
