require "list_input"

describe ListInput do
  it "Can store an empty string as input" do
    subject = described_class.new(" ")
    expect(subject.sorted_list).to eq []
  end

  it "Can store a single job" do
    subject = described_class.new("a => ")
    expect(subject.sorted_list).to eq ["a"]
  end

  it "Can store multiple jobs" do
    subject = described_class.new("a => , b => , c => ")
    expect(subject.sorted_list).to eq ["c","b","a"]
  end

  it "Can store multiple jobs with dependencies" do
    subject = described_class.new("a => , b => c, c => f, d => a, e => b, f=> ")
    expect(subject.sorted_list).to eq ["fc", "f", "cb", "be", "ad", "a"]
  end
end
