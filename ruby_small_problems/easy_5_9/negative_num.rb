def negative(number)
  return number if number.negative? || number.zero?

  number * -1
end

p negative(0)

## alternate

def negative_2(number)
  number > 0 ? -number : number
end

p negative_2(0)
