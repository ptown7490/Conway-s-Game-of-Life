class GameBoard
  attr_reader :rows, :cols, :board

  def initialize(x, y, z)
    @board = []
    @rows = y
    @cols = x
    @depth = z

    (0...z).each do |z_index|
      (0...y).each do |y_index|
        (0...x).each do |x_index|
          @board << { :cell => Cell.new(x_index,y_index,z_index, false), :neighbors => [] }
        end
      end
    end
  end

  def find(x, y, z)
    if x >= @cols || x < 0 || y >= @rows || y < 0 || z >= @depth || z < 0
      nil
    else
      @board[@rows*@cols*z + @cols*y + x]
    end
  end

  def fill_neighbors(cell)
    x = cell[:cell].x_coord
    y = cell[:cell].y_coord
    z = cell[:cell].z_coord

    (x-1 .. x+1).each do |i|
      (y-1 .. y+1).each do |j|
        (z-1 .. z+1).each do |k|
          neighbor = self.find(i,j,k)
          unless neighbor.nil?
            cell[:neighbors] << neighbor[:cell]
          end
        end
      end
    end

    cell[:neighbors].delete(cell[:cell])
  end



end
