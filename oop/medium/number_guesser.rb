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

  LOSE_MESSAGE = 'You are out of guesses. You lose.'
  WIN_MESSAGE = 'You got it! Thanks for playing.'

  def initialize
    @secret_number = nil
    @guesses = 7
  end

  def display_message(message)
    puts message
  end

  def end_game_message
    if guesses.zero?
      display_message(LOSE_MESSAGE)
    else
      display_message(WIN_MESSAGE)
    end
  end

  def guess_logic
    guess = nil
    loop do
      guess = validate_guess
      reduce_guesses
      break if guesses.zero? || winner?(guess)

      guess_message(guess)
    end
    end_game_message
  end

  def guess_message(guess)
    display_message(guess > @secret_number ? 'Too high' : 'Too low')
  end

  def play
    set_secret
    guess_logic
  end

  def reduce_guesses
    self.guesses -= 1
  end

  def user_guess_message
    display_message("You have #{guesses} guesses remaining.")
    display_message('Enter a number between 1 and 100: ')
  end

  def validate_guess
    guess = nil
    loop do
      user_guess_message
      guess = gets.chomp.to_i
      p @secret_number
      break if (guess.is_a? Integer) && (guess > 1 && guess < 100)

      display_message('Invalid guess')
    end
    guess
  end

  def winner?(guess)
    guess == @secret_number
  end

  private

  def set_secret
    @secret_number = rand(1..100)
  end
end

game = GuessingGame.new
game.play
