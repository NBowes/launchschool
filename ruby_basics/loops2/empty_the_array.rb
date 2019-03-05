# stop printing names when the array is empty - use `loop`

names = ['joe', 'sarah', 'tom', 'jen']

loop do
  puts names.shift
  break if names.empty?
end

