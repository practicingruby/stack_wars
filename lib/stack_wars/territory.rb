module StackWars
  class Territory
    def initialize(position, params={})
      @position = position
      @occupant = params.fetch(:occupant, nil)

      if occupied?
        @army_strength = params.fetch(:army_strength)
      else
        @army_strength = 0
      end
    end

    attr_reader :occupant, :army_strength

    def controlled_by?(player)
      baseline_for?(player) || occupied_by?(player) 
    end

    def add_one_army(player)
      @army_strength += 1

      @occupant ||= player.color
    end

    def remove_one_army
      raise Errors::IllegalMove unless @army_strength > 0

      @army_strength -= 1
      @occupant = nil if @army_strength == 0
    end

    def fortify(player)
      if controlled_by?(player)
        player.deploy_army
        add_one_army(player)

        @occupant ||= player.color
      else
        raise Errors::IllegalMove
      end
    end

    def occupied?
      !!@occupant
    end

    def unoccupied?
      !occupied?
    end

    def occupied_by?(player)
      @occupant == player.color
    end

    def baseline_for?(player)
      case player.color
      when "white"
        row == Battlefield::WHITE_BASELINE
      when "black"
        row == Battlefield::BLACK_BASELINE
      else
        raise ArgumentError, "#{color} is not a valid color"
      end
    end

    def row
      @position[1]
    end

    def column
      @position[0]
    end
  end
end
