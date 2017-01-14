COMPILER=ocamlopt
OPTIONS=
OBJECTS=prime.cmi prime.cmx prime.o
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

prime: prime.ml
	$(COMPILER) $(OPTIONS) $+ -o $@
