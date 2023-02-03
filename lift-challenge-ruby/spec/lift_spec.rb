require_relative "../lift"

xdescribe("set tests") do
  it("set test 1") do
    expect(lift_sequence([ [],   [],    [5,5,5], [],   [],    [],    [] ],5)).to eq ([0,2,5,0])
  end
  it("set test 2") do
    expect(lift_sequence([ [],   [],    [1,1],   [],   [],    [],    [] ],5)).to eq ([0,2,1,0])
  end
  it("set test 3") do
    expect(lift_sequence([ [],   [3],  [4],    [],   [5],  [],    [] ],5)).to eq ([0,1,2,3,4,5,0])
  end
  it("set test 4") do
    expect(lift_sequence([ [],   [0],  [],      [],   [2],  [3],  [] ],5)).to eq ([0, 5, 4, 3, 2, 1, 0])
  end
end

xdescribe("First block: single person queues only going up") do

  it"1 - input valid 2 floors no people" do
    expect(lift_sequence([[],[]],5)).to eq ([0])
  end

  it"2 - input valid 2 floors 1 person" do
    expect(lift_sequence([[1],[]],5)).to eq ([0,1,0])
  end

  it"3 - input valid 3 floors 1 person" do
    expect(lift_sequence([[],[2],[]],5)).to eq ([0,1,2,0])
  end

  it"4 - input valid 3 floors 2 people" do
    expect(lift_sequence([[1],[2],[]],5)).to eq ([0,1,2,0])
  end

  it"5 - input valid 6 floors 3 people" do
    expect(lift_sequence([[4],[5],[4],[],[],[]],5)).to eq ([0,1,2,4,5,0])
  end

  it"6 - input valid 6 floors 4 people different orders" do
    expect(lift_sequence([[4],[3],[4],[5],[5],[]],5)).to eq ([0,1,2,3,4,5,0])
  end

end

xdescribe("Second block: single person queues only going down") do
  it"7 - input valid 3 floors 1 person going down" do
    expect(lift_sequence([[],[],[0]],5)).to eq ([0,2,0])
  end

  it"8 - input valid 5 floors 1 person going down" do
    expect(lift_sequence([[],[],[],[1],[]],5)).to eq ([0,3,1,0])
  end

  it"9 - input valid 7 floors 3 person going down" do
    expect(lift_sequence([[],[],[],[1],[],[0],[4]],5)).to eq ([0,6,5,4,3,1,0])
  end
end

xdescribe("Three: mixed up and down single person queues within capacity") do
  it"10 - 6 floors with 1 person going up and one person going down no overlap" do
    expect(lift_sequence([[],[2],[],[1],[],[]],10)).to eq ([0,1,2,3,1,0])
  end
  it"11 - 6 floors with 1 person going up and one person going down with overlap" do
    expect(lift_sequence([[],[],[5],[],[],[2]],10)).to eq ([0,2,5,2,0])
  end
  it"12 - 6 floors with 1 person going up and one person going down with overlap" do
    expect(lift_sequence([[],[4],[1],[],[],[]],10)).to eq ([0,1,4,2,1,0])
  end
end

xdescribe("Four: queues of multiple people per floor all going up only") do
  it("13 - 6 floors with 2 person queue in on one level going to same floor")do
    expect(lift_sequence([[],[],[4,4],[],[],[]],10)).to eq ([0,2,4,0])
  end

  it("14 - 6 floors with 2 person queue in on one level going to diff floor")do
    expect(lift_sequence([[],[],[4,5],[],[],[]],10)).to eq ([0,2,4,5,0])
  end

  it("15 - 6 floors with 4 persons in on 2 levels going to diff floor")do
    expect(lift_sequence([[],[2,3],[4,5],[],[],[]],10)).to eq ([0,1,2,3,4,5,0])
  end

  it("16 - 6 floors with 5 persons in on 2 levels going to diff floor")do
    expect(lift_sequence([[],[2,3,5],[4,5],[],[],[]],10)).to eq ([0,1,2,3,4,5,0])
  end
end

xdescribe("five - queues of multiple people per floor all going down only") do
  it("17 - 6 floors with 2 person queue in one level going to the same floor") do
    expect(lift_sequence([[],[],[],[],[],[2,2]],10)).to eq ([0,5,2,0])
  end
  it("18 - 6 floors with 2 persons on one floor going to 2 levels") do
    expect(lift_sequence([[],[],[],[],[1,2],[]],10)).to eq ([0,4,2,1,0])
  end
  it("19 - 6 floors with 4 persons on 2 floors going to diff levels") do
    expect(lift_sequence([[],[],[],[],[1,2],[4,2]],10)).to eq ([0,5,4,2,1,0])
  end
  it("20 - 6 floors with 5 persons on 2 floors going to diff levels") do
    expect(lift_sequence([[],[],[],[],[1,1,0],[4,3]],10)).to eq ([0,5,4,3,1,0])
  end
end

xdescribe("six - queues of multiple people per floor going both up and down") do
  it("21 -2 people on same floor, 1 up 1 down") do
    expect(lift_sequence([[],[],[5,1],[],[],[]],10)).to eq ([0,2,5,2,1,0])
  end
  it("22 -4 people on 2 floors, up and down") do
    expect(lift_sequence([[],[],[5,1],[0,1],[],[]],10)).to eq ([0,2,5,3,2,1,0])
  end
  it("23 -multiple people on same floor, some up some down") do
    expect(lift_sequence([[6],[],[5,1,1,4],[],[],[],[],[4,0]],10)).to eq ([0,2,4,5,6,7,4,2,1,0])
  end
end

describe("seven - over capacity ") do
  xit("24 - queue of 3 people going dow from same floor, capacity 2") do
    expect(lift_sequence([[],[],[],[],[],[4,3,2]],2)).to eq ([0,5,4,3,5,2,0])
  end
  xit("25 - queue of 4 people going dow from same floor, capacity 2") do
    expect(lift_sequence([[],[],[],[],[],[4,3,2,1]],2)).to eq ([0,5,4,3,5,2,1,0])
  end
  xit("26 - queue of 4 people going up and down from same floor, capacity 2") do
    expect(lift_sequence([[],[],[],[4,4,5,2],[],[]],2)).to eq ([0,3,4,3,2,3,5,0])
  end
  xit("27 - queue of 10 people going up and down from 2 floors, capacity 3") do
    expect(lift_sequence([[],[],[0,1,6,1,5],[],[5,3,5,6,0],[],[]],3)).to eq ([0,2,4,5,6,4,3,2,1,0,4,5,6,2,1,0])
  end
  it("28 - large queue, capacity 1")do
    expect(lift_sequence([[],[2,3,4,5,6,7,8,9],[],[],[],[],[],[],[],[]],1)).to eq([0,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,0])
  end
  xit("29 - late tests YOYO")do
    expect(lift_sequence([[], [], [4, 4, 4, 4], [], [2, 2, 2, 2], [], []],2)).to eq ([0,2,4,2,4,2,0])
  end
  xit("30 - late tests YOYO with floor skip")do
    expect(lift_sequence([[], [], [4, 4, 4, 4], [1], [2, 2, 2, 2], [], []],2)).to eq ([0,2,4,3,2,4,3,2,3,1,0])
  end

end

#and 2 not 'stopping' at floors even when full.