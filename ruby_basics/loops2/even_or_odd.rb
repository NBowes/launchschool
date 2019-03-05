# Write a loop that prints numbers 1-5 and whether the number is even or odd

count = 1

loop do
  puts "#{count} is even!" if count.even?
  puts "#{count} is odd!" if count.odd?
  break if count == 5
  count += 1
end