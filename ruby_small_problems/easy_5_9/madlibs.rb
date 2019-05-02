# Enter a noun, verb, adjective, adverb, put them in a sentence

def madlib(noun, verb, adjective, adverb)
  "Do you #{adverb} #{verb} your #{adjective} #{noun}? Same."
end

def prompt(message)
  puts message
end

prompt('Enter a noun:')
noun = gets.chomp

prompt('Enter a verb:')
verb = gets.chomp

prompt('Enter an adjective:')
adjective = gets.chomp

prompt('Enter an adverb:')
adverb = gets.chomp

p madlib(noun, verb, adjective, adverb)
