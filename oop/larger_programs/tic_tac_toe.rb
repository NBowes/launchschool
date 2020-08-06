# frozen_string_literal: true

class Board
  attr_reader :squares

  INITIAL_VALUE = ' '
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 5, 9], [3, 5, 7], [1, 4, 7],
    [2, 5, 8], [3, 6, 9]
  ].freeze

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_VALUE) }
  end

  def get_square(key)
    @squares[key]
  end

  def set_square(key, marker)
    @squares[key].marker = marker
  end

  def empty_spaces
    squares.select do |_, square|
      square.marker == INITIAL_VALUE
    end.keys
  end

  def full?
    empty_spaces.empty?
  end

  def player_lines
    player = []
    WINNING_LINES.each do |line|
      player << line.select do |square|
        squares[square].marker == 'X'
      end
    end
    player
  end

  def computer_lines
    computer = []
    WINNING_LINES.each do |line|
      computer << line.select do |square|
        squares[square].marker == 'O'
      end
    end
    computer
  end

  def player_won?
    player = player_lines
    player.any? { |lines| lines.length == 3 }
  end

  def computer_won?
    computer = computer_lines
    computer.any? { |lines| lines.length == 3 }
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

  def print_message(message)
    puts message
  end

  def display_welcome_message
    print_message('Welcome to tic tac toe!')
  end

  def display_goodbye_message
    print_message('Thanks for playing tic tac toe - goodbye.')
  end

  def human_moves
    print_message("pick one of the following numbers: #{board.empty_spaces}")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_spaces.include?(square)

      print_message('That is not a valid number. Try again.')
    end

    board.set_square(square, human.marker)
  end

  def computer_moves
    choice = board.empty_spaces.sample
    board.set_square(choice, computer.marker)
  end

  def display_board
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
    if board.player_won?
      print_message('Player won!')
    elsif board.computer_won?
      print_message('Computer won.... blah.')
    else
      print_message('No one won? how...')
    end
  end

  def play
    display_welcome_message
    loop do
      display_board
      human_moves
      break if board.winner? || board.full?

      computer_moves
      break if board.winner? || board.full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
