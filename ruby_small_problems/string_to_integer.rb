# don't use built in .to_i method
# don't worry about string validation yet - assume all characters are numbers

DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}.freeze

def string_to_integer(string)
  numbers = string.chars.map { |num| DIGITS[num] }

  number = 0
  numbers.each { |n| number = 10 * number + n }
  number
end

p string_to_integer('432')

def string_to_signed_integer(string)
  sign = string.gsub(/[0-9]/, '')
  string.slice! sign

  case sign
  when '-' then -string_to_integer(string)
  when '+' then string_to_integer(string)
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('-234')
