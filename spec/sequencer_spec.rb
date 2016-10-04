require "sequencer"

describe Sequencer do
  context "Input and output with no dependencies" do
    it "Can accept an empty string as input and output an empty sequence" do
      sequencer = described_class.new(" ")
      expect(sequencer.display).to eq []
    end

    it "Can accept a single job and output the same" do
      sequencer = described_class.new("a => ")
      expect(sequencer.display).to eq ["a"]
    end

    it "Can accept multiple jobs and output a sequence" do
      sequencer = described_class.new("a => , b => , c => ")
      expect(sequencer.display).to eq ["c","b","a"]
    end
  end
end
