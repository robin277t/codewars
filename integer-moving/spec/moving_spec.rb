require_relative "../moving"

RSpec.describe "next bigger function" do
  it "switches 2 digit number around A" do
    expect(next_bigger(12)).to eq(21)
  end
  it "switches 2 digit number around B" do
    expect(next_bigger(34)).to eq(43)
  end
  it "switches 3 digit number around A" do
    expect(next_bigger(513)).to eq(531)
  end
  it "switches 3 digit number around B" do
    expect(next_bigger(414)).to eq(441)
  end
  it "switches 3 digit number around C" do
    expect(next_bigger(144)).to eq(414)
  end
  it "switches 4 digit number around A" do
    expect(next_bigger(2017)).to eq(2071)
  end
  it "switches 4 digit number around B" do
    expect(next_bigger(8976)).to eq(9678) 
  end
  it "switches 4 digit number around C" do
    expect(next_bigger(1221)).to eq(2112) 
  end
  it "switches 5 digit number around A" do
    expect(next_bigger(12121)).to eq(12211)
  end
  it "switches 5 digit number around B" do
    expect(next_bigger(89765)).to eq(95678)
  end
  it "returns -1 on a single number" do
    expect(next_bigger(9)).to eq(-1)
  end
  it "returns -1 on a single number" do
    expect(next_bigger(111)).to eq(-1)
  end
  it "returns -1 on a single number" do
    expect(next_bigger(531)).to eq(-1)
  end              
  it "returns new number" do
    expect(next_bigger(3954)).to eq(4359)
  end              
end

