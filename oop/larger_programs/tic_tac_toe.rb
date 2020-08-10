# frozen_string_literal: true

class Board
  attr_reader :squares

  INITIAL_VALUE = ' '
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 5, 9], [3, 5, 7], [1, 4, 7],
    [2, 5, 8], [3, 6, 9]
  ].freeze
  PLAYER_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  def initialize
    @squares = {}
    reset
  end

  def computer_lines
    computer = []
    WINNING_LINES.each do |line|
      computer << line.select do |square|
        squares[square].marker == COMPUTER_MARKER
      end
    end
    computer
  end

  def computer_won?
    computer = computer_lines
    computer.any? { |lines| lines.length == 3 }
  end

  def empty_spaces
    squares.select do |_, square|
      square.marker == INITIAL_VALUE
    end.keys
  end

  def full?
    empty_spaces.empty?
  end

  def get_square(key)
    @squares[key]
  end

  def set_square(key, marker)
    @squares[key].marker = marker
  end

  def player_lines
    player = []
    WINNING_LINES.each do |line|
      player << line.select do |square|
        squares[square].marker == PLAYER_MARKER
      end
    end
    player
  end

  def player_won?
    player = player_lines
    player.any? { |lines| lines.length == 3 }
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_VALUE) }
  end

  def winner?
    player_won? || computer_won?
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new('X')
    @computer = Player.new('O')
  end

  def clear_screen_and_display_board
    system 'clear'
    display_board
  end

  def computer_moves
    choice = board.empty_spaces.sample
    board.set_square(choice, computer.marker)
  end

  def display_goodbye_message
    print_message('Thanks for playing tic tac toe - goodbye.')
  end

  def display_welcome_message
    print_message('Welcome to tic tac toe!')
  end

  def display_board
    puts "You are: #{human.marker} Computer is: #{computer.marker}\n\n"
    puts '     |     |'
    puts "  #{board.get_square(1)}  |  #{board.get_square(2)}  |  #{board.get_square(3)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square(4)}  |  #{board.get_square(5)}  |  #{board.get_square(6)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square(7)}  |  #{board.get_square(8)}  |  #{board.get_square(9)}"
    puts '     |     |'
  end

  def display_result
    display_board
    if board.player_won?
      print_message('Player won!')
    elsif board.computer_won?
      print_message('Computer won.... blah.')
    else
      print_message('No one won? how...')
    end
  end

  def human_moves
    print_message("Pick one of the following numbers: #{board.empty_spaces}")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_spaces.include?(square)

      print_message('That is not a valid number. Try again.')
    end

    board.set_square(square, human.marker)
  end

  def play_again?
    print_message('Do you want to play again? (y/n)')
    answer = nil
    loop do
      answer = gets.chomp
      break if valid_answer?(answer)

      print_message("Thats not a valid answer. Please choose 'y' or 'n'")
    end

    answer == 'y'
  end

  def board_logic
    loop do
      human_moves
      break if board.winner? || board.full?

      computer_moves
      break if board.winner? || board.full?

      display_board
    end
  end

  def play
    display_welcome_message
    sleep 1
    clear_screen_and_display_board
    loop do
      board_logic
      display_result
      break unless play_again?

      reset
    end
    display_goodbye_message
  end

  def print_message(message)
    puts message
  end

  def reset
    board.reset
    clear_screen_and_display_board
    print_message('Lets play again!')
  end

  def valid_answer?(answer)
    answer.downcase == 'y' || answer.downcase == 'n'
  end
end

game = TTTGame.new
game.play
