include ../header.mk

COMPILER := gfortran
OPTIONS := -Wall -O3 -march=native -march=native
BINARIES := prime
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
	$(BENCH) "./$<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	$(BENCH) -t "./$<"

prime: prime.f90
	$(COMPILER) $(OPTIONS) $+ -o $@
