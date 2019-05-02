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

p all_substrings('abcde')