require_relative 'card'

class Deck
  attr_reader :name, :cards
  attr_accessor :card_idx

  def initialize(args = {})
    @name = args[:name] || "Flash Cards"
    @cards = args[:cards] || []
    @card_idx = 0
  end

  def shuffle!
    cards.shuffle!
  end

  def current_card
    cards[card_idx]
  end

  def current_definition
    current_card.definition
  end

  def current_term
    current_card.term
  end

  def flip_card!
    self.card_idx += 1
  end

  def finished?
    cards.size <= card_idx
  end

  def count_correct
    cards.select{ |card| card.got_correct }.size
  end

  def guess_for_current_card(attempt)
    current_card.guess(attempt)
  end
end

deck = Deck.new
deck.flip_card!
