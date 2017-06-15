class Player
  attr_accessor :name
  attr_reader :points

  def initialize
    @name   = ""
    @bank   = 100
    @hand   = []
    @points = 0
  end

  def draw_card(deck)
    card = deck.take_card
    @hand << card
    @points += card.power 
  end

  def take_money(amount)
    raise "not enough money!" if @bank < amount
    @bank -= amount
  end
end
