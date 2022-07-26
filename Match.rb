require './Player.rb'
require './Game.rb'
require './prompts.rb'
## creates a new game

class Match
##creates new players and starts game
  def initialize()
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    @g1 = Game.new(@p1,@p2,PromptsList::PROMPTS)

    curr_asker = @p1
    prev_asker = @p2
    while (!@g1.is_game_over?())
      @g1.play_round(curr_asker, prev_asker)
      temp = curr_asker
      curr_asker = prev_asker
      prev_asker = temp
      puts "----- NEW TURN -----"
    end

  end

end

