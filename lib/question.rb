class Question
  def initialize(question, answer, points)
    @question = question
    @answer = answer
    @points = points.to_i
  end

  def to_s
    "#{@question}(#{@points} балла)"
  end

  def answer
    @answer
  end

  def user_answer=(user_answer)
    @user_answer = user_answer.to_s.downcase
  end

  def right_answer?
    @user_answer == @answer.downcase
  end

  def points
   right_answer? ? @points : 0
  end
end
