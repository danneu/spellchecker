#
# Wraps a string with some string manipulation methods.
#
class Word
  attr_reader :string

  LETTERS = ("a".."z").to_a

  def initialize(string)
    @string = string
  end

  def misspellings_of_misspellings
    misspellings.flat_map { |misspelled_string|
      Word.new(misspelled_string).misspellings
    }
  end

  def misspellings
    deletion + transposition + alteration + insertion
  end

  # "hello"
  # => %w[ello hllo helo hell]
  def deletion
    (0...length).map { |i|
      string.dup.tap { |str| str[i] = "" }
    }.uniq
  end

  # "hello"
  # => %w[ehllo hlelo hello helol]
  def transposition
    (0...length-1).map { |i|
      string[0...i] +
      string[i+1, 1] +
      string[i,1] +
      string[i+2..-1]
    }.uniq
  end

  # Replaces each letter of word with entire alphabet one char at a time
  # %w[allo bllo cllo ... helao helbo helco ...]
  def alteration
    (0...length).flat_map { |i|
      LETTERS.map { |letter|
        string.dup.tap { |w| w[i] = letter }
      }
    }.uniq
  end

  # Inserts each letter of alphabet between every character incl leading and trailing.
  def insertion
    return [] if string.empty?
    (0..length).flat_map { |i|
      LETTERS.map { |letter|
        string[0...i] + letter + string[i..-1]
      }
    }
  end

  def length
    string.length
  end
end

