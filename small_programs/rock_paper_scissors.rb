VALID_CHOICES = %w[rock paper scissors].freeze
VALID_ANSWER = %w[y n].freeze

def prompt(message)
  puts message
end

def you_win(choice, computer)
  choice == 'rock' && computer == 'scissors' ||
    choice == 'scissors' && computer == 'paper' ||
    choice == 'paper' && computer == 'rock'
end

def computer_win(choice, computer)
  choice == 'rock' && computer == 'paper' ||
    choice == 'paper' && computer == 'scissors' ||
    choice == 'scissors' && computer == 'rock'
end

def winner(choice, computer)
  if you_win(choice, computer)
    prompt('You win!')
  elsif computer_win(choice, computer)
    prompt('Computer wins :(')
  else
    prompt("It's a tie")
  end
end

def display_results(choice, computer)
  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer}")
  winner(choice, computer)
end

loop do
  choice = nil
  prompt("What is your choice? (#{VALID_CHOICES.join(', ')})")
  loop do
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice)

    prompt("Please chose a different value. Try #{VALID_CHOICES.join(', ')}")
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)
  prompt('Do you want to play again? (y/n)')
  answer = nil
  loop do
    answer = gets.chomp

    break if VALID_ANSWER.include?(answer)

    prompt("Please choice #{VALID_ANSWER.join(', ')} (n to quit)")
  end

  break if answer.casecmp('n').zero?
end

prompt('Thanks for playing!')
