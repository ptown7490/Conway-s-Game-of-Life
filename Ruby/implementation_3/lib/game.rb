require './lib/board'

class Game
	attr_reader :generation, :generations, :board

	def initialize(gens=5)
		@generations = gens
		@generation = 0
		@board = Board.new(nil, shift(GLIDER, 1, 0))
	end

	def step
		puts "Generation: #{@generation}"
		puts "Live cells: #{@board.true_cells}"
		@board.print_grid
		puts "x: #{-@board.dimensions[:x_negative]} .. #{@board.dimensions[:x_positive] - 1}"
		puts "y: #{-@board.dimensions[:y_negative]} .. #{@board.dimensions[:y_positive] - 1}"
		print '='*30, "\n"
		@board = @board.next_generation
		@generation += 1
	end

	def play
		while gets.chomp != 'x' do
			puts "Generation: #{@generation}"
			puts "Live cells: #{board.true_cells}"
			board.print_grid
			puts "x: #{-board.dimensions[:x_negative]} .. #{board.dimensions[:x_positive] - 1}"
			puts "y: #{-board.dimensions[:y_negative]} .. #{board.dimensions[:y_positive] - 1}"
			print '='*30, "\n"
			board = board.next_generation
			@generation += 1
		end
	end


end
