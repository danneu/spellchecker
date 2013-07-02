#
# Counts the frequency of words in a given chunk of text.
# Converts a wall of text into a hash of words and their
# occurrence frequency.
#
class FrequencyTable

  def initialize(text)
    @text = text
  end

  def self.count(text)
    new(text).to_hash
  end

  # Counts frequency of words
  #
  # @return [Hash[String, Int]] word frequency lookup table
  def to_hash
    Hash[Hash.new(0).tap { |hash|
      words.each { |word|
        hash[word] += 1
      }
    }.sort_by { |_, frequency| -frequency }]
  end
  alias_method :table, :to_hash

  # Turns large string of text into array of words.
  #
  # @return [Array[String]] text broken into array of words
  def words
    @text.downcase.scan(/[a-z]+/)
  end

  # Shows common elements between the table and given strings.
  #
  # @param [Array[String]] strings to lookup
  # @return [Array[String]] the strings that occur in the table
  def occurrences_of(strings)
    strings & table.keys
  end

end
