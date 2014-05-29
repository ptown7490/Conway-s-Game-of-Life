class Cell
  attr_reader :state
  attr_accessor :neighbors

  def initialize(coordinates, state=false)
    @x_coord = coordinates[:x]
    @y_coord = coordinates[:y]

    @state = state
    @neighbors = []
  end

  def true_neighbors
    @neighbors.count do |cell|
      cell.state
    end
  end

  def coordinates
    { x: @x_coord,
      y: @y_coord }
  end
end
