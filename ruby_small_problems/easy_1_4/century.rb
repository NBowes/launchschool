# what century is it?
# New centuries begin in years that end with 01
# add 'th', 'nd', 'rd' where applicable

def century(year)
  century = year % 100 == 0 ? (year / 100) : (year / 100) + 1
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if (11..20).to_a.include?(century % 100)

  suffix = century % 10
  case suffix
  when 1
    "st"
  when 2
    "nd"
  when 3
    "rd"
  else
    "th"
  end
end


puts century(2001)
puts century(2000)
puts century(5)
puts century(10103)
puts century(13900)