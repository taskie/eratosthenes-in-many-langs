include ../header.mk

COMPILER := g++
COMPILER2 := clang++
OPTIONS := -Wall -O3 -march=native -march=native -std=c++17
BINARIES := prime prime_char prime_clang prime_char_clang
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

prime: prime.cc
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_char: prime_char.cc
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_clang: prime.cc
	$(COMPILER2) $(OPTIONS) $+ -o $@

prime_char_clang: prime_char.cc
	$(COMPILER2) $(OPTIONS) $+ -o $@
