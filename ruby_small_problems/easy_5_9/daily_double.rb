# remove duplicates, but still return original string order - dont use #squeeze
# ex: crunch('ddaaiillyy ddoouubbllee') == 'daily double'

def crunch(string)
  unique_string = ''
  count = 0

  while count <= string.length
    unique_string << string[count] unless string[count] == string[count + 1]
    count += 1
  end
  unique_string
end

p crunch('daailly doouuble')
