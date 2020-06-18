# A deck of cards.
require 'pry'
require 'pry-byebug'

class Deck
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = ['♠', '♥', '♣', '♦'].freeze

  attr_reader :deck

  def initialize
    @deck = []
  end

  def new_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck << Card.new(value, suit)
      end
    end

    @deck.shuffle!
  end
end
