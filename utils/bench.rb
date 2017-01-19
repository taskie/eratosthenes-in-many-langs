#!/usr/bin/env ruby

require 'benchmark'
require 'json'
require 'optparse'
require 'pathname'

repeat = 5
wall_time = 5.0
test_mode = false

opt = OptionParser.new
opt.on('-n TIMES', 'number of trials') {|v| repeat = v.to_i }
opt.on('-w WALLTIME', 'time limit') {|v| wall_time = v.to_f }
opt.on('-t', 'test mode') {|v| test_mode = v; repeat = 1 }
opt.parse!(ARGV)

exit 1 if $*.empty?
command = $*.join(' ')

pwd = Pathname.pwd
project_dir = Pathname(__FILE__).dirname.parent.expand_path

puts "# #{pwd.relative_path_from(project_dir).to_s}"
puts "# " + command

test_hash = nil
File.open(File.join(File.dirname($0), 'test.json')) do |file|
  test_hash = JSON.load(file)
end

ns =
  if test_mode
    [0, 1, 2, 3, 4, 5, 10, 100, 1000, 10000]
  else
    [0] + (30 .. 60).map{|x| (2 ** (x / 2.0)).to_i}
  end

ns.each do |n|
  results = []
  repeat.times do
    out = nil
    result = Benchmark.measure do
      out = `#{command} #{n}`
    end
    expected = test_hash[n.to_s]
    mes = "n: #{n}, expected: #{expected}, output: #{out.to_i}"
    if expected != out.to_i
      STDERR.puts mes
      exit 1
    end
    puts mes if test_mode
    results << result.total
  end
  next if test_mode
  results.sort!
  min = results.first
  med = if repeat % 2 == 0
          (results[repeat / 2 - 1] + results[repeat / 2]) / 2
        else
          results[repeat / 2]
        end
  max = results.last
  avg = results.inject{|sum, x| sum + x} / results.size
  var = results.inject(0){|sum, x| sum + (x - avg) ** 2} / (results.size - 1)
  stddev = Math.sqrt(var)
  puts [n, min, med, max, avg, stddev].join("\t")
  break if min >= wall_time
end
