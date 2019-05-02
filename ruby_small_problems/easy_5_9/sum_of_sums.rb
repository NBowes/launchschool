def sum_of_array(array)
  total = 0
  array.size.times { |i| total += array[0..i].reduce(:+) }
  total
end

p sum_of_array([3, 5, 2])
