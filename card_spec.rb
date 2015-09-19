require_relative('card')

describe Card do

  details = { term: "Jurassic Park", definition: "The Greatest Goddamn Movie Ever" }
  let(:card) { Card.new(details) }

    describe '#term' do
      it 'should return the term of the card object' do
        expect(card.term).to eq("Jurassic Park")
      end
    end

    describe '#definition' do
      it 'should return the definition of the card object' do
        expect(card.definition).to eq("The Greatest Goddamn Movie Ever")
      end
    end

    describe '#to_s' do
      it 'should print information' do
        expect(card.to_s).to eq("Jurassic Park: The Greatest Goddamn Movie Ever")
      end
    end

    describe '#got_correct' do
      it 'should return got_correct status' do
        expect(card.got_correct).to eq(false)
      end
    end

    describe '#mark_complete' do
      it 'should turn got_correct status to true' do
        expect(card.mark_complete).to eq(true)
      end
    end

end