# A double number is a number with an even number of digits whose
# left-side digits are exactly the same as its right-side digits

# ex. 44, 3333, 103103, 7676,
# return twice the number unless the number entered is a double number

def double_number?(number)
  number_array = number.to_s.split('')
  half = number_array.length / 2
  left_side = number_array.values_at(0...half)
  right_side = number_array.values_at(half...number_array.length)
  left_side == right_side
end

def double(number)
  return number if double_number?(number)

  number * 2
end

p double(123_456_789_123_456_789)
