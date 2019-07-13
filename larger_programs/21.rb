# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

def prompt(msg)
  puts msg
end

def initalize_cards
  cards = []
  suits = ['H', 'D', 'S', 'C']
  card_values = ['A', '2', '3', '4', '5', '6',
                 '7', '8', '9', '10', 'J', 'Q',
                 'K']
  suits.each do |suit|
    card_values.each do |value|
      cards << [suit, value]
    end
  end
  cards.shuffle
end

def total(cards)
  values = cards.map{ |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  num_aces = values.select{ |card| card == 'A'}.size
  num_aces.times do
    sum -= 10 if sum > 21
  end
  sum

end

def busted?(cards)
  total(cards) > 21
end

cards = initalize_cards
loop do
# player turn
  answer = nil
  player_cards = cards.pop(2)
  loop do
    p player_cards
    p total(player_cards)
    prompt("Hit or Stay?")
    answer = gets.chomp
    player_cards << cards.shift
    break if answer.capitalize == 'Stay' || busted?(player_cards)
  end

  if busted?(player_cards)
    # end game
  else
    prompt("You chose to stay.")
  end

  prompt("Dealer...")
  # dealer turn

  loop do
    dealer_cards = cards.pop(2)
    loop do
      p dealer_cards
      break if total(dealer_cards) >= 17 
      dealer_cards << cards.shift
    end

    if busted?(dealer_cards)
      prompt("Dealer bust!")
    else
      prompt("Dealer stays with #{total(dealer_cards)}")
    end
    break
  end
  break
end

