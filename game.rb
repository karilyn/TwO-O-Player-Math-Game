require './player'
require './question'

class Game

  attr_accessor :player1 :player2, :current_player

  def initialize(player1, player2)
    @player1 = Player.new(@name, 3)
    @player2 = Player.new(@name, 3)
    current_player = @player1
  end

  def check_score
    puts "#{@player1.name}: #{@player1.lives}/3 vs. #{@player2.name}: #{@player2.lives}/3"
  end

  def show_score
    if @player1.lives > @player2.lives
      puts @player1.lives
    else
      puts @player2.lives
  end

  def winner
    if @player1.lives > @player2.lives
      puts @player1.name
    else
      puts @player2.name
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
    puts "#{winner} wins with a score of #{show_score}"
    "----- GAME OVER -----"
  end


  def play_game
    # loop through until game ends
    while !game_over?
      Question.new.ask_question(@current_player)
      check_score
      switch_player
      puts "----- NEW TURN -----"
    end
    end_game

  end
end

