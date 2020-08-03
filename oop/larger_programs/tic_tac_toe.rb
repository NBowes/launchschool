class Board
  INITIAL_VALUE = ' '
  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_VALUE)}
  end

  def get_square(key)
    @squares[key]
  end

  def set_square(key, marker)
    @squares[key].marker = marker
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
  
  def display_welcome_message
    puts "Welcome to tic tac toe!"
  end

  def display_goodbye_message
    puts "Thanks for playing tic tac toe - goodbye."
  end

  def empty_spaces
    board.squares.select do |key, square|
      square.marker == Board::INITIAL_VALUE
    end.keys
  end

  def human_moves
    puts "pick one of the following numbers: #{empty_spaces}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)

      puts 'that is not a valid number. try again.'
    end

    board.set_square(square, human.marker)
  end

  def computer_moves
    choice = empty_spaces.sample
    board.set_square(choice, computer.marker)
  end

  def display_board
  puts "     |     |"
  puts "  #{board.get_square(1)}  |  #{board.get_square(2)}  |  #{board.get_square(3)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board.get_square(4)}  |  #{board.get_square(5)}  |  #{board.get_square(6)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board.get_square(7)}  |  #{board.get_square(8)}  |  #{board.get_square(9)}"
  puts "     |     |"
  end

  def play
    display_welcome_message
    loop do
      display_board
      human_moves
      computer_moves
      display_board
      human_moves
      computer_moves
      display_board
      human_moves
      computer_moves
      display_board
      break
      break if someone_won? || board_full?

      computer_moves
      break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
