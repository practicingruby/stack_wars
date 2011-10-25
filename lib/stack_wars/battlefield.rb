module StackWars
  class Battlefield
    def self.from_json(json_file)
      new(JSON.parse(File.read(json_file)))
    end

    def initialize(territories)
      @territories = territories
    end

    def to_a
      Marshal.load(Marshal.dump(@territories))
    end

    # loses instance variables, but better than hitting to_s() by default
    alias_method :inspect, :to_s

    def to_s
      TextDisplay.new(to_a).to_s
    end
  end
end
