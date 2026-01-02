# Compilation process of vhdl file using GHDL and showing wave form using GTKwave
After writing the vhdl and test bench do the following steps
### 1. Analyze(Compile)
Compile each VHDL file:
```sh
ghdl -a my_entity.vhd
ghdl -a my_tb.vhd
```
The `-a` stands for analyze.
### 2. Elaborate
Elaborate the top-level (usually the testbench):
```sh
ghdl -e my_tb
```
This creates an executable simulation file.

**Note**: just the name of testbench not the extention

### 3. Run the Simulation and Generate a Waveform
To generate a `.vcd` waveform file:
```sh
ghdl -r my_tb --vcd=wave.vcd
```
Then open wave.vcd in GTKWave:
```sh
gtkwave wave.vcd
```
