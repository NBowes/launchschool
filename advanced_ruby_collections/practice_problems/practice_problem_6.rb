# use #each to print out all of the vowels in the strings

hsh = { first: ['the', 'quick'],
        second: ['brown', 'fox'],
        third: ['jumped'],
        fourth: ['over', 'the', 'lazy', 'dog'] }

def vowel?(char)
  char =~ /[aeiou]/
end

hsh.each do |_, v|
  v.each do |word|
    word.chars.each do |char|
      puts char if vowel?(char)
    end
  end
end
