# versions of compilers and processors

## Bash

* `bash --version | head -1`
    + GNU bash, version 4.4.19(1)-release (x86_64-unknown-linux-gnu)

## C

* `gcc --version | head -1`
    + gcc (GCC) 7.3.1 20180312
* `clang --version | head -1`
    + clang version 6.0.0 (tags/RELEASE_600/final)

## C++

* `g++ --version | head -1`
    + g++ (GCC) 7.3.1 20180312
* `clang++ --version | head -1`
    + clang version 6.0.0 (tags/RELEASE_600/final)

## C\# #

* `mono --version | head -1`
    + Mono JIT compiler version 5.10.0 (makepkg/dac60775616 Thu Mar 22 02:05:14 CET 2018)
* `mcs --version | head -1`
    + Mono C# compiler version 5.10.0.0

## Clojure

* `clojure -e "(println (clojure-version))"`
    + 1.9.0

## Common Lisp

* `sbcl --version | head -1`
    + SBCL 1.4.0
* `clisp --version | head -1`
    + GNU CLISP 2.49 (2010-07-07) (built on foutrelis)

## D

* `dmd --version | head -1`
    + DMD64 D Compiler v2.079.0
* `ldc --version | head -2`
    + LDC - the LLVM D compiler (1.8.0): based on DMD v2.078.3 and LLVM 6.0.0

## Fortran

* `gfortran --version | head -1`
    + GNU Fortran (GCC) 7.3.1 20180312

## Go

* `go version | head -1`
    + go version go1.10 linux/amd64

## Groovy

* `groovy -v 2>&1 | tail -1`
    + Groovy Version: 2.4.14 JVM: 1.8.0_162 Vendor: Oracle Corporation OS: Linux

## Haskell

* `stack ghc -- --version | head -1`
    + The Glorious Glasgow Haskell Compilation System, version 8.2.2

## Java

* `java -version 2>&1 | tail -1`
    + OpenJDK 64-Bit Server VM (build 25.162-b12, mixed mode)
* `javac -version 2>&1 | tail -1`
    + javac 1.8.0_162

## JavaScript

* `node --version | head -1`
    + v9.10.0

## Julia

* `julia --version | head -1`
    + julia version 0.6.2

## Kotlin

* `kotlin -version`
    + Kotlin version 1.2.30-release-78 (JRE 1.8.0_162-b12)

## Lua

* `lua -v | head -1`
    + Lua 5.3.4  Copyright (C) 1994-2017 Lua.org, PUC-Rio
* `luajit -v | head -1`
    + LuaJIT 2.0.5 -- Copyright (C) 2005-2017 Mike Pall. http://luajit.org/

## Nim

* `nim --version 2>&1 | head -1`
    + Nim Compiler Version 0.18.0 [Linux: amd64]

## OCaml

* `ocaml --version | head -1`
    + The OCaml toplevel, version 4.06.0

## Perl

* `perl --version | head -2 | tail -1`
    + This is perl 5, version 26, subversion 1 (v5.26.1) built for x86_64-linux-thread-multi

## PHP

* `php -v | head -1`
    + PHP 7.2.3 (cli) (built: Mar  1 2018 16:50:09) ( NTS )

## Python

* `python --version 2>&1 | head -1`
    + Python 3.6.4

## Ruby

* `ruby --version | head -1`
    + ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]

## Rust

* `rustc --version | head -1`
    + rustc 1.24.0 (4d90ac38c 2018-02-12)

## Scala

* `scala -version 2>&1 | tail -1`
    + Scala code runner version 2.12.4-20171023-143547-unknown -- Copyright 2002-2017, LAMP/EPFL and Lightbend, Inc.
* `scalac -version 2>&1 | tail -1`
    + Scala compiler version 2.12.4-20171023-143547-unknown -- Copyright 2002-2017, LAMP/EPFL and Lightbend, Inc.

## Scheme

* `gosh -V | head -1`
    + Gauche scheme shell, version 0.9.5 [utf-8,pthreads], x86_64-pc-linux-gnu

## Squirrel

* `squirrel -version | head -1`
    + Squirrel 3.1 stable Copyright (C) 2003-2016 Alberto Demichelis (64 bits)

