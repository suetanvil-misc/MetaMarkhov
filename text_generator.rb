class TextGenerator
  def initialize(data)
    @data = data
  end

  def follow(word)
    weighted_list = @data[word]
    value = Kernel.rand
    weighted_list.each do |(word, weighting)|
      value -= weighting
      return word if value <= 0
    end
  end
end
