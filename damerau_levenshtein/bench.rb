# frozen_string_literal: true

require 'benchmark/ips'
require 'damerau-levenshtein'

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  a = 'test text 1'
  b = 'text test 2'

  x.report('damerau-levenshtein short text') do
    DamerauLevenshtein.distance(a, b)
  end

  c = 'test text 1' * 100
  d = 'text test 2' * 100

  x.report('damerau-levenshtein long text') do
    DamerauLevenshtein.distance(c, d)
  end
end
