def swap_name(name)
  names = name.split
  "#{names.last}, #{names.first}"
end

p swap_name('nathen bowes')

## alternate

def swapper(name)
  name.split(' ').reverse.join(', ')
end

p swapper('nathen bowes')
