class QuizzController < ApplicationController
  before_action :set_quizz

  def show_quizz
    if session[:user_id] == nil
      return head :forbidden
    end
  end

  def validate_quizz
    user_answers = [params[:question0]]
    if params[:question1]
      user_answers.append(params[:question1])
    end
    if params[:question2]
      user_answers.append(params[:question2])
    end
    score = 0
    for i in 0..user_answers.length
      if @answers[i] == user_answers[i]
        score+=1
      end
    end

    if score*100/user_answers.length >= 60
      message = "Félicitations, vous avez passé le quizz #{@quizz.title}, vous remportez #{@quizz.difficulty.points} points"
    else
      message = "Désolé, vous avez raté le quizz #{@quizz.title}, vous perdez #{@quizz.difficulty.points} points"
    end
    User.find(session[:user_id]).points += @quizz.difficulty.points
    flash[:info] = message
    redirect_to '/'
  end

  private
  def set_quizz
    @quizz = Quizz.find(params[:id])
    @questions = @quizz.get_questions
    @answers = @questions.map { |question| question.good_answer }
  end

end
