string = 'Launch School'

10.times { |number| puts ' ' * number + string }

# modify to remove begin/unil/end loop

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end