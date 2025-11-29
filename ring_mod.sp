* Ring modulator

* first sine source 
V1 11 0 sin(0 0.7 1k)
Rs1 11 1 0.5

* transformer with split secondary
L1 1 0 10mH
L2 2 3 10mH
L3 3 4 10mH
K1 L1 L2 1
K2 L2 L3 1
K3 L1 L3 1

* second sine source
Rs2 3 33 0.5
V2 33 0 sin(0 0.7 1.2k)

* ring modulator diode section using Schottky diodes
D1 2 5 DI_BAT42W
D2 5 4 DI_BAT42W
D3 4 6 DI_BAT42W
D4 6 2 DI_BAT42W

* transformer with split secondary
L4 5 0 10mH
L5 0 6 10mH
L6 7 0 10mH
K4 L4 L5 1
K5 L5 L6 1
K6 L4 L6 1

* some load at the output
Rl 7 0 50

* model small signal schootky diode BAT42W
*SRC=BAT42W;DI_BAT42W;Diodes;Si;  30.0V  0.200A  5.00ns   Diodes Inc Schottky Diode
.MODEL DI_BAT42W D  ( IS=87.5u RS=18.1m BV=30.0 IBV=500n
+ CJO=8.88p  M=0.333 N=3.51 TT=7.20n )

* make it possible to plot current through devices
.options savecurrents

* control language script
.control
set xbrushwidth = 3
tran .1u 40m 
run
* plot current through diode, note special syntax
plot xlimit 0 5m @D1[id] 
* plot voltages
plot xlimit 0 5m v(7)
plot xlimit 0 5m v(11) v(33)
* plot frequency spectrum of output v(7)
fft V(7)
plot xlog db(V(7)) xlimit 100 10k ylimit -50 0
.endc

.end


