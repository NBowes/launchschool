# compare two arrays, see if they match - put true/false if they do/do not

a = [1, 5, 9]
b = [1, 9, 5]

puts a == b

# compare each number
a.each_with_index do |num,i|
  puts num == b[i]
end



