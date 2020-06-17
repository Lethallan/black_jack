#both human and robot

class Player
  POINTS_HASH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }

  attr_reader :name, :cards, :money, :bank, :score

  def initialize(name)
    @cards = []
    @money = 100
    @name = name
    @bank = 0
    @score = 0
  end

  def gamble
    @money -= 10
    @bank += 10
  end

  def take_card
    if @cards.length < 3
      @cards << @deck.delete_at(0)
    else
      count_score
    end
  end

  def initial_cards
    loop do
      take_card
      break if @cards.length == 2
    end
  end

  def show_cards
    @cards.each { |card| puts "#{card.value} #{card.suit}" }
  end

  def do_nothing
    !take_card
    !open_cards
  end

  def ace
    if @score <= 10
      @score += 11
    else
      @score += 1
    end
  end

  def count_score
    @cards.each do |card|
      if card.value == 'A'
        ace
      else
        @score += POINTS_HASH.fetch(card.value)
      end
    end
  end
end
