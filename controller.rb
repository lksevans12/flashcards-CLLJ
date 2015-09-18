require_relative 'model'
require_relative 'view'

class Controller
  attr_reader :model, :view
  def initialize(params = {})
    @model = params[:model]
    @view = params[:view]
  end

  def run
    #logic here to run program?
  end
end

#calling #run to run program
# Controller.new().run
