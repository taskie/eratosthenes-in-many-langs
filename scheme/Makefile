SCRIPTS=prime.scm

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "gosh $$script" | tee $$script.log; \
	done
