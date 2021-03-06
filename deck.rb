require_relative 'card'

class Deck
  attr_reader :name
  attr_accessor :cards
  attr_accessor :card_idx

  def initialize(args = {})
    @name = args[:name] || "Flash Cards"
    @cards = args[:cards] || []
    @card_idx = 0
  end

  def weight_cards
    weighted_cards = []
    cards.each do |card|
      card.weight.times { weighted_cards << card }
    end
    self.card_idx = 0
    self.cards = weighted_cards
  end

  def add_weight_to_current_card
    current_card.weight += 1
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

  def not_finished?
    card_idx < cards.length
    # cards.size <= card_idx
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
