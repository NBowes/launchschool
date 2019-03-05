# part 6 - undefined (local variables)

a =  7

def my_value(b)
  b = a + a 
end

my_value(a)
puts a