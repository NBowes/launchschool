def acii_value(string)
  characters = string.chars 
  sum = 0
  characters.map { |char| sum += char.ord}
  sum
end

p acii_value('nathen')