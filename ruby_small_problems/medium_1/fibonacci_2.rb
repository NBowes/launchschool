# rewrite the fibonacci method so it is not recursive

def fibonacci(nth)
  fib = [1, 1]
  3.upto(nth) do
    fib << fib[-1] + fib[-2]
  end
  fib.last
end

p fibonacci(20)
