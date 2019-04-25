def multiply_pairs(arr1,arr2)
  product_array = []
  arr1.each do |num_1|
    arr2.each do |num_2|
      product_array << num_1 * num_2
    end
  end
  product_array.sort
end

p multiply_pairs([2, 4], [4, 3, 1, 2])
