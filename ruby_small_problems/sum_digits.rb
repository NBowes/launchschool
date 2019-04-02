# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def sum(number)
  digits = number.to_s.chars
  total = 0

  digits.each do |num|
    total += num.to_i
  end

  total
end

p sum(25)

## challenge

def better_sum(num)
  total = num.to_s.chars.map(&:to_i).inject(:+)
  # long hand: total = num.to_s.chars.map{|x|x.to_i}.inject{|sum,x| sum + x}
end

p better_sum(35)