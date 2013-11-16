class QuizVids.Views.Setup extends Backbone.View

  initialize: (options = {}) ->
    super options

  events: ->
    "click #yt-search": "clickSearch"

  clickSearch: (event) ->
    event.preventDefault()
    query = @$("#yt_search").val()
    @ajaxYT(query)

  ajaxYT: (query) ->
    $.ajax
      url: "https://gdata.youtube.com/feeds/api/videos?v=2&alt=jsonc&q=#{query}&max-results=8&format=5&safeSearch=strict"
      success: (data) =>
        @videoSearch(data)

  videoSearch: (data) ->
    debugger

