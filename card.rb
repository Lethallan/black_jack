#just a card

class Card
  attr_reader :value, :suit, :points

  POINTS_HASH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }

  def initialize(value, suit)
    @value = value
    @suit = suit
    @points = POINTS_HASH.fetch(@value)
  end
end

 #'A' is not in hash, it should be checked somewhere else
 #Fetch doesn't work... bullshit

#  9: from /usr/bin/irb:23:in `<main>'
#  8: from /usr/bin/irb:23:in `load'
#  7: from /Library/Ruby/Gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
#  6: from (irb):31
#  5: from (irb):12:in `new_deck'
#  4: from (irb):12:in `each'
#  3: from (irb):13:in `block in new_deck'
#  2: from (irb):13:in `each'
#  1: from (irb):14:in `block (2 levels) in new_deck'
# NameError (uninitialized constant Deck::Card)
# irb(main):032:0>