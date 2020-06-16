#just a card

class Card
  attr_reader :value, :suit, :points

  POINTS_HASH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }

  def initialize(value, suit)
    @value = value
    @suit = suit
    @points = POINTS_HASH.fetch(value)
  end
end

 #'A' is not in hash, it should be checked somewhere else
 #Fetch doesn't work... bullshit