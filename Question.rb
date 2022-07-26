require './prompts.rb'

def find(index)
  @prompts[index][:question]
end

puts find(1)

puts @num_prompts