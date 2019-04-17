# reverse an array without #reverse method

def new_reverse(array)
  new_array = []
  count = array.length
  while count > 0
    new_array << array[-1]
    array.pop
    count -= 1
  end
  new_array
end

p new_reverse(%w[1 2 3 4 5])

## alternate
def real_reverse(array)
  reverse_array = []
  array.reverse_each { |obj| reverse_array << obj }
  reverse_array
end

p real_reverse(%w[12 23 43 34 54])
