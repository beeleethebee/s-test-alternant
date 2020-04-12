class QuizzController < ApplicationController
  before_action :set_quizz

  def show_quizz
    if session[:user_id] == nil
      return head :forbidden
    end
    if Scoreboard.where('user_id' => session[:user_id],'quizz_id' => @quizz.id).first
      redirect_to "/score/#{@quizz.id}"
      return
    end
  end

  def validate_quizz
    user_answers = []
    params.each do |param_name, value|
      if param_name.match(/^question\d/)
        user_answers.append(value)
      end
    end
    score = calc_score(user_answers)
    score_ratio = score * 100 / user_answers.length
    quizz_points = @quizz.difficulty.points
    if score_ratio >= 60
      message = "Félicitations, vous avez passé le quizz #{@quizz.title}, vous remportez #{quizz_points} points"
      Scoreboard.create user_id: session[:user_id], quizz_id: @quizz.id, score:score_ratio.ceil
    else
      message = "Désolé, vous avez raté le quizz #{@quizz.title}, vous perdez #{(quizz_points *= -0.5).abs  } points"
    end
    User.find(session[:user_id]).add_points(quizz_points.ceil)
    flash[:info] = message
    redirect_to '/'
  end
  

  private
  def set_quizz
    @quizz = Quizz.find(params[:id])
    @questions = @quizz.get_questions
    @answers = @questions.map { |question| question.good_answer }
  end

  def calc_score(user_answers)
    score = 0
    for i in 0...user_answers.length
      if @answers[i] === user_answers[i]
        score+=1
      end
    end
    score

  end

end
