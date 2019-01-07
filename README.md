## Ruby Levenshtein Benchmark

There are some ruby libraries to calculate [levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance).
Which library should we use?

Benchmark target libraries

- [damerau-levenshtein](https://github.com/GlobalNamesArchitecture/damerau-levenshtein)
- [levenshtein](https://rubygems.org/gems/levenshtein/versions/0.2.2)
- [levenshtein-ffi](https://github.com/dbalatero/levenshtein-ffi)

Please note that require filename is conflicted so the bundler environment is separated.

## Conslusion

**Use damerau-levenshtein** because it supports UTF-8 and moderately fast on short text and long text.

|Gem|Short Text Performance|Long Text Performance|UTF-8 Support|
|:-:|:-:|:-:|:-:|
|gem 'damerau-levenshtein'|1.673M|8.370k|o|
|gem 'levenshtein'|98.976k|20.000|?|
|gem 'levenshtein-ffi'|5.860M|1.716k|x|

Performance: Bigger is fast

## Prepare

```bash
bundle install
```

## Run

```bash
ruby run_all.rb
```

## Results

```
run benchmark
Warming up --------------------------------------
damerau-levenshtein short text
                        28.847k i/100ms
damerau-levenshtein long text
                       135.000  i/100ms
Calculating -------------------------------------
damerau-levenshtein short text
                        345.211k (±16.5%) i/s -      1.673M in   5.010610s
damerau-levenshtein long text
                          1.708k (±16.5%) i/s -      8.370k in   5.061909s
Warming up --------------------------------------
levenshtein short text
                         2.062k i/100ms
levenshtein long text
                         1.000  i/100ms
Calculating -------------------------------------
levenshtein short text
                         20.006k (±13.4%) i/s -     98.976k in   5.093285s
levenshtein long text
                          3.817  (± 0.0%) i/s -     20.000  in   5.250539s
Warming up --------------------------------------
levenshtein-ffi short text
                        87.465k i/100ms
levenshtein-ffi long text
                        33.000  i/100ms
Calculating -------------------------------------
levenshtein-ffi short text
                          1.170M (± 2.5%) i/s -      5.860M in   5.010915s
levenshtein-ffi long text
                        340.802  (± 2.9%) i/s -      1.716k in   5.039697s
```

## UTF-8 Support

### damerau-levenshtein

>The damerau-levenshtein gem allows to find edit distance between two UTF-8 or ASCII encoded strings with O(N*M) efficiency.
>https://github.com/GlobalNamesArchitecture/damerau-levenshtein#damerau-levenshtein

damerau-levenshtein supports UTF-8

### levenshtein

We couldn't identify if levenshtein supports UTF-8.

### levenshtein-ffi

>The C extension uses char* strings, and so Unicode strings will give incorrect distances.
https://github.com/dbalatero/levenshtein-ffi#known-issues

levenshtein-ffi doesn't support UTF-8
