require './board_controller'

PIXEL_WIDTH = 15

# board_con = BoardController.new
WIDTH = 20
HEIGHT = 20
BOARD_HEIGHT = PIXEL_WIDTH*HEIGHT
WIN_WIDTH = PIXEL_WIDTH*WIDTH
WIN_HEIGHT = PIXEL_WIDTH*HEIGHT*2
Shoes.app(title: 'Conway', width: WIN_WIDTH, height: WIN_HEIGHT) do
	@dead = red
	@alive = blue

	background white
	stroke black
	fill @dead

	@bc = BoardController.new
	@map = []
	
	if (BOARD_HEIGHT/@bc.height) < (WIN_WIDTH/@bc.width)
		square_width = BOARD_HEIGHT/@bc.height
	else
		square_width = WIN_WIDTH/@bc.width
	end
	(0...@bc.height).each do |j|
		(0...@bc.width).each do |i|
			@map << rect(left: square_width*i, top: square_width*j, width: square_width, height: square_width)
		end
	end
	@map.each {|el| @bc.add(el)}

	@bc.views.each_with_index do |el, i|
		el.style(fill: (@bc.state(i) ? @alive : @dead))
	end

	flow top: BOARD_HEIGHT, width: WIN_WIDTH do
		stack width: "50%" do
			@debug = para "width: #{@bc.width}"
			@debug1 = para "height: #{@bc.height}"
			@size_out = para "total: #{@bc.board.size}"
			button 'step' do
				step
			end
		end
		stack width: "50%" do
			@x_bounds = para "x: #{-@bc.board.dimensions[:x_negative]} .. #{@bc.board.dimensions[:x_positive]-1}"
			@y_bounds = para "y: #{-@bc.board.dimensions[:y_negative]} .. #{@bc.board.dimensions[:y_positive]-1}"
			@live_out = para "live: #{@bc.board.true_cells}"
			@generation_out = para "Generation #{@bc.generation}"
		end
	end





	def map_view
		@map.each {|el| el.remove }
		@map.clear
		@bc.clear_views

		if (BOARD_HEIGHT/@bc.height) < (WIN_WIDTH/@bc.width)
			square_width = BOARD_HEIGHT/@bc.height
		else
			square_width = WIN_WIDTH/@bc.width
		end
		(0...@bc.height).each do |j|
			(0...@bc.width).each do |i|
				@map << rect(left: square_width*i, top: square_width*j, width: square_width, height: square_width)
			end
		end
		@map.each {|el| @bc.add(el)}
	end

	def step
		@bc.next_gen
		map_view

		@bc.views.each_with_index do |el, i|
			el.style(fill: (@bc.state(i) ? @alive : @dead))
		end

		@debug.replace "width: #{@bc.width}"
		@debug1.replace "height: #{@bc.height}"
		@x_bounds.replace "x: #{-@bc.board.dimensions[:x_negative]} .. #{@bc.board.dimensions[:x_positive]-1}"
		@y_bounds.replace "y: #{-@bc.board.dimensions[:y_negative]} .. #{@bc.board.dimensions[:y_positive]-1}"
		@size_out.replace "total: #{@bc.board.size}"
		@live_out.replace "live: #{@bc.board.true_cells}"
		@generation_out.replace "Generation #{@bc.generation}"
	end

	# resize
end
# animate
