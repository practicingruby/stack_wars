require "json"
require_relative "../lib/stack_wars"

data = JSON.parse(File.read(ARGV[0]))

puts StackWars::TextDisplay.new(data)