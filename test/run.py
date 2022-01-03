#!/usr/bin/env python3

from pathlib import Path
from vunit import VUnit


VU = VUnit.from_argv()
#VU.add_osvvm()
#VU.add_verification_components()

RTL_PATH = Path(__file__).parent.parent / "rtl"
TB_PATH = Path(__file__).parent

VU.add_library("rtl_lib").add_source_files(RTL_PATH / "*.vhdl")
VU.add_library("tb_lib").add_source_files(TB_PATH / "*.vhdl")

# suppress these warnings: /home/osboxes/.local/lib/python3.9/site-packages/vunit/vhdl/check/src/check.vhd:1778:18:warning: declaration of "tracks" hides variable interface "tracks" [-Whide]
# TODO: Find out why they are spewing out...
VU.add_compile_option("ghdl.flags", ["-Wno-hide"], True)

VU.main()