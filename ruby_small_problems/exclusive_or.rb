# In this exercise, you will write a method named xor that takes two arguments, 
# and returns true if exactly one of its arguments is truthy, false otherwise.

def xor(a,b)
 (a && !b) || (b && !a)
end

puts xor(4.even?,4.odd?)
