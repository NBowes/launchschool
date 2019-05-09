def word_length(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

p word_length('the cow jumped over the moon')
