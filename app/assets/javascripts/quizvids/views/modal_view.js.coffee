class QuizVids.Views.Modal extends Backbone.View

  initialize: (options = {}) ->
    super options

    @initiateModal()

  events: ->

  initiateModal: ->
    console.log "initiateModal called"
    $("#quiz-modal").modal
      show: false
      backdrop: "static"
      keyboard: false
