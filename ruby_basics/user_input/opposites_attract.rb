# add two numbers together. One must be positive, one negative, validate numbers, and only check for numbers after
# both have been entered. 

def valid_number?(number)
  number.to_i.to_s == number && number.to_i != 0
end

def get_number
  loop do
    puts "Please enter a positive/negative number:"
    number = gets.chomp
    return number if valid_number?(number)
    puts "Invalid input. Please enter a non-zero integer."
  end
end

number_1 = nil
number_2 = nil

loop do
  number_1 = get_number
  number_2 = get_number
  break if number_1.to_i < 0 || number_2.to_i < 0
  puts "Sorry, one number must be negative. Try again."
end

total = number_1.to_i + number_2.to_i
puts "#{number_1} + #{number_2} = #{total}"