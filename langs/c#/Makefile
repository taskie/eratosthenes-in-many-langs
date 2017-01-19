include ../header.mk

COMPILER := mcs
OPTIONS := -optimize+
BINARIES := Prime.exe PrimeLinq.exe
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	$(BENCH) "mono $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	$(BENCH) -t "mono $<"

%.exe: %.cs
	$(COMPILER) $(OPTIONS) $<
