class Move
  CHOICES = %w[Rock Paper Scissors Lizard Spock].freeze

  def initialize(choice)
    @choice = choice
  end

  def rock?
    @choice == 'Rock'
  end

  def paper?
    @choice == 'Paper'
  end

  def scissors?
    @choice == 'Scissors'
  end
  
  def lizard?
    @choice == 'Lizard'
  end

  def spock?
    @choice == 'Spock'
  end

  def >(other)
    (rock? && (other.scissors? || other.lizard?)) ||
      (paper? && (other.rock? || other.spock?)) ||
      (scissors? && (other.paper?|| other.lizard?)) ||
      (lizard? && (other.paper? || other.spock?)) ||
      (spock? && (other.rock? || other.scissors?))
  end

  def <(other)
    (rock? && (other.paper? || other.spock?)) ||
      (paper? && (other.scissors? || other.lizard?)) ||
      (scissors? && (other.rock? || other.spock?)) ||
      (lizard? && (other.rock? || other.scissors?)) ||
      (spock? && (other.lizard? || other.paper?))
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
      puts "Please choose #{Move::CHOICES.join(', ')}:"
      choice = gets.chomp.capitalize
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
    puts "Welcome to #{Move::CHOICES.join(', ')} #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for #{Move::CHOICES.join(', ')} #{human.name}!"
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
    human.score == 5 ? puts('You won!!') : puts("#{computer.name} won..well that sucks...")
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
