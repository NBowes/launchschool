def capital?(letter)
  letter =~ /[A-Z]/
end

def swapcase(string)
  chars = string.split('')
  new_string = ''
  chars.each do |char|
    new_string << if capital?(char)
                    char.downcase
                  else
                    char.upcase
                  end
  end
end

p swapcase('tEstING teSSt')
