require './Player.rb'

class Game 

  def initialize(p1, p2,prompts)
    @p1 = p1
    @p2 = p2
    @prompt = 0
    @prompts = prompts
    @num_prompts = @prompts.length()
    @prompts_list = get_prompts_index_array().shuffle()
  end

  def is_game_over?
    if @p1.lifes == 0
      read_winner(@p2)
      return true
    elsif @p2.lifes == 0
      read_winner(@p1)
      return true
    else 
      return false
    end
  end

  def play_round(asker,player)
  # keep asking questions
    puts get_question(asker)
    puts get_answer(player)
    puts read_score()
  end

  def read_score
    "P1: #{@p1.lifes()}/3 vs P2: #{@p2.lifes()}/3"
  end

  def read_winner(player)
    puts "Player #{player.name} wins with a score of #{player.lifes}/3"

    puts "----- GAME OVER -----"
    puts "Good bye!"    
  end

  def get_question(asker)
    "Player #{asker.name}: #{@prompts[@prompt][:question]} \n"
  end

  #check answer, update lifes if wrong, puts response
  def get_answer(player)
    input = gets.chomp

    if input == @prompts[@prompt][:answer]
      set_prompt()
      return "Player #{player.name}: Yes! You are correct"
    else
      set_prompt()
      player.lifes -= 1
      return "Player #{player.name}: Seriously? No!"
    end    
  end 

  def set_prompt
    if @prompt == @prompts_list.length()-1
      @prompt = 0
      @prompts_list.shuffle()      
    else
      @prompt += 1  
    end 
  end

  def get_prompts_index_array
    temp = []
    i = 0
    while i < @num_prompts
      temp.push(i)
      i+=1
    end
    temp
  end 

end