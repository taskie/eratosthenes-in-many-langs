include ../header.mk

PROCESSOR := zsh
SCRIPTS := prime.zsh prime2.zsh
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
