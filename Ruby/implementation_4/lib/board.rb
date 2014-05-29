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

def offset(pairs, delta)
  dx = delta[0]
  dy = delta[1]

  pairs.collect do |pair|
    [pair[0]+dx, pair[1]+dy]
  end
end


NEIGHBOR_OFFSET = [[-1,1], [0,1], [1,1],
                   [-1,0],        [1,0],
                   [-1,-1],[0,-1],[1,-1]]



class Board
  attr_reader :x_min, :x_max, :y_min, :y_max, :trail

  def initialize(seed, trail=[])
    if seed.nil?
      raise ArgumentError
    end
    @trail = trail.concat(seed).uniq
    @x_min = min_x(@trail)
    @x_max = max_x(@trail)
    @y_min = min_y(@trail)
    @y_max = max_y(@trail)

    @board = seed.uniq

  end

  def print_grid
    (@y_max).downto(@y_min) do |y_index|
      (@x_min).upto(@x_max) do |x_index|
        print (@board.include?([x_index, y_index]) ? '#' : '+')
        print ' '
      end
      puts
    end
  end

  def next_generation
    next_board = []
    relevant_cells = []
    count_hash = {}

    @board.each do |pair|
      relevant_cells.concat offset(NEIGHBOR_OFFSET, pair)
    end

    element = relevant_cells.pop
    while !element.nil? do
      number = 1
      number += relevant_cells.count(element)
      relevant_cells.delete(element)
      count_hash[element] = number
      element = relevant_cells.pop
    end

    count_hash.each_pair do |key, value|
      if ((value == 3) || ((value == 2) && @board.include?(key)))
        next_board << key
      end
    end

    Board.new(next_board, @trail)
  end

  def column(number)
    @board.select do |cell|
        cell[0] == number
    end
  end

  def row(number)
    @board.select do |cell|
      cell[1] == number
    end
  end

  def width
    @x_max - @x_min + 1
  end

  def height
    @y_max - @y_min + 1
  end

  def live
    @board.length
  end

  def size
    self.width * self.height
  end

  def include?(pair)
    @board.include? pair
  end

  
end


