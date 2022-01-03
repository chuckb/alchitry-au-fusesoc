# Deploying VHDL To Alchitry Au Using FuseSoC

## Overview

This repo demonstrates using the [FuseSoC] build system to synthesize, place and route, write and load a bin file to the [Alchitry Au] FPGA board with the [Au Io] module installed. The deployed design will demonstrate use of the 4-bit binary added implemented in [adder.vhdl]. The right 4 switches of the right bank and the right 4 switches of the center bank are inputs A and B respectively. The right 5 LEDs of the left most LED bank will show the X output. [FuseSoC] will call Vivado in batch mode without use of the Vivado GUI.

Typically, calling [FuseSoC] in the run phase will cause the Vivado hardware loader platform to run once the binary has been built. However, the Alchitry board is not supported (as of this writing) by the Vivado loader tool. Alchitry has its own [command-line loader]. A [Makefile] was created to join a dependency between FuseSoC, running the build phase vs. the run phase, building a bin file, and the Alchitry loader.

This example adds test automation using the [VUnit] python library. The test bench is automatically executed prior to synthesis.

## Prerequisites
- Tested on Linux (Lubuntu guest on Windows 10 host via Virtualbox to be specific)
- Alchitry [command-line loader] (you must build the binary)
- [Vivado]
- FuseSoC python module `pip install fusesoc` (and Python, of course)
- [VUnit] python module `pip install vunit_hdl`

## Running
- To load the design into RAM only `make temp`
- To load the design into Flash `make perm`

## Result
### 2 + 2 = 4
<img alt="2 + 2 = 4" src="image/au_adder.jpg" />

