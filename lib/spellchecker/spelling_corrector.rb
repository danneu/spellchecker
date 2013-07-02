#
# Compares a string against a word frequency table to
# determine a spelling correction (or none at all).
#
class SpellingCorrector
  attr_reader :string, :table

  def initialize(string, table)
    @string = string
    @table = table
  end

  def correct
    return string if string_known
    misspellings_known.max { |a, b|
      table.to_hash[a] <=> table.to_hash[b]
    }
  end

  def string_known
    table.occurrences_of([string]).any?
  end

  def misspellings_known
    table.occurrences_of(misspellings)
  end

  def misspellings
    word.misspellings
  end

  def word
    Word.new(string)
  end
end
