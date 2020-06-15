#Interface
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require_relative 'human'
require_relative 'dealer'

class Main
  def new_game
    what_is_your_name
    human ||= Human.new(gets.chomp)
    dealer ||= Dealer.new
    greetings
    shuffle_cards
    human.initial_cards
    human.gamble
    dealer.initial_cards
    dealer.gamble
  end

  def what_is_your_name
    puts '
    Here is Black Jack game.
    What is your name?'
  end

  def greetings
    puts "
    Greetings, #{human.name}!
    I'm #{dealer.name}.
    Let's get it started!"
  end

  def shuffle_cards
    @current_deck = Deck.new
    @cuurent_deck.new_deck
  end

  def options
    new_game

    loop do
      options_text

      action = gets.chomp.to_i
      break if game_over

      case action
      when 1 then takes_cards
      when 2 then skips_move
      when 3 then opens_cards
      else wrong_command
      end
    end
  end

  def options_text
    puts'
    1 - Take a card
    2 - Skip a move
    3 - Open cards'
  end

  def counts_points
  end

  def takes_cards
  end

  def skips_move
  end

  def opens_cards
  end

  def wrong_command
    puts 'No such action. Try again'
  end

  def information
    #gives information about cards, points and gambles
  end

  def game_over
    #offers two options: start a new game or exit
  end
end

 game = Main.new
 game.options
