module StackWars
  class TextDisplay
    COLOR_SYM = { "black" => "B", "white" => "W" }
    HEADER    = "#{' '*7}#{(0..8).to_a.join(' '*6)}"
    SEPARATOR = "#{' '*6} #{9.times.map { '|' }.join(' '*6)}"

    BLACK_BORDER  = "#{' '*5}#{COLOR_SYM['black']*61}"
    WHITE_BORDER  = "#{' '*5}#{COLOR_SYM['white']*61}"

    def initialize(battlefield)
      @battlefield = battlefield
    end

    # loses instance variables, but better than hitting to_s() by default
    alias_method :inspect, :to_s

    def to_s
      battlefield_text = @battlefield.map.with_index do |row, row_index|
        row_text = row.map do |color, strength|
          if color == "unclaimed"
            "(___)"
          else
            "(#{COLOR_SYM[color]}#{strength.to_s.rjust(2)})"
          end
        end.join("--")

        "#{row_index.to_s.rjust(3)}  #{row_text}\n"
      end.join("#{SEPARATOR}\n")

      [HEADER, BLACK_BORDER, battlefield_text.chomp, WHITE_BORDER].join("\n")
    end
  end
end
