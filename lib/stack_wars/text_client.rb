module StackWars
  class TextClient
    def initialize(game)
      @game = game
    end

    def play(string)
      md = string.match(/^ *(?<pos1>\d+ +\d+) *(?<pos2>\d+ +\d+)? *$/)

      raise Errors::ParseError unless md

      if md[:pos2]
        @game.play(point(md[:pos1]), point(md[:pos2]))
      else
        @game.play(point(md[:pos1]))
      end
    end

    private

    def point(string)
      string.scan(/\d+/).map(&:to_i)
    end
  end
end
