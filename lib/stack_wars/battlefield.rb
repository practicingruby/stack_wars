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

    def initialize(territories)
      @territories = territories
    end

    def to_a
      Marshal.load(Marshal.dump(@territories))
    end

    def[](x,y)
      @territories[y][x]
    end

    # loses instance variables, but better than hitting to_s() by default
    alias_method :inspect, :to_s

    def to_s
      TextDisplay.new(to_a).to_s
    end
  end
end
