def multiply_list(arr1, arr2)
  new_arr = []
  index = 0
  arr1.each do |num|
    new_arr << num * arr2[index]
    index += 1
  end
  new_arr
end

p multiply_list([3, 5, 7], [9, 10, 11])
