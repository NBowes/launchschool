# find the total age of the male members of the family

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

def sum_males_age(munsters)
  males_age = 0
  males = munsters.select do |_, v|
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

p females_age

# print out the name, age, and gender of each munster

def munsters_string_substitution(fam)
  fam.each do |name, details|
    puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
  end
end

munsters_string_substitution(munsters)
