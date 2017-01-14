COMPILER=go build
OPTIONS=
BINARIES=prime

all: $(BINARIES)

clean:

clobber: clean
	\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.go
	$(COMPILER) $(OPTIONS) $+
