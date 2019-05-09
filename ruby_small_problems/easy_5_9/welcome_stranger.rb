# assume occupation_hash has 'title' and 'occupation' as the keys

def welcome(name_array, occupation_hash)
  name = name_array.join(' ')
  occupation = occupation_hash.values.join(' ')

  "Hello #{name}, nice to have a #{occupation} around here."
end

p welcome(%w[nathen j c bowes], title: 'Junior', occupation: 'Developer')
