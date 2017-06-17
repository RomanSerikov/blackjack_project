class Deck
  def initialize
    @cards = []
    @values = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @suits  = %w(+ <3 ^ <>)
    @points = {"A" => 11, "J" => 10, "Q" => 10, "K" => 10}
    make_deck
    shuffle
  end

  def take_card
    @cards.shift
  end

  private

  def make_deck
    @values.each do |value|
      @suits.each do |suit|
        points = @points.has_key?(value) ? @points[value] : value.to_i
        @cards << Card.new(value: value, suit: suit, points: points)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end
end
