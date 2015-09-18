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
    if term == string
      mark_complete
  end

  def got_correct?


  end

end

# driver test

test = Card.new({term: 'alias', def: 'To create a second name for the variable or method'})
print test


