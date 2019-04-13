# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers.

array = [2,3,4,5,3,5,5,3,6,3]

def average(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  average = sum / array.length
end

puts average(array)