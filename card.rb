class Card

  attr_reader :term, :definition
  attr_accessor :got_correct, :wait

  def initialize(args = {})
    @term = args[:term]
    @definition = args[:definition]
    @got_correct = args.fetch(:complete, false)
    @wait = 1
  end

  def mark_complete
    @got_correct = true
  end

  def to_s
    "#{self.term}: #{self.definition}"
  end

  def guess(string)
    term == string ? mark_complete : false
  end

end

# driver test

# p test = Card.new({term: 'alias', def: 'To create a second name for the variable or method'})


# p test.guess('alias')
# p test.guess('sucks balls')
# p test.got_correct?

