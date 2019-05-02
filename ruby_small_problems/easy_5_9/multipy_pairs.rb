def multiply_pairs(arr1, arr2)
  product_array = []
  arr1.each do |num1|
    arr2.each do |num2|
      product_array << num1 * num2
    end
  end
  product_array.sort
end

p multiply_pairs([2, 4], [4, 3, 1, 2])
