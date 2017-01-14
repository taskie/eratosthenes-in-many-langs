COMPILER=g++
OPTIONS=-Wall -O3 -march=native -march=native
BINARIES=prime prime_char

all: $(BINARIES)

clean:

clobber: clean
	\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.cc
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_char: prime_char.cc
	$(COMPILER) $(OPTIONS) $+ -o $@
