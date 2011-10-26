require_relative "../lib/stack_wars"

field = StackWars::Battlefield.new
game  = StackWars::Game.new(field)
moves = File.foreach("#{File.dirname(__FILE__)}/sample-moves.txt")

client = StackWars::TextClient.new(game)

message = catch(:game_over) do
  loop do
    system "clear"
    puts field

    puts
    puts "Current Score: #{game.active_player.color}: "+
         "#{game.active_player.successful_invasions}, "+
         "#{game.opponent.color}: "+
         "#{game.opponent.successful_invasions}"

    command = moves.next
    print "#{game.active_player.color}:#{game.active_player.reserves} > #{command}"
    client.play(command)


    puts "hit enter to continue"
    gets
  end
end

puts field
puts message
