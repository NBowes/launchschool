# order this array by descending numeric value

arr = %w[10 11 9 7 8]

def sort_array(arr)
  arr.sort_by(&:to_i).reverse
end

p sort_array(arr)

## alternate

arr.sort do |a, b|
  b.to_i <=> a.to_i
end
