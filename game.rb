class Game

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck   = Deck.new
    @bank   = 0
  end

  def greetings
    puts "Приветствуем! Как вас зовут?"
    @player.name = gets.chomp
  end

  def make_bets(amount)
    @player.take_money(amount)
    @dealer.take_money(amount)

    @bank += (amount * 2)
  end

  def give_two_cards(person)
    2.times { person.draw_card(@deck) }
  end

  def start
    greetings

    puts "Player:"
    give_two_cards(@player)
    @player.show_cards

    puts "Dealer:"
    give_two_cards(@dealer)
    @dealer.show_cards

    make_bets(10)
  end
end
