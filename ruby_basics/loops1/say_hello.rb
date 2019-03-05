# Modify the code below so "Hello!" is printed 5 times.
say_hello = true

while say_hello
  puts "Hello!"
  say_hello = false
end

###
say_hello = true
times = 5

while say_hello
  puts "Hello!"
  times -= 1
  if times == 0
    say_hello = false
  end
end

### 
say_hello = true
count = 0

while say_hello
  puts "Hello!"
  count += 1
  say_hello = false if count == 5
end