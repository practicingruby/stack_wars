require "json"

data = JSON.parse(File.read(ARGV[0]))

color_to_symbol = { "black" => "B", "white" => "W" }

output = data.map do |row|
  row.map do |color, strength|
    if color == "unclaimed"
      "(___)"
    else
      "(#{color_to_symbol[color]}#{strength.to_s.rjust(2)})"
    end
  end.join("--") + "\n"
end.join("  |      |      |      |      |      |      |      |      |\n")

puts output
