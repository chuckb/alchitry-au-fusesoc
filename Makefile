builddir := ./build
bindir := $(builddir)/chuckb_examples_alchitry-au-fusesoc_1.0.0/synth-vivado/chuckb_examples_alchitry-au-fusesoc_1.0.0.runs/impl_1
binfile := $(bindir)/au_top.bin
bitfile := $(bindir)/au_top.bit
source := $(wildcard ./rtl/*.vhdl)
constraints := $(wildcard ./data/*.xdc)

$(binfile): $(source) $(constraints)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

$(bitfile): $(source) $(constraints)
	fusesoc --cores-root=$(PWD) run --target=synth --build chuckb:examples:alchitry-au-fusesoc:1.0.0

.PHONY: temp
temp: $(binfile)
	alchitry-loader -p ./bin/au_loader.bin -r $(binfile)

.PHONY: perm
perm: $(bitfile)
	alchitry-loader -p ./bin/au_loader.bin -f $(bitfile)

.PHONY: clean
clean:
	rm -r $(builddir)