module StackWars
  class Game
    def initialize(battlefield)
      @players         = [Player.new(:black), Player.new(:white)].cycle
      @battlefield     = battlefield
      start_new_turn 
    end

    attr_reader :active_player

    def fortify(position)
      territory = territory_at(position)     
      
      territory.fortify(active_player)
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
