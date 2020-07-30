=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.
=end
class GuessingGame
  attr_accessor :guesses

  def initialize
    @secret_number = nil
    @guesses = 7
  end

  def play
    set_secret
    guess
  end

  def valid_guess?(guess)
    guess.class == Integer && (guess > 1 && guess < 100)
  end

  def guess
    guess = nil
    loop do
      loop do
        puts "You have #{self.guesses} guesses remaining."
        puts 'Enter a number between 1 and 100: '
        guess = gets.chomp.to_i
        break if valid_guess?(guess)
        puts 'Invalid guess'
      end
      winner?(guess) ? display_message('You got it!') : guess_logic(guess)
      reduce_guesses
      break if guesses == 0 || winner?(guess)
    end
  end

  def winner?(guess)
    guess == @secret_number
  end

  def display_message(message)
    puts message
  end

  def guess_logic(guess)
    display_message(guess > @secret_number ? 'Too high' : 'Too low')
  end

  def reduce_guesses
    self.guesses -= 1
    return 'You lose.' if guesses == 0
  end

  private

  def set_secret
    @secret_number = rand(1..100)
  end
end

game = GuessingGame.new
game.play