class Deck
  def initialize
    @cards = []
    Card::VALID_RANKS.each do |rank|
      Card::VALID_SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def size
    @cards.size
  end

  def cards
    @cards.dup.freeze
  end

  def draw(number_of_cards)
    @cards.shift(number_of_cards)
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
