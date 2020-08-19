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
    @cards.shuffle
  end
end

class BlackJackGame
  attr_reader :deck

  def initialize
    @deck = Deck.new
  end
end

class Player
  def iniitialize
  end

  def hit
  end

  def stay
  end

end

twenty_one = BlackJackGame.new
p twenty_one.deck.cards
