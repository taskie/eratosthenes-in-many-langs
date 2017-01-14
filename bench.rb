#!/usr/bin/env ruby

require 'benchmark'
require 'json'
require 'optparse'

repeat = 5
wall_time = 5.0

opt = OptionParser.new
opt.on('-n TIMES') {|v| repeat = v.to_i }
opt.on('-t WALLTIME') {|v| wall_time = v.to_f }
opt.parse!(ARGV)

exit 1 if $*.empty?
command = $*.join(" ")

test_hash = nil
File.open(File.join(File.dirname($0), "test.json")) do |file|
  test_hash = JSON.load(file)
end

ns = [0,1,2,3,4,5,10,100,1000,10000].concat (30 .. 60).map{|x| (2 ** (x / 2.0)).to_i}


ns.each do |n|
  results = []
  repeat.times do
    out = nil
    result = Benchmark.measure do
      out = `#{command} #{n}`
    end
    if test_hash[n.to_s] != out.to_i
      STDERR.puts "expected: #{n}, output: #{out.to_i}"
      exit 1
    end
    results << result.total
  end
  results.sort!
  min = results.first
  med = if repeat % 2 == 0
          (results[repeat / 2 - 1] + results[repeat / 2]) / 2
        else
          results[repeat / 2]
        end
  max = results.last
  avg = results.inject{|x, y| x + y} / results.size
  var = results.inject{|x, y| y + (x - avg) ** 2} / (results.size - 1)
  stddev = Math.sqrt(var)
  puts [n, min, med, max, avg, stddev].join("\t")
  break if min >= wall_time
end
