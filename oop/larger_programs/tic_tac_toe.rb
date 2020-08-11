# frozen_string_literal: true

class Board
  attr_reader :squares

  INITIAL_VALUE = ' '
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 5, 9], [3, 5, 7], [1, 4, 7],
    [2, 5, 8], [3, 6, 9]
  ].freeze
  HUMAN_MARKER = 'X'
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

  def display
    puts "You are: #{HUMAN_MARKER} Computer is: #{COMPUTER_MARKER}\n\n"
    puts '     |     |'
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts '     |     |'
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
        squares[square].marker == HUMAN_MARKER
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

  def []=(key, marker)
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
  attr_accessor :current_marker

  FIRST_TO_MOVE = Board::HUMAN_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(Board::HUMAN_MARKER)
    @computer = Player.new(Board::COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def clear_screen_and_display_board
    system 'clear'
    board.display
  end

  def computer_moves
    choice = board.empty_spaces.sample
    board[choice] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def display_goodbye_message
    print_message('Thanks for playing tic tac toe - goodbye.')
  end

  def display_welcome_message
    print_message('Welcome to tic tac toe!')
  end

  def display_result
    board.display
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

    board[square] = human.marker
  end

  def human_turn?
    current_marker == human.marker
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

  def board_winner_logic
    loop do
      current_player_moves
      break if board.winner? || board.full?

      board.display
    end
  end

  def play
    display_welcome_message
    sleep 1
    clear_screen_and_display_board
    loop do
      board_winner_logic
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
    self.current_marker = human.marker
    clear_screen_and_display_board
    print_message('Lets play again!')
  end

  def valid_answer?(answer)
    answer.downcase == 'y' || answer.downcase == 'n'
  end
end

game = TTTGame.new
game.play
