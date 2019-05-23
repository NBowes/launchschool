[1,2,3].select do |num|
  num > 5
  'hi'
end

# select looks for truthy values
# 'hi' returns a truthy value
# => [1, 2, 3]

[1,2,3].reject do |num|
  puts num
end

# puts returns nil
# nil is false
# => [1, 2, 3]

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# value is the three values in the array
# value[0] is the first letter of each word
# => {a: 'ant', b: 'bear', c: 'cat'}

['ant', 'bear', 'caterpiller'].pop.size

# pop removes the last item from the array
# size is called on the return value
# => 11

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# arr = [1, 2, 3, 4, 5]

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# map returns an array 
# if returns nil when it returns false
# => [nil, 'bear']