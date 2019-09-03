def featured(num)
  num += 1
  num += 1 until num % 7 == 0 && num.odd?
  loop do
    num_chars = num.to_s.chars
    return num if num_chars == num_chars.uniq
    num += 14
    break if num > 9_999_999_998
  end

  "There is no possible featured number for the given input"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
