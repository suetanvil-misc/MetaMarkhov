require_relative "spec_helper"

describe TextGenerator do
  let(:t) do
    TextGenerator.new({
      "word" => [["word", 1]],
      "car" => [["race", 0.5],
                ["show", 0.5]]
    })
  end

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
