module StackWars
  class Battlefield
    SIZE = 9
    WHITE_BASELINE = 0
    BLACK_BASELINE = SIZE - 1

    def self.from_json(json_file)
      territory_data = JSON.parse(File.read(json_file))

      territories = territory_data.map.with_index do |row, y|
        row.map.with_index do |t, x|
          occupant, strength = t
          if occupant == "unclaimed"
            Territory.new([x,y])
          else
            Territory.new([x,y], :occupant      => occupant, 
                                 :army_strength => strength)
          end
        end
      end
      
      new(territories)
    end

    def initialize(territories=nil)
      if territories
        @territories = territories
      else
        @territories = 
          SIZE.times.map { |y| SIZE.times.map { |x| Territory.new([x,y]) } }   
      end
    end

    def to_a
      Marshal.load(Marshal.dump(@territories))
    end

    def adjacent?(pos1, pos2)
      (pos1.row == pos2.row && (pos1.column - pos2.column).abs == 1) ||
      (pos2.column == pos2.column && (pos1.row - pos2.row).abs == 1)
    end

    def[](x,y)
      unless [x,y].all? { |c| (WHITE_BASELINE..BLACK_BASELINE).include?(c) }
        raise Errors::OutOfBounds 
      end

      @territories[y][x]
    end

    def deployed_armies(player)
      # FIXME: Inefficient, can probably store integer values on write
      @territories.flatten.reduce(0) do |s, t| 
         s + (t.occupant == player.color ? t.army_strength : 0)
      end
    end

    # loses instance variables, but better than hitting to_s() by default
    alias_method :inspect, :to_s

    def to_s
      TextDisplay.new(to_a).to_s
    end
  end
end
