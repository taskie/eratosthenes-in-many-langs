SCRIPTS=prime.pl

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "perl $$script" | tee $$script.log; \
	done
