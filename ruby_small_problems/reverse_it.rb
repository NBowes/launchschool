# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(string)
  words = string.split.reverse.join(' ')
end

puts reverse_sentence("Hello World")