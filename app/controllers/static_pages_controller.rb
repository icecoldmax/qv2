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
    @selected_quizzes = Quiz.find(quiz_ids)
    @interval = params[:interval]
  end
end
