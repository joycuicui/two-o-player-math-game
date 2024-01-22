class Game

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
  end

  def generate_questions
    num1 = rand(1..20)
    num2 = rand(1..20)
    result = num1 + num2
    {
      num1: num1,
      num2: num2,
      result: result
    }
  end

  def switch_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end

  def start_game
    puts "--- TwO-O-Player Math Game ---"
    while @players.all? {|player| player.score > 0}
      question = generate_questions
      puts "#{@current_player.name}: What does #{question[:num1]} plus #{question[:num2]} equal?"
      print "> "
      player_answer = gets.chomp.to_i
      @current_player.answer_question(question, player_answer)
      switch_player
      puts "----- New Turn -----" unless @players.any? { |player| player.score == 0 }
    end
    announce_winner
  end

  def announce_winner
    player1, player2 = @players
    if player1.score > player2.score
      winner = player1
    else 
      winner = player2
    end
    puts "----- GAME OVER -----"
    puts "#{winner.name} wins with a score of #{winner.score}/3"
    puts "Good bye!"
  end

end



# puts "What does 5 plus 3 equal?"
# print "> "
# answer1 = $stdin.gets.chomp
