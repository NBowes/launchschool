# see if 'Spot' is present
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

p ages.include?('Spot')
p ages.key?('Spot')
p ages.member?('Spot')

# ---
munsters_description = 'The Munsters are creepy in a good way.'

p munsters_description.swapcase == 'tHE mUNSTERS ARE CREEPY IN A GOOD WAY.'
p munsters_description.capitalize == 'The munsters are creepy in a good way.'
p munsters_description.casecmp('the munsters are creepy in a good way.').zero?
p munsters_description.casecmp('THE MUNSTERS ARE CREEPY IN A GOOD WAY.').zero?

# ---
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

# add ages for Marilyn and Spot to the existing hash
additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }

additional_ages.each { |k, v| ages[k] = v }

# alternate
ages.merge!(additional_ages)

p ages

# ---
advice = 'Few things in life are as important as house training your pet dinosaur.'

p advice.include? 'dino'

p advice.slice(0, advice.index('house'))

# count all of the lowercase 't' in one line
statement = 'The Flintstones Rock!'

p statement.count('t')
p statement.center(40)
