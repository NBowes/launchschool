# frozen_string_literal: true

# a guessing game class
class GuessingGame
  attr_accessor :guesses

  LOSE_MESSAGE = 'You are out of guesses. You lose.'
  WIN_MESSAGE = 'You got it! Thanks for playing.'
  RANGE = 1..100

  def initialize
    @secret_number = nil
    @guesses = 7
  end

  def display_message(message)
    puts message
  end

  def end_game_message
    guesses.zero? ? display_message(LOSE_MESSAGE) : display_message(WIN_MESSAGE)
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

  def begin_game_message
    display_message("You have #{guesses} guesses remaining.")
    display_message('Enter a number between 1 and 100: ')
  end

  def validate_guess
    guess = nil
    loop do
      begin_game_message
      guess = gets.chomp.to_i
      break if (guess.is_a? Integer) && (RANGE.include? guess)

      display_message('Invalid guess')
    end
    guess
  end

  def winner?(guess)
    guess == @secret_number
  end

  private

  def set_secret
    @secret_number = rand(RANGE)
  end
end

game = GuessingGame.new
game.play
