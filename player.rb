class Player
 
  attr_accessor :other_player
  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 3
  end

  def answer_question(question, answer)
    if question[:result] == answer
      puts "YES! You are correct. 🎉"
      @score = @score
    else 
      puts "Seriously? No! 💥"
      @score -= 1
    end
    display_score
  end

  def display_score
    if @other_player.name == "Player 1"
      puts "P1: #{@other_player.score}/3 vs P2: #{@score}/3"
    else 
      puts "P1: #{@score}/3 vs P2: #{@other_player.score}/3"
    end
  end
end


# example output: 
# Player 1: What does 5 plus 3 equal?
# > 9
# Player 1: Seriously? No!
# P1: 2/3 vs P2: 3/3
# ----- New Turn -----
# Player 2: What does 2 plus 6 equal?
# > 8
# Player 2: YES! You are correct.
# P1: 2/3 vs P2: 3/3
# ----- New Turn -----
# ... some time later ...
# Player 1 wins with a score of 1/3
# ----- GAME OVER -----
# Good bye!
