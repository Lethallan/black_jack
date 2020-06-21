
# both human and robot
require 'pry'
require 'pry-byebug'

class Player
  POINTS_HASH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }.freeze

  attr_reader :name, :cards, :money, :bank, :score

  def initialize(name)
    @cards = []
    @money ||= 100
    @name = name
    @bank = 0
    @score = 0
  end

  def gamble
    @money -= 10
    @bank += 10
  end

  def take_card(deck)
    if @cards.length < 3
      @cards << deck.deck.delete_at(0)
    else
      count_score
    end
  end

  def get_rid_of_old_cards
    @cards.clear unless @cards.empty?
    @score = 0 unless score.zero?
  end

  def initial_cards(deck)
    get_rid_of_old_cards
    2.times { take_card(deck) }
  end

  def show_cards
    @cards.map { |card| "#{card.value}#{card.suit}" }
  end

  def do_nothing(deck)
    !take_card(deck)
    !show_cards
  end

  def ace
    if @score <= 10
      @score += 11
    else
      @score += 1
    end
  end

  def count_score
    @score = 0
    @cards.each do |card|
      if card.value == 'A'
        ace
      else
        @score += POINTS_HASH.fetch(card.value)
      end
    end
  end

  def win
    @bank -= 10
    @money += 20
  end

  def lose
    @bank -= 10
  end

  def draw
    @bank -= 10
    @money += 10
  end
end
