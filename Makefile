DIRECTORIES := c c\# c++ clojure commonlisp d fortran go haskell java \
	javascript julia lua nim ocaml perl php python ruby rust scala \
	scheme squirrel

.PHONY: all clean cleanlog clobber test $(DIRECTORIES)

all: $(DIRECTORIES)

$(DIRECTORIES):
	$(MAKE) -C $@

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
