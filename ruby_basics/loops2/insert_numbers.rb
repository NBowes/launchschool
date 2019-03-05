# stop when there are 5 numbers in the array - user generated numbers

numbers = []

loop do
  puts "Enter a number"
  number = gets.chomp.to_i
  numbers << number
  break if numbers.size == 5 
end

puts "----"
puts numbers