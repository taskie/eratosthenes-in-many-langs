COMPILER=mcs
OPTIONS=-optimize+
BINARIES=Prime.exe PrimeLinq.exe

all: $(BINARIES)

clean:

clobber: clean
	-\rm $(BINARIES)

bench: $(BINARIES)
	for binary in $+; do \
		../bench.rb "mono $$binary" | tee $$binary.log; \
	done

Prime.exe: Prime.cs
	$(COMPILER) $(OPTIONS) $+

PrimeLinq.exe: PrimeLinq.cs
	$(COMPILER) $(OPTIONS) $+
