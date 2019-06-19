# order this array by descending numeric value

arr = ['10','11','9','7','8']

def sort_array(arr)
  arr.sort_by do |element|
    element.to_i
  end.reverse
end

p sort_array(arr)

## alternate

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# order books array based on year of publication

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end

# change all of the 3 values to 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

# find the total age of the male members of the family

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}
def sum_males_age(munsters)
  males_age = 0
  males = munsters.select do |_,v|
    v['gender'] == 'male'
  end

  males.each do |_, v|
    males_age += v['age']
  end
  males_age
end

p sum_males_age(munsters)

## alternate

females_age = 0
munsters.each_value do |details|
  females_age += details['age'] if details['gender'] == 'female'
end

females_age

# print out the name, age, and gender of each munster

def munsters_string_substitution(fam)
  fam.each do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
  end
end

munsters_string_substitution(munsters)

# use #each to print out all of the vowels in the strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

def vowel?(char)
  char =~ /[aeiou]/
end

hsh.each do |_, v|
  v.each do |word|
    word.chars.each do |char|
      puts char if vowel?(char)
    end
  end
end

# sort the array alphabetically/numerically 
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub_array|
  sub_array.sort do |a, b|
  a <=> b  
end
end

# use map to return a new array with each value incremented by 1
# don't modify the original array

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

array.map do |hash|
  new_hash = {}
    hash.each do |key,num|
      new_hash[key] = num + 1
    end
  new_hash
end
