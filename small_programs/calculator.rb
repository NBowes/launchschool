# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

puts "What is your first number?"
number1 = gets.chomp.to_i

puts "What is your second number?"
number2 = gets.chomp.to_i

puts "What operation should we do? 1.add, 2.subtract, 3.multiply, 4.divide?"
operation = gets.chomp

case operation
when "1"
  puts "#{number1} + #{number2} is #{number1 + number2}"
when "2"
  puts "#{number1} - #{number2} is #{number1 - number2}"
when "3"
  puts "#{number1} x #{number2} is #{number1 * number2}"
when "4"
  puts "#{number1} / #{number2} is #{number1 / number2}"
else
  puts "You are the weakest link - goodbye."
end