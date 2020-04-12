class AdminController < ApplicationController
  before_action :isAdmin

  def show
    @quizzs = Quizz.all
  end

  def admin_quizz
    @quizz = Quizz.find(params[:id])
    @questions = @quizz.get_questions
    session[:quizz_id] = @quizz.id
  end

  def destroy_quizz
    quizz_id = params[:id]
    Scoreboard.where('quizz_id' => quizz_id).destroy_all
    Quizz.find(quizz_id).destroy
    redirect_to '/admin'
  end

  def update_quizz
  end

  def display_quizz
    quizz = Quizz.find(params[:id])
    quizz.display = not(quizz.display)
    quizz.save
    redirect_to '/admin'
  end

  def admin_question
    begin
      @question = Question.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @question = Question.new
    end
  end

  def update_question
    Question.find(params[:id]).update  name: params[:name],
                                      good_answer: params[:good_answer], bad_answer1: params[:bad_answer1],
                                      bad_answer2: params[:bad_answer2], bad_answer3: params[:bad_answer3]
    redirect_to "/admin/quizz/#{session[:quizz_id]}"
    session[:quizz_id] = nil
  end

  def create_question
    Question.create name: params[:name],
                    good_answer: params[:good_answer], bad_answer1: params[:bad_answer1],
                    bad_answer2: params[:bad_answer2], bad_answer3: params[:bad_answer3]
    question_id = Question.last.id
    quizz = Quizz.find(session[:quizz_id])

    if quizz.question_2_id.blank?
      quizz.question_2_id = question_id
    else
      quizz.question_3_id = question_id
    end
    quizz.save
    redirect_to "/admin/quizz/#{session[:quizz_id]}"
    session[:quizz_id] = nil
  end

  private
  def isAdmin
    unless User.find(session[:user_id]).isAdmin
      head :forbidden
    end
  end
end
