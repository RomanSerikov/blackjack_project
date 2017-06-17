class Game
  attr_reader :current_player

  def initialize
    @user           = User.new
    @dealer         = Dealer.new
    @deck           = nil
    @bank           = 0
    @current_player = nil
    @finish_round   = nil
  end

  def start
    greetings

    new_round!

    loop do
      make_turn
    end
  end

  private

  def make_turn
    action = current_player.choose_action
    
    case action
    when 1 then skip_turn
    when 2 then take_card(current_player)
    when 3 then @finish_round = true
    else puts "Wrong command"
    end

    if @finish_round || check_three_cards!
      choose_winner
      ask_for_more
    end
  end

  def new_round!
    @deck         = Deck.new
    @finish_round = false
    @user.refresh!
    @dealer.refresh!

    puts "User:"
    give_two_cards(@user)
    @user.show_cards

    puts "Dealer:"
    give_two_cards(@dealer)
    @dealer.show_cards

    make_bets(10)

    @current_player = @user
  end

  def ask_for_more
    puts "Wanna more? <Y>"
    action = gets.chomp.upcase

    if action == "Y"
      new_round!
    else
      puts "Всего хорошего, и спасибо за рыбу!"
      exit!
    end
  end

  def choose_winner
    show_both_hands

    if @user.points > 21
      puts "You lost!"
      # Перевод денег из общего банка Дилеру
    elsif @user.points > @dealer.points
      puts "User with #{@user.points} points WIN!"
      # Перевод денег из общего банка Пользователю
    elsif @user.points == @dealer.points
      puts "It's draw!"
      # Вернуть деньги Пользователю и Дилеру
    else
      puts "You lost!"
      # Перевод денег из общего банка Дилеру
    end
  end

  def check_three_cards!
    @finish_round = (@user.hand.size == 3 && @dealer.hand.size == 3)
  end

  def greetings
    puts "Приветствуем! Как вас зовут?"
    @user.name = gets.chomp
  end

  def take_card(player)
    player.draw_card(@deck)
    puts "#{player.class}, now your hand:"
    @user.show_cards
    skip_turn
  end

  def give_two_cards(player)
    2.times { player.draw_card(@deck) }
  end

  def make_bets(amount)
    @user.take_money(amount)
    @dealer.take_money(amount)

    @bank += (amount * 2)
  end

  def skip_turn
    puts "Zzzz...."
    change_player
    sleep(1)
    puts "Now its #{@current_player.class} turn."
  end

  # def open_hand
  #   @finish_round = true
  #   show_both_hands
  # end

  def show_both_hands
    puts "User:"
    @user.show_cards

    puts "Dealer:"
    @dealer.show_cards
  end

  def change_player
    @current_player = (@current_player == @user ? @dealer : @user)
  end
end
