class Deck
  attr_reader :name, :cards
  attr_accessor :card_idx

  def initialize(args = {})
    @name = args[:name] || "Flash Cards"
    @cards = args[:cards] || []
    @card_idx = 0
  end

  def shuffle
    cards.shuffle!
  end

  def current_card
    cards[card_idx]
  end

  def next_card
    card_idx += 1
  end

  def count_correct
    cards.select{ |card| card.got_correct? }.size
  end

  def guess(attempt)
    current_card.guess(attempt)
  end

end