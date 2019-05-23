include ../Tools/OMicroB/etc/Makefile.conf

SOURCES := quicksort.ml
TARGETS := quicksort.byte quicksort.c quicksort.elf quicksort.pic32_elf quicksort.hex
ATTY := /dev/ttyACM0

all: $(TARGETS)

$(TARGETS): $(SOURCES)
	$(BIN)/omicrob -v $^ -mlopt -verbose -stack-size 200 -heap-size 200

flash: quicksort.hex
	sudo ./reset.py $(ATTY)
	$(BIN)/omicrob -flash -sudo $<


clean:
	@rm -f *.cmo *.cmi *.avr
	@rm -f sketch.ld.*
	@rm -f $(TARGETS)

.PHONY: all clean
