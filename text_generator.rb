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
    count = 0
    terminal = false
    until count > minimum_length && terminal
      word = follow(last_word)
      terminal = terminal?(word)
      if punctuation?(word)
        words.last << word
        last_word = nil
      else
        words << word
        last_word = word.dup
        count += 1
      end
    end
    words.join(" ")
  end
end
