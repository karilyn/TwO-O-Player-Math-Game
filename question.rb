class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def prompt
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(user_input)
    user_input == @answer
  end

 end
