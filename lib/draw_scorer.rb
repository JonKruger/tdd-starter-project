class DrawScorer
  def score(cards)
    score = 0
    score += score_ranks(cards)
    score += score_pairs(cards)
    score += score_three_of_a_kind(cards)
    score += score_four_of_a_kind(cards)
    score += score_spades(cards)
    score
  end

  private 

  def score_ranks(cards)
    ten_point_ranks = %w(J Q K)
    numerical_ranks = %w(2 3 4 5 6 7 8 9 10)
    score = 0
    score += cards.select { |card| ten_point_ranks.include?(card.rank) }.size * 10
    score += cards.select { |card| card.rank == "A" }.size * 15
    score += cards.select { |card| numerical_ranks.include?(card.rank) }.map(&:rank).map(&:to_i).sum
  end

  def score_pairs(cards)
    score_same_rank(cards, 2, 50)
  end

  def score_three_of_a_kind(cards)
    score_same_rank(cards, 3, 150)
  end 

  def score_four_of_a_kind(cards)
    score_same_rank(cards, 4, 300)
  end 

  def score_same_rank(cards, number, score_bonus)
    cards.group_by { |card| card.rank }.select { |k, v| v.size == number }.size * score_bonus
  end

  def score_spades(cards)
    cards.select { |card| card.suit == "spades" }.size
  end
end