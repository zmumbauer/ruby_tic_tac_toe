class Board
  WIDTH = 3
  HEIGHT = WIDTH

  def initialize
    @grid = Array.new(HEIGHT) {Array.new(WIDTH, :" ")}
  end

  def visualization
    output = "\n"
    output << generate_header
    output << generate_grid
  end

  def winner?(player)
    marker = player.marker
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
  end

  def spaces_left?
    @grid.any? do |row|
      row.any? do |cell|
        cell == :" "
      end
    end
    true
  end

  def place_marker(coordinates, something)
    y, x = coordinates
    @grid[y][x] = something if @grid[y][x] == :" "
  end

  private

  def generate_header
    (1..WIDTH).reduce("   ") { |a, e| a << "  #{e}" } << "\n"
  end


  def generate_grid
    letter = "A"
    @grid.reduce("") do |output, row|
      output << format_row(row, letter) 
      letter = letter.next
      output
    end
  end

  def format_row(row, letter)
    row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]" } << "\n"
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?(marker)
    [-1, 1].any? do |sign|
      (0...WIDTH).all? do |i|
        second_index= sign > 0 ? i : sign * (i+1)
        @grid[i][second_index] == marker
      end
    end
  end
end

def print_and_check
  @b.print_grid
  if @b.row_win?(:O)
    p "O wins in row"
  end
  if @b.row_win?(:X)
    p "X wins in row"
  end
  if @b.column_win?(:O)
    p "O wins in column"
  end
  if @b.column_win?(:X)
    p "X wins in column"
  end
  if @b.diagonal_win?(:O)
    p "O wins in diagonal"
  end
  if @b.diagonal_win?(:X)
    p "X wins in diagonal"
  end
end
