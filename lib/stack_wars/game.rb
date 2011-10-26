module StackWars
  class Game
    def initialize(battlefield)
      @players         = [Player.new("black"), Player.new("white")].cycle
      @battlefield     = battlefield
      start_new_turn 
    end

    attr_reader :active_player

    def play(position)
      territory = territory_at(position)     
      
      territory.fortify(active_player)
      start_new_turn
    end

    def start_new_turn
      @active_player  = @players.next
    end

    private

    def territory_at(position)
      @battlefield[*position]
    end
  end
end
