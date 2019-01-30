require_relative 'game'
require_relative 'player'

players = [
  Player.new("Tevin", :X),
  Player.new("Sasha", :O)
]

game = Game.new(players)

puts "Tic Tac Toe"
puts game.display_board
puts "Player 1, your move"
p game.play_turn(players[0])
puts game.display_board