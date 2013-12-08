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
      @selected_quizzes = Quiz.find(quiz_ids).map(&:id)
      @interval = params[:interval]
      @playlist = params[:playlist]
    end

    respond_to do |format|
      format.html { render layout: "quiz_layout" }
    end
  end

  def quiz_json
    quizzes = Quiz.find(params[:quiz_ids])
    data = quiz_data(quizzes)

    render :json => { "quiz_data" => data }
  end

  def quiz_data(quizzes)
    data = quizzes.map do |quiz|
      {
        "name" => quiz.name,
        "author" => quiz.user.name,
        "user_id" => quiz.user.id,
        "questions" => questions(quiz.id)
      }
    end
    data
  end

  def questions(quiz_id)
    questions = Quiz.find(quiz_id).questions
    data = questions.map do |q|
      { "content" => q.content,
        "answers" => answers(q.id)
      }
    end
    data
  end

  def answers(question_id)
    answers = Question.find(question_id).answers
    data = answers.map do |a|
      {
        "content" => a.content,
        "correct" => a.correct
      }
    end
    data
  end
end
