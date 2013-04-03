require_relative "spec_helper"

describe TextGenerator do
  let(:t) do
    TextGenerator.new({
      "word" =>  [["word", 1]],
      "car" =>   [["race", 0.5], ["show", 0.5]],
      "puppy" => [["car", 0.7],  [".", 0.3]],
      "race" =>  [["puppy", 1]],
      "." =>     [["puppy", 1]]
    })
  end

  describe "#follow" do
    it "always picks something if it has weighting 1" do
      t.follow("word").should == "word"
    end

    it "picks the first thing if it falls in that range" do
      Kernel.should_receive(:rand).and_return(0.25)
      t.follow("car").should == "race"
    end

    it "takes the first thing that fits in the range" do
      Kernel.should_receive(:rand).and_return(0.75)
      t.follow("car").should == "show"
    end
  end

  describe "#generate" do
    before :each do
      Array.any_instance.stub(:sample).and_return("puppy")
      Kernel.should_receive(:rand).and_return(0,0,0,1)
    end

    it "creates a phrase for a given data set" do
      t.generate(4).should == "puppy car race puppy."
    end

    it "will only end on a terminal" do
      t.generate(2).should == "puppy car race puppy."
    end
  end
end
