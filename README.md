# Spellchecker

A lil Ruby spellchecker that makes spelling corrections based on a word frequency lookup table.

[Julython](http://www.julython.org/) inspired me to dust this off and publish it.

## Usage

Simple correction:

``` ruby
SpellingCorrector.new("helo", FrequencyTable.new("hello there, partner")).correct
=> "hello"

SpellingCorrector.new("helol", FrequencyTable.new("hello there, partner")).correct
=> "hello"
```

Frequency is used to settle ties:

``` ruby
SpellingCorrector.new("helol", FrequencyTable.new("helo hello")).correct
=> "helo"

SpellingCorrector.new("helol", FrequencyTable.new("helo hello hello")).correct
=> "hello"
```

## See the tests for how it works


