COMPILER := mcs
OPTIONS := -optimize+
BINARIES := Prime.exe PrimeLinq.exe
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
	../bench.rb "mono $<" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: %
	../bench.rb -t "mono $<"

%.exe: %.cs
	$(COMPILER) $(OPTIONS) $<
