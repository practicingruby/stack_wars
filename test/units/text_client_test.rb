require_relative "../test_helper"

describe "StackWars::TextClient" do
  let(:game) { MiniTest::Mock.new }

  subject { StackWars::TextClient.new(game) }

  it "should parse single point commands" do
    game.expect(:play, nil, [[8,0]])
    subject.play("8 0")

    game.verify
  end

  it "should parse two point commands" do
    game.expect(:play, nil, [[3,3],[3,4]])
    subject.play("3 3 3 4")

    game.verify
  end

  it "should raise a ParseError when given junk commands" do
    ["1", "1 0 1", "1 0 1 1 z", "asf"].each do |junk|
      insist { subject.play(junk) }.must_raise(StackWars::Errors::ParseError)
    end
  end
end
