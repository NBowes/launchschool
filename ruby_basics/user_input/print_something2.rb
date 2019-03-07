# Modify part 1 of print_something so any input that is not y/n will show an error and ask again.

answer = nil # without this, answer is not defined outside of the loop
loop do 
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  break if answer == 'y' || answer == 'n'
  puts "Invalid choice - try using y or n."
end

puts 'something' if answer == 'y'