require './lib/cell'
require './lib/seeds'

def max_x(pairs)
  pairs.max_by {|pair| pair[0]}[0]
end

def min_x(pairs)
  pairs.min_by {|pair| pair[0]}[0]
end

def max_y(pairs)
  pairs.max_by {|pair| pair[1]}[1]
end

def min_y(pairs)
  pairs.min_by {|pair| pair[1]}[1]
end

TWO_BY_TWO = { x_positive: 2,
               x_negative: 0,
               y_positive: 2,
               y_negative: 0 }
DIMENSIONS = { x_positive: 6, x_negative: 5, y_positive: 6, y_negative: 5}
NULL_DIMENSIONS = { x_positive: 1, x_negative: 0, y_positive: 1, y_negative: 0}

class Board
  attr_reader :true_cells
  attr_reader :cells

  def initialize(dimensions=nil, seeds=[])
    unless dimensions.nil?
      @x_p = dimensions[:x_positive]
      @x_n = dimensions[:x_negative]
      @y_p = dimensions[:y_positive]
      @y_n = dimensions[:y_negative]
    else
      @x_p = 2
      @x_n = 1
      @y_p = 2
      @y_n = 1
    end

    if @x_p < 1 || @x_n < 0 || @y_p < 1 || @y_n < 0
      raise ArgumentError, 'Dimension in every direction must be non-negative.'
    end

    unless seeds.empty?
      if max_x(seeds) + 1 >= @x_p
        @x_p = max_x(seeds) + 2
      end
      if min_x(seeds) <= -@x_n
        @x_n = min_x(seeds).abs + 1
      end
      if max_y(seeds) + 1 >= @y_p
        @y_p = max_y(seeds) + 2
      end
      if min_y(seeds) <= -@y_n
        @y_n = min_y(seeds).abs + 1
      end
    end

    create_board(seeds)
    @true_cells = @cells.count { |cell| cell.state }
  end

  def next_generation
    next_board = Board.new(self.dimensions, self.next_generation_seed)
  end

  def find_cell(coordinates)
    unless (-@x_n...@x_p).include?(coordinates[:x]) && (-@y_n...@y_p).include?(coordinates[:y])
      nil
    else
      rows = (-@y_n...@y_p).to_a.reverse.index(coordinates[:y])
      across = (-@x_n...@x_p).to_a.index(coordinates[:x])

      @cells[self.width*rows+across]
    end
  end

  def column(number)
    unless ((-@x_n)...@x_p).include? number
      nil
    else
      @cells.select do |cell|
        cell.coordinates[:x] == number
      end
    end
  end

  def row(number)
    unless ((-@y_n)...@y_p).include? number
      nil
    else
      @cells.select do |cell|
        cell.coordinates[:y] == number
      end
    end
  end

  def dimensions
    { x_positive: @x_p,
      x_negative: @x_n,
      y_positive: @y_p,
      y_negative: @y_n }
  end

  def width
    @x_n + @x_p
  end

  def height
    @y_n + @y_p
  end

  def size
    @cells.length
  end

  def print_grid
    puts
    (@y_p-1).downto(-@y_n) do |y_index|
      (-@x_n).upto(@x_p-1) do |x_index|
        print (self.find_cell({x: x_index, y: y_index}).state ? '#' : '_')
        print ' '
      end
      puts
    end
    puts
  end

  def next_generation_seed
    seed = []
    @cells.each do |cell|
      x = cell.coordinates[:x]
      y = cell.coordinates[:y]
      if !cell.state && cell.true_neighbors == 3
        seed << [x, y]
      elsif cell.state
        if (2..3).include? cell.true_neighbors
          seed << [x, y]
        end
      end 
    end
    seed
  end

private

  def create_board(seeds)
    @cells = []
    (@y_p-1).downto(-@y_n) do |y_index|
      (-@x_n).upto(@x_p-1) do |x_index|
        @cells << Cell.new({ x: x_index, y: y_index }, seeds.include?([x_index, y_index]))
      end
    end

    @cells.each do |cell|
      fill_neighbors_for_cell(cell)
    end
  end

  

  def fill_neighbors_for_cell(cell)
    x = cell.coordinates[:x]
    y = cell.coordinates[:y]

    (x-1 .. x+1).each do |i|
      (y-1 .. y+1).each do |j|
        neighbor = self.find_cell({x: i, y: j})
        unless neighbor.nil?
          cell.neighbors << neighbor
        end
      end
    end

    cell.neighbors.delete(cell)
  end
end


