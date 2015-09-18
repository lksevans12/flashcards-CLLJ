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
    @deck = Deck.new(cards)
  end
    # retrieve hash from parser
    # creating array of cards from hash
    # create new deck w/ array
    #run

  def run
    view.welcome
    unless deck.finished?
      play_turn
    end
    view.game_over
    # view.question_prompt
    # #display current card (definition)
    # definition = deck.current_definition
    # view.to_s(definition)

    # view.answer_prompt
    # #display: user "guess"
    # #retrieve user input
    # input = view.input
    # unless input == "exit"
    #check input: return T/F
    # deck.guess_for_current_card(input)

    # #flip_card if T
    #logic here to run program?
  end

  def play_turn
    view.question_prompt
    #display current card (definition)
    definition = deck.current_definition
    view.to_s(definition)
    view.answer_prompt
    #display: user "guess"
    #retrieve user input
    input = view.input
    if input == "exit"
    elsif input == "skip"
      deck.flip_card!
    else
      wrong_guesses = 0
      while wrong_guesses <= 3
        deck.guess_for_current_card(input) ? break : wrong_guesses += 1
      end
      deck.flip_card!
    end
  end
end

#calling #run to run program
Controller.new(flashcard_samples.txt).run
