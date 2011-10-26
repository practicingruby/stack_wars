require_relative "../lib/stack_wars"

data = "#{File.dirname(__FILE__)}/../test/fixtures/active_battlefield.json"
field = StackWars::Battlefield.from_json(data)

black_player = StackWars::Player.new("black")
white_player = StackWars::Player.new("white")

puts field
puts "\nFortifying black position at (0,6)\n\n"

field[0,6].fortify(black_player)

puts "#{field}\n\nFortifying white baseline position at (2,0)"

field[2,0].fortify(white_player)

puts field
