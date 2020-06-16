#Interface
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require_relative 'human'
require_relative 'dealer'

class Main
  def new_game
    players
    shuffle_cards
    human.initial_cards
    human.gamble
    dealer.initial_cards
    dealer.gamble
  end

  def players
    if human.nil? && dealer.nil??
      what_is_your_name
      human ||= Human.new(gets.chomp)
      dealer ||= Dealer.new
      greetings
    else
      nice_to_see_you_again
    end
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

  def  nice_to_see_you_again
    puts "Nice to see you again, #{human.name}!"
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
    if human.money == 0
      no_money
    elsif dealer.money == 0
      dealer_no_money
    else
      continue_or_not
    end
  end

  def no_money
    puts "#{human.name}, you have run out of money. Game over."
  end

  def dealer_no_money
    puts "#{dealer.name} has run out of money. You totally win!"
  end

  def do_you_want_to_continue
    puts '
    Do you want to continue?
    1 - Yes
    2 - No'
  end

  def continue_or_not
    do_you_want_to_continue
    choice = gets.chomp.to_i

    case choice
    when 1 then new_game
    when 2 then exit
  end
end

 game = Main.new
 game.options
