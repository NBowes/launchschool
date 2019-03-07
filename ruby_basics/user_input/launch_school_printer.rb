# prints a phrase the number of times a user says - at least 3 lines.
answer = nil

loop do 
  puts "How many times do you want to say 'This is cool'?"
  answer = gets.chomp.to_i
  break if answer > 3
  puts "Please enter a number greater than 3."
end

answer.times do |phrase|
  phrase = "This is cool"
  puts phrase
end

# while answer > 0
#   puts "This is cool"
#   answer -= 1
# end

