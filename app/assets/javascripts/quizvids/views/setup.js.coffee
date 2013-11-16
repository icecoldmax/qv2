class QuizVids.Views.Setup extends Backbone.View

  initialize: (options = {}) ->
    super options

  events: ->
    "click #yt-search": "clickSearch"
    "click .search-result": "clickResult"
    "click .remove-playlist-entry": "clickRemove"
    "click #setup-submit": "clickSubmit"

  templates:
    searchResults: """
      <% _.each(items, function(item) { %>
        <div class="search-result col-sm-3" data-video-id="<%= item.id %>" data-video-title="<%= item.title.substr(0, 30) %>...">
          <h4><%= item.title.substr(0, 20) %>...</h4>
          <p><%= item.description.substr(0, 20) %>...</p>
          <img src="<%= item.thumbnail.sqDefault %>" width="100" height="100" />
      </div>
      <% }); %>
    """

    playlistEntry: """
      <li data-video-id="<=% data.id %>">
        <a class="remove-playlist-entry close">x</a>
        <span class="video-title"><%= data.title %></span>
        <input name="playlist[]" type="hidden" value="<%= data.id %>">
      </li>
    """

  clickSearch: (event) ->
    event.preventDefault()
    query = @$("#yt_search").val()
    @getVideos(query)

  clickResult: (event) ->
    event.stopPropagation()
    videoId = $(event.currentTarget).data("video-id")
    videoTitle = $(event.currentTarget).data("video-title")
    @addToPlaylist(videoId, videoTitle)

  clickRemove: (event) ->
    event.stopPropagation()
    @$(event.target).parents("li").remove()

  clickSubmit: (event) =>
    if $(".setup_form input[type=checkbox]:checked").length is 0
      alert "You haven't selected any quizzes!"
      return false
    else if $("#playlist ul li").length is 0
      alert "You haven't selected any videos!"
      return false
    else
      return true

  getVideos: (query) ->
    $.ajax
      url: "https://gdata.youtube.com/feeds/api/videos?v=2&alt=jsonc&q=#{query}&max-results=8&format=5&safeSearch=strict"
      success: (response) =>
        @populateResults(response.data)

  populateResults: (data) ->
    @$("#yt-results").html _.template(@templates.searchResults)(items: data.items)

  addToPlaylist: (videoId, videoTitle) ->
    @$("#playlist ul").append _.template(@templates.playlistEntry)(data: { id: videoId, title: videoTitle} )
