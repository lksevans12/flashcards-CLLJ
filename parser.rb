module Parser
  extend self

  def read(filepath)
    array = []
    File.readlines(filepath).map do |line|
      array <<line
    end
    array
  end

  def cards(file)
    deck = []
    card = {}
    lines_per_card = 3

    read(file).each_with_index do |line, index|
      if index % lines_per_card == 0
        card[:definition] = line.chomp
      elsif index % lines_per_card == 1
        card[:term] = line.chomp
      elsif index % lines_per_card == 2
        deck << card
        card = {}
      end
    end
     deck
  end
end



#controller notes

#multiple decks?
#ARGV.empty? ? filename = 'flashcard_test.txt' : filename = ARGV[0]
