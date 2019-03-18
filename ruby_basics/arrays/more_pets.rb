# select dog from pets and add it to 'my_pets'

pets = ['dog','cat','fish','lizard']

my_pets = pets[2..3]
my_pets.pop

my_pets << pets[0]

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."