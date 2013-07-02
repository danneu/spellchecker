require "test_helper"

describe SpellingCorrector do

  def table
    FrequencyTable.new("hi hi hi sup sup bye")
  end

  def default_corrector(string)
    SpellingCorrector.new(string, table)
  end

  context "string found" do

    it "returns string" do
      assert { default_corrector("hello").correct == "hello" }
    end

  end

  context "string misspellings found" do

    it "returns string of highest occurrence" do
      table = FrequencyTable.new("ho ho ha ha ha ah")
      corrector = SpellingCorrector.new("hi", table)
      assert { corrector.correct == "ha" }
    end

  end
end
