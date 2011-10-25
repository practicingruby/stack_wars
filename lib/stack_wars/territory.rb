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

    def occupied?
      !!@occupant
    end

    def occupied_by?(player)
      @occupant == player.color
    end

    def baseline?(player)
      case player.color
      when "white"
        row == 0
      when "black"
        row == Battlefield::SIZE - 1
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
