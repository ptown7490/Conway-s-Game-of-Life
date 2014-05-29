class Cell
  @@all_cells = []

  attr_reader(:x, :y)
  attr_accessor(:alive, :alive_next)

  def initialize(x, y)
    @x, @y = x, y
    @alive = @alive_next = false
    @neighbors = []
  end

  def self.create(x, y)
    new_cell = Cell.new(x, y)
    @@all_cells << new_cell
    new_cell
  end

  def self.all
    @@all_cells
  end

  def self.clear
    @@all_cells = []
  end

  def make_neighbors
    cell_neighbors = []
    Cell.all.each do |cell|
      unless cell == self then if (cell.x - @x).abs < 2 && (cell.y - @y).abs < 2 then cell_neighbors << cell end end
    end
    cell_neighbors
  end

  def neighbors
    if @neighbors.empty?
      @neighbors = self.make_neighbors
    end
      @neighbors
  end

  def live_neighbors
    # puts 'live_neighbors'
    self.neighbors.count do |neighbor|
      neighbor.alive
    end
  end

  def find_next
    # puts 'find_next'
    if !@alive
      self.live_neighbors == 3
    elsif self.live_neighbors > 3 || self.live_neighbors < 2
      false
    else @alive end
  end
end
