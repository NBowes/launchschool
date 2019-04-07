# not case sensitive, only alphanumeric characters matter

def palindrome?(input)
  new_input = input.downcase.delete('^a-z0-9')
  new_input == new_input.reverse
end

# alternate 

def palindrome?(input)
  new_input = input.downcase.gsub(/[^a-z0-9]/,'')
  new_input == new_input.reverse
end

puts palindrome?("123- 321")
puts palindrome?("Adam I'm Ada")