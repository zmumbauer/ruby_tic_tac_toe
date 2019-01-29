class Player

  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    [get_row, get_column]
  end

  def get_row
    gets.to_i
  end

  def get_column
    gets.to_i
  end

end