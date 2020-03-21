

* -------------------------------------------------------------------
*|                     Do Not Revise This Document                  |
* -------------------------------------------------------------------


**********************************************************************
**                          Simulation Setup                        **
**********************************************************************

.prot                                                 
.lib 'cic018.l' tt                            
.unprot                                               
.option post = 1                                        
.option accurate=1                                       
.option runlvl=5  
.option measform=2 
.option captab
.temp 25                    
.include "Clock_Divider2.sp"
                
****************************End of Segment****************************

.subckt unit_inv vin vout vdd vss 
MP1 vout vin vdd vdd p_18 w=1.5u l=0.18u m=1
MN1 vout vin vss vss n_18 w=0.5u l=0.18u m=1
.ends




**********************************************************************
**                         First Stage Inverter                     **
**********************************************************************
         

                           
****************************End of Segment****************************



**********************************************************************
**                             TOP Cell                             **
**********************************************************************
Xunit_inv clk_in clk vdd vss / unit_inv                  
XClock_Divider VDD VSS clk clk_out con1 con2 con3  / Clock_Divider
                           
****************************End of Segment****************************




**********************************************************************
**                        Parameter Definition                      **
**********************************************************************

.param VDD = 1.8
.param VSS = 0
.param clk_freq = 560X
.param clk_prd  = '(1/clk_freq)'
.param tran_ret = 'clk_prd / 2000'
.param clk_trf  = 0.01n
.tran tran_ret 'clk_prd*200'

****************************End of Segment****************************






**********************************************************************
**                          External Source                         **
**********************************************************************
CCload clk_out VSS 1pF
vdd vdd gnd VDD
vss vss gnd VSS
v_clk clk_in gnd pulse(0 VDD 2n clk_trf clk_trf 'clk_prd/2' clk_prd)

vc2 con1 gnd pwl( 0.5n 0 '60*clk_prd' 0 '0.01n+60*clk_prd' VDD)

vc1 con2 gnd pwl(
+0.5n 0 
+'20*clk_prd' 0 
+'0.01n+20*clk_prd' VDD 
+'60*clk_prd-0.01n' VDD 
+'60*clk_prd' 0 
+'120*clk_prd' 0 
+'0.01n+120*clk_prd' 1.8 )

vc0 con3 gnd pwl( 
+0.5n 0 
+'10*clk_prd' 0 
+'0.01n+10*clk_prd' VDD 
+'20*clk_prd-0.01n' VDD 
+'20*clk_prd' 0 
+'40*clk_prd' 0 
+'0.01n+40*clk_prd' VDD  
+'60*clk_prd-0.01n' VDD 
+'60*clk_prd' 0 
+'90*clk_prd' 0 
+'0.01n+90*clk_prd' VDD 
+'120*clk_prd-0.01n' VDD 
+'120*clk_prd' 0 
+'160*clk_prd' 0 
+'0.01n+160*clk_prd' VDD)


***************************************
* ----------------------------------- *
*|       control signal table        |*
*|-----------------------------------|*
*| CON1 | CON2 | CON3 |  switch time |*
*|------+------+------+--------------|*
*|  0   |  0   |  0   | 0 x clk_prd  |*
*|  0   |  0   |  1   | 10x clk_prd  |*
*|  0   |  1   |  0   | 20x clk_prd  |*
*|  0   |  1   |  1   | 40x clk_prd  |*
*|  1   |  0   |  0   | 60x clk_prd  |*
*|  1   |  0   |  1   | 90x clk_prd  |*
*|  1   |  1   |  0   | 120x clk_prd |*
*|  1   |  1   |  1   | 160x clk_prd |*
* ----------------------------------- *
***************************************

****************************End of Segment****************************






**********************************************************************
**                     Simulation & Measurement                     **
**********************************************************************

.MEAS tran T0 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= 0
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T1 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '12*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T2 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '22*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T3 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '42*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T4 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '62*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T5 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '92*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T6 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '122*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
.MEAS tran T7 TRIG v(clk_out) VAL = 'VDD / 2' RISE=2 TD= '162*clk_prd'
 + TARG v(clk_out) VAL = 'VDD / 2' RISE=3
 
