def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0) # wrong number of arguments (ArgumentError), also NoMethodError
find_first_nonzero_among(1) # NoMethodError - #each doesn't work with numbers