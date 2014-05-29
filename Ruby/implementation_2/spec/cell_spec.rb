require 'rspec'
require 'cell'

describe Cell do
  before do
    Cell.clear
  end

  describe '#initialize' do
    it 'initializes an instance of Cell' do
      test_cell = Cell.new(1, 1)
      test_cell.should be_an_instance_of Cell
    end
  end

  describe '.create' do
    it 'creates a new cell' do
      test_cell = Cell.create(2, 2)
      Cell.all.should eql [test_cell]
    end
  end

  describe '.all' do
    it 'returns an array containing all Cell objects' do
      World.new(100, 100)
      Cell.all.length.should eq 10000
    end
  end

  describe '#make_neighbors' do
    it 'returns an array of adjacent cells on the board - corner' do
      World.new(100, 100)
      test_cell = Cell.all[0]
      test_cell.make_neighbors.length.should eq 3
    end

    it 'returns an array of adjacent cells on the board - sides' do
      World.new(100, 100)
      test_cell = Cell.all[1]
      test_cell.make_neighbors.length.should eq 5
    end

    it 'returns an array of adjacent cells on the board - everywhere else' do
      World.new(100, 100)
      test_cell = Cell.all[101]
      test_cell.make_neighbors.length.should eq 8
    end
  end

  describe '#neighbors' do
    it 'returns an array of adjacent cells on the board - corner' do
      World.new(100, 100)
      test_cell = Cell.all[0]
      test_cell.neighbors.length.should eq 3
    end

    it 'returns an array of adjacent cells on the board - sides' do
      World.new(100, 100)
      test_cell = Cell.all[1]
      test_cell.neighbors.length.should eq 5
    end

    it 'returns an array of adjacent cells on the board - everywhere else' do
      World.new(100, 100)
      test_cell = Cell.all[101]
      test_cell.neighbors.length.should eq 8
    end
  end

  describe '#live_neighbors' do
    it 'keeps track of live neighbors' do
      World.new(100,100)
      test_cell = Cell.all[101]
      Cell.all[0].alive = true
      Cell.all[1].alive = true
      Cell.all[2].alive = true
      Cell.all[100].alive = true
      Cell.all[102].alive = true
      Cell.all[200].alive = true
      Cell.all[201].alive = true
      Cell.all[202].alive = true
      test_cell.live_neighbors.should eq 8
    end
  end

  describe '#find_next' do
    it 'returns whether the cell is alive for the next time step of the game' do
      World.new(100, 100)
      test_cell = Cell.all[101]
      Cell.all[200].alive = true
      Cell.all[201].alive = true
      Cell.all[202].alive = true
      test_cell.find_next.should eq true
    end

    it '' do
      World.new(100, 100)
      test_cell = Cell.all[101]
      test_cell.alive = true
      Cell.all[0].alive = true
      Cell.all[200].alive = true
      Cell.all[201].alive = true
      Cell.all[202].alive = true
      test_cell.find_next.should eq false
    end

    it '' do
      World.new(100, 100)
      test_cell = Cell.all[101]
      test_cell.alive = true
      Cell.all[200].alive = true
      test_cell.find_next.should eq false
    end
  end
end
