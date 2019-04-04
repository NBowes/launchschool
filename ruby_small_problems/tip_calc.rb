# Simple tipe calculator

puts "What is the bill amount?"
bill = gets.to_f

puts "What is the percentage of tip?"
tip_percent = gets.to_f / 100

tip = (bill * tip_percent).round(2)
puts "The tip is #{tip}"
puts "The total is #{bill + tip}"