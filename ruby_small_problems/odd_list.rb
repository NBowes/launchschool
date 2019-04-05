# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 

def oddities(array)
  odd_elements = []
  count = 0
  while count <= array.size
    odd_elements << array[count]
    count += 2
  end
  odd_elements
end

array = [2, 4, 6, 8, 10]
puts oddities(array)