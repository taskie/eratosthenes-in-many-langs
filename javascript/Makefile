SCRIPTS=prime.js

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "node $$script" | tee $$script.log; \
	done
