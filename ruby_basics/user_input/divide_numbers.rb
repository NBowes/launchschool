def valid_number?(number)
  number.to_i.to_s == number 
end
numerator = nil

loop do
  puts "Please enter a numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input. Please make sure its an integer."
end
denominator = nil

loop do
  puts "Please enter a denominator:"
  denominator = gets.chomp
  if denominator == "0"
    puts "Denominator can't be 0"
  else
    break if valid_number?(denominator)
    puts "Invalid input. Please make sure its an integer."
  end
end

answer = numerator.to_i / denominator.to_i
puts "#{numerator}/#{denominator} is #{answer}"