class Scoreboard < ActiveRecord::Base
  belongs_to :users
  belongs_to :questions
end
