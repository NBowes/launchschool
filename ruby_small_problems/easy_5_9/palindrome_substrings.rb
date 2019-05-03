def substrings(string)
  substrings = []
  string.length.times { |i| substrings << string[0..i] }
  substrings
end

def all_substrings(string)
  all_substrings = []
  0.upto(string.length - 1) do |index|
    current_substring = string[index..-1]
    all_substrings << substrings(current_substring)
  end
  all_substrings.flatten
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindrome_substrings(string)
  substrings = all_substrings(string)
  palindromes = []
  substrings.each do |word|
    palindromes << word if palindrome?(word)
  end
  palindromes
end

p palindrome_substrings('knitting cassettes')
