cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { hearts: cards.clone,
         diamonds: cards.clone,
         clubs: cards.clone,
         spades: cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.each_key do |suit|
  cards = deck[suit]
  # when you shuffle cards, if you don't use clone, it shuffles all of the suits
  # the same way (it's always the same array)
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |score, (_, remaining_cards)|
  number_cards = remaining_cards.map do |card|
    score(card)
  end
  score += number_cards.sum
end

puts sum
