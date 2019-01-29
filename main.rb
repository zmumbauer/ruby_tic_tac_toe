require_relative 'game'
require_relative 'player'

players = [
  Player.new("Tevin", :X),
  Player.new("Sasha", :O)
]

game = Game.new(players)

puts "Tic Tac Toe"
game.print_board
puts "Player 1, your move"
p game.play_turn(players[0])
game.print_board