# return the last number of the nth fibonacci number

def fibonacci_last(nth)
  fib = [1, 1]
  3.upto(nth) do 
    fib << fib[-1] + fib[-2]
  end
  fib.last.to_s[-1].to_i
end

p fibonacci_last(20) == 5
p fibonacci_last(15) == 0