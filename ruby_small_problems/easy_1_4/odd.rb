# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. 
# You may assume that the argument is a valid integer value.

def num_odd?(num)
  num % 2 == 1
end

puts num_odd?(-3)
puts num_odd?(2)
