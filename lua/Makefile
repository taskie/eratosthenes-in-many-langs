SCRIPTS=prime.lua

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "luajit $$script" | tee $$script.log; \
	done
