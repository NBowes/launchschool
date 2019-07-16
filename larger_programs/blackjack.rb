# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

def busted?(cards)
  total(cards) > 21
end

def determine_winner(p_cards, d_cards)
  p_score = total(p_cards)
  d_score = total(d_cards)

  if p_score > 21
    'Player Busted'
  elsif d_score > 21
    'Dealer Busted'
  elsif p_score > d_score
    'Player'
  elsif d_score > p_score
    'Dealer'
  else
    'Tie'
  end
end

def display_winner(p_cards, d_cards)
  result = determine_winner(p_cards, d_cards)

  case result
  when 'Player Busted'
    prompt('Dealer wins..womp womp')
  when 'Dealer Busted'
    prompt('Player wins!!')
  when 'Player'
    prompt('Player wins!!')
  when 'Dealer'
    prompt('Dealer wins..womp womp')
  when 'Tie'
    prompt('It is a tie..woh.')
  end
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

def prompt(msg)
  puts msg
end

def results(p_cards, d_cards)
  prompt('+++++++++++++++++++++')
  prompt("| Player score: #{total(p_cards)}  |")
  prompt("| Dealer score: #{total(d_cards)}  |")
  prompt('+++++++++++++++++++++')
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  values.select { |card| card == 'A' }.size.times do
    sum -= 10 if sum > 21
  end
  sum
end

cards = initalize_cards
loop do
  # player turn
  answer = nil
  player_cards = cards.pop(2)
  loop do
    prompt("Player has #{total(player_cards)}")
    break if busted?(player_cards)

    prompt("Hit or Stay?")
    answer = gets.chomp
    break if answer.capitalize == 'Stay'

    player_cards << cards.shift
  end

  if busted?(player_cards)
    prompt("You busted!")
  else
    prompt("You chose to stay.")
  end

  prompt("Dealer...")
  # dealer turn
  dealer_cards = cards.pop(2)
  loop do
    prompt("Dealer has #{total(dealer_cards)}")
    break if total(dealer_cards) >= 17

    dealer_cards << cards.shift
  end

  if busted?(dealer_cards)
    prompt("Dealer bust!")
  else
    prompt("Dealer stays with #{total(dealer_cards)}")
  end

  results(player_cards, dealer_cards)
  display_winner(player_cards, dealer_cards)

  break
end
