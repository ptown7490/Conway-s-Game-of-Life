require 'spec_helper'

describe Cell do

  context 'before parent Board instance is initialized' do
    it 'has no neighbors' do
      test_cell = Cell.new({x: 1, y: 1})
      expect(test_cell).to be_an_instance_of Cell
      expect(test_cell.neighbors).to be_empty
    end
  end

  context 'after parent Board instance has initialized' do
    describe '#neighbors' do
      board = Board.new({x_positive: 10, x_negative: 10, y_positive: 10, y_negative: 10})
      context 'on the grid\'s edge' do
        it 'has 5 neighboring cells.' do
          edge_cell = board.find_cell({x: 9, y: 8})
          expect(edge_cell.neighbors.length).to eq 5
        end
      end

      context 'at a corner' do
        it 'has 3 neighboring cells.' do
          corner_cell = board.find_cell({x: 9, y: 9})
          expect(corner_cell.neighbors.length).to eq 3
        end
      end

      context 'anywhere inside grid' do
        it 'has 8 neighboring cells.' do
          inside_cell = board.find_cell({x: 0, y:0})
          expect(inside_cell.neighbors.length).to eq 8
        end
      end
    end
  end
end
