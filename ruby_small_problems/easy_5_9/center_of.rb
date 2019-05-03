def center_of(string)
  chars = string.chars
  middle_index = chars.length / 2
  if chars.length.even?
    chars[middle_index] + chars[middle_index + 1]
  else
    chars[middle_index]
  end
end

p center_of('x')
