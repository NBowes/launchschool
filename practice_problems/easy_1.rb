famous_words = 'seven years ago...'
prefix = 'Four score and '

famous_words.prepend(prefix)
p famous_words

## alternate

famous_words.insert(0, prefix)
p famous_words

# ---

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times {how_deep.gsub!("number", "add_eight(number)") }

p how_deep
eval(how_deep)

# return only Barney and value in an array
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")
