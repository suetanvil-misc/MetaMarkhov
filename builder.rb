# Build the Markhov chain generator


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

  def normalizedCounts
    total = totalCounts() + 0.0

    result = counts.keys.map {|k| [k, @counts[k]] }
    result.sort! {|a, b| a[1] <=> b[1]}
    result.map! {|entry| entry[1] = entry[1]/total}

    return result
  end

  private

  def totalCounts
    return @counts.values.inject(0) {|memo, cnt| memo + cnt}
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

    bigHash = createDataHash()
    writeBigHash(bigHash, filename)
  end

  private

  def addFirstWord(theWord)
    @lastWord = entryFor(theWord)
  end

  def entryFor(theWord)
    @words[theWord] = WordEntry.new(theWord) unless @words.has_key?(theWord)
    return @words[theWord]
  end

  def createDataHash
    result = {}

    for k in @words.keys
      result[k] = @words[k].normalizedCounts()
    end

    return result
  end

  def writeBigHash(bigHash, filename)
    # Code goes here
  end
end

