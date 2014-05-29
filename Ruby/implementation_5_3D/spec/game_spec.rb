require 'cell'
require 'board'
require 'rspec'

describe Cell do
  describe '#initialize' do
    it 'initializes a cell' do
      test_cell = Cell.new(1, 1, 1, false)
      test_cell.should be_an_instance_of Cell
    end

    it 'knows it\'s coordinates' do
      test_cell = Cell.new(1, 1, 1, false)
      test_cell.x_coord.should eq 1
    end
  end
end

describe GameBoard do
  describe '#initialize' do
    it 'initializes an instance of GameBoard' do
      test_board = GameBoard.new(5, 5, 5)
      test_board.should be_an_instance_of GameBoard
    end
    it 'fills the board with the cells it creates' do
      test_board = GameBoard.new(5, 5, 5)
      test_board.board.count.should eq 125
    end
  end

  describe '#find' do
    it 'returns the proper cell' do
      test_board = GameBoard.new( 5, 5 ,5)
      found_cell = test_board.find( 2, 2 ,2)
      found_cell.should eq test_board.board[62]
      found_cell[:self].x_coord.should eq  2
      found_cell[:self].y_coord.should eq  2
      found_cell[:self].z_coord.should eq  2
    end
  end

  describe "#neighbors" do
    it 'populates the neighbors array with all of a cells neighbors' do
      test_board = GameBoard.new(5, 5, 5)
      found_cell = test_board.find(2, 2, 2)
      test_board.fill_neighbors(found_cell)
      found_cell[:neighbors].count.should eq 26
    end

    it 'can calculate at corners and edges' do
      test_board = GameBoard.new(5, 5, 5)
      found_cell = test_board.find(0, 0, 0)
      test_board.fill_neighbors(found_cell)
      found_cell[:neighbors].count.should eq 7
    end
  end
end


