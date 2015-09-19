require_relative 'parser'
require_relative 'deck'
require_relative 'card'
require_relative 'view'

class Controller
  include Parser

  attr_reader :deck, :cards, :view

  def initialize(file)
    @file = file
    @view = View.new
    @cards = Parser.cards(file).map { |card_hash| Card.new(card_hash) }
    @deck = Deck.new({cards: cards})
  end

  def run
    deck.shuffle!
    view.welcome
    while !deck.finished?
      play_turn
    end
    view.game_over
  end

  def play_turn
    view.question_prompt
    definition = deck.current_definition
    view.to_s(definition)
    view.answer_prompt
    input = view.input
    if input == "quit"
      deck.card_idx = deck.cards.length
    elsif input == "skip"
      deck.flip_card!
    else
      wrong_guesses = 0
      while wrong_guesses <= 1
        view.question_prompt
        view.to_s(definition)
        view.answer_prompt
        input = view.input
        deck.guess_for_current_card(input) ? break : wrong_guesses += 1
      end
      deck.flip_card!
    end
  end
end

Controller.new('flashcard_samples.txt').run
