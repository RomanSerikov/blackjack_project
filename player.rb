class Player
  attr_accessor :name
  attr_reader :points, :hand

  def initialize
    @name   = ""
    @bank   = 100
    @hand   = []
    @points = 0
  end

  def refresh!
    @hand   = []
    @points = 0
  end

  def draw_card(deck)
    card = deck.take_card
    @hand << card
    add_points(card)
  end

  def take_money(amount)
    raise "not enough money!" if @bank < amount
    @bank -= amount
  end

  def give_money(amount)
    @bank += amount
  end

  def show_cards
    @hand.each do |card|
      puts "card: #{card.value}#{card.suit}"
    end
    puts "points: #{@points}"
  end

  private

  def add_points(card)
    if card.value == "A" && @hand.size != 1
      if (2..10).include?(points)
        @points += 11
      elsif (11..21).include?(points)
        @points += 1
      end
    else
      @points += card.points
    end
  end
end
