
# part 8 - no defined local variable 'a'

array = [1,2,3]

array.each do |stuff|
  a = stuff
end

puts a
