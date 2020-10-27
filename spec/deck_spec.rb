require "spec_helper"

describe Deck do
  let(:deck) { Deck.new }

  it "does not allow the cards array to be directly modified" do
    expect { deck.cards << nil }.to raise_error(FrozenError)
  end

  describe "standard deck upon creation" do
    it "has 52 cards" do
      expect(deck.size).to eq(52)
    end

    it "has all unique cards" do
      expect(deck.cards.uniq.count).to eq(deck.cards.count)
    end

    it "should have 13 cards of each suit" do
      grouped_by_suit = subject.cards.map(&:suit).tally
      expect(grouped_by_suit.values.all? { |v| v == 13 }).to be true
      expect(grouped_by_suit.size).to eq(4)
    end

    it "should have 4 cards of each rank" do
      grouped_by_rank = subject.cards.map(&:rank).tally
      expect(grouped_by_rank.values.all? { |v| v == 4 }).to be true
      expect(grouped_by_rank.size).to eq(13)
    end

  end

  context "drawing" do
    let(:deck) { Deck.new }

    it "allows you to draw the top n cards of the deck" do
      cards = deck.draw(3)
      expect(cards.size).to eq(3)
    end

    it "removes the cards from the deck" do
      cards = deck.draw(3)
      expect(deck.cards & cards).to eq([])
    end
  end

  context "shuffling" do
    let(:deck) { Deck.new }

    it "should randomize the order of the cards in the deck" do
      top_cards = 10.times.collect do
        deck.shuffle
        deck.cards[0]
      end

      # If you shuffle 10 times and get the same top card more than 3 times...
      # well that's unlikely enough for me to draw the line here.
      expect(top_cards.uniq.count).to be > 7
    end
  end
end
