# get the second to last word of a sentence

def end_is_near(string)
  words = string.split
  words.select do |word|
    words.index(word) == (words.length - 2)
  end
  # words[-2]
end

p end_is_near('hello world')
