# use map to return a new array with each value incremented by 1
# don't modify the original array

array = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]

array.map do |hash|
  new_hash = {}
  hash.each do |key, num|
    new_hash[key] = num + 1
  end
  new_hash
end
