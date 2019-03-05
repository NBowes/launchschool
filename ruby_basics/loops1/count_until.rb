# Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]


###

until numbers.length < 1
  puts numbers.shift ## numbers.pop for reverse
end

###

count = 0

until numbers.size == count
  puts numbers[count]
  count += 1
end