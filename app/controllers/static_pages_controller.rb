class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def setup
    @quizzes = Quiz.all
  end

  def quiz
    if params[:selected_quizzes].present?
      quiz_ids = params[:selected_quizzes]
      @selected_quizzes = Quiz.find(quiz_ids)
      @interval = params[:interval]
      @playlist = params[:playlist]
    end

    respond_to do |format|
      format.html { render layout: "quiz_layout" }
      format.json do
        render :json => {"do i need this" => "dunno"}
      end
    end
  end

  def quiz_data
  end
end
