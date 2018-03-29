include ../header.mk

COMPILER := kotlinc
OPTIONS :=
BINARIES := PrimeKt.class
LOGS := $(addsuffix .log, $(BINARIES))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -rf META-INF/
	rm -f $(BINARIES)

bench: $(LOGS)

%.log: %
	$(BENCH) "kotlin $(basename $<)" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	$(BENCH) -t "kotlin $(basename $<)"

%Kt.class: %.kt
	$(COMPILER) $(OPTIONS) $+
