require_relative "spec_helper"
require_relative "../builder"


describe WordEntry do
  describe "#follow and counts" do
    we = WordEntry.new("beable")

    we.totalCounts.should == 0

    we.followedBy("pez")
    we.totalCounts.should == 1

    we.followedBy("doidy")
    we.totalCounts.should == 2
    we.followers.should == ['doidy', 'pez']

    nc = we.normalizedCounts()
    (nc[0][1]).should == 0.5
    
  end

end

describe MCBuilder do
  describe "#addWord" do
    it "adds a word." do
      bldr = MCBuilder.new()

      bldr.addWord("first")
      bldr.followers("first").size.should == 0

      bldr.addWord("second")
      bldr.followers("first").size.should == 1
      bldr.followers("second").size.should == 0

#      bldr.followers("first").should == ["second"]

    end
  end

  



end
