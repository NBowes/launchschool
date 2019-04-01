# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(num)
  digits = num.to_s.chars
  list = []
  digits.each do |digit|
    list << digit.to_i
  end
  list
end

p digit_list(123)


