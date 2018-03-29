include ../header.mk

PROCESSOR := bash
SCRIPTS := prime.bash
LOGS := $(addsuffix .log, $(SCRIPTS))

.PHONY: all clean cleanlog clobber bench test

all:

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean

bench: $(LOGS)

%.log: %
	$(BENCH) "$(PROCESSOR) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	$(BENCH) -t "$(PROCESSOR) $<"
