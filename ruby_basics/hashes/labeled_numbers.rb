# use #each to iterate over the numbers hash

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

numbers.each do |k,v|
  puts "A #{k} number is #{v}."
end