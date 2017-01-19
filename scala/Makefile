COMPILER := scalac
OPTIONS := -opt:_
BINARIES := Prime.class
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	rm -f $(patsubst %.class,%$$.class,$(BINARIES))

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "scala $(basename $<)" | tee $@

test: $(addsuffix .test, $(BINARIES))

%.test: %
	../bench.rb -t "scala $(basename $<)"

%.class: %.scala
	$(COMPILER) $(OPTIONS) $+
