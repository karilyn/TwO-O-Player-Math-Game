require './player'
require './question'

class Game

  attr_accessor :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = @player1
  end

  def check_score
    "#{@player1.name}: #{@player1.lives}/3 vs. #{@player2.name}: #{@player2.lives}/3"
  end

  def winner
    if @player1.lives > @player2.lives
      @player1
    else
      @player2
    end
  end

  def finish_turn!(is_correct)
    if !is_correct
      @current_player.lose_life
    end
    switch_player
  end


  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def game_over?
    @player1.is_dead? || @player2.is_dead?
  end

  def result
    {
      :winner => winner.name,
      :score => winner.lives
    }
  end

 end
