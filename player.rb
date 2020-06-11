#both human and robot

class Player
  attr_reader :name, :cards, :money, :gamble_money

  def initialize(name)
    @cards = []
    @money = 100
    @name = name
    @gamble_money = 0
  end

  def gamble
    @money -=10
    @gamble_money += 10
  end

  def take_card
    # забирает элементы массива колоды к себе в массив
  end
end
