# count the length of each word - store in an hash
# duplicate lengths will be counted as multiples, not individually
# Bonus: don't count non-alphabetic characters

def word_length(phrase)
  lengths = {}
  words = phrase.split(' ')
  words.each do |word|
    clean = word.delete('^a-zA-z')
    if lengths[clean.length]
      lengths[clean.length] += 1
    else
      lengths[clean.length] = 1
    end
  end

  lengths
end

p word_length("hey, how's it going?")
