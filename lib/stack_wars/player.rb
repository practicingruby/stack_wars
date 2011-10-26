module StackWars
  class Player
    def initialize(color)
      @color                = color
      @reserves             = 3*Battlefield::SIZE
      @successful_invasions = 0
    end

    attr_reader :color, :reserves, :successful_invasions

    def deploy_army
      raise Errors::IllegalMove unless @reserves > 0
      @reserves -= 1
    end

    def invade_enemy_territory
      @successful_invasions += 1
    end
  end
end
