# versions of compilers and processors

## C

* `gcc --version | head -1`
    + gcc (GCC) 6.3.1 20170109
* `clang --version | head -1`
    + clang version 3.9.1 (tags/RELEASE_391/final)

## C++

* `g++ --version | head -1`
    + g++ (GCC) 6.3.1 20170109
* `clang++ --version | head -1`
    + clang version 3.9.1 (tags/RELEASE_391/final)

## C#

* `mono --version | head -1`
    + Mono JIT compiler version 4.6.1 (Stable 4.6.1.3/abb06f1 Mon Oct  3 07:51:42 UTC 2016)
* `mcs --version | head -1`
    + Mono C# compiler version 4.6.1.0

## Clojure

* `clj -e "(println (clojure-version))"`
    + 1.8.0

## Common Lisp

* `sbcl --version | head -1`
    + SBCL 1.3.12
* `clisp --version | head -1`
    + GNU CLISP 2.49 (2010-07-07) (built on foutrelis)

## D

* `dmd --version | head -1`
    + DMD64 D Compiler v2.072.2
* `ldc --version | head -2`
    + LDC - the LLVM D compiler (1.0.0): based on DMD v2.070.2 and LLVM 3.8.0

## Fortran

* `gfortran --version | head -1`
    + GNU Fortran (GCC) 6.3.1 20170109

## Go

* `go version | head -1`
    + go version go1.7.4 linux/amd64

## Haskell

* `ghc --version | head -1`
    + The Glorious Glasgow Haskell Compilation System, version 8.0.1

## Java

* `java -version 2>&1 | tail -1`
    + OpenJDK 64-Bit Server VM (build 25.112-b15, mixed mode)
* `javac -version 2>&1 | tail -1`
    + javac 1.8.0_112

## JavaScript

* `node --version | head -1`
    + v5.6.0

## Julia

* `julia --version | head -1`
    + julia version 0.5.0

## Lua

* `lua -v | head -1`
    + Lua 5.3.3  Copyright (C) 1994-2016 Lua.org, PUC-Rio
* `luajit -v | head -1`
    + LuaJIT 2.0.4 -- Copyright (C) 2005-2015 Mike Pall. http://luajit.org/

## Nim

* `nim --version 2>&1 | head -1`
    + Nim Compiler Version 0.15.0 (2016-10-04) [Linux: amd64]

## OCaml

* `ocaml --version | head -1`
    + The OCaml toplevel, version 4.04.0

## Perl

* `perl --version | head -2 | tail -1`
    + This is perl 5, version 24, subversion 0 (v5.24.0) built for x86_64-linux-thread-multi

## PHP

* `php -v | head -1`
    + PHP 7.0.14 (cli) (built: Dec  7 2016 17:11:27) ( NTS )

## Python

* `python --version 2>&1 | head -1`
    + Python 3.6.0

## Ruby

* `ruby --version | head -1`
    + ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-linux]

## Rust

* `rustc --version | head -1`
    + rustc 1.16.0-nightly (1a2ed98d3 2017-01-13)

## Scala

* `scala -version 2>&1 | tail -1`
    + Scala code runner version 2.12.1-20161205-201300-2787b47 -- Copyright 2002-2016, LAMP/EPFL and Lightbend, Inc.
* `scalac -version 2>&1 | tail -1`
    + Scala compiler version 2.12.1-20161205-201300-2787b47 -- Copyright 2002-2016, LAMP/EPFL and Lightbend, Inc.

## Scheme

* `gosh -V | head -1`
    + Gauche scheme shell, version 0.9.5 [utf-8,pthreads], x86_64-pc-linux-gnu

## Squirrel

* `squirrel -version | head -1`
    + Squirrel 3.1 stable Copyright (C) 2003-2016 Alberto Demichelis (64 bits)

