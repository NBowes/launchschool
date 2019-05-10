string = 'Launch School'

10.times { |number| puts ' ' * number + string }

# modify to remove begin/unil/end loop

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if (number % divisor).zero?
    divisor -= 1
  end
  factors
end

p factors(0)

def tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param << 'rutabaga'
end

my_string = 'pumpkins'
my_array = ['pumpkins']
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## vs

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param += ['rutabaga']

  [a_string_param, an_array_param]
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
