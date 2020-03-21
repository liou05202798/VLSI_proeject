
************************************************************************
* auCdl Netlist:
* 
* Library Name:  final_project
* Top Cell Name: freq_div
* View Name:     schematic
* Netlisted on:  Dec 22 01:44:26 2019
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM



************************************************************************
* Library Name: final_project
* Cell Name:    inverter
* View Name:    schematic
************************************************************************


.SUBCKT inverter VDD VSS Vin Vout
*.PININFO VDD:I VSS:I Vin:I Vout:O
MN_inv Vout Vin VSS VSS N_18 W=0.5u L=180.00n m=1
MP_inv Vout Vin VDD VDD P_18 W=0.5u L=180.00n m=1
.ENDS
************************************************************************
* Library Name: final_project
* Cell Name:    inverter for TG
* View Name:    schematic
************************************************************************
.SUBCKT inverter2 VDD VSS Vin Vout
*.PININFO VDD:I VSS:I Vin:I Vout:O
MN_inv Vout Vin VSS VSS N_18 W=2u L=180.00n m=1
MP_inv Vout Vin VDD VDD P_18 W=4u L=180.00n m=1
.ENDS

.SUBCKT inverter4 VDD VSS Vin Vout
*.PININFO VDD:I VSS:I Vin:I Vout:O
MN_inv Vout Vin VSS VSS N_18 W=2u L=180.00n m=1
MP_inv Vout Vin VDD VDD P_18 W=4u L=180.00n m=1
.ENDS

.SUBCKT inverter5 VDD VSS Vin Vout
*.PININFO VDD:I VSS:I Vin:I Vout:O
MN_inv Vout Vin VSS VSS N_18 W=4u L=180.00n m=1
MP_inv Vout Vin VDD VDD P_18 W=12u L=180.00n m=1
.ENDS


************************************************************************
* Library Name: final_project
* Cell Name:    inverter for  driving capability
* View Name:    schematic
************************************************************************
.SUBCKT inverter3 VDD VSS Vin Vout
*.PININFO VDD:I VSS:I Vin:I Vout:O
MN_inv Vout Vin VSS VSS N_18 W=2u L=180.00n m=1
MP_inv Vout Vin VDD VDD P_18 W=6u L=180.00n m=1
.ENDS
************************************************************************
* Library Name: final_project
* Cell Name:    Nnor2
* View Name:    schematic
************************************************************************

************************************************************************
* Library Name: final_project
* Cell Name:    NAND2
* View Name:    schematic
************************************************************************

.SUBCKT NAND2 OUT_nand2 VDD VSS a b
*.PININFO VDD:I VSS:I a:I b:I OUT_nand2:O
MM1 net6 b VSS VSS N_18 W=2u L=180.00n m=1
MN_nand2 OUT_nand2 a net6 VSS N_18 W=2u L=180.00n m=1
MM0 OUT_nand2 b VDD VDD P_18 W=2u L=180.00n m=1
MP_nand2 OUT_nand2 a VDD VDD P_18 W=2u L=180.00n m=1
.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    NAND3
* View Name:    schematic
************************************************************************


.SUBCKT nand3 A B C VDD VSS VOUT
*.PININFO A:I B:I C:I VDD:I VSS:I clk_7:O
MM3 net7 C VSS VSS N_18 W=0.5u L=180.00n m=1
MM2 net11 B net7 VSS N_18 W=0.5u L=180.00n m=1
MN_nand3 VOUT A net11 VSS N_18 W=0.5u L=180.00n m=1
MM5 VOUT C VDD VDD P_18  W=0.5u L=180.00n m=1
MM0 VOUT B VDD VDD P_18  W=0.5u L=180.00n m=1
MM4 VOUT A VDD VDD P_18  W=0.5u L=180.00n m=1
.ENDS


************************************************************************
* Library Name: final_project
* Cell Name:    D_flipflop
* View Name:    schematic
************************************************************************

.SUBCKT D_flipflop D Q Q_bar VDD VSS clk 


*.PININFO D:I VDD:I VSS:I clk:I Q:O Q_bar:O
MM10 net7 net27 VSS VSS N_18 W=1u L=180.00n m=1
MM9 net11 clk VSS VSS N_18  W=1u L=180.00n m=1
MM8 net15 D VSS VSS N_18  W=1u L=180.00n m=1
MM7 Q Q_bar VSS VSS N_18  W=1u L=180.00n m=1
MM6 Q_bar clk net7 VSS N_18  W=1u L=180.00n m=1
MM5 net27 net15 net11 VSS N_18  W=1u L=180.00n m=1
MM4 net15 clk net34 VDD P_18 W=2u L=180.00n m=1
MM3 Q Q_bar VDD VDD P_18 W=2u L=180.00n m=1
MM2 Q_bar net27 VDD VDD P_18  W=2u L=180.00n m=1
MM1 net27 clk VDD VDD P_18  W=2u L=180.00n m=1
MM0 net34 D VDD VDD P_18  W=2u L=180.00n m=1

.ENDS




************************************************************************
* Library Name: final_project
* Cell Name:    clk7
* View Name:    schematic
************************************************************************

.SUBCKT clk7 VDD VSS clk clk7 
*.PININFO VDD:I VSS:I clk:I clk7:O
XI4 net7 VDD VSS net6 clk7 / NAND2
XI3 net6 clk7 net12 VDD VSS clk  / D_flipflop
XI2 net25 net6 net18 VDD VSS clk  / D_flipflop
XI1 net31 net25 net24 VDD VSS clk  / D_flipflop
XI0 net7 net31 net30 VDD VSS clk  / D_flipflop
.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    clk5
* View Name:    schematic
************************************************************************

