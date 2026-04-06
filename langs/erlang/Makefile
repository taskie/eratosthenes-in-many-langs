include ../header.mk

COMPILER := erlc
BINARIES := prime prime_atomics
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	rm -f prime.beam prime_atomics.beam

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

prime: prime.erl
	$(COMPILER) $<
	echo '#!/bin/sh' > $@
	echo 'DIR=$$(dirname "$$0")' >> $@
	echo 'erl -noshell -pa "$$DIR" -run prime main -- "$$@"' >> $@
	chmod +x $@

prime_atomics: prime_atomics.erl
	$(COMPILER) $<
	echo '#!/bin/sh' > $@
	echo 'DIR=$$(dirname "$$0")' >> $@
	echo 'erl -noshell -pa "$$DIR" -run prime_atomics main -- "$$@"' >> $@
	chmod +x $@
