COMPILER := scalac
OPTIONS := -opt:_
BINARIES := Prime.class
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:
	-\rm $(patsubst %.class,%$$.class,$(BINARIES))

cleanlog:
	-\rm $(LOGS)

clobber: clean
	-\rm $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "scala $(basename $<)" | tee $@

test: $(addsuffix .test, $(BINARIES))

%.test: %
	../bench.rb -t "scala $(basename $<)"

%.class: %.scala
	$(COMPILER) $(OPTIONS) $+
