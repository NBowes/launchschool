# create add and multiple methods - all tests be ture

def add(a,b)
  a + b
end

def multiply(a,b)
  a * b 
end

# tests:
puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36