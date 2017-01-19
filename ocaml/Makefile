COMPILER := ocamlopt
OPTIONS :=
BINARIES := prime prime_unsafe
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	rm -f $(addsuffix .cmi,$(BINARIES)) $(addsuffix .cmx,$(BINARIES))
	rm -f $(addsuffix .o,$(BINARIES))

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "./$<" | tee $@

test: $(addsuffix .test, $(BINARIES))

%.test: %
	../bench.rb -t "./$<"

prime: prime.ml
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_unsafe: prime.ml
	$(COMPILER) $(OPTIONS) -unsafe $+ -o $@
