class Card
  attr_reader :value, :suit, :points

  def initialize(value:, suit:, points:)
    @value  = value
    @suit   = suit
    @points = points
  end
end
