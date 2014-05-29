require './board_controller'

PIXEL_WIDTH = 20

# board_con = BoardController.new
WIDTH = 20
# HEIGHT = 15
# BOARD_HEIGHT = PIXEL_WIDTH*HEIGHT
WIN_WIDTH = PIXEL_WIDTH*WIDTH
# WIN_HEIGHT = PIXEL_WIDTH*HEIGHT*2
Shoes.app(title: 'Conway', width: WIN_WIDTH, height: WIN_WIDTH*2) do
	@dead = red
	@trail = green
	@alive = blue

	background white
	stroke black
	fill @dead

	@bc = BoardController.new
	@map = {}

	def map_view
		@map.each_value {|rectangle| rectangle.remove }
		@map.clear


		square_width = WIN_WIDTH/(@bc.width > @bc.height ? @bc.width : @bc.height)

		y_index = @bc.board.y_max
		(0...@bc.height).each do |j|
			x_index = @bc.board.x_min
			(0...@bc.width).each do |i|
				rectangle = rect(left: square_width*i+5, top: square_width*j+5, width: square_width, height: square_width)
				@map[[x_index, y_index]] =  rectangle
																				
				x_index += 1
			end
			y_index -= 1
		end
	end


	map_view
	
	@map.each_pair do |key, value|
		if @bc.state(key)
			value.style fill: @alive
		elsif @bc.trailed?(key)
			value.style fill: @trail
		else
			value.style fill: @dead
		end
	end


	@text = flow top: WIN_WIDTH, width: "90%", margin: 10 do
		stack width: "50%" do
			@debug = para "width: #{@bc.width}"
			@debug1 = para "height: #{@bc.height}"
			@size_out = para "total: #{@bc.board.size}"
			button 'step' do
				step
			end
		end
		stack width: "50%" do
			@x_bounds = para "x: #{@bc.board.x_min} .. #{@bc.board.x_max}"
			@y_bounds = para "y: #{@bc.board.y_min} .. #{@bc.board.y_max}"
			@live_out = para "live: #{@bc.board.live}"
			@generation_out = para "Generation #{@bc.generation}"
		end
	end





	

	def step
		@bc.next_gen
		map_view

		@map.each_pair do |key, value|
			if @bc.state(key)
				value.style fill: @alive
			elsif @bc.trailed?(key)
				value.style fill: @trail
			else
				value.style fill: @dead
			end
		end

		@debug.replace "width: #{@bc.width}"
		@debug1.replace "height: #{@bc.height}"
		@x_bounds.replace "x: #{@bc.board.x_min} .. #{@bc.board.x_max}"
		@y_bounds.replace "y: #{@bc.board.y_min} .. #{@bc.board.y_max}"
		@size_out.replace "total: #{@bc.board.size}"
		@live_out.replace "live: #{@bc.board.live}"
		@generation_out.replace "Generation #{@bc.generation}"
	end

	# resize
end
# animate
