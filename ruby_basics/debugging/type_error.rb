def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
p get_quote('Yoda')
# puts '"' + get_quote('Confucius')  + '"'

# what is the issue and how would you fix it?

### there is no implicit return statements, so it will only return the last if statement, and only if it is 'Einstein'
### you could put a return in each of the if statements, or turn the 3 statements into 1 if/elsif statement