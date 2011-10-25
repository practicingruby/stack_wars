require "json"

data = JSON.parse(File.read(ARGV[0]))

color_to_symbol = { "black" => "B", "white" => "W" }

header    = "       0      1      2      3      4      5      6      7      8\n"
separator = "       |      |      |      |      |      |      |      |      |\n"

border_b  = "     BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\n"
border_w  = "     WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW\n"

battlefield_text = data.map.with_index do |row, row_index|
  row_text = row.map do |color, strength|
    if color == "unclaimed"
      "(___)"
    else
      "(#{color_to_symbol[color]}#{strength.to_s.rjust(2)})"
    end
  end.join("--")

  "#{row_index.to_s.rjust(3)}  #{row_text}\n"
end.join(separator)

puts [header, border_b, battlefield_text, border_w].join
