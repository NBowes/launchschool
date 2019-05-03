# print 'fizz' if number is divisible by 3
# print 'buzz' if number is divisble by 5
# print 'fizzbuzz' if number is divisble by 3 and 5

def fizzbuzz(num1, num2)
  numbers = []
  num1.upto(num2) do |num|
    numbers << if (num % 3).zero? && (num % 5).zero?
                 puts 'fizzbuzz'
               elsif (num % 5).zero?
                 puts 'buzz'
               elsif (num % 3).zero?
                 puts 'fizz'
               else
                 puts num
               end
  end
  numbers
end

p fizzbuzz(2, 20)
