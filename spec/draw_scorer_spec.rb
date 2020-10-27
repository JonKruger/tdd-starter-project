require "spec_helper"

describe DrawScorer do
  subject { DrawScorer.new }
  
  context "face cards = 10 each" do
    %w(J Q K).each do |rank|
      context "#{rank}" do
        it "is 10 points" do
          card = Card.new(rank, "hearts")
          expect(subject.score([card])).to eq(10)
        end
      end
    end
  end

  context "aces = 15 each" do
    it "it is 15 points" do
      card = Card.new("A", "hearts")
      expect(subject.score([card])).to eq(15)
    end
  end

  %w(2 3 4 5 6 7 8 9 10).each do |rank|
    context "numbers (#{rank}) = number value" do
      it "is #{rank.to_i} points" do
        card = Card.new(rank, "hearts")
        expect(subject.score([card])).to eq(rank.to_i)
      end
    end
  end

  context "each pair = 50" do
    it "should give a 50 pt bonus in addition to card score" do
      cards = [Card.new("J", "hearts"), Card.new("J", "clubs")]
      expect(subject.score(cards)).to eq(10 + 10 + 50)
    end
  end

  context "three of a kind = 150" do
    it "should give a 150 pt bonus in addition to card score" do
      cards = [Card.new("J", "diamonds"), Card.new("J", "clubs"), Card.new("J", "hearts")]
      expect(subject.score(cards)).to eq(10 + 10 + 10 + 150)
    end
  end

  context "four of a kind = 300" do
    it "should give a 300 pt bonus in addition to card score" do
      cards = [Card.new("J", "spades"), Card.new("J", "clubs"), Card.new("J", "hearts"), Card.new("J", "diamonds")]
      expect(subject.score(cards)).to eq(10 + 10 + 10 + 10 + 300 + 1)
    end
  end

  context "each spade = 1" do
    it "should give 1 pt for each spade" do
      cards = [Card.new("J", "spades"), Card.new("Q", "spades"), Card.new("K", "clubs")]
      expect(subject.score(cards)).to eq(10 + 10 + 10 + 1 + 1)
    end
  end

end