class QuestionsController < ApplicationController
  before_filter :find_quiz
  before_filter :find_question, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @questions = @quiz.questions.all
    respond_with(@questions)
  end

  def show
  end

  def new
    @question = @quiz.questions.new
  end

  def create
    @question = @quiz.questions.create(question_params)
    respond_with @question, location: quiz_questions_path(@quiz.id)
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to quiz_question_path(@quiz, @question)
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to quiz_questions_path(@quiz.id)
  end

  protected

  def question_params
    params.fetch(:question).permit(:content)
  end

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
