COMPILER=gfortran
OPTIONS=-Wall -O3 -march=native -march=native
BINARIES=prime

all: $(BINARIES)

clean:

clobber: clean
	\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.f90
	$(COMPILER) $(OPTIONS) $+ -o $@
