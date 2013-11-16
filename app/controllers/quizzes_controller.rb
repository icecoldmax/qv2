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

    @question_index = 0
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      flash[:success] = "Quiz created"
      redirect_to quizzes_path
    else
      flash[:error] = @quiz.errors.full_messages
      @question_index = 0
      render 'new'
    end
  end

  def edit
    @question_index = 0
  end

  def update
    if @quiz.update_attributes(quiz_params)
      flash[:success] = "Quiz updated"
      redirect_to @quiz
    else
      @question_index = 0
      render 'edit'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  protected

  def quiz_params
    params.require(:quiz)
      .permit(:name, :author,
        :questions_attributes => [:id, :content,
          :answers_attributes => [:id, :content, :correct]
        ]
      )
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
end
