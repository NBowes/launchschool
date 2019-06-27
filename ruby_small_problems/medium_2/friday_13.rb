# find the number of friday the 13th days there are
# given the year provided
require 'date'

def friday_13th(year)
  days = 0
  12.times do |i|
    i += 1
    thirteen = Date.new(year, i, 13)
    days += 1 if thirteen.friday?
  end
  days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
