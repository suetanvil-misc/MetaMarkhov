require_relative "spec_helper"
require_relative "../builder"


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
