# method that searches for all multiples of 3 or 5 that lie between 1 and some other number
# computes the sum of those multiples
# You may assume that the number passed in is an integer greater than 1.


def multisum(num)
  sum = []
  1.upto(num) do |n|
    if n % 3 == 0 || n % 5 == 0
      sum << n
    end
  end
  sum.reduce(:+)
end

puts multisum(20)

# alternate
def multi_sum(num)
  sum = 0
  1.upto(num) do |n|
    if n % 3 == 0 || n % 5 == 0
      sum += n
    end
  end
  sum
end

puts multi_sum(10)