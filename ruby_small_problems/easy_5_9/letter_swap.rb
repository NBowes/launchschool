# swap the first and last letter of each word in a string

def swap(string)
  words = string.split(' ')
  words.map do |word|
    word[0], word [-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('hey what is a receipt')
