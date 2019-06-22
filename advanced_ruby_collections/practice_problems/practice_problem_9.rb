# use either #select or #reject to find multiples of 3
# return a new array with the same structure

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |array|
  array.select do |num|
    (num % 3).zero?
  end
end
