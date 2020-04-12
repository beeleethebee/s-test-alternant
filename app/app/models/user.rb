class User < ActiveRecord::Base
  has_secure_password validations: false
  belongs_to :scoreboards, optional: true

  def add_points(pts)
    self.points+=pts
    self.save
  end

  def isAdmin
    self.role === 'admin'
  end

  def has_done_Quizz(id_quizz)
    Scoreboard.where('user_id' => self.id,'quizz_id' => id_quizz).first
  end
end
