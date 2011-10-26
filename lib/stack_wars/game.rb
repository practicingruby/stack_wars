module StackWars
  class Game
    def initialize(battlefield)
      @players         = [Player.new("black"), Player.new("white")].cycle
      @battlefield     = battlefield
      start_new_turn 
    end

    attr_reader :active_player

    def opponent
      @players.peek
    end

    def play(pos1, pos2=nil)
      if pos2.nil?
        territory = territory_at(pos1)     
        
        territory.fortify(active_player)
      else
        from = territory_at(pos1)
        to   = territory_at(pos2)

        raise Errors::IllegalMove unless battlefield.adjacent?(from, to)

        if to.occupied_by?(opponent)
          attack(from, to)
        else
          move_army(from, to) 
        end
      end
      
      game_over || start_new_turn
    end

    def game_over
      deployed_armies = battlefield.deployed_armies(active_player) 
      if active_player.reserves + deployed_armies == 0
        case
        when active_player.successful_invasions > opponent.successful_invasions     
          throw :game_over, "#{active_player.color} won!"
        when active_player.successful_invasions < opponent.successful_invasions
          throw :game_over, "#{opponent.color} won!"
        else
          throw :game_over, "its a draw"
        end
      end
    end

    def start_new_turn
      @active_player = @players.next
    end

    private

    attr_reader :battlefield

    def move_army(from, to)
      from.remove_one_army
      if to.baseline_for?(opponent)
        active_player.invade_enemy_territory
      else
        to.add_one_army(active_player)
      end
    end

    def attack(from, to)
      raise Errors::IllegalMove if from.army_strength != 1

      to.remove_one_army
      move_army(from, to) unless to.occupied?
    end

    def territory_at(position)
      @battlefield[*position]
    rescue Errors::OutOfBounds
      raise Errors::IllegalMove
    end
  end
end
