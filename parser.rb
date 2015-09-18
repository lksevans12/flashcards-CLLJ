require 'pry'

module Parser
  extend self

  def read(filepath)
    # binding.pry
    array = []
    File.readlines(filepath, 'r').each do |line|
      array <<line
    end
    puts array
  end




end
