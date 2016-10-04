require "dependencies"

describe DependencyCheck do
  it "Raises error if jobs depend on themselves" do
    subject = described_class.new("a => , b => , c => c")
    expect{ subject.check_self_dependencies }.to raise_error "Self dependencies spotted"
  end

  it "Raises error if jobs have circular dependencies" do
    subject = described_class.new("a => , b => c, c => f, d => a, e => , f => b")
    expect{ subject.check_circular_dependencies }.to raise_error "Circular dependencies spotted"
  end
end
