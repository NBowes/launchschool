def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

# starting with a product = 0 - the product will always be 0
### solution - add an if statement to check for product == 0 or make product = 1

