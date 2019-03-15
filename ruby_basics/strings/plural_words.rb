# use .each to print the plural of each word

words = "car human elephant airplane"
words = words.split(' ')

words.each do |word|
  puts word + "s"
end
