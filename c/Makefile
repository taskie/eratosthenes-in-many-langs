COMPILER=gcc
OPTIONS=-Wall -O3 -march=native -march=native -lm
BINARIES=prime prime_bitv prime_bitv_64 prime_bitv_sse4 prime_bitv_sse4_64

all: $(BINARIES)

clean:

clobber: clean
	\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

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
