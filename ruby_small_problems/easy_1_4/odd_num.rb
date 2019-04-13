# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

(1..99).each do |i|
  puts i if i.odd? 
end

# alternate

puts (1..99).to_a.select {|num| num.odd?}