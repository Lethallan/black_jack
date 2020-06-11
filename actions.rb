#Actions for both human and robot

module Actions
  attr_reader :gamble_money

  def take_card
  end

  def gamble
    self.money -= 10
    @gamble_money += 10
  end

  def
end

# хм... а может, нужен класс player,
# в котором будут методы, общие для робота и человека,
# а потом два дочерних класса