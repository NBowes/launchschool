VALID_CHOICES = %w[rock paper scissors lizard spock].freeze
VALID_ANSWER = %w[y n].freeze
RULES = %w[
  Scissors cuts
  Paper covers
  Rock crushes
  Lizard poisons
  Spock smashes
  Scissors decapitates
  Lizard eats
  Paper disproves
  Spock vaporizes
  Rock crushes Scissors
].freeze

score = { player: 0, computer: 0 }

def prompt(message)
  puts message
end

def you_win(choice, computer)
  choice == 'rock' && computer == 'scissors' ||
    choice == 'scissors' && computer == 'paper' ||
    choice == 'paper' && computer == 'rock' ||
    choice == 'rock' && computer == 'lizard' ||
    choice == 'lizard' && computer == 'spock' ||
    choice == 'scissors' && computer == 'lizard' ||
    choice == 'spock' && computer == 'scissors' ||
    choice == 'lizard' && computer == 'paper' ||
    choice == 'paper' && computer == 'spock' ||
    choice == 'spock' && computer == 'rock'
end

def computer_win(choice, computer)
  choice == 'rock' && computer == 'paper' ||
    choice == 'paper' && computer == 'scissors' ||
    choice == 'scissors' && computer == 'rock' ||
    choice == 'lizard' && computer == 'rock' ||
    choice == 'spock' && computer == 'lizard' ||
    choice == 'lizard' && computer == 'scissors' ||
    choice == 'scissors' && computer == 'spock' ||
    choice == 'paper' && computer == 'lizard' ||
    choice == 'spock' && computer == 'paper' ||
    choice == 'rock' && computer == 'spock'
end

def winner(choice, computer, score)
  if you_win(choice, computer)
    prompt('You win!')
    score[:player] += 1
  elsif computer_win(choice, computer)
    prompt('Computer wins :(')
    score[:computer] += 1
  else
    prompt("It's a tie")
  end
end

def display_round_results(choice, computer, score)
  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer}")
  winner(choice, computer, score)
end

def display_score(score)
  prompt("Player: #{score[:player]}, Computer: #{score[:computer]}")
end

def welcome
  prompt("Welcome to #{VALID_CHOICES.map{|word| word.capitalize}.join(', ')}!")
  prompt("Rules: #{RULES.join(' ')}")
end

welcome

loop do

  prompt("What is your choice? (#{VALID_CHOICES.join(', ')})")
  choice = nil
  loop do
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice)

    prompt("Please chose a different value. Try #{VALID_CHOICES.join(', ')}")
  end

  computer_choice = VALID_CHOICES.sample

  display_round_results(choice, computer_choice, score)
  display_score(score)

  break if score[:player] == 5 || score[:computer] == 5
end

prompt('Thanks for playing!')
