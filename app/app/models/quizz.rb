class Quizz < ActiveRecord::Base

  has_many :scoreboards

  has_many :difficulty

  belongs_to :question1, class_name: "Question", foreign_key: "question_1_id"
  belongs_to :question2, class_name: "Question", foreign_key: "question_2_id"
  belongs_to :question3, class_name: "Question", foreign_key: "question_3_id"

  def difficulty
    Difficulty.find(difficulty_id)
  end

end
