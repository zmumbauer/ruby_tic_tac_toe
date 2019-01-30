class Player

  ROW_MAP = (:A..:C).zip(0..2).to_h

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
    loop do
      instructions("row")
      input = gets
      choice = translate_row(input)
      return choice if choice
      puts "Invalid row"
    end
  end

  def translate_row(input)
    choice = ROW_MAP[input[0].upcase.to_sym]

    validate_choice(choice)
  end

  def get_column
    loop do
      instructions("column")
      input = gets
      choice = translate_column(input)
      return choice if choice
      puts "Invalid column"
    end
  end

  def translate_column(input)
    choice = input.to_i - 1
    validate_choice(choice)
  end

  def instructions(string)
    puts "Pick a #{string}"
    print ">>"
  end

  def validate_choice(choice)
    choice if (0..2).include?(choice)
  end

end