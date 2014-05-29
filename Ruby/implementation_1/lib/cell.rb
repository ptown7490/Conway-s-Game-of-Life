class Cell
  attr_reader(:x, :y, :alive, :neighbors, :next_state_alive)

  @@all_cells = []

  def initialize(x, y)
    @x = x
    @y = y
    @alive = false
    @next_state_alive = @alive
  end

  def Cell.create(x, y)
    new_cell = Cell.new(x, y)
    @@all_cells << new_cell
    new_cell
  end

  def Cell.all
    @@all_cells
  end

  def Cell.clear
    @@all_cells = []
  end

  def make_alive
    @alive = true
  end

  def make_dead
    @alive = false
  end

  def next_make_alive
    @next_state_alive = true
  end

  def next_make_dead
    @next_state_alive = false
  end

  def make_neighbors
    @neighbors = []
    @@all_cells.each do |cell|
      if cell.x == self.x - 1 && cell.y == self.y - 1
        self.neighbors << cell
      elsif cell.x == self.x - 1 && cell.y == self.y + 1
        self.neighbors << cell
      elsif cell.x == self.x - 1 && cell.y == self.y
        self.neighbors << cell
      elsif cell.x == self.x && cell.y == self.y - 1
        self.neighbors << cell
      elsif cell.x == self.x && cell.y == self.y + 1
        self.neighbors << cell
      elsif cell.x == self.x + 1 && cell.y == self.y - 1
        self.neighbors << cell
      elsif cell.x == self.x + 1 && cell.y == self.y + 1
        self.neighbors << cell
      elsif cell.x == self.x + 1 && cell.y == self.y
        self.neighbors << cell
      end
    end
    @neighbors
  end

  def alive_neighbors
    @neighbors.count do |neighbor|
      neighbor.alive
    end
  end

  def find_next_state
    @next_state_alive = @alive

    if !self.alive && self.alive_neighbors == 3
      self.next_make_alive
    elsif self.alive
      if self.alive_neighbors > 3
        self.next_make_dead
      elsif self.alive_neighbors < 2
        self.next_make_dead
      end
    end
  end

end
