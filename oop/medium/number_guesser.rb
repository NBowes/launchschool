# frozen_string_literal: true

# Create an object-oriented number
# guessing class for numbers in
# the range 1 to 100
# with a limit of 7 guesses per game.
# The game should play like this:

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

class GuessingGame
  attr_accessor :guesses

  def initialize
    @secret_number = nil
    @guesses = 7
  end

  def valid_guess?(guess)
    (guess.is_a? Integer) && (guess > 1 && guess < 100)
  end

  def no_guesses
    if guesses.zero?
      display_message('You have no more guesses. You lose.')
    else
      false
    end
  end

  def guess_logic
    guess = nil
    loop do
      loop do
        user_guess_message
        guess = gets.chomp.to_i
        break if valid_guess?(guess)

        display_message('Invalid guess')
      end
      break if no_guesses || winner?(guess)
    end
  end

  def display_message(message)
    puts message
  end

  def guess_message(guess)
    display_message(guess > @secret_number ? 'Too high' : 'Too low')
    reduce_guesses
  end

  def play
    set_secret
    guess_logic
  end

  def reduce_guesses
    self.guesses -= 1
    return 'You lose.' if guesses.zero?
  end

  def user_guess_message
    display_message("You have #{guesses} guesses remaining.")
    display_message('Enter a number between 1 and 100: ')
  end

  def winner?(guess)
    if guess == @secret_number
      display_message('You got it!')
      true
    else
      guess_message(guess)
    end
  end

  private

  def set_secret
    @secret_number = rand(1..100)
  end
end

game = GuessingGame.new
game.play
