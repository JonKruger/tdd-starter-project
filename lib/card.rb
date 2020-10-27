class Card
  VALID_RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  VALID_SUITS = %w[hearts diamonds clubs spades]

  attr_reader :rank, :suit

  def initialize(rank, suit)
    raise "Invalid rank" unless VALID_RANKS.include?(rank)
    raise "Invalid suit" unless VALID_SUITS.include?(suit)

    @rank = rank
    @suit = suit
  end

  def ==(other)
    rank == other&.rank && suit == other&.suit
  end

  alias_method :eql?, :==

  def hash
    (rank + suit).hash
  end
end
