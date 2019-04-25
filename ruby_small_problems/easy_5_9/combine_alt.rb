# assume that both arrays are the same length

def combine_alt(arr1, arr2)
  index = 0
  new_array = []
  while index < arr1.length
    new_array << arr1[index] << arr2[index]
    index += 1
  end
  new_array
end

p combine_alt([1, 2, 3], [4, 5, 6])

## alternate

def combine_alt_2(arr1, arr2)
  new_array = []
  arr1.each_with_index do |value, index|
    new_array << value << arr2[index]
  end
  new_array
end

p combine_alt_2([1, 2, 3], [4, 5, 6])
