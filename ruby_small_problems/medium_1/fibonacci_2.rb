# rewrite the fibonacci method so it is not recursive

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do 
    first, last = [last, first + last]
  end
  last
end

p fibonacci(20)