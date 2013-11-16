class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def setup
    @quizzes = Quiz.all
  end

  def quiz
    quiz_ids = params[:selected_quizzes]
    @selected_quizzes = quiz_ids.present? ? Quiz.find(quiz_ids) : nil
    @interval = params[:interval]
  end
end
