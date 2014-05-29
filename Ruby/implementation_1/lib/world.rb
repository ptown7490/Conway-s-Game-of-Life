class World
  attr_reader(:board, :steps)

  def initialize(rows, columns)
    @steps = 0
    @board = Array.new(rows)

    @board.map!.with_index do |row, y_index|
      row = Array.new(columns)
      row.map!.with_index do |cell, x_index|
        cell = Cell.create(x_index+1, y_index+1)
      end
    end

    @board.each do |row|
      row.each do |cell|
        cell.make_neighbors
      end
    end
  end

  def print_board
    @board.each do |row|
      row.each do |cell|
        if cell.alive
          print 'X '
        else
          print '* '
        end
      end
      puts
    end
  end

  def next_step
    Cell.all.each do |cell|
      cell.find_next_state
    end

    Cell.all.each do |cell|
      if cell.next_state_alive
        cell.make_alive
      else
        cell.make_dead
      end
    end

    @steps += 1
    puts steps
    self.print_board
  end


end
