require_relative 'parser'
require_relative 'deck'
require_relative 'card'
require_relative 'view'

class Controller
  include Parser

  attr_reader :deck, :cards, :view, :file
  attr_accessor :not_done

  def initialize
    @file = file
    @view = View.new
    view.ask_for_subject
    choice = view.input.upcase
      if choice == "RUBY"
        file = 'flashcard_samples.txt'
      elsif choice == "MOVIES"
        file = 'movies_deck.txt'
      else
        file = 'flashcard_samples.txt'
      end
     # create array of hash of cards
    @cards = Parser.cards(file).map { |card_hash| Card.new(card_hash) }
    # instantiate a deck populated w/ cards
    @deck = Deck.new({cards: cards})
    @not_done = true
  end

  def run
    view.welcome
    view.ask_for_subject
    while not_done
      deck.shuffle!
      deck.cards.length.times {play_turn}
    end
    view.game_over
  end

  def play_turn
    wrong_guesses = 0
    while wrong_guesses < 3
      view.question_prompt
      view.to_s(deck.current_definition)
      view.answer_prompt
      input = view.input
      if input == "quit"
        self.not_done = false
        break
      elsif input == "skip"
        break
      else
        if deck.guess_for_current_card(input)
          view.right_guess
          deck.flip_card!
          break
        else
          deck.add_weight_to_current_card
          wrong_guesses += 1
          view.wrong_guess
        end
      end
    end
    view.guess_3_times if wrong_guesses == 3
    deck.flip_card!
  end

end

#calling #run to run program


Controller.new.run
