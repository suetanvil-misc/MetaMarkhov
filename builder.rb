
# Builder class skeleton

class WordEntry
  attr_reader :word

  def initialize(word)
    @word = word
    @counts = {}
  end

  def follow(word)
    @counts[word] = 0 unless @counts.has_key?(word)
    @counts[word] += 1
  end
end


class MCBuilder
  def initialize()
    @words = {}
    @lastWord = nil
  end

  def addWord(theWord)
    @lastWord.follow(theWord) if @lastWord
    @lastWord = entryFor(theWord)
  end

  def extrude(filename)
    filename += '.rb' unless filename.end_with?('.rb')
    puts "Extruding to '#{filename}'"
  end

  private

  def addFirstWord(theWord)
    @lastWord = entryFor(theWord)
  end

  def entryFor(theWord)
    @words[theWord] = WordEntry.new(theWord) unless @words.has_key?(theWord)
    return @words[theWord]
  end
end

