require_relative 'parser'

describe Parser do
  let(:cards) { Parser.read('flashcard_samples.txt') }
  let(:new_cards) { CardParser.make_cards('flashcard_samples.txt') }

  describe '#parser' do
    it 'should return an Array' do
      expect(cards).to be_an_instance_of Array
    end
  end
end
