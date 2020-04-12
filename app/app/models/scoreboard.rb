class Scoreboard < ActiveRecord::Base
  has_many :users
  has_many :quizz
end
