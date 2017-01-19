include ../header.mk

PROCESSOR := sbcl --script
PROCESSOR2 := clisp
COMPILER := $(PROCESSOR) compile.lisp
COMPILER2 := $(PROCESSOR2) -c
BINARIES := prime.fasl prime.fas prime_nobit.fasl prime_nobit.fas
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	rm -f $(patsubst %.fas,%.lib,$(filter %.fas,$(BINARIES)))

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.fasl.log: %.fasl
	$(BENCH) "$(PROCESSOR) $<" | tee $@

%.fas.log: %.fas
	$(BENCH) "$(PROCESSOR2) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.fasl.test: %.fasl
	$(BENCH) -t "$(PROCESSOR) $<"

%.fas.test: %.fas
	$(BENCH) -t "$(PROCESSOR2) $<"

%.fasl: %.lisp
	$(COMPILER) $<

%.fas: %.lisp
	$(COMPILER2) $<
