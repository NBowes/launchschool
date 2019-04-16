# fibonacci numbers (1,1,2,3,5,8,13...) - find index of number
# from indicated number of digits

def fibonacci(digits)
  index = 0
  f_num = [1, 1]
  loop do
    index += 1
    number = Math.log10(f_num[index]).to_i + 1
    break if number == digits

    new_number = f_num[index - 1] + f_num[index]
    f_num << new_number
  end
  f_num.length
end

p fibonacci(10000)
