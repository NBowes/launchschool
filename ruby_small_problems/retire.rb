require 'date'

puts "What is your age?"
age = gets.to_f

puts "What age would you like to retire?"
retire = gets.to_f

year = Date.today.year
time_to_retire = (retire - age).round
retired_date = year + time_to_retire

puts "It's #{year}. You will retire in #{retired_date}."
puts "That's #{time_to_retire} years away."
