# frozen_string_literal: true

puts 'prepare'
puts `(cd damerau_levenshtein && bundle install)`
puts `(cd levenshtein && bundle install)`
puts `(cd levenshtein_ffi && bundle install)`

puts 'run benchmark'
puts `(cd damerau_levenshtein && bundle exec ruby bench.rb)`
puts `(cd levenshtein && bundle exec ruby bench.rb)`
puts `(cd levenshtein_ffi && bundle exec ruby bench.rb)`
