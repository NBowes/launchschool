# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input])

puts 'Your character stats:'
puts player

# running into an error - find and fix the problem

# Error: TypeError - no implicit conversion of nil into Hash (line 17)
### 1. input is a String, need to convert it to a symbol
### 2. merge creates a new hash/object, but without the '!' character doesn't modify
### the original 'player' object.
### 3. fix by either using #merge! or by setting player = player.merge(character_classes[input.to_sym])