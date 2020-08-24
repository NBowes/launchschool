# frozen_string_literal: true

# Player
# - hit
# - stay
# - busted?
# - total
# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

# class Game
#   def start
#     deal_cards
#     show_initial_cards
#     player_turn
#     dealer_turn
#     show_result
#   end
# end

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    case @value
    when 'A' then 'Ace'
    when 'K' then 'King'
    when 'Q' then 'Queen'
    when 'J' then 'Jack'
    else
      @value
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'C' then 'Clubs'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    end
  end

  def ace?
    value == 'Ace'
  end

  def face?
    value == 'King' || value == 'Queen' || value == 'Jack'
  end

  def to_s
    "The #{value} of #{suit}."
  end
end

class Participant
  attr_reader :name
  attr_accessor :cards

  def initialize(name)
    @name = name
    @cards = []
  end
end

class Dealer < Participant

  def show_cards
    puts "Dealer has:"
    puts cards.first
  end
end

class Player < Participant

  def busted?
    total > 21
  end

  def show_cards
    puts "Player has:"
    cards.each do |card|
      puts card
    end
  end
  
  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.face?
        total += 10
      else
        total += card.value.to_i
      end
    end
    total
  end

  def hit
  end

  def stay
  end

end

class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    suits = %w[H D S C]
    card_values = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    suits.each do |suit|
      card_values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    @cards.shuffle!
  end
end

class BlackJackGame
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new('Player')
    @dealer = Dealer.new('Dealer')
  end

  def deal_cards
    2.times do 
      player.cards << @deck.cards.pop
      dealer.cards << @deck.cards.pop
    end
  end

  def display_message(message)
    puts message
  end

  def player_turn
    return 'Player has blackjack!' unless player.total < 21 || player.busted?

    loop do
      display_message("#{player.name} score is #{player.total} ")
      display_message("What do you want to do? [h = hit, s = stay]")
      answer = nil
      loop do        
        answer = gets.chomp
        break if %w[h s].include? answer
        display_message('That is not a valid answer - try again.')
      end

      if answer == 'h'
        player.cards << deck.cards.pop
        player.show_cards
        break if player.busted?
      end
    end
  end

  def show_initial_cards
    show_cards(player.cards, dealer.cards)
  end

  def show_busted
    if player.busted?
      "Well..that's not good. You busted. Dealer wins"
    end
  end

  def show_cards(player_cards, dealer_cards)
    player.show_cards
    puts ""
    dealer.show_cards
    puts ""
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    show_busted if player.busted?
#   dealer_turn
#   show_result
  end
end

twenty_one = BlackJackGame.new
p twenty_one.start
