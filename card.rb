class Card

  attr_reader :term, :def
  attr_accessor :complete

  def initialize(args = {})
    @term = args[:term]
    @def = args[:def]
    @complete = args.fetch(:complete, false)
  end

  def mark_complete
    @complete = true
  end

  def to_s
    "#{self.term}: #{self.def}"
  end

  def guess(string)
    mark_complete if self.term == string
    complete
  end

  def got_correct?
    true if complete == true
    complete
  end

end

# driver test

test = Card.new({term: 'alias', def: 'To create a second name for the variable or method'})
print test

# p test.guess('alias')
p test.guess('sucks balls')
p test.got_correct?

