def non_alpha?(char)
  char =~ /[^a-zA-Z]/
end

def staggered_caps(string)
  new_chars = ''
  need_upper = true
  string.chars.each do |char|
    new_chars << if need_upper
                   char.upcase
                 else
                   char.downcase
                 end
    need_upper = !need_upper unless non_alpha?(char)
  end
  new_chars
end

p staggered_caps('I Love Launch School!')
