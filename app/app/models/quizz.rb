class Quizz < ActiveRecord::Base

  belongs_to :scoreboards, optional: true

  has_many :difficulty

  belongs_to :question1, class_name: "Question", foreign_key: "question_1_id"
  belongs_to :question2, class_name: "Question", foreign_key: "question_2_id", optional: true
  belongs_to :question3, class_name: "Question", foreign_key: "question_3_id", optional: true

  def difficulty
    Difficulty.find(difficulty_id)
  end

  def get_questions
    questions = [question1]
    if question2
      questions.append(question2)
    end
    if question3
      questions.append(question3)
    end
    questions
  end

end
