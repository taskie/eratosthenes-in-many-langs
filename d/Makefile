COMPILER=dmd
OPTIONS=-O
OBJECTS=prime.o
BINARIES=prime

all: $(BINARIES)

clean:
	-\rm $(OBJECTS)

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.d
	$(COMPILER) $(OPTIONS) $+ -of=$@
