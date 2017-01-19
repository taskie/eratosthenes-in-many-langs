include ../header.mk

PROCESSOR := lua
PROCESSOR2 := luajit
SCRIPTS := prime.lua
LOGS := $(addsuffix .log, $(SCRIPTS)) $(addsuffix .jit.log, $(SCRIPTS))

.PHONY: all clean cleanlog clobber bench test

all:

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean

bench: $(LOGS)

%.log: %
	$(BENCH) "$(PROCESSOR) $<" | tee $@

%.jit.log: %
	$(BENCH) "$(PROCESSOR2) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	$(BENCH) -t "$(PROCESSOR) $<"

%.jit.test: %
	$(BENCH) -t "$(PROCESSOR2) $<"
