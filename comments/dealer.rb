class Dealer < Player
  def choose_action
    puts "#{self.class} hand: #{'*' * hand.size}"
    points < 17 ? 2 : 1
  end
end
