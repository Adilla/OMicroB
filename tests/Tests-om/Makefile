include ../../etc/Makefile.conf

SOURCES := oSyrac.ml
TARGETS := oSyrac.byte oSyrac.c oSyrac.elf oSyrac.pic32_elf oSyrac.hex
ATTY := /dev/ttyACM0

all: $(TARGETS)

$(TARGETS): $(SOURCES)
	$(BIN)/omicrob -v $^ -mlopt -verbose -stack-size 200 -heap-size 200

flash: oSyrac.hex
	sudo ./reset.py $(ATTY)
	$(BIN)/omicrob -flash -sudo $<


clean:
	@rm -f *.cmo *.cmi *.avr
	@rm -f sketch.ld.*
	@rm -f $(TARGETS)

.PHONY: all clean
