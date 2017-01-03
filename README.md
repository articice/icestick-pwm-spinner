# icestick-pwm-spinner
An ugly PWM-lit spinner demo for icestick FPGA evaluation board, built by yosys/arachne-pnr/icestorm

# Why ugly?
- Because the counter is linear, but the light-up of leds is not.
- Because the spinner doesn't look continuous.
- Because the green led doesn't do anything.

# How to run
- You need an icestick evaluation board from Lattice.
- You need the yosys/arachne-pnr/icestorm suite (installation instructions are here http://www.clifford.at/icestorm/) .
- Run make && make prog.
- Enjoy!
