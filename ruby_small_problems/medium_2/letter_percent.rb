# find the percent of upper/lowercase or neither from a given string

def letter_percent(string)
  percentages = { uppercase: 0, lowercase: 0, neither: 0 }
  uppercase = 0
  lowercase = 0
  neither = 0

  string.chars.each do |char|
    if /[a-z]/ =~ char
      lowercase += 1
    elsif /[A-Z]/ =~ char
      uppercase += 1
    else
      neither += 1
    end
  end
  percentages[:uppercase] = (uppercase / string.length.to_f) * 100
  percentages[:lowercase] = (lowercase / string.length.to_f) * 100
  percentages[:neither] = (neither / string.length.to_f) * 100
  percentages
end

p letter_percent('abCdef 123')
