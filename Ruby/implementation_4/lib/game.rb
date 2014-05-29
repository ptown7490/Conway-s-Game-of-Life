require './lib/board'

class Game
	attr_reader :generation, :generations, :board

	def initialize(gens=5)
		@generations = gens
		@generation = 0
		@board = Board.new(shift(GLIDER, 1, 0))
	end

	def step
		puts "Generation: #{@generation}"
		puts "Live cells: #{@board.live}"
		@board.print_grid
		puts "Cells touched: #{board.trail.length}"
		puts "x: #{board.x_min} .. #{board.x_max}"
		puts "y: #{board.y_min} .. #{board.y_max}"
		print '='*30
		@board = @board.next_generation
		@generation += 1
	end

	def play
		seed = GLIDER_GUN
		board = Board.new(seed)
		while gets.chomp != 'x' do
			puts "Generation: #{@generation}"
			puts "Live cells: #{board.live}"
			board.print_grid
			puts "Cells touched: #{board.trail.length}"
			puts "x: #{board.x_min} .. #{board.x_max}"
			puts "y: #{board.y_min} .. #{board.y_max}"
			print '='*30
			board = board.next_generation
			@generation += 1
		end
	end


end
