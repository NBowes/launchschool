# update greeting_method to combine both methods before put statement

def hello
  "hello"
end

def world
  "world"
end

def greeting
  hello + " " + world
end

puts greeting