SCRIPTS=prime.nut

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "squirrel $$script" | tee $$script.log; \
	done
