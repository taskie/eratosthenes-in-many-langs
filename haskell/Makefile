COMPILER := ghc
OPTIONS := -O
BINARIES := prime prime_unsafe
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	rm -f $(addsuffix .hi, $(BINARIES)) $(addsuffix .o, $(BINARIES))

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "./$<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "./$<"

prime: prime.hs
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_unsafe: prime_unsafe.hs
	$(COMPILER) $(OPTIONS) $+ -o $@
