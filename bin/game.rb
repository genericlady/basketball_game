require_relative "../config/environment.rb"

game = BasketballGame.new

players = [Player.new, Player.new("skins")]

players.each { |player| game.add_observer(player) }

game.run
