# assume the array contains only numbers, and is not empty

def multiply_avg(array)
  product = 1
  array.each { |num| product *= num }
  average = (product.to_f / array.length).round(3)
  "The result is #{average}"
end

p multiply_avg([2, 5, 7, 11, 13, 17])
