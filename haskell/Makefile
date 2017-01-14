COMPILER=ghc
OPTIONS=-O
BINARIES=prime prime_unsafe

all: $(BINARIES)

clean:
	-rm prime.hi prime.o prime_unsafe.hi prime_unsafe.o

clobber: clean
	-rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.hs
	$(COMPILER) $(OPTIONS) $+ -o $@

prime_unsafe: prime_unsafe.hs
	$(COMPILER) $(OPTIONS) $+ -o $@
