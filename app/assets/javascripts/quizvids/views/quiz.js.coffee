class QuizVids.Views.Quiz extends Backbone.View

  initialize: (options = {}) ->
    super options

    @model.bind "change:currentQuizData", @updateModal, @

    @startPlaying()

  events: ->
    "click #quiz-modal button" : "hideQuiz"

  templates:
    modal: """
      <div class="row">
        <p><%= question.content %></p>
      </div>
      <div class="row answers">
        <% _.each(answers, function(answer) { %>
          <div class="col-sm-6 answer" "data-correct="<%= answer.correct %>"
            <span><%= answer.content %></span>
          </div>
        <% }); %>
      </div>
    """

  startPlaying: ->
    playlist = @model.get("playlist")
    loadPlaylist(playlist)
    @startTimer()

  startTimer: =>
    @quizTimer = setInterval(@showQuiz, interval * 1000)

  showQuiz: =>
    pauseVideo()
    @clearTimer()
    @model.getRandomQuestion()
    @updateModal()

  clearTimer: ->
    clearInterval(@quizTimer)

  updateModal: =>
    data = @model.get("currentQuizData")
    quiz = data.quiz
    question = data.question
    answers = data.answers
    @$("#quiz-modal .modal-title").text "From: #{quiz.name} by #{quiz.author}"
    @$("#quiz-modal .modal-body").html _.template(@templates.modal)(question: question, answers: answers)
    @showModal()

  showModal: =>
    @$("#quiz-modal").modal("show")

  hideQuiz: =>
    @hideModal()
    playVideo()
    @startTimer()

  hideModal: =>
    @$("#quiz-modal").modal("hide")

