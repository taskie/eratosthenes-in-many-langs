SCRIPTS=prime.py prime_numpy.py

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "python $$script" | tee $$script.log; \
	done
