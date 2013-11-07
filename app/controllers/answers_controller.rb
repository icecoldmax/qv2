class AnswersController < ApplicationController
  before_filter :find_quiz
  before_filter :find_question
  before_filter :find_answer, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @answers = @question.answers.all
    respond_with(@answers)
  end

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.create(answer_params)
    respond_with @answer, location: quiz_question_answers_path(@quiz, @question)
  end

  def edit
  end

  def update
    if @answer.update_attributes(answer_params)
      flash[:success] = "Answer updated"
      redirect_to quiz_question_answers_path(@quiz, @question)
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to quiz_question_answers_path(@quiz, @question)
  end

  protected

  def answer_params
    params.fetch(:answer).permit(:content, :correct)
  end

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
