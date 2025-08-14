* Chua circuit
* Using a Voltage Dependent Voltage Source (E1) as amplifier
L1 0 1 8.5mH
C2 0 1 47nF
R6 1 2 1.6kOhm
C1 0 2 4.6nF
* diodes give non linearity to circuit to "induce chaos"
D1 3 2 1N4148 
R5 3 0 3.3kOhm
D2 2 4 1N4148
R4 0 4 3.3kOhm
* the amplifier is modelled using a "E" element or VCVS
* the TABLE makes the output clip at +-9V
E1 6 0 TABLE {V(2,0)} = (-7.25, -9) (7.25, 9)
R3 2 6 290Ohm
R7 3 8 47kOhm
V2 0 8 9V
R8 4 7 47kOhm
V1 7 0 9V
* diode model
.model 1N4148 D (Is=2.52n Rs=.568 N=1.752 Cjo=4p M=.4 tt=20n Iave=200m Vpk=75 mfg=OnSemi type=silicon)
* transient analysis (voltages and currents as function of time)
.TRAN .02ms 30ms uic
.control
run
* option retraceplot is needed because values on x axis are not monotonic
plot v(1) vs v(2) retraceplot title 'Chua circuit'
.endc
.end




