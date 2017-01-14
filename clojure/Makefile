BINARIES=classes/Prime.class

all: $(BINARIES)

clean:

clobber: clean
	-\rm -rf classes/

bench: $(BINARIES)
	../bench.rb "java -cp classes:/usr/share/clojure/clojure.jar Prime" | tee Prime.class.log

classes/Prime.class: Prime.clj
	mkdir -p classes
	clj compile.clj
