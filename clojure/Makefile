BINARIES := classes/Prime.class
LOGS := $(addsuffix .log, $(notdir $(BINARIES)))

.PHONY: all clean cleanlog clobber bench test

all: $(BINARIES)

clean:

cleanlog:
	-\rm $(LOGS)

clobber: clean
	-\rm -rf classes/

bench: $(LOGS)

%.log: classes/%
	../bench.rb "java -cp classes:/usr/share/clojure/clojure.jar Prime" | tee $@

test: $(patsubst %.log,%.test,$(LOGS))

%.test: classes/%
	../bench.rb -t "java -cp classes:/usr/share/clojure/clojure.jar Prime"

$(BINARIES): Prime.clj
	mkdir -p classes
	clj compile.clj
