SCRIPTS=prime.rb

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "ruby $$script" | tee $$script.log; \
	done
