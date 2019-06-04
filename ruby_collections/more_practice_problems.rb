# turn this array into a hash
# names are keys, value is position
flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]

flint_hash = {}
flintstones.each_with_index do |name, index|
  flint_hash[name] = index
end
p flint_hash

# add all the ages
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843,
         'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }

sum = 0
ages.values.each do |age|
  sum += age
end
p sum

## alternate
ages.values.inject(:+)

# remove any old people (over 100)
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

ages.select! { |_, age| age < 100 }
p ages

# select the lowest age from the family_ages hash
family_ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843,
                'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }

p family_ages.values.sort.first

## alternate
family_ages.values.min

# Find the index of the first name that starts with 'Be'
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

flintstones.select! { |name| name.start_with?('Be') }.first
p flintstones

# shorten all the names 3 characters
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

new_names = []
flintstones.map { |name| new_names << name[0..2] }
p new_names

# Create a hash that expresses the frequency
# with which each letter occurs in this string:
# ex: { 'F'=>1, 'R'=>1, 'T'=>1, 'c'=>1, 'e'=>2, ... }

statement = 'The Flintstones Rock'
statement.gsub!(/\s+/, '')

count = {}
statement.chars.each { |char| count[char] = statement.count(char) }
p count

# titleize this
# titleize is a method in Rails, but not Ruby
# ex. 'The Flinstones Rock'
words = 'the flintstones rock'

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

p titleize(words)

# give all of the munsters an age_group key
# kid 0-17, adult 18-64, senior 65+
munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

def age_group(age)
  case age
  when 0..18
    'kid'
  when 18..64
    'adult'
  else
    'senior'
  end
end

munsters.each do |_, info|
  info['age_group'] = age_group(info['age'])
end

p munsters
