COMPILER=nim c
OPTIONS=--opt=speed
BINARIES=prime

all: $(BINARIES)

clean:
	-\rm -rf nimcache

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $(BINARIES) ; do \
		../bench.rb ./$$binary | tee $$binary.log ; \
	done

prime: prime.nim
	$(COMPILER) $(OPTIONS) $+
