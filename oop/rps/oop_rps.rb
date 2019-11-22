class Move
  CHOICES = ['rock', 'paper', 'scissors']

  def initialize(choice)
    @choice = choice
  end

  def rock?
    @choice == 'rock'
  end

  def paper?
    @choice == 'paper'
  end

  def scissors?
    @scissors == 'scissors'
  end

  def >(other_choice)
    if rock?
      return true if other_choice.scissors?
      return false
    elsif paper?
      return true if other_choice.rock?
      return false
    elsif scissors?
      return true if other_choice.paper?
      return false
    end
  end

  def <(other_choice)
    if rock?
      return true if other_choice.paper?
      return false
    elsif paper?
      return true if other_choice.scissors?
      return false
    elsif scissors?
      return true if other_choice.paper?
      return false
    end
  end

  def to_s
    @choice
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = nil
    loop do
      puts 'What is your name?'
      name = gets.chomp
      break unless name.empty?
    end
    self.name = name.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors:"
      choice = gets.chomp
      break if Move::CHOICES.include? choice
      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = [ 'Google Pixel 4XL', 'Google Pixel 3', 'Google Pixel 2XL', 'Computer'].sample
  end

  def choose
    self.move = Move.new(Move::CHOICES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors #{human.name}!"
  end

  def display_winner
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won :("
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? ('yes' or 'no')"
      answer = gets.chomp
      break if ['yes', 'no'].include? answer.downcase
      puts "Invalid answer. Please type 'yes' or 'no'."
    end
    answer == 'yes'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
