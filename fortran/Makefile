COMPILER := gfortran
OPTIONS := -Wall -O3 -march=native -march=native
BINARIES := prime
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

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

prime: prime.f90
	$(COMPILER) $(OPTIONS) $+ -o $@
