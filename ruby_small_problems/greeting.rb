# The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

print "What is you name? "
name = gets.chomp

if name.include? "!"
  puts "HELLO #{name.capitalize.chop}! WHY ARE YOU YELLING?"
else
  puts "Hey #{name} :)"
end