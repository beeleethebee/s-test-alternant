class Question < ActiveRecord::Base
  has_many :question1, :class_name => 'Quizz'
  has_many :question2, :class_name => 'Quizz'
  has_many :question3, :class_name => 'Quizz'

  def get_answers
    questions = [good_answer,bad_answer1]
    if bad_answer2
      questions.append(bad_answer2)
    end
    if bad_answer3
      questions.append(bad_answer2)
    end
    questions.shuffle
  end
end
