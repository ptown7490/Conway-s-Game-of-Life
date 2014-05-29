require './lib/board'

class BoardController
	attr_reader :board, :views, :generation

	def initialize
		@board = Board.new(GLIDER)
		@min_x = @board.x_min
		@max_x = @board.x_max
		@min_y = @board.y_min
		@max_y = @board.y_max
		@generation = 0
	end

	def next_gen
		@generation += 1
		@board = @board.next_generation
	end

	def state(pair)
		@board.include? pair
	end

	def trailed?(pair)
		@board.trail.include? pair
	end

	def width
		@board.width
	end

	def height
		@board.height
	end

end