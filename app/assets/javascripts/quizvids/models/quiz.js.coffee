class QuizVids.Models.Quiz extends Backbone.Model
  url: "/quiz_json"

  initialize: (options = {}) ->
    super options

  getRandomQuestion: ->
    data = @get "quiz_data"

    quizCount = data.length
    currentQuiz = data[@randomNum(quizCount)]

    questionCount = currentQuiz.questions.length
    currentQuestion = currentQuiz.questions[@randomNum(questionCount)]

    data = {
      quiz: currentQuiz
      question: currentQuestion
      answers: currentQuestion.answers
    }

    @set currentQuizData: data

  randomNum: (max) ->
    Math.floor(Math.random() * max)
