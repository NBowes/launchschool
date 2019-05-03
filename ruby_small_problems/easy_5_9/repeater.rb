def repeater(string)
  new_string = ''
  string.chars.map { |char| new_string << char * 2 }
  new_string
end

p repeater('hello')
