def substrings(string)
  substrings = []
  string.length.times { |i| substrings << string[0..i] }
  substrings
end

p substrings('abc') == %w[a ab abc]
