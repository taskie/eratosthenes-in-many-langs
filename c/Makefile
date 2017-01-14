COMPILER := gcc
COMPILER2 := clang
OPTIONS := -Wall -O3 -march=native -march=native -lm
BINARIES := prime prime_bitv prime_bitv_64 prime_bitv_sse4 prime_bitv_sse4_64 \
	prime_clang prime_bitv_clang prime_bitv_64_clang prime_bitv_sse4_clang prime_bitv_sse4_64_clang
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	-\rm $(LOGS)

clobber: clean
	-\rm $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "./$<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "./$<"

prime: prime.c
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_bitv: prime_bitv.c
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_bitv_64: prime_bitv.c
	$(COMPILER) $(OPTIONS) -DBITV_64BIT $+ -o $@

prime_bitv_sse4: prime_bitv.c
	$(COMPILER) $(OPTIONS) -DBITV_SSE4 $+ -o $@

prime_bitv_sse4_64: prime_bitv.c
	$(COMPILER) $(OPTIONS) -DBITV_64BIT -DBITV_SSE4 $+ -o $@

prime_clang: prime.c
	$(COMPILER2) $(OPTIONS) $+ -o $@

prime_bitv_clang: prime_bitv.c
	$(COMPILER2) $(OPTIONS) $+ -o $@

prime_bitv_64_clang: prime_bitv.c
	$(COMPILER2) $(OPTIONS) -DBITV_64BIT $+ -o $@

prime_bitv_sse4_clang: prime_bitv.c
	$(COMPILER2) $(OPTIONS) -DBITV_SSE4 $+ -o $@

prime_bitv_sse4_64_clang: prime_bitv.c
	$(COMPILER2) $(OPTIONS) -DBITV_64BIT -DBITV_SSE4 $+ -o $@
