require_relative "../test_helper"

describe "StackWars::Game" do

  let(:territory)   { mock("territory") }
  let(:battlefield) { mock("battlefield") }

  subject { StackWars::Game.new(battlefield) }

  it "must be able to alternate players" do
    subject.active_player.color.must_equal :black

    subject.start_new_turn
    subject.active_player.color.must_equal :white

    subject.start_new_turn
    subject.active_player.color.must_equal :black
  end

  it "must be able to fortify positions" do
    subject.expects(:territory_at).with([0,1]).returns(territory)
    territory.expects(:fortify).with(subject.active_player)

    subject.fortify([0,1])
  end
end
