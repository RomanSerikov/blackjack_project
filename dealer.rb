class Dealer < Player
  def display_actions
    puts "#{self.class}, сделай выбор:"
    puts "<1>: Пропустить"
    puts "<2>: Добавить карту" if hand.size != 3
    action = gets.chomp.to_i
  end

  def choose_action
    puts "#{self.class} hand: (ACTUALLY HIDDEN)"
    show_cards
    
    action = display_actions
  end
end
