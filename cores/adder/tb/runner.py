from edalize.vunit_hooks import VUnitHooks
from vunit import VUnit

class VUnitRunner(VUnitHooks):
    # Override the main hook to shut up needless warnings
    def main(self, vu: VUnit):
        # suppress warnings like these: /home/osboxes/.local/lib/python3.9/site-packages/vunit/vhdl/check/src/check.vhd:1778:18:warning: declaration of "tracks" hides variable interface "tracks" [-Whide]
        # TODO: Find out why they are spewing out...
        vu.add_compile_option("ghdl.a_flags", ["-Wno-hide"], True)
        super().main(vu)
