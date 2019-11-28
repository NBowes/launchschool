class Move
  attr_accessor :choice

  CHOICES = %w(Rock Paper Scissors Lizard Spock).freeze

  WINNERS = { Rock: ['Scissors', 'Lizard'],
              Paper: ['Rock', 'Spock'],
              Scissors: ['Paper', 'Lizard'],
              Lizard: ['Paper', 'Spock'],
              Spock: ['Rock', 'Scissors'] }

  def initialize(choice)
    @choice = choice
  end

  def >(other)
    WINNERS[choice.to_sym].include? other.choice
  end

  def ==(other)
    choice == other.choice
  end

  def to_s
    @choice
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
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
    @history << choice
  end
end

class Computer < Player
  def set_name
    self.name = ['Pixel 4XL', 'Pixel 3', 'Pixel 2XL', 'Computer'].sample
  end

  def choose
    choice = Move::CHOICES.sample
    self.move = Move.new(choice)
    @history << choice
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def clear
    sleep(2)
    system 'clear'
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
    clear
  end

  def display_history
    puts '----------------------'
    puts 'Move History:'
    puts "#{human.name}: #{human.history}"
    puts "#{computer.name}: #{computer.history}"
    puts '----------------------'
    clear
  end

  def want_history?
    answer = nil
    loop do
      puts 'Do you want to display the move history?'
      answer = gets.chomp
      break if %w(yes no).include? answer.downcase

      puts "Invalid answer. Please type 'yes' or 'no'."
    end

    answer == 'yes'
  end

  def human_won
    puts "#{human.name} won!"
    human.score += 1
  end

  def computer_won
    puts "#{computer.name} won :("
    computer.score += 1
  end

  def display_winner
    puts "It's a tie" if human.move == computer.move

    human.move > computer.move ? human_won : computer_won
  end

  def winner?
    human.score == 5 || computer.score == 5
  end

  def play_again?
    human.score == 5 ? puts('You won!!') : puts("#{computer.name} won..")
    answer = nil
    loop do
      puts "Do you want to play again? ('yes' or 'no')"
      answer = gets.chomp
      break if %w(yes no).include? answer.downcase

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
      display_history if want_history?
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
