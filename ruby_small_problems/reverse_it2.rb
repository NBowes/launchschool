# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. 
# Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present

def reverse_words(string)
  if string.length >= 5
    reverse = string.split('').reverse.join
  else
    puts "Your string is too short. Make sure it has at least 5 characters."
  end
end

puts reverse_words("whaaaaat now")