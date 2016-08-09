require './classes/generator'
require './classes/lang'
require './classes/game_base'
require './classes/game'

# game = SecretNumber::GameBase.new 1, 1000
# game.start
game = SecretNumber::Game.new
game.create_levels 4, 10
game.start