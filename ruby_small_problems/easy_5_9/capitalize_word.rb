def cap_word(string)
  string.split(' ').map(&:capitalize).join(' ')
end

p cap_word('the bus went really fast.')
