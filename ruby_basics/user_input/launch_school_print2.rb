# Use launch_school_print to print the number of times until user quits program

loop do 
answer = nil
  loop do 
    puts "How many times do you want to say 'This is cool'? (Q to quit)"
    answer = gets.chomp
    if answer.downcase == 'q' || answer.to_i > 3
      break
    else
      puts "Please enter a number greater than 3 or 'q' to exit the program."
    end
  end

  break if answer.downcase == 'q'

  answer.to_i.times do |phrase|
    phrase = "This is cool"
    puts phrase
  end
end