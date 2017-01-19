COMPILER := javac
OPTIONS := -O
BINARIES := Prime.class
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	../bench.rb "java $(basename $<)" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "java $(basename $<)"

%.class: %.java
	$(COMPILER) $(OPTIONS) $+
