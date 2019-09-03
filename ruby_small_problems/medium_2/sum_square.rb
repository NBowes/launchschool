def sum_square_difference(number)
  sum_square = 0
  squared_sum = 0
  1.upto(number) do |num|
    sum_square += num
    squared_sum += num**2
  end
  sum_square**2 - squared_sum
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(100) == 25_164_150
