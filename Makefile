builddir := ./build
vunitout := ./vunit_out
testmapping := $(vunitout)/test_output/test_name_to_path_mapping.txt
bindir := $(builddir)/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1
binfile := $(bindir)/au_top.bin
bitfile := $(bindir)/au_top.bit
source := $(wildcard ./rtl/*.vhdl)
constraints := $(wildcard ./constraints/*.xdc)
test := $(wildcard ./test/*.vhdl)

$(binfile): $(source) $(constraints) $(testmapping)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

$(bitfile): $(source) $(constraints) $(testmapping)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

.PHONY: temp
temp: $(binfile)
	alchitry-loader -p ./bin/au_loader.bin -r $(binfile)

.PHONY: perm
perm: $(bitfile)
	alchitry-loader -p ./bin/au_loader.bin -f $(bitfile)

$(testmapping): $(source) $(test)
	./test/run.py

.PHONY: clean
clean:
	rm -rf $(builddir)
	rm -rf $(vunitout)