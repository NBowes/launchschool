# assign_name has a default value

def assign_name(name="Bob")
  name
end

puts assign_name("Kevin") == 'Kevin'
puts assign_name == 'Bob'