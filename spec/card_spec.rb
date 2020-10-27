require "spec_helper"

describe Card do
  context "valid ranks" do
    it "allows creation" do
      Card::VALID_RANKS.each do |rank|
        Card.new(rank, "hearts")
      end
    end
  end

  context "invalid ranks" do
    it "raises error on creation" do
      expect { Card.new("0", "hearts") }.to raise_error("Invalid rank")
    end
  end

  context "valid suits" do
    it "allows creation" do
      Card::VALID_SUITS.each do |suit|
        Card.new("2", suit)
      end
    end
  end

  context "invalid suits" do
    it "raises error on creation" do
      expect { Card.new("2", "circles") }.to raise_error("Invalid suit")
    end
  end

  it "does not allow you to modify the rank" do
    card = Card.new("2", "hearts")
    expect { card.rank = "3" }.to raise_error(NoMethodError)
  end

  it "does not allow you to modify the suit" do
    card = Card.new("2", "hearts")
    expect { card.suit = "spades" }.to raise_error(NoMethodError)
  end

  context "equality" do
    it "considers cards with the same rank and suit to be equal" do
      expect(Card.new("2","hearts") == Card.new("2", "hearts")).to be true
    end

    it "considers cards with different rank to be not equal" do
      expect(Card.new("2","hearts") == Card.new("3", "hearts")).to be false
    end

    it "considers cards with different suit to be not equal" do
      expect(Card.new("2","hearts") == Card.new("2", "spades")).to be false
    end

    it "is not equal to nil" do
      expect(Card.new("2","hearts") == nil).to be false
    end
  end

  context "inequality" do
    it "considers cards with the same rank and suit to be equal" do
      expect(Card.new("2","hearts") != Card.new("2", "hearts")).to be false
    end

    it "considers cards with different rank to be not equal" do
      expect(Card.new("2","hearts") != Card.new("3", "hearts")).to be true
    end

    it "considers cards with different suit to be not equal" do
      expect(Card.new("2","hearts") != Card.new("2", "spades")).to be true
    end

    it "is not equal to nil" do
      expect(Card.new("2","hearts") != nil).to be true
    end
  end

  context "hashes" do
    it "should have the same hash for equal cards" do
      expect(Card.new("2","hearts").hash).to eq(Card.new("2", "hearts").hash)
    end

    it "should have different hashes for unequal cards" do
      expect(Card.new("2","hearts").hash).to_not eq(Card.new("3", "hearts").hash)
    end
  end

  context "uniqueness" do
    it "considers two equal objects to not be unique" do
      card1 = Card.new("2", "hearts")
      card2 = Card.new("2", "hearts")
      expect([card1, card2].uniq.count).to eq(1)
    end

    it "considers two unequal objects to not be unique" do
      card1 = Card.new("2", "hearts")
      card2 = Card.new("3", "hearts")
      expect([card1, card2].uniq.count).to eq(2)
    end
  end
end

