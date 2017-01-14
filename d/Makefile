COMPILER := dmd
COMPILER2 := ldc
OPTIONS := -O
BINARIES := prime prime_ldc
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	-\rm $(addsuffix .o, $(BINARIES))

cleanlog:
	-\rm $(LOGS)

clobber: clean
	-\rm $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "./$<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "./$<"

prime: prime.d
	$(COMPILER) $(OPTIONS) $+ -of=$@

prime_ldc: prime.d
	$(COMPILER2) $(OPTIONS) $+ -of=$@
