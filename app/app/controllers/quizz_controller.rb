class QuizzController < ApplicationController
  def show_quizz
    if session[:user_id] == nil
      return head :forbidden
    end

    @quizz = Quizz.find(params[:id])
    @questions = @quizz.get_questions
    @answers = @questions.map { |question| question.good_answer }
  end


end
