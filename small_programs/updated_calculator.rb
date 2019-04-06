# validate numbers
# validate operator
# print result with 'adding..' message
# ask for user's name
# ask if you want to do another calculation
# goodbye message 

def valid_number?(num)
  num.to_i != 0
end

def operator_message(op)
  case op
  when "1"
    puts "Adding numbers..."
  when "2"
    puts "Subtracting numbers..."
  when "3"
    puts "Multiplying numbers..."
  when "4"
    puts "Dividing numbers..."
  end
end

loop do
  number1 = nil
  loop do
    puts "What is your first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      puts "Hmm.. that number doesn't look right."
    end
  end

  number2 = nil
  loop do
    puts "What is your second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      puts "Hmm.. that number doesn't look right."
    end
  end

  puts "What operation should we do? 1.add, 2.subtract, 3.multiply, 4.divide?"

  operator = nil
  loop do
    operator = gets.chomp

    if %(1,2,3,4).include?(operator)
      break
    else
      puts "You must choose 1,2,3, or 4"
    end
  end

  operator_message(operator)

  result = case operator
  when "1"
    number1.to_i + number2.to_i
  when "2"
    number1.to_i - number2.to_i
  when "3"
    number1.to_i * number2.to_i
  when "4"
    number1.to_f / number2.to_f
  end

  puts "The result is #{result}"
  puts "Do you want to do another calculation? (N to quit)"
    answer = gets.chomp

    break if answer.downcase == 'n'
end

puts <<-MSG
Thanks for using the calculator.
To start it again type 'ruby updated_calculator.rb' and press enter.
MSG
