require_relative 'game'
require_relative 'player'



class Session
  def initialize
    puts "Welcome to Tic Tac Toe"
    @players = [
      create_player(:X),
      create_player(:O)
    ]
    @ties = 0
    play_loop
    puts "Thank you for playing."
  end

  private

  def create_player(marker)
    print "Who will play as #{marker}?\n"
    name = gets.chomp.strip
    Player.new(name, marker)
  end

  def play_loop
    loop do
      puts "Starting a new game"
      game = Game.new(@players)
      puts update_scores(game.winner)
      puts display_scores
      break unless play_again?
    end
  end

  def play_again?
    print "Would you like to play another? (y/n)\n>"
    loop do
      answer = gets.strip[0].upcase
      case answer
      when "Y"
        return true
      when "N"
        return false
      else
        puts "Sorry that wasn't a valid choice."
      end
    end
  end

  def update_scores
    if winner
      winner.increment_score
      "#{winner.name} won!"
    else
      @ties += 1
      "The game was a tie"
    end
  end

  def display_scores
    scores = 
    @players.map do |player|
      "#{player.name} has won #{player.score} times."
    end
    scores << "There were #{@ties} ties after #{games_played} games."
  end

  def games_played
    @ties + @players.reduce(0) { |a, e| a + e.score }
  end
end