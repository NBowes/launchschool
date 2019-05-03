def repeater_consonants(string)
  string.chars.map do |char|
    if vowel?(char)
      char
    else
      char * 2
    end
  end.join
end

def vowel?(letter)
  letter.match(/[aeiou]/)
end

p repeater_consonants('hey hows it going?')
