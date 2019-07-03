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
require 'pry'
require 'pry-byebug'
SPACE = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
def prompt(msg)
  puts msg
end

# rubocop:disable Metrics/AbcSize
def show_board(brd, score)
  system 'clear'
  puts "=== You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER} ==="
  display_score(score)
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

# rubocop:enable Metrics/AbcSize
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = SPACE }
  new_board
end

def empty_spaces(brd)
  brd.keys.select { |num| brd[num] == SPACE }
end

def joinor(arr, sep = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(sep)
  end
end

def player_place_marker(brd)
  choice = ''

  loop do
    prompt("please choose a square (#{joinor(empty_spaces(brd))})")
    choice = gets.chomp.to_i
    break if empty_spaces(brd).include?(choice)

    prompt('Sorry, that choice is not valid')
  end

  brd[choice] = PLAYER_MARKER
end

def find_danger_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == SPACE }.keys.first
  else
    nil
  end
end

def computer_place_marker(brd)
  choice = nil

  WINNING_LINES.each do |line|
    choice = find_danger_square(line, brd)
    break if choice
  end

  if !choice
    choice = empty_spaces(brd).sample
  end

  brd[choice] = COMPUTER_MARKER
end

def winner?(brd)
  # !! makes the return value of find_winner true/false/nil
  !!find_winner(brd)
end

def find_winner(brd)
  WINNING_LINES.each do |line|
    # https://ruby-doc.org/core-2.4.1/Hash.html#method-i-values_at
    # (*line) == (line[0], line[1], line[2])
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def keep_score(brd, score)
  if find_winner(brd) == 'Player'
    score[:player] += 1
  elsif find_winner(brd) == 'Computer'
    score[:computer] += 1
  end
end

def display_score(score)
  prompt("The score is Player: #{score[:player]} Computer: #{score[:computer]}")
end

def board_full?(brd)
  empty_spaces(brd).empty?
end

def display_winner(score)
  if score[:player] == 5
    prompt('Player wins!')
  elsif score[:computer] == 5
    prompt('Computer wins...how did that happen?')
  end
end

loop do
  score = { player: 0, computer: 0 }
  loop do
    board = initialize_board
    loop do
      show_board(board, score)

      player_place_marker(board)
      break if winner?(board) || board_full?(board)

      computer_place_marker(board)
      break if winner?(board) || board_full?(board)
    end

    show_board(board, score)

    if winner?(board)
      keep_score(board, score)
    else
      prompt('Its a tie')
    end
    display_score(score)
    break if score[:player] == 5 || score[:computer] == 5
  end
  display_winner(score)
  prompt('Do you want to play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing. To play again type `ruby tic_tac_toe.rb`. Bye!!')
