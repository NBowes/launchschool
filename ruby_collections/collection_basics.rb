# find the word 'grass'

str = 'The grass is green'
str[4,5

# when you pass arr.slice only the index, it returns a string
# anything else will return a new array

arr = [1, 'two', :three, '4']
arr[3, 1] # => ["4"]
arr[3..3] # => ["4"]
arr[3]    # => "4"

# not unique hash keys are overwritten

hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }
# => warning: key 'fruit' is a duplicate and overwritten
