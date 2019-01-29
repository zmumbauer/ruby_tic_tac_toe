require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
  end

  def play_turn(player)
    move = player.get_move

    @board[*move]=(player.marker)

    @board.winner?(player.marker)
  end

  def print_board
    @board.print_grid
  end

end