def palindrome?(input)
  input == input.reverse
end

puts palindrome?("racecar")
puts palindrome?("Racecar")
puts palindrome?("car")

stuff = ['thing2','thing1', "thing2"]
puts palindrome?(stuff)
