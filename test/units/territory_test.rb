require_relative "../test_helper"

describe "StackWars::Territory" do
  let(:black_player) { StackWars::Player.new("black") }
  let(:white_player) { StackWars::Player.new("white") }

  let(:white_baseline) { StackWars::Battlefield::WHITE_BASELINE }
  let(:black_baseline) { StackWars::Battlefield::BLACK_BASELINE }

  let(:columns)        { (0...StackWars::Battlefield::SIZE) }
  let(:interior_rows)  { (white_baseline+1..black_baseline-1) }

  def new_territory(*args)
    StackWars::Territory.new(*args)
  end

  it "must know when it is part of a baseline" do
    columns.each do |x|
      black_baseline_territory = new_territory([x, black_baseline])
      black_baseline_territory.must_be :baseline_for?, black_player
      black_baseline_territory.wont_be :baseline_for?, white_player

      white_baseline_territory = new_territory([x, white_baseline])
      white_baseline_territory.must_be :baseline_for?, white_player
      white_baseline_territory.wont_be :baseline_for?, black_player
    end
  end

  it "must know when it not part of a baseline" do
    columns.each do |x|
      interior_rows.each do |y|
        territory = new_territory([x,y])
        territory.wont_be :baseline_for?, black_player
        territory.wont_be :baseline_for?, white_player
      end
    end
  end

  it "treats each players baseline as controlled" do
    columns.each do |x|
      black_baseline_territory = new_territory([x, black_baseline])
      black_baseline_territory.must_be :controlled_by?, black_player
      black_baseline_territory.wont_be :controlled_by?, white_player

      white_baseline_territory = new_territory([x, white_baseline])
      white_baseline_territory.must_be :controlled_by?, white_player
      white_baseline_territory.wont_be :controlled_by?, black_player
    end
  end

  it "treats any occupied territory as controlled by the occupying player" do
    black_controlled_territory = 
      new_territory([3,3], :occupant => black_player.color, :army_strength => 1)

    white_controlled_territory = 
      new_territory([4,4], :occupant => white_player.color, :army_strength => 1)

    black_controlled_territory.must_be :controlled_by?, black_player
    black_controlled_territory.wont_be :controlled_by?, white_player

    white_controlled_territory.must_be :controlled_by?, white_player
    white_controlled_territory.wont_be :controlled_by?, black_player
  end

  it "allows the player to fortify any position on their own baseline" do
    columns.each do |x|
      black_territory = new_territory([x, black_baseline])
      black_territory.fortify(black_player)
        
      black_territory.army_strength.must_equal(1)
      black_territory.must_be :occupied_by?, black_player

      black_territory.fortify(black_player)
      black_territory.army_strength.must_equal(2)

      white_territory = new_territory([x, white_baseline])
      white_territory.fortify(white_player)
        
      white_territory.army_strength.must_equal(1)
      white_territory.must_be :occupied_by?, white_player

      white_territory.fortify(white_player)
      white_territory.army_strength.must_equal(2)
    end
  end

  it "allows the player to fortify their own occupied territories" do
    [black_player, white_player].each do |player|
       territory = 
         new_territory([3,3], :occupant =>player.color, :army_strength => 1)
       territory.fortify(player)
       territory.must_be :occupied_by?, player
       territory.army_strength.must_equal(2)
    end
  end

  it "does not allow fortifying unoccupied internal territories" do
    [black_player, white_player].each do |player|
      territory = new_territory([2,3])
      territory.wont_be :baseline_for?, player
      territory.wont_be :occupied?

      insist { territory.fortify(player) }.
        must_raise(StackWars::Errors::IllegalMove)
    end
  end
end
