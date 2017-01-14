COMPILER=rustc
OPTIONS=-O
BINARIES=prime

all: $(BINARIES)

clean:

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.rs
	$(COMPILER) $(OPTIONS) $+ -o $@
