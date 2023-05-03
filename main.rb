#!/usr/bin/env ruby

require './game'
require './player'
require './question'
require 'pp'

# Get player names
def get_player_name(player)
  puts "#{player}: Enter your name"
  gets
end

turn_count = 0

# Initialize game
player1 = get_player_name("Player 1").strip
player2 = get_player_name("Player 2").strip

game = Game.new(player1, player2)

# run the game loop
until game.game_over?
  puts "\n----- NEW TURN -----" if turn_count > 0
  puts

  question = Question.new
  puts "#{game.current_player.name}: #{question.prompt}"
  puts

  user_input = gets.chomp.to_i
  if question.check_answer(user_input)
    puts
    puts "#{game.current_player.name}: YES! You are correct."
    game.finish_turn!(true)
  else
    puts
    puts "#{game.current_player.name}: No sorry, that's not correct."
    game.finish_turn!(false)
  end

  puts
  print game.check_score
  puts
  turn_count += 1
end

result = game.result
puts

puts "#{result[:winner]} wins with a score of #{result[:score]}."
puts

puts "----- GAME OVER -----"
puts

puts "Good bye!"

