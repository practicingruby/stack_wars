require_relative "../test_helper"

describe "A full game of stack wars" do
  let(:moves) do     
    moves_file = "#{File.dirname(__FILE__)}/../fixtures/moves.json"
    JSON.load(File.read(moves_file))
  end

  let(:battlefield) { StackWars::Battlefield.new }

  let(:game) { StackWars::Game.new(battlefield) }

  it "must end as expected" do
    message = catch(:game_over) do
      moves.each { |move| game.play(*move) } 
    end

    message.must_equal "white won!"

    white = game.active_player
    black = game.opponent

    battlefield.deployed_armies(white).must_equal(4)
    battlefield.deployed_armies(black).must_equal(0)

    white.reserves.must_equal(0)
    black.reserves.must_equal(0)

    white.successful_invasions.must_equal(6)
    black.successful_invasions.must_equal(4)
  end
end
