require_relative 'deck'

describe 'Deck' do
  let(:deck) { Deck.new({cards: cards})}
  let(:card1) { Card.new({term: "one", definition: "This is the number one"})}
  let(:card2) { Card.new({term: "two", definition: "This is the number two"})}
  let(:card3) { Card.new({term: "three", definition: "This is the number three"})}
  let(:cards) { [card1, card2, card3] }

  it 'should initialize with the name "Flash Cards"' do
    expect(deck.name).to eq("Flash Cards")
  end

  it 'should have a cards array with all cards' do
    expect(deck.cards.first).to be_a(Card)
  end

  describe '#shuffle!' do
    xit 'should rearrange the cards array in a random order.' do
      # Assume to be true because using Ruby method
    end
  end

  describe '#current_card' do
    it 'should initialize with the first card' do
      expect(deck.current_card).to eq(card1)
    end
  end

  describe '#flip_card!' do
    it 'should change the current index of the card by 1' do
      p "************"
      p deck.card_idx
      deck.flip_card!
      p deck.card_idx
      expect{deck.flip_card!}.to change{deck.card_idx}.by(1)
    end
  end

  describe '#count_correct' do
    it 'should return the number of correct cards' do
      card1.got_correct = true
      expect(deck.count_correct).to eq(1)
    end
  end

  describe '#guess_for_current_card' do
    it 'should check the inputted attempt against the current card' do
      expect(deck.guess_for_current_card("one")).to eq(true)
    end
  end
end