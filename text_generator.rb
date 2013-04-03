class TextGenerator
  def initialize(data)
    @data = data
  end

  def follow(word)
    return starting_word if word.nil?
    raise "#{word} does not have an entry in the dataset" unless @data.keys.include?(word)
    weighted_list = @data[word]
    value = Kernel.rand
    weighted_list.each do |(word, weighting)|
      value -= weighting
      return word if value <= 0.00001
    end
  end

  def starting_word
    @data.keys.sample
  end

  def terminal?(word)
    punctuation?(word)
  end

  def punctuation?(word)
    word == "."
  end

  def generate(minimum_length)
    words = []
    last_word = nil
    until words.count > minimum_length && terminal?(last_word)
      next_word = follow(last_word)
      if punctuation?(next_word)
        words.last << next_word
      else
        words << next_word
      end
      last_word = next_word
    end
    words.join(" ")
  end
end
