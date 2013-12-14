class QuizzesController < ApplicationController
  before_filter :signed_in_check, only: [:edit, :update, :new, :create, :destroy]
  before_filter :find_quiz, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :correct_user_for_quiz, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    @quizzes = Quiz.all
    respond_with(@quizzes)
  end

  def show
  end

  def new
    @quiz = Quiz.new(user: current_user)
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
      :questions_attributes => [:id, :content, :_destroy,
        :answers_attributes => [:id, :content, :correct]
      ])
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def correct_user
    @user = User.find(current_user) if signed_in?
    redirect_to(root_url) unless current_user?(@user)
  end

  def correct_user_for_quiz
    find_quiz
    if signed_in?
      @user = User.find(current_user)
      unless (@user == @quiz.user) || admin?
        flash[:danger] = "Can't edit someone else's quiz."
        redirect_to(quizzes_path) unless @user == @quiz.user
      end
    end
  end

  def signed_in_check
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
