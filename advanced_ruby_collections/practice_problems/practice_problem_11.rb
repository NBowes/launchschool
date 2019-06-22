# return a new array with the same sub-arrays, but ordered based on odd numbers only
# expected return: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end
