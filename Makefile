COMPILER=gcc
OPTIONS=-Wall -O3 -march=native -march=native -lm
BINARIES=prime prime_bitv prime_bitv_64 prime_bitv_sse4 prime_bitv_sse4_64
DIRECTORIES := c c\# c++ clojure commonlisp d fortran go haskell java \
	javascript julia lua nim objective-c ocaml perl php python ruby rust \
	scala scheme squirrel swift

.PHONY: all clean clobber $(DIRECTORIES)

all: $(DIRECTORIES)

$(DIRECTORIES):
	$(MAKE) -C $@
