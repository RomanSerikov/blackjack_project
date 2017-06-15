class Dealer
  attr_accessor :name
  attr_reader :points

  def initialize
    @name   = "MrRobot"
    @bank   = 100
    @hand   = []
    @points = 0
  end

  def draw_card(deck)
    card = deck.take_card
    @hand << card
    @points += card.points
  end

  def take_money(amount)
    raise "not enough money!" if @bank < amount
    @bank -= amount
  end

  def show_cards
    @hand.each do |card|
      puts "card: #{card.value}#{card.suit}"
    end
    puts "points: #{@points}"
  end
end
