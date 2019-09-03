# find the percent of upper/lowercase or neither from a given string

def letter_percent(string)
  percentages = { uppercase: 0, lowercase: 0, neither: 0 }

  string.chars.each do |char|
    if /[a-z]/ =~ char
      percentages[:lowercase] += 1
    elsif /[A-Z]/ =~ char
      percentages[:uppercase] += 1
    else
      percentages[:neither] += 1
    end
  end
  percentages[:uppercase] = (percentages[:uppercase] / string.length.to_f) * 100
  percentages[:lowercase] = (percentages[:lowercase] / string.length.to_f) * 100
  percentages[:neither] = (percentages[:neither] / string.length.to_f) * 100
  percentages
end

p letter_percent('abCdef 123')
