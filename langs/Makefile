DIRECTORIES := $(wildcard */)

.PHONY: all clean cleanlog clobber test

all:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) all;)

clean:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) clean;)

cleanlog:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) cleanlog;)

clobber:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) clobber;)

test:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) test;)

bench:
	$(foreach DIR,$(DIRECTORIES),$(MAKE) -C $(DIR) bench;)
