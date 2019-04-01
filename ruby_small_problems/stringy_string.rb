# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

def stringy(num)
  count = 0
  binary = []

  while count < num
    if count == 0 || count.even?
      binary << 1
    else
      binary << 0
    end
    binary
    count += 1
  end

  binary.join
end

puts stringy(5)

### alternate

def stringify(num)
  binary = []

  num.times do |index|
    number = index.even? ? 1 : 0
    binary << number
  end
  
  binary.join
end

puts stringify(5)