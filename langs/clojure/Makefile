include ../header.mk

BINARIES := classes/Prime.class
LOGS := $(addsuffix .log, $(notdir $(BINARIES)))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	rm -f $(LOGS)

clobber: clean
	rm -f -rf classes/

bench: $(LOGS)

%.log: classes/%
	$(BENCH) "java -cp classes:/usr/share/clojure/clojure.jar Prime" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: classes/%
	$(BENCH) -t "java -cp classes:/usr/share/clojure/clojure.jar Prime"

$(BINARIES): Prime.clj
	mkdir -p classes
	clj compile.clj
