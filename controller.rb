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
    # create array of hash of cards
    @cards = Parser.cards(file).map { |card_hash| Card.new(card_hash) }
    # instantiate a deck populated w/ cards
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
    wrong_guesses = 0
    while wrong_guesses < 3
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
        if deck.guess_for_current_card(input)
          view.right_guess
          deck.flip_card!
          break
        else
          wrong_guesses += 1
          view.wrong_guess
        end
      end
    end
    deck.flip_card!
  end

end

#calling #run to run program
Controller.new('flashcard_samples.txt').run
