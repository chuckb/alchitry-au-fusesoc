import cocotb
import subprocess
import os
from pathlib import Path

# Get the path of the cocotb library
cocotb_base_dir = Path(cocotb.__file__).parent
# Get the ghdl vpi module...note - portability for Windows needed - if I cared...
vpi_lib = cocotb_base_dir / "libs/libcocotbvpi_ghdl.so"
# Build the vpi flag. It would be great if ghdl could look at current directory instead of needing absolute path.
vpi_flag = "--vpi=" + vpi_lib.as_posix()
# Make sure that the vpi file exists
if (vpi_lib.exists()):
    # Copy the current environment...otherwise GUI will not run because X settings will not be in the env.
    my_env = os.environ.copy()
    # Add the python module containing the cocotb tests to the environment.
    my_env["MODULE"] = "gui"
    # Run ghdl...note that toplevel and std is repeated here. Is there a way to lift these flags from FuseSoC?
    subprocess.run(["ghdl", "-r", "--std=93c", "adder", vpi_flag], env=my_env)
else:
    print("Cocotb vpi lib for ghdl not found.")
    exit(1)
