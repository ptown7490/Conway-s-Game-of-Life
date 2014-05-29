require './lib/game'

game = Game.new(10)
while game.generation <= game.generations do
	game.step
end
# game.play