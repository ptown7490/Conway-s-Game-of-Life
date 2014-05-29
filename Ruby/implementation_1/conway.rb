require './lib/cell'
require './lib/world'

world = World.new(10, 10)

seeds = []

#blinker
# seeds = [33,34,35]

#beacon
seeds = [21,22,31,44,53,54]

seeds.each do |i|
  Cell.all[i].make_alive
end

puts 'Initial'
world.print_board
while world.steps < 10 do
  world.next_step
end
