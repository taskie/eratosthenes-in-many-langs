PROCESSOR := sbcl --script
PROCESSOR2 := clisp
COMPILER := $(PROCESSOR) compile.lisp
COMPILER2 := $(PROCESSOR2) -c
BINARIES := prime.fasl prime.fas prime_nobit.fasl prime_nobit.fas
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	-\rm $(patsubst %.fas,%.lib,$(filter %.fas,$(BINARIES)))

cleanlog:
	-\rm $(LOGS)

clobber: clean
	-\rm $(BINARIES)

bench: $(LOGS)

%.fasl.log: %.fasl
	../bench.rb "$(PROCESSOR) $<" | tee $@

%.fas.log: %.fas
	../bench.rb "$(PROCESSOR2) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.fasl.test: %.fasl
	../bench.rb -t "$(PROCESSOR) $<"

%.fas.test: %.fas
	../bench.rb -t "$(PROCESSOR2) $<"

%.fasl: %.lisp
	$(COMPILER) $<

%.fas: %.lisp
	$(COMPILER2) $<
