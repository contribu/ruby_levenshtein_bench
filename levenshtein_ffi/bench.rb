# frozen_string_literal: true

require 'benchmark/ips'
require 'levenshtein-ffi'

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  a = 'test text 1'
  b = 'text test 2'

  x.report('levenshtein-ffi') do
    Levenshtein.distance(a, b)
  end

  x.compare!
end
