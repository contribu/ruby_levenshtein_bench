# frozen_string_literal: true

require 'benchmark/ips'
require 'levenshtein'

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  a = 'test text 1'
  b = 'text test 2'

  x.report('levenshtein short text') do
    Levenshtein.normalized_distance(a, b)
  end

  c = 'test text 1' * 100
  d = 'text test 2' * 100

  x.report('levenshtein long text') do
    Levenshtein.normalized_distance(c, d)
  end
end
