# move the first element to the end of an array
# don't modify the original array

def rotation(array)
  last_element = array.shift
  rotated_array = []

  array.each do |element|
    rotated_array << element unless element == last_element
  end
  rotated_array << last_element
  rotated_array
end

array = %w[a b c]
p rotation(array)

def rotate_string(string)
  rotation(string.chars).join
end

p rotate_string('hello')

def rotate_integer(num)
  rotation(num.to_s.chars).join.to_i
end

p rotate_integer(123)

## alternate
def rotate(array)
  array[1..-1] + [array[0]]
end

arr = [1, 2, 3]
p rotate(arr)

# add another argument to the method to choose which element gets rotated
# use right most character to start, 1 results in same array being returned

def rotate_from_right(number, num)
  number_arr = number.to_s.chars
  number_arr[-num..-1] = rotate(number_arr[-num..-1])
  number_arr.join.to_i
end

p rotate_from_right(4567, 2)

def max_rotation(number)
  count = number.to_s.size

  until count.zero?
    number = rotate_from_right(number, count)
    count -= 1
  end

  # count.downto(2) do |n|
  #   number = rotate_from_right(number, n)
  # end
  number
end

p max_rotation(735_291) == 321_579
