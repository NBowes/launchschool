# write a method that checks if the string has matching parentheses

def balanced?(string)
  left_bracket = 0
  right_bracket = 0

  string.chars.each do |char|
    left_bracket += 1 if char == '('
    right_bracket += 1 if char == ')'
  end
  return true if left_bracket == right_bracket
  return false if left_bracket > right_bracket ||
                  right_bracket > left_bracket
end

p balanced?('he))ll(o(') == true

# modify to account for parentheses order
# correct order is '(' then ')'

def more_balanced?(string)
  count = 0

  string.chars.each do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    break if count < 0
  end

  count.zero?
end

p more_balanced?('he))ll(o(') == false
p more_balanced?('(h(ell)o)') == true
p more_balanced?('((What)) (is this))?') == false
