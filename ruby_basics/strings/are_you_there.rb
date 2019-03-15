# Using the following code, print true if colours includes the colour 'yellow' and print false 
# if it doesn't. Then, print true if colours includes the colour 'purple' and print false if it doesn't.

colours = 'blue pink yellow orange'
colours = colours.split(' ')

puts colours.include?('yellow')
puts colours.include?('purple')
