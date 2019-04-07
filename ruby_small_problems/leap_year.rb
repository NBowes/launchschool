# leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100
# If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400

def leap_year?(year)
  return true if year % 4 == 0 && year % 100 != 0
  return true if year % 100 == 0 && year % 400 == 0
  false
end

## alternate

def leap_year(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

puts leap_year?(240001)
puts leap_year?(2016)
puts leap_year(2016)
puts leap_year(240001)