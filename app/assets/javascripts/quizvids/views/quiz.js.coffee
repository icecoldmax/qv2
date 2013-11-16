class QuizVids.Views.Quiz extends Backbone.View

  initialize: (options = {}) ->
    super options

    @startPlaying()

  events: ->

  startPlaying: ->
    console.log "startPlaying ran"

    playlist = @model.get("playlist")
    loadPlaylist(playlist)
