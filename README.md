# Deploying VHDL To Alchitry Au Using FuseSoC

## Overview

This repo demonstrates:
- A thoughtfully designed, multi-target project directory structure for FPGA cores (inspiration credit to [E4tHam]).

- Using the [FuseSoC] build system to synthesize, place and route, write and load a bin file to the [Alchitry Au] FPGA board with the [Au Io] module installed. The deployed design will demonstrate use of the 4-bit binary added implemented in [adder.vhdl]. The right 4 switches of the right bank and the right 4 switches of the center bank are inputs A and B respectively. The right 5 LEDs of the left most LED bank will show the X output. [FuseSoC] will call Vivado in batch mode without use of the Vivado GUI. Typically, calling [FuseSoC] in the run phase will cause the Vivado hardware loader platform to run once the binary has been built. However, the Alchitry board is not supported (as of this writing) by the Vivado loader tool. Alchitry has its own [command-line loader]. A pre-run script was added to load the binary after building, and then terminate prior to handing off to the Vivado loader. This also makes it so one can pass `--run` on the command line after building and the alchitry-loader will load an already built bin file (if re-loading to RAM is desired).

- Test automation, driven by [FuseSoC], using the [VUnit] python library, overriding the VUnit configuration process by passing in compilation switches prior to execution.

- Using FuseSoC flags to conditionally load the design into RAM or flash.

## Prerequisites
- Tested on Linux (Lubuntu guest on Windows 10 host via Virtualbox to be specific)
- Alchitry [command-line loader] (you must build the binary)
- [Vivado]
- [FuseSoC python module] `pip install fusesoc` (and Python, of course)
- [VUnit] python module `pip install vunit_hdl`

## Running
- To build and load the design into RAM on Alchitry Au Io
```
fusesoc run --target alchitry_au_io chuckb:examples:adder
```
- To build and load the design into Flash on Alchitry Au Io
```
fusesoc run --target alchitry_au_io --flag flash chuckb:examples:adder
```
- To run VUnit test bench
```
fusesoc run --target test chuckb:examples:adder
```
## Result
### 2 + 2 = 4
<img alt="2 + 2 = 4" src="image/au_adder.jpg" />

[Alchitry Au]:          https://www.sparkfun.com/products/16527
[FuseSoC]:              https://fusesoc.readthedocs.io/en/stable/index.html
[command-line loader]:  https://github.com/chuckb/alchitry-loader
[Au Io]:                https://www.sparkfun.com/products/16525
[adder.vhdl]:           rtl/adder.vhdl
[Makefile]:             Makefile
[Vivado]:               https://www.xilinx.com/support/download.html
[VUnit]:                https://vunit.github.io/
[FuseSoC python module]: https://github.com/olofk/fusesoc
[E4tHam]:               https://github.com/E4tHam/fusesoc_template