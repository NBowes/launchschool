# modify password.rb to include a username in the validation

REAL_PASSWORD = 'PaSSword'
USERNAME = 'nate'
password = nil
username = nil
number_of_tries = 3

loop do
  puts ">> Please enter your username:"
  username = gets.chomp
  puts "Please enter your password."
  password = gets.chomp
  break if password == REAL_PASSWORD && username == USERNAME
  puts "Authorization Failed."
  number_of_tries -= 1
  if number_of_tries < 1
    puts "You are out of tries "
    break
  end
end

puts "Welcome!" if password == REAL_PASSWORD && username == USERNAME