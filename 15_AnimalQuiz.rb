# The program starts by telling the user to think of an animal. 
# It then begins asking a series of yes/no questions about that animal: does it swim, does it have hair, etc. 
# Eventually, it will narrow down the possibilities to a single animal and guess that (Is it a mouse?).

# If the program has guessed correctly, the game is over and may be restarted with a new animal. 
# If the program has guess incorrectly, it asks the user for the kind of animal they were thinking of 
# and then asks for the user to provide a question that can distinguish between its incorrect guess and the correct answer. 
# It then adds the new question and animal to its "database" and will guess that animal in the future (if appropriate).


# pseudocode
# 1. create a menu that will loop and display the questions and route where necessary
# 2. create an animal and store it into an array as an object or key:value hash. update menu.
# 3. create the game/rules that actually does the logic. flow should be menu>game>animal>save animal and question tree>menu

require 'pry-byebug'

class Menu
  def self.ask?(question)
    p question
    answer = gets.chomp.downcase
    if answer == 'y'
      true
    elsif answer == 'n'
      false
    else
      puts "Enter a valid input: 'y' or 'n'"
      p '*'*20
      self.ask?(question)
    end
  end

  def self.request()

  end

  def self.say(*msg)
    p msg
  end
end

class Animal
  attr_accessor :name, :guess, :answer, :question

  def initialize(name)
    @name = name
    @guess = "Is it a #{name}?"
  end
end


class Game
  
  def initialize
    @animal = Animal.new("mouse")
    @database = [@animal]
  end

  def play
    p 'play'
    
    Menu.say('Think of an animal and I will guess it.')
    # sleep(4)
    Menu.say(@animal.guess)
    Menu.say(@database)
    Menu.say(@animal.answer)
    if Menu.ask?('Was I right? (y/n)')
      p '*'*20
      p 'I win'
      p '*'*20
    else
      p "What is the name of the animal you were thinking of?"
      answer = gets.chomp.downcase
      new_animal = Animal.new(name = answer)

      p "Tell me a (y/n) question to help identify this animal"
      new_animal.question = gets.chomp.to_s

      p "Tell me the answer to your question (y/n)"
      new_animal.answer = gets.chomp.to_s
      @database << new_animal
    end

    
    

  end
end

game = Game.new


loop do
  answer=Menu.ask?("Want to play?")
  if answer
    game.play

  else
    exit
  end
end