.MEAS tran freq_1 param = '1/T1'
.MEAS tran freq_2 param = '1/T2'
.MEAS tran freq_3 param = '1/T3'
.MEAS tran freq_4 param = '1/T4'
.MEAS tran freq_5 param = '1/T5'
.MEAS tran freq_6 param = '1/T6'
.MEAS tran freq_7 param = '1/T7'

.MEAS tran freq_1_err param = 'abs(freq_1 - clk_freq/1) / (clk_freq/1)'
.MEAS tran freq_2_err param = 'abs(freq_2 - clk_freq/2) / (clk_freq/2)'
.MEAS tran freq_3_err param = 'abs(freq_3 - clk_freq/3) / (clk_freq/3)'
.MEAS tran freq_4_err param = 'abs(freq_4 - clk_freq/4) / (clk_freq/4)'
.MEAS tran freq_5_err param = 'abs(freq_5 - clk_freq/5) / (clk_freq/5)'
.MEAS tran freq_6_err param = 'abs(freq_6 - clk_freq/6) / (clk_freq/6)'
.MEAS tran freq_7_err param = 'abs(freq_7 - clk_freq/7) / (clk_freq/7)'


.meas tran vdd_energy_0 INTEG 'v(vdd)*-(i(vdd))' from='2*clk_prd' to='2*clk_prd+2*1*clk_prd' 
.meas tran vdd_energy_1 INTEG 'v(vdd)*-(i(vdd))' from='10*clk_prd+2*2*clk_prd' to='10*clk_prd+4*2*clk_prd' 
.meas tran vdd_energy_2 INTEG 'v(vdd)*-(i(vdd))' from='20*clk_prd+2*3*clk_prd' to='20*clk_prd+4*3*clk_prd'
.meas tran vdd_energy_3 INTEG 'v(vdd)*-(i(vdd))' from='40*clk_prd+2*4*clk_prd' to='40*clk_prd+4*4*clk_prd' 
.meas tran vdd_energy_4 INTEG 'v(vdd)*-(i(vdd))' from='60*clk_prd+2*5*clk_prd' to='60*clk_prd+4*5*clk_prd' 
.meas tran vdd_energy_5 INTEG 'v(vdd)*-(i(vdd))' from='90*clk_prd+2*6*clk_prd' to='90*clk_prd+4*6*clk_prd' 
.meas tran vdd_energy_6 INTEG 'v(vdd)*-(i(vdd))' from='120*clk_prd+2*7*clk_prd' to='120*clk_prd+4*7*clk_prd'
.meas tran vdd_energy_7 INTEG 'v(vdd)*-(i(vdd))' from='160*clk_prd+2*8*clk_prd' to='160*clk_prd+4*8*clk_prd'

.meas tran pwr_0 param = 'vdd_energy_0 / (2*1*clk_prd)'
.meas tran pwr_1 param = 'vdd_energy_1 / (2*2*clk_prd)'
.meas tran pwr_2 param = 'vdd_energy_2 / (2*3*clk_prd)'
.meas tran pwr_3 param = 'vdd_energy_3 / (2*4*clk_prd)'
.meas tran pwr_4 param = 'vdd_energy_4 / (2*5*clk_prd)'
.meas tran pwr_5 param = 'vdd_energy_5 / (2*6*clk_prd)'
.meas tran pwr_6 param = 'vdd_energy_6 / (2*7*clk_prd)'
.meas tran pwr_7 param = 'vdd_energy_7 / (2*8*clk_prd)'

.meas tran total_avg_pwr param = '(pwr_0+pwr_1+pwr_2+pwr_3+pwr_4+pwr_5+pwr_6+pwr_7)/8'

****************************End of Segment****************************




**********************************************************************
**                    Process Corner Verification                   **
**
********************************************************************


.end
****************************End of Segment****************************


