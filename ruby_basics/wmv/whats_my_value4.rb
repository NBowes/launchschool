# part 4 - integers are immutable, but strings are mutable and are modified by the my_vaule method

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end 

my_value(a)
puts a