### Output of run:
```
osboxes@osboxes:~/Documents/alchitry-au-fusesoc-cocotb$ make temp
./test/run.py
Compiling into rtl_lib:   rtl/adder.vhdl                                                                                           /home/osboxes/.local/lib/python3.9/site-packages/vunit/sim_if/ghdl.py:252: Warning: 'ghdl.flags' is deprecated and it will be removed in future releases; use 'ghdl.a_flags' instead
  warn(
passed
Compiling into rtl_lib:   rtl/au_top.vhdl                                                                                          passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/string_ops/src/string_ops.vhd                        passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/path/src/path.vhd                                    passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/print_pkg.vhd                            passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/location_pkg.vhd                         passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/location_pkg-body-2008m.vhd              passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/types.vhd                             passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/codec_builder.vhd                     passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/codec_builder-2008p.vhd               passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/codec.vhd                             passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/codec-2008p.vhd                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/api/external_string_pkg.vhd           passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/string_ptr_pkg.vhd                    passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/ansi_pkg.vhd                             passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/log_levels_pkg.vhd                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/string_ptr_pkg-body-2002p.vhd         passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/byte_vector_ptr_pkg.vhd               passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/api/external_integer_vector_pkg.vhd   passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/integer_vector_ptr_pkg.vhd            passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/log_handler_pkg.vhd                      passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/print_pkg-body.vhd                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/logger_pkg.vhd                           passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/dictionary/src/dictionary.vhd                        passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/run/src/run_types.vhd                                passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/file_pkg.vhd                             passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/log_handler_pkg-body.vhd                 passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/integer_vector_ptr_pkg-body-2002p.vhd passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/integer_array_pkg.vhd                 passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/queue_pkg.vhd                         passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/string_ptr_pool_pkg.vhd               passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/queue_pkg-body.vhd                    passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/queue_pkg-2008p.vhd                   passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/integer_vector_ptr_pool_pkg.vhd       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/run/src/runner_pkg.vhd                               passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/run/src/run_api.vhd                                  passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/queue_pool_pkg.vhd                    passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/integer_array_pkg-body.vhd            passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/dict_pkg.vhd                          passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/data_types/src/data_types_context.vhd                passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/core/src/stop_pkg.vhd                                passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/core/src/stop_body_2008p.vhd                         passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/core/src/core_pkg.vhd                                passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/run/src/run.vhd                                      passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/logger_pkg-body.vhd                      passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/log_levels_pkg-body.vhd                  passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/logging/src/log_deprecated_pkg.vhd                   passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/check/src/checker_pkg.vhd                            passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/run/src/run_deprecated_pkg.vhd                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/vunit_run_context.vhd                                passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/check/src/checker_pkg-body.vhd                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/check/src/check_api.vhd                              passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/check/src/check_deprecated_pkg.vhd                   passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/vunit_context.vhd                                    passed
Compiling into tb_lib:    test/adder_tb.vhdl                                                                                       passed
Compiling into vunit_lib: ../../.local/lib/python3.9/site-packages/vunit/vhdl/check/src/check.vhd                                  passed
Compile passed

Starting tb_lib.adder_tb.should add
Output file: /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/vunit_out/test_output/tb_lib.adder_tb.should_add_8c5471c23ad7cb8bb172b4570a7cda772ee88477/output.txt
pass (P=1 S=0 F=0 T=1) tb_lib.adder_tb.should add (0.4 seconds)

==== Summary ======================================
pass tb_lib.adder_tb.should add (0.4 seconds)
===================================================
pass 1 of 1
===================================================
Total time was 0.4 seconds
Elapsed time was 0.4 seconds
===================================================
All passed!
fusesoc --cores-root=/home/osboxes/Documents/alchitry-au-fusesoc-cocotb run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0
WARNING: The CAPI1 core file description format is deprecated and will be removed in the next major version of FuseSoC. Please port your core files to the CAPI2 format.
INFO: Preparing chuckb:examples:alchitry-au-fusesoc:1.0.0
INFO: Setting up project

INFO: Building
make[1]: Entering directory '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado'
vivado -notrace -mode batch -source chuckb_examples_alchitry-au-fusesoc_1.0.0.tcl

****** Vivado v2020.2 (64-bit)
  **** SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
  **** IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
    ** Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

source chuckb_examples_alchitry-au-fusesoc_1.0.0.tcl -notrace
INFO: [Common 17-206] Exiting Vivado at Mon Jan  3 14:06:24 2022...
vivado -notrace -mode batch -source chuckb_examples_alchitry-au-fusesoc_1.0.0_run.tcl chuckb_examples_alchitry-au-fusesoc_1.0.0.xpr

****** Vivado v2020.2 (64-bit)
  **** SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
  **** IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
    ** Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

open_project chuckb_examples_alchitry-au-fusesoc_1.0.0.xpr
WARNING: [filemgmt 56-3] Default IP Output Path : Could not find the directory '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.gen/sources_1'.
Scanning sources...
Finished scanning sources
source chuckb_examples_alchitry-au-fusesoc_1.0.0_run.tcl -notrace
[Mon Jan  3 14:06:49 2022] Launched synth_1...
Run output will be captured here: /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/synth_1/runme.log
[Mon Jan  3 14:06:49 2022] Launched impl_1...
Run output will be captured here: /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/runme.log
[Mon Jan  3 14:06:49 2022] Waiting for impl_1 to finish...

*** Running vivado
    with args -log au_top.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source au_top.tcl -notrace


****** Vivado v2020.2 (64-bit)
  **** SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
  **** IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
    ** Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

source au_top.tcl -notrace
Command: link_design -top au_top -part xc7a35tftg256-1
Design is defaulting to srcset: sources_1
Design is defaulting to constrset: constrs_1
INFO: [Device 21-403] Loading part xc7a35tftg256-1
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2346.000 ; gain = 0.000 ; free physical = 804 ; free virtual = 11422
INFO: [Project 1-479] Netlist was created with Vivado 2020.2
INFO: [Project 1-570] Preparing netlist for logic optimization
Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/alchitry.xdc]
Finished Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/alchitry.xdc]
Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/au.xdc]
Finished Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/au.xdc]
Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/au_io.xdc]
Finished Parsing XDC File [/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/src/chuckb_examples_alchitry-au-fusesoc_1.0.0/constraints/au_io.xdc]
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2369.949 ; gain = 0.000 ; free physical = 712 ; free virtual = 11328
INFO: [Project 1-111] Unisim Transformation Summary:
No Unisim elements were transformed.

5 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
link_design completed successfully
link_design: Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 2369.949 ; gain = 24.012 ; free physical = 712 ; free virtual = 11327
Command: opt_design
Attempting to get a license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xc7a35t'
Running DRC as a precondition to command opt_design

Starting DRC Task
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Project 1-461] DRC finished with 0 Errors
INFO: [Project 1-462] Please refer to the DRC report (report_drc) for more information.

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.96 . Memory (MB): peak = 2401.965 ; gain = 32.016 ; free physical = 679 ; free virtual = 11306

Starting Cache Timing Information Task
INFO: [Timing 38-35] Done setting XDC timing constraints.
Ending Cache Timing Information Task | Checksum: f579b2a2

Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 2651.918 ; gain = 249.953 ; free physical = 291 ; free virtual = 10934

Starting Logic Optimization Task

Phase 1 Retarget
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
INFO: [Opt 31-49] Retargeted 0 cell(s).
Phase 1 Retarget | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-389] Phase Retarget created 0 cells and removed 0 cells

Phase 2 Constant propagation
INFO: [Opt 31-138] Pushed 0 inverter(s) to 0 load pin(s).
Phase 2 Constant propagation | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-389] Phase Constant propagation created 0 cells and removed 0 cells

Phase 3 Sweep
Phase 3 Sweep | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-389] Phase Sweep created 0 cells and removed 0 cells

Phase 4 BUFG optimization
Phase 4 BUFG optimization | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-662] Phase BUFG optimization created 0 cells of which 0 are BUFGs and removed 0 cells.

Phase 5 Shift Register Optimization
INFO: [Opt 31-1064] SRL Remap converted 0 SRLs to 0 registers and converted 0 registers of register chains to 0 SRLs
Phase 5 Shift Register Optimization | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-389] Phase Shift Register Optimization created 0 cells and removed 0 cells

Phase 6 Post Processing Netlist
Phase 6 Post Processing Netlist | Checksum: f579b2a2

Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
INFO: [Opt 31-389] Phase Post Processing Netlist created 0 cells and removed 0 cells
Opt_design Change Summary
=========================


-------------------------------------------------------------------------------------------------------------------------
|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
|  Retarget                     |               0  |               0  |                                              0  |
|  Constant propagation         |               0  |               0  |                                              0  |
|  Sweep                        |               0  |               0  |                                              0  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                              0  |
-------------------------------------------------------------------------------------------------------------------------



Starting Connectivity Check Task

Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771
Ending Logic Optimization Task | Checksum: f579b2a2

Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 131 ; free virtual = 10771

Starting Power Optimization Task
INFO: [Pwropt 34-132] Skipping clock gating for clocks with a period < 2.00 ns.
Ending Power Optimization Task | Checksum: f579b2a2

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 130 ; free virtual = 10771

Starting Final Cleanup Task
Ending Final Cleanup Task | Checksum: f579b2a2

Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 130 ; free virtual = 10771

Starting Netlist Obfuscation Task
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 130 ; free virtual = 10771
Ending Netlist Obfuscation Task | Checksum: f579b2a2

Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2822.887 ; gain = 0.000 ; free physical = 130 ; free virtual = 10771
INFO: [Common 17-83] Releasing license: Implementation
22 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
opt_design completed successfully
opt_design: Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 2822.887 ; gain = 452.938 ; free physical = 130 ; free virtual = 10771
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2862.906 ; gain = 0.000 ; free physical = 128 ; free virtual = 10769
INFO: [Common 17-1381] The checkpoint '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_opt.dcp' has been generated.
INFO: [runtcl-4] Executing : report_drc -file au_top_drc_opted.rpt -pb au_top_drc_opted.pb -rpx au_top_drc_opted.rpx
Command: report_drc -file au_top_drc_opted.rpt -pb au_top_drc_opted.pb -rpx au_top_drc_opted.rpx
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1704] No user IP repositories specified
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository '/home/osboxes/tools/Xilinx/Vivado/2020.2/data/ip'.
INFO: [Timing 38-35] Done setting XDC timing constraints.
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Coretcl 2-168] The results of DRC are in file /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_drc_opted.rpt.
report_drc completed successfully
Command: place_design
Attempting to get a license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.
Running DRC as a precondition to command place_design
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.

Starting Placer Task
INFO: [Place 30-611] Multithreading enabled for place_design using a maximum of 4 CPUs

Phase 1 Placer Initialization

Phase 1.1 Placer Initialization Netlist Sorting
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 108 ; free virtual = 10696
Phase 1.1 Placer Initialization Netlist Sorting | Checksum: ead7212b

Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 108 ; free virtual = 10696
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 108 ; free virtual = 10696

Phase 1.2 IO Placement/ Clock Placement/ Build Placer Device
Phase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: ead7212b

Time (s): cpu = 00:00:00.25 ; elapsed = 00:00:00.13 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 137 ; free virtual = 10726

Phase 1.3 Build Placer Netlist Model
Phase 1.3 Build Placer Netlist Model | Checksum: 19bd0cb0f

Time (s): cpu = 00:00:00.35 ; elapsed = 00:00:00.18 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 149 ; free virtual = 10741

Phase 1.4 Constrain Clocks/Macros
Phase 1.4 Constrain Clocks/Macros | Checksum: 19bd0cb0f

Time (s): cpu = 00:00:00.36 ; elapsed = 00:00:00.18 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 149 ; free virtual = 10741
Phase 1 Placer Initialization | Checksum: 19bd0cb0f

Time (s): cpu = 00:00:00.37 ; elapsed = 00:00:00.19 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 149 ; free virtual = 10740

Phase 2 Global Placement

Phase 2.1 Floorplanning
Phase 2.1 Floorplanning | Checksum: 19bd0cb0f

Time (s): cpu = 00:00:00.37 ; elapsed = 00:00:00.19 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 148 ; free virtual = 10740

Phase 2.2 Update Timing before SLR Path Opt
Phase 2.2 Update Timing before SLR Path Opt | Checksum: 19bd0cb0f

Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.19 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 148 ; free virtual = 10740

Phase 2.3 Global Placement Core
WARNING: [Place 46-29] place_design is not in timing mode. Skip physical synthesis in placer
Phase 2.3 Global Placement Core | Checksum: 15a9f5442

Time (s): cpu = 00:00:00.90 ; elapsed = 00:00:00.40 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10730
Phase 2 Global Placement | Checksum: 15a9f5442

Time (s): cpu = 00:00:00.90 ; elapsed = 00:00:00.40 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10730

Phase 3 Detail Placement

Phase 3.1 Commit Multi Column Macros
Phase 3.1 Commit Multi Column Macros | Checksum: 15a9f5442

Time (s): cpu = 00:00:00.90 ; elapsed = 00:00:00.40 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10730

Phase 3.2 Commit Most Macros & LUTRAMs
Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1b1438a96

Time (s): cpu = 00:00:00.93 ; elapsed = 00:00:00.41 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10729

Phase 3.3 Area Swap Optimization
Phase 3.3 Area Swap Optimization | Checksum: 152e1dbcc

Time (s): cpu = 00:00:00.94 ; elapsed = 00:00:00.41 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10729

Phase 3.4 Pipeline Register Optimization
Phase 3.4 Pipeline Register Optimization | Checksum: 152e1dbcc

Time (s): cpu = 00:00:00.94 ; elapsed = 00:00:00.41 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10729

Phase 3.5 Small Shape Detail Placement
Phase 3.5 Small Shape Detail Placement | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.48 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 135 ; free virtual = 10726

Phase 3.6 Re-assign LUT pins
Phase 3.6 Re-assign LUT pins | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.49 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 135 ; free virtual = 10726

Phase 3.7 Pipeline Register Optimization
Phase 3.7 Pipeline Register Optimization | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.49 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 135 ; free virtual = 10726
Phase 3 Detail Placement | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.49 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 135 ; free virtual = 10726

Phase 4 Post Placement Optimization and Clean-Up

Phase 4.1 Post Commit Optimization
Phase 4.1 Post Commit Optimization | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.49 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 135 ; free virtual = 10726

Phase 4.2 Post Placement Cleanup
Phase 4.2 Post Placement Cleanup | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.49 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727

Phase 4.3 Placer Reporting

Phase 4.3.1 Print Estimated Congestion
INFO: [Place 30-612] Post-Placement Estimated Congestion 
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|                1x1|                1x1|
|___________|___________________|___________________|
|      South|                1x1|                1x1|
|___________|___________________|___________________|
|       East|                1x1|                1x1|
|___________|___________________|___________________|
|       West|                1x1|                1x1|
|___________|___________________|___________________|

Phase 4.3.1 Print Estimated Congestion | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727
Phase 4.3 Placer Reporting | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727

Phase 4.4 Final Placement Cleanup
Netlist sorting complete. Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727
Phase 4 Post Placement Optimization and Clean-Up | Checksum: 1b83a64dc

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727
Ending Placer Task | Checksum: 1973f1537

Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 136 ; free virtual = 10727
INFO: [Common 17-83] Releasing license: Implementation
41 Infos, 1 Warnings, 0 Critical Warnings and 0 Errors encountered.
place_design completed successfully
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 145 ; free virtual = 10737
INFO: [Common 17-1381] The checkpoint '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_placed.dcp' has been generated.
INFO: [runtcl-4] Executing : report_io -file au_top_io_placed.rpt
report_io: Time (s): cpu = 00:00:00.09 ; elapsed = 00:00:00.13 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 139 ; free virtual = 10730
INFO: [runtcl-4] Executing : report_utilization -file au_top_utilization_placed.rpt -pb au_top_utilization_placed.pb
INFO: [runtcl-4] Executing : report_control_sets -verbose -file au_top_control_sets_placed.rpt
report_control_sets: Time (s): cpu = 00:00:00.04 ; elapsed = 00:00:00.08 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 145 ; free virtual = 10736
Command: phys_opt_design
Attempting to get a license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Timing 38-35] Done setting XDC timing constraints.
INFO: [Vivado_Tcl 4-383] Design worst setup slack (WNS) is greater than or equal to 0.000 ns. Skipping all physical synthesis optimizations.
INFO: [Vivado_Tcl 4-232] No setup violation found. The netlist was not modified.
INFO: [Common 17-83] Releasing license: Implementation
51 Infos, 1 Warnings, 0 Critical Warnings and 0 Errors encountered.
phys_opt_design completed successfully
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:00.02 ; elapsed = 00:00:00.01 . Memory (MB): peak = 2954.387 ; gain = 0.000 ; free physical = 143 ; free virtual = 10736
INFO: [Common 17-1381] The checkpoint '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_physopt.dcp' has been generated.
Command: route_design
Attempting to get a license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xc7a35t'
Running DRC as a precondition to command route_design
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.


Starting Routing Task
INFO: [Route 35-254] Multithreading enabled for route_design using a maximum of 4 CPUs
Checksum: PlaceDB: fad0cac8 ConstDB: 0 ShapeSum: 9c6e4a6f RouteDB: 0

Phase 1 Build RT Design
Phase 1 Build RT Design | Checksum: 16f49be77

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2985.969 ; gain = 31.582 ; free physical = 110 ; free virtual = 10624
Post Restoration Checksum: NetGraph: a4e6d692 NumContArr: ca62e7e5 Constraints: 0 Timing: 0

Phase 2 Router Initialization

Phase 2.1 Create Timer
Phase 2.1 Create Timer | Checksum: 16f49be77

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2985.969 ; gain = 31.582 ; free physical = 113 ; free virtual = 10593

Phase 2.2 Fix Topology Constraints
Phase 2.2 Fix Topology Constraints | Checksum: 16f49be77

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2992.965 ; gain = 38.578 ; free physical = 115 ; free virtual = 10577

Phase 2.3 Pre Route Cleanup
Phase 2.3 Pre Route Cleanup | Checksum: 16f49be77

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2992.965 ; gain = 38.578 ; free physical = 115 ; free virtual = 10576
 Number of Nodes with overlaps = 0

Phase 2.4 Update Timing
Phase 2.4 Update Timing | Checksum: 119d1535b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 112 ; free virtual = 10574
Phase 2 Router Initialization | Checksum: 119d1535b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 112 ; free virtual = 10574

Router Utilization Summary
  Global Vertical Routing Utilization    = 0 %
  Global Horizontal Routing Utilization  = 0 %
  Routable Net Status*
  *Does not include unroutable nets such as driverless and loadless.
  Run report_route_status for detailed report.
  Number of Failed Nets               = 14
    (Failed Nets is the sum of unrouted and partially routed nets)
  Number of Unrouted Nets             = 14
  Number of Partially Routed Nets     = 0
  Number of Node Overlaps             = 0


Phase 3 Initial Routing

Phase 3.1 Global Routing
Phase 3.1 Global Routing | Checksum: 119d1535b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 111 ; free virtual = 10573
Phase 3 Initial Routing | Checksum: 107c30558

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 4 Rip-up And Reroute

Phase 4.1 Global Iteration 0
 Number of Nodes with overlaps = 0
Phase 4.1 Global Iteration 0 | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573
Phase 4 Rip-up And Reroute | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 5 Delay and Skew Optimization

Phase 5.1 Delay CleanUp
Phase 5.1 Delay CleanUp | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 5.2 Clock Skew Optimization
Phase 5.2 Clock Skew Optimization | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573
Phase 5 Delay and Skew Optimization | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 6 Post Hold Fix

Phase 6.1 Hold Fix Iter

Phase 6.1.1 Update Timing
Phase 6.1.1 Update Timing | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573
Phase 6.1 Hold Fix Iter | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573
Phase 6 Post Hold Fix | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 7 Route finalize

Router Utilization Summary
  Global Vertical Routing Utilization    = 0.0153871 %
  Global Horizontal Routing Utilization  = 0.00507548 %
  Routable Net Status*
  *Does not include unroutable nets such as driverless and loadless.
  Run report_route_status for detailed report.
  Number of Failed Nets               = 0
    (Failed Nets is the sum of unrouted and partially routed nets)
  Number of Unrouted Nets             = 0
  Number of Partially Routed Nets     = 0
  Number of Node Overlaps             = 0

Phase 7 Route finalize | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 115 ; free virtual = 10573

Phase 8 Verifying routed nets

 Verification completed successfully
Phase 8 Verifying routed nets | Checksum: 11e95405a

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 113 ; free virtual = 10571

Phase 9 Depositing Routes
Phase 9 Depositing Routes | Checksum: b3b1d66b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 113 ; free virtual = 10571

Phase 10 Post Router Timing
Phase 10 Post Router Timing | Checksum: b3b1d66b

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 113 ; free virtual = 10571
INFO: [Route 35-16] Router Completed Successfully

Time (s): cpu = 00:00:11 ; elapsed = 00:00:09 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 129 ; free virtual = 10588

Routing Is Done.
INFO: [Common 17-83] Releasing license: Implementation
60 Infos, 1 Warnings, 0 Critical Warnings and 0 Errors encountered.
route_design completed successfully
route_design: Time (s): cpu = 00:00:12 ; elapsed = 00:00:10 . Memory (MB): peak = 2998.965 ; gain = 44.578 ; free physical = 129 ; free virtual = 10588
INFO: [Common 17-600] The following parameters have non-default value.
general.maxThreads
INFO: [Timing 38-480] Writing timing data to binary archive.
Writing placer database...
Writing XDEF routing.
Writing XDEF routing logical nets.
Writing XDEF routing special nets.
Write XDEF Complete: Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3018.844 ; gain = 11.875 ; free physical = 129 ; free virtual = 10588
INFO: [Common 17-1381] The checkpoint '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_routed.dcp' has been generated.
INFO: [runtcl-4] Executing : report_drc -file au_top_drc_routed.rpt -pb au_top_drc_routed.pb -rpx au_top_drc_routed.rpx
Command: report_drc -file au_top_drc_routed.rpt -pb au_top_drc_routed.pb -rpx au_top_drc_routed.rpx
INFO: [IP_Flow 19-1839] IP Catalog is up to date.
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Coretcl 2-168] The results of DRC are in file /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_drc_routed.rpt.
report_drc completed successfully
INFO: [runtcl-4] Executing : report_methodology -file au_top_methodology_drc_routed.rpt -pb au_top_methodology_drc_routed.pb -rpx au_top_methodology_drc_routed.rpx
Command: report_methodology -file au_top_methodology_drc_routed.rpt -pb au_top_methodology_drc_routed.pb -rpx au_top_methodology_drc_routed.rpx
INFO: [Timing 38-35] Done setting XDC timing constraints.
INFO: [DRC 23-133] Running Methodology with 4 threads
INFO: [Coretcl 2-1520] The results of Report Methodology are in file /home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top_methodology_drc_routed.rpt.
report_methodology completed successfully
INFO: [runtcl-4] Executing : report_power -file au_top_power_routed.rpt -pb au_top_power_summary_routed.pb -rpx au_top_power_routed.rpx
Command: report_power -file au_top_power_routed.rpt -pb au_top_power_summary_routed.pb -rpx au_top_power_routed.rpx
INFO: [Timing 38-35] Done setting XDC timing constraints.
Running Vector-less Activity Propagation...

Finished Running Vector-less Activity Propagation
73 Infos, 1 Warnings, 0 Critical Warnings and 0 Errors encountered.
report_power completed successfully
INFO: [runtcl-4] Executing : report_route_status -file au_top_route_status.rpt -pb au_top_route_status.pb
INFO: [runtcl-4] Executing : report_timing_summary -max_paths 10 -file au_top_timing_summary_routed.rpt -pb au_top_timing_summary_routed.pb -rpx au_top_timing_summary_routed.rpx -warn_on_violation 
INFO: [Timing 38-91] UpdateTimingParams: Speed grade: -1, Delay Type: min_max.
INFO: [Timing 38-191] Multithreading enabled for timing update using a maximum of 4 CPUs
INFO: [runtcl-4] Executing : report_incremental_reuse -file au_top_incremental_reuse_routed.rpt
INFO: [Vivado_Tcl 4-1062] Incremental flow is disabled. No incremental reuse Info to report.
INFO: [runtcl-4] Executing : report_clock_utilization -file au_top_clock_utilization_routed.rpt
INFO: [runtcl-4] Executing : report_bus_skew -warn_on_violation -file au_top_bus_skew_routed.rpt -pb au_top_bus_skew_routed.pb -rpx au_top_bus_skew_routed.rpx
INFO: [Timing 38-91] UpdateTimingParams: Speed grade: -1, Delay Type: min_max.
INFO: [Timing 38-191] Multithreading enabled for timing update using a maximum of 4 CPUs
Command: write_bitstream -force au_top.bit -bin_file
Attempting to get a license for feature 'Implementation' and/or device 'xc7a35t'
INFO: [Common 17-349] Got license for feature 'Implementation' and/or device 'xc7a35t'
Running DRC as a precondition to command write_bitstream
INFO: [IP_Flow 19-1839] IP Catalog is up to date.
INFO: [DRC 23-27] Running DRC with 4 threads
INFO: [Vivado 12-3199] DRC finished with 0 Errors
INFO: [Vivado 12-3200] Please refer to the DRC report (report_drc) for more information.
INFO: [Designutils 20-2272] Running write_bitstream with 4 threads.
Loading data files...
Loading site data...
Loading route data...
Processing options...
Creating bitmap...
Creating bitstream...
Bitstream compression saved 15746336 bits.
Writing bitstream ./au_top.bit...
Writing bitstream ./au_top.bin...
INFO: [Vivado 12-1842] Bitgen Completed Successfully.
INFO: [Project 1-120] WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
INFO: [Common 17-186] '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/usage_statistics_webtalk.xml' has been successfully sent to Xilinx on Mon Jan  3 14:08:44 2022. For additional details about this file, please refer to the WebTalk help file at /home/osboxes/tools/Xilinx/Vivado/2020.2/doc/webtalk_introduction.html.
INFO: [Common 17-83] Releasing license: Implementation
13 Infos, 0 Warnings, 0 Critical Warnings and 0 Errors encountered.
write_bitstream completed successfully
write_bitstream: Time (s): cpu = 00:00:08 ; elapsed = 00:00:20 . Memory (MB): peak = 3368.578 ; gain = 291.102 ; free physical = 459 ; free virtual = 10564
INFO: [Common 17-206] Exiting Vivado at Mon Jan  3 14:08:44 2022...
[Mon Jan  3 14:08:44 2022] impl_1 finished
wait_on_run: Time (s): cpu = 00:01:36 ; elapsed = 00:01:55 . Memory (MB): peak = 2361.902 ; gain = 0.000 ; free physical = 1980 ; free virtual = 12085
Bitstream generation completed
INFO: [Common 17-206] Exiting Vivado at Mon Jan  3 14:08:44 2022...
make[1]: Leaving directory '/home/osboxes/Documents/alchitry-au-fusesoc-cocotb/build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado'
alchitry-loader -p ./bin/au_loader.bin -r ./build/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1/au_top.bin
Found Au as device 0.
Programming FPGA...
Done.
```


[Alchitry Au]:          https://www.sparkfun.com/products/16527
[FuseSoC]:              https://fusesoc.readthedocs.io/en/stable/index.html
[command-line loader]:  https://github.com/chuckb/alchitry-loader
[Au Io]:                https://www.sparkfun.com/products/16525
[adder.vhdl]:           rtl/adder.vhdl
[Makefile]:             Makefile
[Vivado]:               https://www.xilinx.com/support/download.html
[VUnit]:                https://vunit.github.io/