.SUBCKT clk5 VDD VSS clk clk5 
*.PININFO VDD:I VSS:I clk:I clk5:O
XI3 net7 VDD VSS net6 clk5 / NAND2
XI2 net6 clk5 net12 VDD VSS clk  / D_flipflop
XI1 net25 net6 net18 VDD VSS clk  / D_flipflop
XI0 net7 net25 net24 VDD VSS clk  / D_flipflop
.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    clk3_clk6
* View Name:    schematic
************************************************************************

.SUBCKT clk3_clk6 VDD VSS clk clk3 clk6 
*.PININFO VDD:I VSS:I clk:I clk3:O clk6:O
Xr net8 VDD VSS net7 clk3 / NAND2
XI2 net034 clk6 net034 VDD VSS clk3   / D_flipflop
XI1 net7 clk3 net19 VDD VSS clk  / D_flipflop
XI0 net8 net7 net25 VDD VSS clk  / D_flipflop
.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    clk2_clk4
* View Name:    schematic
************************************************************************

.SUBCKT clk2_clk4  VDD VSS CLK clk2 clk4 
*.PININFO CLK:I VDD:I VSS:I clk2:O clk4:O
XI0 net7 clk4 net7 VDD VSS net13  / D_flipflop

XOUT_clk net13 clk2 net13 VDD VSS CLK  / D_flipflop
.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    decoder
* View Name:    schematic
************************************************************************

.SUBCKT decoder K1 OUT1 OUT2 OUT3 OUT4 OUT5 OUT6 OUT7 VDD VSS con3 con2 con1
X1 VDD VSS con3 con3_bar  inverter
X2 VDD VSS con2 con2_bar  inverter
X3 VDD VSS con1 con1_bar  inverter
X4 con3_bar con2_bar con1_bar VDD VSS K1 nand3
X5 con3 con2_bar con1_bar VDD VSS OUT1 nand3
X6 con3_bar con2 con1_bar VDD VSS OUT2 nand3
X7 con3 con2 con1_bar VDD VSS OUT3 nand3
X8 con3_bar con2_bar con1 VDD VSS OUT4 nand3
X9 con3 con2_bar con1 VDD VSS OUT5 nand3
X10 con3_bar con2 con1 VDD VSS OUT6 nand3
X11 con3 con2 con1 VDD VSS OUT7 nand3
.ENDS


************************************************************************
* Library Name: final_project
* Cell Name:    pass_transistor
* View Name:    schematic
************************************************************************

.SUBCKT pass_transistor CK CKB VDD VSS Vin vout
*.PININFO CK:I CKB:I VDD:I VSS:I Vin:I Vout:O
XI0 VDD VSS CKB net8 / inverter2
MM1 Vin CK Vout VDD P_18 W=4u L=180.00n m=1
MM0 Vin net8 Vout VSS N_18 W=2u L=180.00n m=1


.ENDS

************************************************************************
* Library Name: final_project
* Cell Name:    freq_div
* View Name:    schematic
************************************************************************

.SUBCKT Clock_Divider VDD VSS clk clk_out con1 con2 con3 
*.PININFO CLK_IN:I VDD:I VSS:I a:I b:I c:I CLK_OUT:O
XI24 VDD VSS CLK CLK3 / inverter3

XI21 VDD VSS  CLK3 clk_by_7  / clk7
XI20 VDD VSS CLK3 clk_by_5  / clk5
XI19 VDD VSS CLK3 clk_by_3 clk_by_6   / clk3_clk6
XI18 VDD VSS CLK3 clk_by_2 clk_by_4   / clk2_clk4
XI17 XX DIV1 DIV2 DIV3 DIV4 DIV5 DIV6 DIV7 VDD VSS con3 con2 con1 / decoder
XI16 DIV7 DIV7 VDD VSS clk_by_7_bar2 CLK_OUT / pass_transistor
XI15 DIV6 DIV6 VDD VSS clk_by_6_bar2 CLK_OUT / pass_transistor
XI14 DIV5 DIV5 VDD VSS clk_by_5_bar2  CLK_OUT / pass_transistor
XI13 DIV4 DIV4 VDD VSS clk_by_4_bar2  CLK_OUT / pass_transistor
XI8 DIV3 DIV3 VDD VSS clk_by_3_bar3 CLK_OUT / pass_transistor
XI7 DIV2 DIV2 VDD VSS clk_by_2_bar3  CLK_OUT / pass_transistor
XI6 DIV1 DIV1 VDD VSS clk_by_1_bar3 CLK_OUT / pass_transistor
XI5 XX XX VDD VSS VDD_bar2 CLK_OUT / pass_transistor

XI254 VDD VSS   VDD_BAR VDD_bar2 / inverter4
XI258 VDD VSS  VDD VDD_BAR   / inverter

XI214 VDD VSS clk_by_1_bar2 clk_by_1_bar3   / inverter4
XI278 VDD VSS clk_by_2_bar2 clk_by_2_bar3    / inverter4

XI298 VDD VSS clk_by_3_bar2 clk_by_3_bar3    / inverter4


XI252 VDD VSS  clk_by_7  clk_by_7_bar2 / inverter4
XI262 VDD VSS  clk_by_6  clk_by_6_bar2 / inverter4
XI272 VDD VSS  clk_by_5  clk_by_5_bar2 / inverter4
XI282 VDD VSS  clk_by_4 clk_by_4_bar2 / inverter4
XI292 VDD VSS  clk_by_3 clk_by_3_bar2 / inverter5
XI302 VDD VSS  clk_by_2  clk_by_2_bar2 / inverter5
XI312 VDD VSS   CLK3  clk_by_1_bar2 / inverter5






.ENDS


