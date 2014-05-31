class Feiyue.Views.HomeIndex extends Marionette.View

  el: '#wrapper'

  ui:
    movie_thumb: '#feiyue_movie'

  initialize: ->
    @bindUIElements()
    $.getScript 'https://www.youtube.com/iframe_api'

  events: ->
    'click #loadYT': 'loadYT'

  loadYT: (e) ->
    e.preventDefault()
    @createPlayer()

  createPlayer: ->
    @player = new YT.Player 'movie',
      videoId: '6QOQGZTnTeo'
      playerVars:
        html5: 1
      events:
        'onReady': @playMovie

  playMovie: (e) =>
    e.target.playVideo()
    @after_1_sec @hideMovieThumb

  hideMovieThumb: =>
    @ui.movie_thumb.hide()
      .parent().next().removeClass 'hidden'

  after_1_sec: (f) ->
    setTimeout ->
      f()
    , 1000
