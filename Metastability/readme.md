#This folder contains a simulation of metastability in a digital system.


Steps to run :

1. Install Icarus Verilog (https://bleyer.org/icarus/)
2. Add the installation location bin to the system path on your computer.
3. Run the command: "iverilog -o metability metastability.v metastability_tb.v" to synthesize the Verilog files
4. Run the command: "vvp metastability"
5. To view the waveforms, run the command: "gtkwave metstability.vcd &" and add the signals from the unit under test (UUT)
