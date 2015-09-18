require 'pry'

module Parser
  extend self

  def read(filepath)
    # binding.pry
    array = []
    File.readlines(filepath).each do |line|
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
        card[:definition] = line
      elsif index % lines_per_card == 1
        card[:term] = line
      elsif index % lines_per_card == 2
        deck << card
        card = {}
      end
    end
     deck
  end

end



