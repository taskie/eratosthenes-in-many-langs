SCRIPTS=prime.jl

all:

clean:

clobber: clean

bench:
	for script in $(SCRIPTS) ; do \
		../bench.rb "julia $$script" | tee $$script.log; \
	done
