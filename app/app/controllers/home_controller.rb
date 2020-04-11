class HomeController < ApplicationController

  def home
    if get_user
      @quizzs = Quizz.all
    end

  end



  private
  def get_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
    return @current_user
  end
end
