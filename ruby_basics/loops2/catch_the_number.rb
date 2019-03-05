# loop stops if number is between 1 and 10

loop do
  number = rand(100)
  puts number
  if number >= 1 && number <= 10 # between?(0,10)
    break
  end
end