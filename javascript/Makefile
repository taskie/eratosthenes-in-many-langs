PROCESSOR := node
SCRIPTS := prime.js
LOGS := $(addsuffix .log, $(SCRIPTS))

.PHONY: all clean cleanlog clobber bench test

all:

clean:

cleanlog:
	-\rm $(LOGS)

clobber: clean

bench: $(LOGS)

%.log: %
	../bench.rb "$(PROCESSOR) $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "$(PROCESSOR) $<"
