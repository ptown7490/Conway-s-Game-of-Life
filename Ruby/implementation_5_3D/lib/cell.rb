class Cell
  attr_reader :x_coord, :y_coord, :z_coord
  attr_accessor :alive

  def initialize(x, y, z, state)
    @x_coord = x
    @y_coord = y
    @z_coord = z
    @alive = state
  end
end
