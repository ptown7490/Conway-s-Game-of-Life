require 'rspec'
require 'world'

describe World do
  before do

  end

  describe '#initialize' do
    it 'creates an instance of World' do
      test_world = World.new(100, 100)
      test_world.should be_an_instance_of World
    end

    it 'creates a new board' do
      test_world = World.new(100, 100)
      test_world.board.length.should eq 100
    end

    it '' do
      test_world = World.new(100, 100)
      test_world.board[0][0].should be_an_instance_of Cell
    end
  end

  describe '#next_step' do
    it 'sets each cell to alive or dead appropriately for the next time step in game' do
      test_world = World.new(100, 100)
      Cell.all[100].alive = true
      Cell.all[101].alive = true
      Cell.all[102].alive = true
      test_world.next_step
      Cell.all[1].alive.should eq true
    end
  end



end
