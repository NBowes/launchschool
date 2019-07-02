# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

SPACE = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts msg
end

def show_board(brd)
  system 'clear'
  puts "=== You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER} ==="
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def empty_spaces(brd)
  brd.keys.select { |num| brd[num] == SPACE }
end

def player_place_marker(brd)
  choice = ''

  loop do
    prompt("please choose a square (#{empty_spaces(brd).join(', ')})")
    choice = gets.chomp.to_i
    break if empty_spaces(brd).include?(choice)

    prompt('Sorry, that choice is not valid')
  end

  brd[choice] = PLAYER_MARKER
end

def computer_place_marker(brd)
  choice = empty_spaces(brd).sample
  brd[choice] = COMPUTER_MARKER
end

def winner?(brd)
  # !! makes the return value of find_winner true/false/nil
  !!find_winner(brd)
end

def find_winner(brd)
  win_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
              [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
              [[1, 5, 9], [3, 5, 7]]
  win_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_spaces(brd).empty?
end

board = initialize_board

loop do
  loop do
    show_board(board)

    player_place_marker(board)
    break if winner?(board) || board_full?(board)

    computer_place_marker(board)
    break if winner?(board) || board_full?(board)
  end

  show_board(board)

  if winner?(board)
    prompt("#{find_winner(board)} won!")
  else
    prompt('Its a tie')
  end

  prompt('Do you want to play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing. To play again type `ruby tic_tac_toe.rb`. Bye!!')
