#Interface
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require_relative 'human'
require_relative 'dealer'
require'pry'
require 'pry-byebug'

class Main
  attr_reader :human, :dealer, :current_deck

  #initial methods
  def players
    if @human.nil? && @dealer.nil?
      what_is_your_name
      @human = Human.new(gets.chomp)
      @dealer = Dealer.new
      greetings
    else
      nice_to_see_you_again
    end
  end

  def shuffle_cards
    @deck = Deck.new
    @deck.new_deck
  end

  def start_cards
    @human.initial_cards(@deck)
    @dealer.initial_cards(@deck)
    @human.gamble
    @dealer.gamble
    @human.count_score
    @dealer.count_score
  end

  def new_game
    players
    shuffle_cards
    start_cards
    human_information
  end

  #action methods
  def options
    new_game

    loop do
      move_human
      options_text

      action = gets.chomp.to_i
      break if action == 3 || players_three_cards || @dealer.show_cards

      case action
      when 1 then takes_card
      when 2 then skips_move
      when 3 then opens_cards
      else wrong_command
      end
    end

    final_actions
  end

  def takes_card
    @human.take_card(@deck)
    @human.count_score
    dealer_actions
  end

  def skips_move
    @human.do_nothing(@deck)
    dealer_actions
  end

  def opens_cards
    final_actions
  end

  #three cards condition
  def human_three_cards
    @human.cards.length == 3
  end

  def dealer_three_cards
    @dealer.cards.length == 3
  end

  def players_three_cards
   human_three_cards && dealer_three_cards
  end
  #___________________________________

  def human_wins
    human_wins_text
    @human.win
    @dealer.lose
  end

  def oops_draw
    draw_text
    @human.draw
    @dealer.draw
  end

  def final_actions
    human_show_cards
    dealer_show_cards
    show_score
    winner
    game_over
  end

  #victory_conditions
  def victory_conditions_human
    (@human.score > @dealer.score) && (human.score <= 21)
  end

  def draw_conditions
    @dealer.score == @human.score
  end

  def victory_conditions_dealer
   (@human.score < @dealer.score) && (dealer.score <= 21)
  end

  def winner
    if victory_conditions_human
      human_wins
    elsif draw_conditions
      oops_draw
    elsif victory_conditions_dealer
      dealer_wins
    else
      wrong_method
    end

    show_money
  end
  #_______________________________

  def game_over
    if @human.money <= 0
      no_money
    elsif @dealer.money <= 0
      dealer_no_money
    else
      continue_or_not
    end
  end

  def continue_or_not
    do_you_want_to_continue
    choice = gets.chomp.to_i

    case choice
    when 1 then options
    when 2 then exit
    else wrong_method
    end
  end

  #dealer's actions
  def dealer_actions
    move_dealer_text
    dealer_conditions_for_actions
    dealer_puts
  end

  def dealer_takes_card
    @dealer.take_card(@deck)
    @dealer.count_score
  end

  def dealer_shows_cards
    @dealer.show_cards
  end

  def dealer_waits
    @dealer.do_nothing(@deck)
  end

  def dealer_conditions_for_actions
    if @dealer.score == 21
      dealer_shows_cards
    elsif (@dealer.score < 21) && (@dealer.score > 15)
      dealer_waits
    elsif @dealer.score <= 15
      dealer_take_card
    else
      wrong_method
    end
  end

  def dealer_puts
    if dealer_takes_card
      dealer_took_card
    elsif dealer_shows_cards
      dealer_opened_cards
    elsif dealer_waits
      dealer_skipped_move
    else
      wrong_method
    end
  end

  def dealer_wins
    dealer_wins_text
    @dealer.win
    @human.lose
  end

  def move_dealer_text
    puts "#{@dealer.name} makes a move."
  end

  def dealer_took_card
    puts "#{@dealer.name} takes a card"
  end

  def dealer_opened_cards
    puts "#{@dealer.name} opens cards"
  end

  def dealer_skipped_move
    puts "#{@dealer.name} does nothing"
  end

  def show_dealer_score
    puts "#{@dealer.name} has #{@dealer.score} points"
  end

  def dealer_wins_text
    puts "#{@dealer.name} wins!"
  end

  def dealer_show_cards
    puts "#{@dealer.name} has cards #{@dealer.show_cards}"
  end
  #_________________________________________

  #puts methods
  def what_is_your_name
    puts '
    Here is Black Jack game.
    What is your name?'
  end

  def greetings
    puts "
    Greetings, #{@human.name}!
    I'm #{@dealer.name}.
    Let's get it started!"
  end

  def nice_to_see_you_again
    puts "Nice to see you again, #{@human.name}!"
  end

  def options_text
    puts'
    1 - Take a card
    2 - Skip a move
    3 - Open cards'
  end

  def wrong_command
    puts 'No such action. Try again'
  end

  def move_human
    puts "#{@human.name}, it's your turn."
  end

  def too_many_cards
    puts "
    #{@human.name}, you already have 3 cards.
    Try something else"
  end

  def show_score
    puts "
    #{@human.name}, you have #{@human.score} points
    #{@dealer.name} has #{@dealer.score} points"
  end

  def human_information
    puts "
    #{@human.name}, your cards: #{@human.show_cards}
    Your score: #{@human.score}.
    Your money: #{@human.money}
    Bank: #{@human.bank + @dealer.bank}

    #{dealer.name} has #{@dealer.cards.length} cards."
  end

  def human_show_cards
    puts "#{@human.name}, your cards: #{@human.show_cards}"
  end

  def human_wins_text
    puts "#{@human.name} wins!"
  end

  def draw_text
    puts 'We have a draw!'
  end

  def no_money
    puts "#{@human.name}, you have run out of money. Game over."
  end

  def dealer_no_money
    puts "#{@dealer.name} has run out of money. You totally win!"
  end

  def show_money
    puts " Money:
    #{@human.name} - #{@human.money}
    #{dealer.name} - #{@dealer.money}"
  end

  def do_you_want_to_continue
    puts '
    Do you want to continue?
    1 - Yes
    2 - No'
  end

  def wrong_method
    puts 'something is wrong...'
  end
end

 game = Main.new
 game.options
