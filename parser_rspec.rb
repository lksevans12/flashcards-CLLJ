require_relative 'parser'

describe Parser do
  let(:cards) { Parser.read('flashcard_samples.txt') }
  let(:new_cards) { Parser.cards('flashcard_samples.txt') }

  describe '#parser' do
    it 'should return an Array' do
      expect(cards).to be_an_instance_of Array
    end
  end

  describe '#cards' do
    it 'should return an Array for the deck' do
      expect(new_cards).to be_an_instance_of Array
    end

    it 'should have Hash objects for the cards' do
      expect(new_cards.first).to be_an_instance_of Hash
    end
  end
end
