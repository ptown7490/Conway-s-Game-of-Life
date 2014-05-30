require './lib/board'

class BoardController
	attr_reader :board, :views, :generation

	def initialize
		@board = Board.new(nil, GLIDER_GUN)
		@generation = 0
		@views = []
	end

	def add(cell_view)
		@views << cell_view
	end

	def clear_views
		@views.clear
	end

	def next_gen
		@generation += 1
		@board = @board.next_generation
	end

	def state(index)
		@board.cells[index].state
	end

	def width
		@board.width
	end

	def height
		@board.height
	end

end
