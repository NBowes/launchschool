class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      name = nil
      loop do
        puts 'What is your name?'
        name = gets.chomp
        break unless name.empty?
      end
      self.name = name.capitalize
    else
      self.name = [ 'Google Pixel 4XL', 'Google Pixel 3', 'Google Pixel 2XL', 'Computer'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts 'Sorry, invalid choice.'
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:comuter)
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

    case human.move
    when 'rock'
      puts 'Its a tie.' if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won :(" if computer.move == 'paper'
    when 'paper'
      puts 'Its a tie.' if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won :(" if computer.move == 'scissors'
    when 'scissors'
      puts 'Its a tie.' if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won :(" if computer.move == 'rock'
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
