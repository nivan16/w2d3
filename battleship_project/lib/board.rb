class Board
  attr_reader :size

  def self.print_grid(matrix)
    matrix.each{ |row| puts row.join(" ") }
  end

  def initialize(n)
    @grid = Array.new(n){ [:N] * n}
    @size = n*n
  end
  
  def [](position)
    row, column = position #note, position == an array, so this is the same as writing row, column = position[0], position[1] !!!!!
    return @grid[row][column]
  end

  def []=(position, val)
    row, column = position
    @grid[row][column] = val
  end

  def num_ships
    return @grid.flatten.count {|ele| ele == :S} #Has to be flattened!!!!! otherwise count just compares the *ele* to an array!
  end

  def attack(position)
    row, column = position

    if self[position] == :S
        self[position] = :H
        p "you sunk my battleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    while num_ships < size/4.0
        position = [rand(@grid.length-1), rand(@grid.length-1)]
        self[position] = :S
    end
  end

  def hidden_ships_grid
    
    hidden = @grid.map do |row|
        hide = []
        row.map do |column|
            if column != :S
                hide << column
            else
                hide << :N
            end
        end
        hide
    end
    return hidden
  end

  
end
