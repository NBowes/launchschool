# part 1
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# part 2

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# part 3

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# part 4 - integers are immutable, but strings are mutable and are modified by the my_vaule method

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end 

my_value(a)
puts a

# part 5 - Assignment never changes the value of an object; instead, it creates a new object, and 
# then stores a reference to that object in the variable on the left.

a = "Xyzzy"

def my_value(b)
  b = "yzzyX"
end

my_value(a)
puts a

# part 6 - undefined (local variables)

a =  7

def my_value(b)
  b = a + a 
end

my_value(a)
puts a

# part 7 - each block

a = 7
array = [1,2,3]

array.each do |stuff|
  a = stuff
end

puts a

# part 8 - no defined local variable 'a'

array = [1,2,3]

array.each do |stuff|
  a = stuff
end

puts a

# part 9 - block has no affect

a = 7
array = [1,2,3]

array.each do |a|
  a += 1
end

puts a

# part 10 - no method error

a = 7
array = [1,2,3]

def my_value(ary)
  ary.each do |b|
    a += b 
  end
end

my_value(array)
puts a