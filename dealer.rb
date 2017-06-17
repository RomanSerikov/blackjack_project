class Dealer < Player
  def choose_action
    puts "#{self.class} hand: #{"*" * hand.size}"
    action = (points < 17 ? 2 : 1)
  end
end
