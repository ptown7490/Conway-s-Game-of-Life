require 'rspec'
require 'world'
require 'cell'

describe World do
  before do
    Cell.clear
  end

  describe '#initialize' do
    it 'initializes the World object' do
      test_world = World.new(10, 10)
      test_world.should be_an_instance_of World
    end

    it 'creates a x by y board' do
      test_world = World.new(10, 10)
      test_world.board.length.should eq 10
    end

    it '' do
      test_world = World.new(10, 10)
      test_cell = test_world.board[4][4]
      test_cell.neighbors.length.should eq 8
    end

    it '' do
      test_world = World.new(10, 10)
      test_cell = test_world.board[0][0]
      test_cell.neighbors.length.should eq 3
    end
  end
end

describe Cell do
  before do
    Cell.clear
  end

  describe '#initialize' do
    it 'initializes the Cell object' do
      test_cell = Cell.new(1, 2)
      test_cell.should be_an_instance_of Cell
    end
  end

  describe '#alive_neighbors' do
    it 'returns a count of alive neighbors' do
      test_world = World.new(10, 10)
      Cell.all[10].make_alive
      Cell.all[11].make_alive
      test_cell = Cell.all[20]
      test_cell.alive_neighbors.should eq 2
    end
  end

  describe '#neighbors' do
    it 'creates an array of neighboring cell objects' do
      test_world = World.new(10, 10)
      test_cell = Cell.all[11]
      test_cell.neighbors.length.should eq 8
    end
  end
end
