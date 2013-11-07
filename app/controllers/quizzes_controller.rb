class QuizzesController < ApplicationController
  before_filter :find_quiz, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @quizzes = Quiz.all
    respond_with(@quizzes)
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(quiz_params)
    respond_with @quiz, location: quizzes_path
  end

  def edit
  end

  def update
    if @quiz.update_attributes(quiz_params)
      flash[:success] = "Quiz updated"
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  protected

  def quiz_params
    params.fetch(:quiz).permit(:name, :author)
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
end
