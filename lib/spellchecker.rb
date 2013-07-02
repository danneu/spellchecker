require "spellchecker/version"
require "spellchecker/word"
require "spellchecker/spelling_corrector"
require "spellchecker/frequency_table"

module Spellchecker
  
  # FIXME: Decide on how to cook entry-point.
  def self.correct(string)
    SpellingCorrector.new(string, _).correct
  end

end
