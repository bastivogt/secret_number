require './classes/generator'
require './classes/lang'
require './classes/game_base'

game = SecretNumber::GameBase.new 1, 1000
game.start
