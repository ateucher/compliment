# Generate a randomized compliment

`compliment()` creates one or more randomized compliments by combining a
randomly chosen sentence template with randomly chosen adjectives and
nouns. Call [`set.seed()`](https://rdrr.io/r/base/Random.html) ahead of
time if you need the flattery to be reproducible.

## Usage

``` r
compliment(n = 1)
```

## Arguments

- n:

  A single positive number of compliments to generate. Non-integers are
  rounded down.

## Value

A character vector of length `n` containing compliments.

## Examples

``` r
compliment()
#> [1] "Somehow you make even ordinary Tuesdays feel resilient, like a well-tended garden."

set.seed(1234)
compliment(3)
#> [1] "Scientists agree: you're more unstoppable than the average library on a rainy day."            
#> [2] "Somehow you make even ordinary Tuesdays feel wise, like a sunbeam breaking through the clouds."
#> [3] "Somehow you make even ordinary Tuesdays feel insightful, like a first crocus of spring."       
```
