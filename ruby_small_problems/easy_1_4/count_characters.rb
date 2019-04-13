# spaces should not be counted as characters

def count_characters(message)
  characters = message.delete(' ').split('')
  count = characters.size
  puts "There are #{count} characters in '#{message}'."
end

puts "Write a message with one or more words:"
message = gets.chomp

count_characters(message)
