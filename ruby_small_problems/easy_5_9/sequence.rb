=begin
Create a method that takes two integers as arguments.
The first argument is a count, and the second is the first number
of a sequence that your method will create. The method should return
an Array that contains the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.
=end

def sequence(count, first_num)
  number_array = []
  count.times do |index|
    number_array << if index.zero?
                      first_num
                    else
                      first_num * (index + 1)
                    end
  end
  number_array
end

p sequence(4,-7)

## alternate

def seq(count, first)
  (1..count).map { |index| index * first}
end

p seq(4,-7)
