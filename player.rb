class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = gets.chomp
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def is_dead?
    @lives == 0
  end



  def ask_question
    question = Question.new
    question.ask_question(@name)
    input = gets.chomp.to_i
    question.check_answer(input)
  end

end

