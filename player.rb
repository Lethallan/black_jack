#both human and robot

class Player
  attr_reader :name, :cards, :money, :bank

  def initialize(name)
    @cards = []
    @money = 100
    @name = name
    @bank = 0
  end

  def gamble
    @money -=10
    @bank += 10
  end

  def take_card
    @cards << @deck.delete_at(0)
  end

  def initial_cards
    loop do
      take_card
      break if @cards.length == 2
    end
  end

  def open_cards
  end

  def skip
  end

  def count_points
  end
end
