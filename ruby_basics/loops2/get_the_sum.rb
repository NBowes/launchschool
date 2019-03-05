# only stop when the right answer is found

loop do
  puts "What is 1 + 1?"
  answer = gets.chomp.to_i

  if answer == 2
    puts "Yea it is"
    break
  else
    puts "uh, you should check your math and try again."
  end
end