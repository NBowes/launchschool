# Using an if/else statement, run a loop that prints "The loop was processed!" 
# one time if process_the_loop equals true. Print "The loop wasn't processed!" 
# if process_the_loop equals false.

process_the_loop = [true,false].sample

loop do
  if process_the_loop
    puts "The loop was processed!"
    break
  else
    puts "The loop was not processed!"
    break
  end
end