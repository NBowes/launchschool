# make a method that  uses the daylight argument to tell if it's day or night

def time_of_day(daylight)
  if daylight
    puts "It's daytime"
  else
    puts "It's nighttime"
  end
end

daylight = [true,false].sample

time_of_day(daylight)