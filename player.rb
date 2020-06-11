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
    # забирает элементы массива колоды к себе в массив
  end

  def put_card
    # достать карту из массива игрока и положить на стол (ещё один массив?)
  end

  def skip
    # пропустить ход
  end

  def count_points
    # подсчитать очки на картах
  end
end
