class Deck
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS  = %w[+ <3 ^ <>]
  POINTS = { 'A' => 11, 'J' => 10, 'Q' => 10, 'K' => 10 }

  def initialize
    @cards = []
    make_deck!
    shuffle!
  end

  def take_card
    @cards.pop
  end

  private

  def make_deck!
    VALUES.each do |value|
      SUITS.each do |suit|
        points = POINTS.key?(value) ? POINTS[value] : value.to_i
        @cards << Card.new(value: value, suit: suit, points: points)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
