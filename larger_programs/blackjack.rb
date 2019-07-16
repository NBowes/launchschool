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

def determine_winner(p_score, d_score)
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

def display_score(score)
  prompt('-------------------------------')
  prompt("Player score: #{score[:player]}")
  prompt("Dealer score: #{score[:dealer]}")
  prompt('-------------------------------')
end

def display_winner(score)
  winner = score.key(5)

  case winner
  when :player
    prompt('Player wins it all!!')
  when :dealer
    prompt('Dealer wins - aww man!!')
  end
end

def display_winner_message(p_cards, d_cards, score)
  p_total = total(p_cards)
  d_total = total(d_cards)
  result = determine_winner(p_total, d_total)

  case result
  when 'Player Busted'
    prompt('Player busted..Dealer wins')
    score[:dealer] += 1
  when 'Dealer Busted'
    prompt('Dealer busted...Player wins!!')
    score[:player] += 1
  when 'Player'
    prompt('Player wins!!')
    score[:player] += 1
  when 'Dealer'
    prompt('Dealer wins..womp womp')
    score[:dealer] += 1
  when 'Tie'
    prompt('It is a tie..woh.')
  end
end

def find_winner?(score)
  score.values.include?(5)
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

def play_again
  prompt('----------')
  prompt('Do you want to play again?')
  answer = gets.chomp
  answer.downcase.start_with?('y')
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
score = { player: 0, dealer: 0 }
prompt('---------------------------------------')
prompt('Welcome to Blackjack - First to 5 wins!')
prompt('---------------------------------------')

loop do
  p find_winner?(score)
  # player turn
  answer = nil
  player_cards = cards.pop(2)
  dealer_cards = cards.pop(2)
  loop do
    prompt('')
    prompt("Player has #{total(player_cards)}")
    break if busted?(player_cards) || total(player_cards) == 21

    prompt("Hit or Stay? (h or s)")
    answer = gets.chomp
    break if answer.downcase.start_with?('s')

    player_cards << cards.shift
  end

  if busted?(player_cards)
    display_winner_message(player_cards, dealer_cards, score)
    display_score(score)
    find_winner?(score) ? break : next
  elsif total(player_cards) == 21
    display_winner_message(player_cards, dealer_cards, score)
    display_score(score)
    find_winner?(score) ? break : next
  else
    prompt("You chose to stay.")
  end
  prompt("Dealer...")
  # dealer turn

  loop do
    prompt("Dealer has #{total(dealer_cards)}")
    break if total(dealer_cards) >= 17

    dealer_cards << cards.shift
  end

  if busted?(dealer_cards)
    display_winner_message(player_cards, dealer_cards, score)
    display_score(score)
    find_winner?(score) ? break : next
  else
    prompt("Dealer stays with #{total(dealer_cards)}")
  end
  unless find_winner?(score)
    results(player_cards, dealer_cards)
    display_winner_message(player_cards, dealer_cards, score)
    display_score(score)
  end
  break if find_winner?(score)
end
display_winner(score)
prompt('Thanks for playing blackjack - Have a good one!')
