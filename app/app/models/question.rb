class Question < ActiveRecord::Base
  has_many :question1, :class_name => 'Quizz'
  has_many :question2, :class_name => 'Quizz'
  has_many :question3, :class_name => 'Quizz'
end
