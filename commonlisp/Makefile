COMPILER=sbcl --script compile.lisp
BINARIES=prime.fasl prime_nobit.fasl

all: $(BINARIES)

clean:

clobber: clean
	\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb "sbcl --script $$binary" | tee $$binary.log ; \
	done

prime.fasl: prime.lisp
	$(COMPILER) $+

prime_nobit.fasl: prime_nobit.lisp
	$(COMPILER) $+
