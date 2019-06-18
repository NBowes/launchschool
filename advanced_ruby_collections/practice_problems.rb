# order this array by descending numeric value

arr = ['10','11','9','7','8']

def sort_array(arr)
  arr.sort_by do |element|
    element.to_i
  end.reverse
end

p sort_array(arr)

## alternate

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# order books array based on year of publication

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end
