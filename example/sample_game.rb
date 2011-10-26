require_relative "../lib/stack_wars"

field = StackWars::Battlefield.new
game  = StackWars::Game.new(field)
moves = File.foreach("#{File.dirname(__FILE__)}/sample-moves.txt")

message = catch(:game_over) do
  loop do
    system "clear"
    puts field

    puts
    puts "Current Score: #{game.active_player.color}: "+
         "#{game.active_player.successful_invasions}, "+
         "#{game.opponent.color}: "+
         "#{game.opponent.successful_invasions}"

    input = moves.next
    print "#{game.active_player.color}:#{game.active_player.reserves} > #{input}"

    md = input.match(/^ *(?<pos1>\d+ +\d+) *(?<pos2>\d+ +\d+)? *$/)

    if md[:pos2]
      game.play(md[:pos1].scan(/\d+/).map(&:to_i), md[:pos2].scan(/\d+/).map(&:to_i))
    else
      game.play(md[:pos1].scan(/\d+/).map(&:to_i))
    end

    puts "hit enter to continue"
    gets
  end
end

puts field
puts message
