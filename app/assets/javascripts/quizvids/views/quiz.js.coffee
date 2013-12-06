class QuizVids.Views.Quiz extends Backbone.View

  initialize: (options = {}) ->
    super options

    @model.bind "change:currentQuizData", @updateModal, @

    @initiateModal()
    @startPlaying()

  events: ->
    "click #quiz-modal button" : "hideQuiz"
    "click #quiz-modal .answer" : "clickAnswer"

  templates:
    modal: """
      <div class="row">
        <p><%= question.content %></p>
      </div>
      <div class="row answers">
        <% _.each(answers, function(answer) { %>
          <div class="col-sm-6 answer" data-correct="<%= answer.correct %>"
            <span><%= answer.content %></span>
          </div>
        <% }); %>
      </div>
    """

  initiateModal: ->
    $("#quiz-modal").modal
      show: false
      backdrop: "static"
      keyboard: false

  startPlaying: ->
    playlist = @model.get("playlist")
    loadPlaylist(playlist)
    @startTimer()

  startTimer: =>
    @quizTimer = setInterval(@showQuiz, interval * 1000)

  clearTimer: =>
    clearInterval(@quizTimer)

  showQuiz: =>
    pauseVideo()
    @clearTimer()
    @model.getRandomQuestion()
    @updateModal()

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
    $("#quiz-modal").modal("hide")
    _.delay(@setModalBackgroundColour, 1000, "white")

  setModalBackgroundColour: (colour) ->
    $("#quiz-modal .modal-content").css("background-color": colour)

  clickAnswer: (event) ->
    answer = $(event.target)
    if answer.data("correct")
      @correctAnswer()
    else
      @incorrectAnswer()

  correctAnswer: ->
    $("#quiz-modal .modal-content").css("background-color": "lightgreen")
    $("#quiz-modal .modal-content").animate("background-color": "#41B432", 600)
    _.delay(@hideQuiz, 1500)

  incorrectAnswer: ->
    $("#quiz-modal .modal-content").css("background-color": "pink")
    $("#quiz-modal .modal-content").animate("background-color": "rgb(220, 20, 60)", 600)
    _.delay(@hideQuiz, 1500)
