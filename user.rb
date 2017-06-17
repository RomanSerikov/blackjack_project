class User < Player
  def display_actions
    puts "#{self.class}, сделай выбор:"
    puts "<1>: Пропустить"
    puts "<2>: Добавить карту" if hand.size != 3
    puts "<3>: Открыть карты"
    action = gets.chomp.to_i
  end

  def choose_action
    puts "#{self.class} hand:"
    show_cards

    action = display_actions
  end
end
