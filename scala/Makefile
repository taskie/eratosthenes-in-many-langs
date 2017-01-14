COMPILER=scalac
OPTIONS=-opt:_
OBJECTS=Prime$$.class
BINARIES=Prime.class

all: $(BINARIES)

clean:
	-\rm $(OBJECTS)

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	../bench.rb "scala Prime" | tee Prime.class.log

Prime.class: Prime.scala
	$(COMPILER) $(OPTIONS) $+
