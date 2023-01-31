require_relative "../lift"

describe("Sample tests") do
  # it("Tests") do
  #   # Floors:    G     1      2        3     4      5      6         Answers:
  #   tests = [[ [ [],   [],    [5,5,5], [],   [],    [],    [] ],     [0, 2, 5, 0]          ],
  #            [ [ [],   [],    [1,1],   [],   [],    [],    [] ],     [0, 2, 1, 0]          ],
  #            [ [ [],   [3,],  [4,],    [],   [5,],  [],    [] ],     [0, 1, 2, 3, 4, 5, 0] ],
  #            [ [ [],   [0,],  [],      [],   [2,],  [3,],  [] ],     [0, 5, 4, 3, 2, 1, 0] ]]
  # end
  it"1 - input valid 2 floors" do
    expect(lift_sequence([[],[]],5)).to eq ([0])
  end
end


