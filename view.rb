class View

  def welcome
    print "Welcome to Flashcards! Once you see the definition, enter your guess or quit to end the game.\n"
    print '*' * 83
  end

  def question_prompt
    print 'Definition:  '
  end

  def answer_prompt
    print "Answer: "
  end

  def input
    gets#.chomp?
  end

  def game_over
    print "Game Over!"
  end

  def to_s(string)
    print string
  end
end



