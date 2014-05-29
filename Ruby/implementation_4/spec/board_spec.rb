require 'spec_helper'



describe Board do
  it 'allocates a grid on the Cartesian plane.' do
    test_board = Board.new [[0,0]]
    expect(test_board).to be_an_instance_of Board
  end

  it 'has a display size defined by extrema.' do
    test_board = Board.new [[0,0]], [[1,1]]
    expect(test_board.size).to  eq 4
  end

  it 'requires a seed argument for initialization.' do
    expect do
      Board.new
    end.to raise_error  ArgumentError
  end

  it 'accepts \'seed\' for live cells as parameter during creation.' do
    test_board = Board.new(
                          [[1,2],
                           [-3,5],
                           [4,-9]])
    expect(test_board.live).to eq 3
  end


  describe '#column' do
    it 'returns array of all live cells with corresponding x-coordintate.' do
      test_board = Board.new [[0,1],[2,5],[0,-2]]
      expect(test_board.column(0).length).to eq 2
    end
  end

  describe '#row' do
    it 'returns array of all cells with corresponding y-coordintate.' do
      test_board = Board.new [[1,0],[2,5],[-2,0]]
      expect(test_board.row(0).length).to eq 2
    end
  end
  

  
end

