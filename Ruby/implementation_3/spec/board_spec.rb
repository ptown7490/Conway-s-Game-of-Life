require 'spec_helper'



describe Board do
  it 'allocates a grid on the Cartesian plane.' do
    test_board = Board.new TWO_BY_TWO
    expect(test_board).to be_an_instance_of Board
  end

  it 'has a definite size.' do
    test_board = Board.new TWO_BY_TWO
    expect(test_board.size).to  eq 4
  end

  it 'does not allow negative dimensions' do
    expect do
      Board.new({ x_positive: 1, x_negative: -3, y_positive: 2, y_negative: 2})
    end.to raise_error  ArgumentError, 'Dimension in every direction must be non-negative.'
  end

  it 'accepts \'seed\' for live cells as parameter during creation' do
    test_board = Board.new({ x_positive: 6, x_negative: 4, y_positive: 10, y_negative: 10},
      [[1,2],
       [-3,5],
       [4,-9]])
    expect(test_board.true_cells).to eq 3
  end


  describe '#column' do
    it 'returns array of all cells with corresponding x-coordintate.' do
      test_board = Board.new TWO_BY_TWO
      expect(test_board.column(0).length).to eq 2
    end
  end

  describe '#row' do
    it 'returns array of all cells with corresponding y-coordintate.' do
      test_board = Board.new TWO_BY_TWO
      expect(test_board.row(0).length).to eq 2
    end
  end
  

  describe '#find_cell' do
    test_board = Board.new TWO_BY_TWO
    context 'when board includes coordinates' do
      it 'returns corresponding cell.' do
        expect(test_board.find_cell({x:0,y:0})).to be_true
      end
    end

    context 'when coordinates fall outside board\'s grid' do
      it 'returns nil.' do
        expect(test_board.find_cell({x:2,y:0})).to be_nil
      end
    end
  end

  describe '#next_generation_seed' do
    it 'knows which coordinates need to be live in the game\'s next generation.' do
      dimensions = { x_positive: 6, x_negative: 4, y_positive: 10, y_negative: 10}
      board = Board.new(dimensions,
                        [[0,1],
                         [0,0],
                         [0,-1]])
      new_seed = board.next_generation_seed
      expect(new_seed).to include([-1,0], [0,0], [1,0])
      next_gen = Board.new(dimensions, new_seed)
      new_seed = next_gen.next_generation_seed
      expect(new_seed).to include([0,-1], [0,0], [0,1])
    end
  end
end

