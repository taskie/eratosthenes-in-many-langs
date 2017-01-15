#!/usr/bin/env ruby

puts "# versions of compilers and processors"
puts

commands_for_lang = {
  'C' => ['gcc --version | head -1', 'clang --version | head -1'],
  'C++' => ['g++ --version | head -1', 'clang++ --version | head -1'],
  'C\#' => ['mono --version | head -1', 'mcs --version | head -1'],
  'Clojure' => ['clj -e "(println (clojure-version))"'],
  'Common Lisp' => ['sbcl --version | head -1', 'clisp --version | head -1'],
  'D' => ['dmd --version | head -1', 'ldc --version | head -2'],
  'Fortran' => ['gfortran --version | head -1'],
  'Go' => ['go version | head -1'],
  'Haskell' => ['ghc --version | head -1'],
  'Java' => ['java -version 2>&1 | tail -1', 'javac -version 2>&1 | tail -1'],
  'JavaScript' => ['node --version | head -1'],
  'Julia' => ['julia --version | head -1'],
  'Lua' => ['lua -v | head -1', 'luajit -v | head -1'],
  'Nim' => ['nim --version 2>&1 | head -1'],
  'OCaml' => ['ocaml --version | head -1'],
  'Perl' => ['perl --version | head -2 | tail -1'],
  'PHP' => ['php -v | head -1'],
  'Python' => ['python --version 2>&1 | head -1'],
  'Ruby' => ['ruby --version | head -1'],
  'Rust' => ['rustc --version | head -1'],
  'Scala' => ['scala -version 2>&1 | tail -1', 'scalac -version 2>&1 | tail -1'],
  'Scheme' => ['gosh -V | head -1'],
  'Squirrel' => ['squirrel -version | head -1'],
}

commands_for_lang.each do |lang, commands|
  puts "## #{lang}"
  puts
  commands.each do |command|
    puts "* `#{command}`"
    puts "    + " + `#{command}`.split("\n").map{|s| s.strip}.join(' ')
  end
  puts
end
