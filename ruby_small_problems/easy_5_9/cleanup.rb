# remove all non-alphabetic characters

def cleanup(string)
  string.gsub(/[^a-zA-z\s]/, ' ').split.join(' ')
end

p cleanup("---What's My +*& Line?")
