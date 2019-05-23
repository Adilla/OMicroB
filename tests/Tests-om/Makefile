include ../../etc/Makefile.conf

SOURCES := oSoli_let.ml
TARGETS := oSoli_let.byte oSoli_let.c oSoli_let.elf oSoli_let.pic32_elf oSoli_let.hex
ATTY := /dev/ttyACM0

all: $(TARGETS)

$(TARGETS): $(SOURCES)
	$(BIN)/omicrob -v $^ -mlopt -verbose -stack-size 200 -heap-size 200

flash: oSoli_let.hex
	sudo ./reset.py $(ATTY)
	$(BIN)/omicrob -flash -sudo $<


clean:
	@rm -f *.cmo *.cmi *.avr
	@rm -f sketch.ld.*
	@rm -f $(TARGETS)

.PHONY: all clean
