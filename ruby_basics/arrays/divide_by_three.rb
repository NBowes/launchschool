# add numbers to array 'divisible_by_three' if they are - use #select

numbers = [9, 27, 16, 39, 81]

divisible_by_three = numbers.select do |num|
                      num % 3 == 0
                     end

puts divisible_by_three