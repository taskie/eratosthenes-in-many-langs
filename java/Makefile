COMPILER=javac
OPTIONS=-O
BINARIES=Prime.class

all: $(BINARIES)

clean:

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	../bench.rb "java Prime" | tee Prime.class.log

Prime.class: Prime.java
	$(COMPILER) $(OPTIONS) $+
