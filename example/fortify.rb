require_relative "../lib/stack_wars"

data = "#{File.dirname(__FILE__)}/../test/fixtures/active_battlefield.json"
field = StackWars::Battlefield.from_json(data)
game  = StackWars::Game.new(field)

puts field
puts "\nFortifying black position at (0,6)\n\n"

game.play([0,6])

puts "#{field}\n\nFortifying white baseline position at (2,0)"

game.play([2,0])

puts field
