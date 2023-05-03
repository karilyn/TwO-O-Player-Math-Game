require './player'
require './question'

class Game

  attr_accessor :player1 :player2, :current_player

  def initialize(player1, player2)
    @player1 = Player.new(@name, 3)
    @player2 = Player.new(@name, 3)
  end

  def start
    # ...
  end

  def check_score
    puts "#{@player1.name}: #{@player1.lives}/3"
  end

  def whose_turn?
    # ...
  end
  
  def show_score
    "#{@name}: #{@lives}/3"
  end

  def turn
    # ...
  end
end

