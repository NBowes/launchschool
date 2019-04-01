# Write a method that counts the number of occurrences of each element in a given array.

things = ["bottle", "candle", "candle", "glass", "bottle"]

def how_many?(array)
  count = {}
  
  array.each do |e|
    if count[e]
      count[e] += 1
    else
      count[e] = 1
    end
  end
 
  count
end

puts how_many?(things)

### alternate

def count(array)
  how_many = {}
  
  array.each do |e|
    how_many[e] = array.count(e)
  end
  
  how_many.each do |k,v|
   puts "#{k}: #{v}"
  end
end

count(things)