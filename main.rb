require_relative "player"
require_relative "game"

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

player1.other_player = player2
player2.other_player = player1


game = Game.new(player1, player2)
game.start_game