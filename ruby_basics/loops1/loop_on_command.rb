# Modify the code below so the loop stops iterating when the user inputs 'yes'.
loop do
  puts "Should I stop?"
  answer = gets.chomp
end

###
loop do
  puts "Should I stop?"
  answer = gets.chomp
  break if answer == 'yes'
  puts "Try again - maybe type 'yes''"
end