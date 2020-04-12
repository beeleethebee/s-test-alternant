class Difficulty < ActiveRecord::Base
  belongs_to :quizzs, optional: true
end
