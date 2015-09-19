class View

  def welcome
    print "Welcome to Flashcards! Once you see the definition, enter your guess or quit to end the game.\n"
    #You're using the deck #{filepath}! << -- how can I code this?
    print '*' * 83
    puts
  end

  def question_prompt
    print 'Definition:  '
  end

  def answer_prompt
    print "Answer: "
  end

  def wrong_guess
    print "Good guess, but its not the right one! Try again!"
  end

  def right_guess
    print "Correct! Good job!"
  end

  def input
    gets.chomp
  end

  def game_over
    print "Game Over!"
  end

  def to_s(string)
    print string
  end
end



