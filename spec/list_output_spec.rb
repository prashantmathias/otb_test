require "list_output"

describe ListOutput do
  it "Can output an empty sequence" do
    subject = described_class.new(" ")
    expect(subject.display).to eq []
  end

  it "Can output a single job " do
    subject = described_class.new("a => ")
    expect(subject.display).to eq ["a"]
  end

  it "Can output a sequence of jobs with no dependencies in no significant order" do
    subject = described_class.new("a => , b => , c => ")
    expect(subject.display).to eq ["c","b","a"]
  end

  it "Can output a sequence of jobs with dependencies in the correct order" do
    subject = described_class.new("a => , b => c, c => f, d => a, e => b, f=> ")
    expect(subject.display).to eq ["f","c","b","e","a","d"]
  end
end
