builddir := ./build
vunitout := ./vunit_out
tested := .vunit.timestamp
bindir := $(builddir)/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1
binfile := $(bindir)/au_top.bin
bitfile := $(bindir)/au_top.bit
source := $(wildcard ./rtl/*.vhdl)
constraints := $(wildcard ./constraints/*.xdc)
test := $(wildcard ./test/*.vhdl)

$(binfile): $(source) $(constraints) $(tested)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

$(bitfile): $(source) $(constraints) $(tested)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

.PHONY: au_ram
au_ram: $(binfile)
	alchitry-loader -p ./bin/au_loader.bin -r $(binfile)

.PHONY: au_flash
au_flash: $(bitfile)
	alchitry-loader -p ./bin/au_loader.bin -f $(bitfile)

$(tested): $(source) $(test)
	./test/run.py
	# indicate test succeeded
	touch $(tested)

.PHONY: test
test: $(tested)

.PHONY: clean
clean:
	rm -rf $(builddir)
	rm -rf $(vunitout)
	rm -rf $(tested)