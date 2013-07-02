require "test_helper"

describe FrequencyTable do

  # Helpers

  def table(text)
    FrequencyTable.new(text)
  end

  def frequency_hash(text)
    FrequencyTable.count(text)
  end


  # Core functionality

  it "returns a hash" do
    table = table("")
    assert { table.to_hash == {} }
  end

  it "counts string frequency" do
    hash = frequency_hash("a a a b b c")
    assert { hash == { "a" => 3, "b" => 2, "c" => 1 } }
  end

  it "sorts words by frequency descending" do
    hash = frequency_hash("c a a b a b")
    assert { hash.keys == %w[a b c] }
  end

  # Method #occurs

  describe "#occurrences_of" do

    def test_table
      FrequencyTable.new("hi hi hi sup sup bye")
    end

    it "returns array" do
      occurrences = test_table.occurrences_of("")
      assert { occurrences == [] }
    end
  end

  # Method #words

  describe "#words" do
    it "returns array" do
      table = table("")
      assert { table.words == [] }
    end

    it "splits strings" do
      words = table("my name is dan").words
      assert { words == %w[my name is dan] }
    end

    it "ignores non-alphabet chars" do
      words = table("a2b$c").words
      assert { words == %w[a b c] }
    end
  end

end
