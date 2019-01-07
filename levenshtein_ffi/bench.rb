# frozen_string_literal: true

require 'benchmark/ips'
require 'levenshtein-ffi'

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  a = 'test text 1'
  b = 'text test 2'

  x.report('levenshtein-ffi short text') do
    Levenshtein.distance(a, b)
  end

  c = 'test text 1' * 100
  d = 'text test 2' * 100

  x.report('levenshtein-ffi long text') do
    Levenshtein.distance(c, d)
  end
end
