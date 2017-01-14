SCRIPTS=prime.php

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "php $$script" | tee $$script.log; \
	done
