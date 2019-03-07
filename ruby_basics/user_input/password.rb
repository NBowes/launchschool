# Display a welcome message when the password has been entered correctly

REAL_PASSWORD = 'PaSSword'
password = nil
number_of_tries = 3

loop do
  puts ">> Please enter your password:"
  password = gets.chomp
  break if password == REAL_PASSWORD
  puts "Invalid password."
  number_of_tries -= 1
  if number_of_tries < 1
    puts "You are out of tries "
    break
  end
end

puts "Welcome!" if password == REAL_PASSWORD
