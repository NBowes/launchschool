def valid_integer?(string)
  string.to_i.to_s == string
end

def win?(guess,winning_number)
  if guess == winning_number
    puts 'Yes! You win.'
  else
    puts 'Nope. Too small.' if guess < winning_number
    puts 'Nope. Too big.'   if guess > winning_number
  end
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i
    win?(guess, winning_number)
  end
end

guess_number(10, 3)
