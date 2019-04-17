def combine(arr1, arr2)
  arr1 + arr2
end

p combine(%w[1 2 3], %w[4 3 5])

## alternate

def add_both(arr1, arr2)
  arr1 | arr2
end

p add_both(%w[cat dog bird], %w[horse pig donkey])
