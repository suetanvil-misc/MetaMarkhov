require_relative "spec_helper"
require_relative "../builder"


describe WordEntry do
  we = WordEntry.new("beable")

  it "keeps track of words following this one." do
    we.totalCounts.should == 0

    we.followedBy("pez")
    we.totalCounts.should == 1

    we.followedBy("doidy")
    we.totalCounts.should == 2
    we.followers.should == ['doidy', 'pez']
  end

  it "returns a normalized count of words." do
    nc = we.normalizedCounts()
    (nc[0][1]).should == 0.5
  end

end

describe MCBuilder do
  describe "#addWordPair" do
    it "adds a word." do
      bldr = MCBuilder.new()

      bldr.addWordPair("first", "second")
      bldr.followers("first").size.should == 1
      bldr.followers("second").size.should == 0
    end
  end

end
