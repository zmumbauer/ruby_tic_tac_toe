require_relative 'board'

class Game

  attr_reader :winner

  def initialize(players)
    @players = players
    @board = Board.new
    play_until_winner
  end

  def play_until_winner
    current_player, other_player = @players
    until @winner || !@board.spaces_left? do
      play_turn(current_player)
      current_player, other_player = other_player, current_player
    end
    puts @board.visualization
    @winner
  end

  def play_turn(player)
    puts @board.visualization
    puts "It is #{player.name}'s turn."
    loop do
    target_cell = player.get_move
    break if @board.place_marker(target_cell, player.marker)
    puts "Invalid Move"
  end
    @winner = player if @board.winner?(player)
  end

end