class Card

  def card(args = {})
    @term = args[:term]
    @def = args[:def]
    @complete = fetch(:complete, false)
  end

  def mark_complete

  end

  def to.s

  end

end


