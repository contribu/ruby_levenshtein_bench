## Ruby Levenshtein Benchmark

Benchmark target libraries

- [damerau-levenshtein](https://github.com/GlobalNamesArchitecture/damerau-levenshtein)
- [levenshtein](https://rubygems.org/gems/levenshtein/versions/0.2.2)
- [levenshtein-ffi](https://github.com/dbalatero/levenshtein-ffi)

Please note that require filename is conflicted so the bundler environment is separated.

## Conslusion

Fast <---> Slow
levenshtein-ffi > damerau-levenshtein >>>> levenshtein

## Prepare

```bash
bundle install
```

## run

```bash
ruby run_all.rb
```

## Results

```
run benchmark
Warming up --------------------------------------
 damerau-levenshtein    30.769k i/100ms
Calculating -------------------------------------
 damerau-levenshtein    379.998k (±10.9%) i/s -      1.877M in   5.032830s
Warming up --------------------------------------
         levenshtein     2.080k i/100ms
Calculating -------------------------------------
         levenshtein     21.205k (± 4.7%) i/s -    106.080k in   5.013985s
Warming up --------------------------------------
     levenshtein-ffi    93.283k i/100ms
Calculating -------------------------------------
     levenshtein-ffi      1.126M (±14.6%) i/s -      5.504M in   5.016091s
```
