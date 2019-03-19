# only return the key value pair that is lower than 25 - use #select and assign to variable 'low_numbers'

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

low_numbers = numbers.select do |k,v|
                v < 25
              end

p low_numbers

