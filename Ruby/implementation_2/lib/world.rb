require 'cell'

class World
  attr_reader(:board)

  def initialize(x, y)
    # @columns = x
    # @rows = y
    @board = Array.new(y) { |row| Array.new(x) { |column| Cell.create(column, row)}}
  end

  # def next_step
  #   Cell.all.each { |cell| cell.alive_next = cell.find_next }

  #   Cell.all.each { |cell| cell.alive = cell.alive_next }
  # end

end
