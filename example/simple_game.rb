require_relative "../lib/stack_wars"

data = "#{File.dirname(__FILE__)}/../test/fixtures/active_battlefield.json"
field = StackWars::Battlefield.from_json(data)
game  = StackWars::Game.new(field)
game.active_player.instance_variable_set(:@reserves, 2)
game.opponent.instance_variable_set(:@reserves, 2)

message = catch(:game_over) do
  loop do
    system "clear"
    puts field

    puts
    puts "Current Score: #{game.active_player.color}: "+
         "#{game.active_player.successful_invasions}, "+
         "#{game.opponent.color}: "+
         "#{game.opponent.successful_invasions}"

    print "#{game.active_player.color}:#{game.active_player.reserves} > "

    md = gets.match(/^ *(?<pos1>\d+ +\d+) *(?<pos2>\d+ +\d+)? *$/)
    unless md
      puts "Unknown command. [press enter to resume]"
      gets
      next
    end

    begin
      if md[:pos2]
        game.play(md[:pos1].scan(/\d+/).map(&:to_i), md[:pos2].scan(/\d+/).map(&:to_i))
      else
        game.play(md[:pos1].scan(/\d+/).map(&:to_i))
      end
    rescue StackWars::Errors::IllegalMove
      puts "illegal move [press enter to resume]"
      gets
      next
    end
  end
end

puts message
