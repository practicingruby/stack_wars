module StackWars
  class Player
    def initialize(color)
      @color    = color
      @reserves = 3*Battlefield::SIZE
    end

    def decrease_reserves
      @reserves -= 1
    end

    attr_reader :color, :reserves
  end
end
