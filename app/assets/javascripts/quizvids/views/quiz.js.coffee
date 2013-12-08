class QuizVids.Views.Quiz extends Backbone.View

  initialize: (options = {}) ->
    super options

    @model.bind "change:currentQuizData", @updateModal, @
    @model.bind "change:state", @changeState, @

    @initiateModal()
    @startPlaying()

  events: ->
    "click #quiz-modal button" : "hideQuiz"
    "click #quiz-modal .answer" : "clickAnswer"

  templates:
    modal: """
      <div class="row question">
        <h3><%= question.content %></h3>
      </div>
      <div class="row answers">
        <% _.each(answers, function(answer) { %>
          <div class="col-sm-6 answer" data-correct="<%= answer.correct %>"
            <span><%= answer.content %></span>
          </div>
        <% }); %>
      </div>
    """

  changeState: ->
    state = @model.get("state")
    switch state
      when 1 then @startTimer()
      when 2 then @clearTimer()

  initiateModal: ->
    $("#quiz-modal").modal
      show: false
      backdrop: "static"
      keyboard: false

  startPlaying: ->
    playlist = @model.get("playlist")
    loadPlaylist(playlist)

  startTimer: =>
    @quizTimer = setInterval(@showQuiz, interval * 1000)

  clearTimer: =>
    clearInterval(@quizTimer)

  showQuiz: =>
    pauseVideo()
    @model.getRandomQuestion()
    @updateModal()

  updateModal: =>
    data = @model.get("currentQuizData")
    quiz = data.quiz
    question = data.question
    answers = _.shuffle(data.answers)
    @$("#quiz-modal .modal-title").text "From: #{quiz.name} by #{quiz.author}"
    @$("#quiz-modal .modal-body").html _.template(@templates.modal)(question: question, answers: answers)
    @showModal()

  showModal: =>
    @$("#quiz-modal").modal("show")

  hideQuiz: =>
    @hideModal()
    playVideo()

  hideModal: =>
    $("#quiz-modal").modal("hide")
    _.delay(@setModalBackgroundColour, 1000, "#2c3e50")

  setModalBackgroundColour: (colour) ->
    $("#quiz-modal .modal-content").css("background-color": colour)

  clickAnswer: (event) ->
    answer = $(event.target)
    if answer.data("correct")
      @correctAnswer()
    else
      @incorrectAnswer()

  correctAnswer: ->
    $("#quiz-modal .modal-content").css("background-color": "lightyellow")
    $("#quiz-modal .modal-content").animate("background-color": "palegreen", 600)
    $("#quiz-modal .answer[data-correct=true]").animate("background-color": "lightgreen", 600)
    $("#quiz-modal .answer[data-correct=false]").animate("background-color": "indianred", 600)

    _.delay(@hideQuiz, 1500)

  incorrectAnswer: ->
    $("#quiz-modal .modal-content").css("background-color": "pink")
    $("#quiz-modal .modal-content").animate("background-color": "rgb(220, 20, 60)", 600)
    $("#quiz-modal .answer[data-correct=true]").animate("background-color": "lightgreen", 600)
    $("#quiz-modal .answer[data-correct=false]").animate("background-color": "indianred", 600)
    _.delay(@hideQuiz, 1500)
