class ScoreController < ApplicationController
  def show_score
    @scoreboard = Scoreboard.where('user_id' => session[:user_id],'quizz_id' => params[:id]).first
    unless @scoreboard
      redirect_to "/quizz/#{params[:id]}"
      return
    end
    @quizz = Quizz.find(params[:id])
  end

  def show_scoreboard
    unless User.find(session[:user_id])
      head :forbidden
    end
    @top = User.order(points: :desc ).limit(10)
  end
end
