module StackWars
  class Player
    def initialize(color)
      @color    = color
      @reserves = 3*Battlefield::SIZE
    end

    def deploy_army
      @reserves -= 1
    end

    attr_reader :color, :reserves
  end
end
