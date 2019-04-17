def half_array(array)
  new_arr = (array.size / 2).ceil
  first = array.slice(0, new_arr)
  second = array.drop(new_arr)

  [first, second]
end

p half_array([])
