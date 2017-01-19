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
	../bench.rb "$(PROCESSOR) $<" | tee $@

%.jit.log: %
	../bench.rb "$(PROCESSOR2) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "$(PROCESSOR) $<"

%.jit.test: %
	../bench.rb -t "$(PROCESSOR2) $<"
