def neutralize(sentence)
  words = sentence.split(' ')
  neutral_sentence = []
  words.each do |word|
    neutral_sentence << word unless negative?(word)
  end

  neutral_sentence.join(' ')
end

def negative?(word)
  %w[dull boring annoying chaotic].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
