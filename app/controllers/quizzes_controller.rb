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
    question = @quiz.questions.build

    4.times do
      question.answers.build
    end
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      flash.now[:success] = "Quiz created"
      redirect_to quizzes_path
    else
      flash.now[:danger] = @quiz.errors.full_messages
      render 'new'
    end
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
    params.require(:quiz).permit(:name, :user_id,
      :questions_attributes => [:id, :content,
        :answers_attributes => [:id, :content, :correct]
      ])
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
end
