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

  def start
    greetings
  end
end
