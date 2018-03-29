DIRECTORIES := bash c c\# c++ clojure commonlisp d fortran go groovy haskell java \
	javascript julia kotlin lua nim ocaml perl php python ruby rust scala \
	scheme squirrel

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
