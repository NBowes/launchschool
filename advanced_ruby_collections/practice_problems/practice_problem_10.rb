# make the first part of the sub-array a hash key, and the second a hash value
# don't use the #to_h method

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
new_hash = {}
arr.each do |array|
  new_hash[array[0]] = array[1]
end

p new_hash
