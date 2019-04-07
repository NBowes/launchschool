# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

def running_total(array)
  sum = 0
  array.map {|num| sum += num}
end

puts running_total([3,4,7])