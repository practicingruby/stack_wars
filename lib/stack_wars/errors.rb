module StackWars
  module Errors
    IllegalMove = Class.new(StandardError)
    OutOfBounds = Class.new(StandardError)
    ParseError  = Class.new(StandardError)
  end
end
