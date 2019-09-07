password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp
  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

password ||= set_password unless password

verify_password(password)
