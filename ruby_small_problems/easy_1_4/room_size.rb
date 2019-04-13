# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

SQUARE_FEET = 10.7639
puts "What is the length of the room?"
length = gets.chomp.to_i

puts "What is the width of the room?"
width = gets.chomp.to_i

area = length * width
area_feet = (area * SQUARE_FEET).round(2)

puts "The area of the room is #{area} square meters(#{area_feet} square feet.)"