require "test_helper"

describe Word do
  describe "#misspellings" do
    it "is empty if word is empty" do
      assert { Word.new("").misspellings == [] }
    end
  end

  # Method #length

  describe "#length" do

    it "returns word size" do
      assert { Word.new("abc").length == 3 }
    end

  end

  # Method #deletion

  describe "#deletion" do

    it "deletes a character for each element" do
      assert { Word.new("abcd").deletion == %w[bcd acd abd abc] }
    end

    it "contains no dupes" do
      assert { Word.new("aaa").deletion == %w[aa] }
    end

  end

  describe "#transposition" do
    it "swaps every two chars" do
      assert { Word.new("abc").transposition == %w[bac acb] }
    end

    it "contains no dupes" do
      assert { Word.new("aaa").transposition == %w[aaa] }
    end
  end

  # Method #alteration

  describe "#alteration" do

    it "remains one char if only one char is given" do
      assert { Word.new("a").alteration == ("a".."z").to_a }
    end

    it "works" do
      alteration = Word.new("hello").alteration
      assert { alteration.first == "aello" }
      assert { alteration.last == "hellz" }
    end

  end

  # Method #insertion

  describe "#insertion" do
    it "works" do
      insertion = Word.new("a").insertion
      assert { insertion.count == 26 * 2 }
      assert { [insertion.first, insertion.last] == %w[aa az] }
    end

    it "is empty if word is empty" do
      assert { Word.new("").insertion == [] }
    end
  end

end
