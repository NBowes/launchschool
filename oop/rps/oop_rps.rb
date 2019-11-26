class Move
  CHOICES = %w[rock paper scissors].freeze

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
    @choice == 'scissors'
  end

  def >(other)
    (rock? && other.scissors?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?)
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.paper?)
  end

  def to_s
    @choice
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
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
      puts 'Please choose rock, paper, scissors:'
      choice = gets.chomp
      break if Move::CHOICES.include? choice

      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Pixel 4XL', 'Pixel 3', 'Pixel 2XL', 'Computer'].sample
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

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_score
    puts '----------------------'
    puts 'Score:'
    puts "#{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
    puts '----------------------'
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won :("
      computer.score += 1
    else
      puts "It's a tie"
    end
  end

  def winner?
    human.score == 5 || computer.score == 5
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? ('yes' or 'no')"
      answer = gets.chomp
      break if %w[yes no].include? answer.downcase

      puts "Invalid answer. Please type 'yes' or 'no'."
    end
    answer == 'yes'
  end

  def main_game
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break if winner?
    end
  end

  def play
    display_welcome_message
    loop do
      main_game
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
