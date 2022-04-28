require_relative "board"
require_relative "human_player"
require_relative "computer_player"
require_relative "game.rb"

puts "Welcome to a game of tictactoe"
puts "please enter your name: "
name = gets.chomp

hash = {X: false, O: true}

game = Game.new(3, hash)
game.play

puts "End of game"