require './Game.rb'
class Player < Game
  attr_accessor :name, :lifes
  
  def initialize(name)
    @name = name
    @lifes = 3  
  end
  
end