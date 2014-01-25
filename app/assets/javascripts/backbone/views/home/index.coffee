class Feiyue.Views.HomeIndex extends Backbone.View

  el: '#wrapper'

  initialize: ->
    $.getScript 'https://www.youtube.com/iframe_api'

  events: ->
    'click #loadYT': 'loadYT'

  loadYT: (e) ->
    @createPlayer()
    $(e.target).hide()
      .parent()
      .next().removeClass('hidden')
    e.preventDefault()

  createPlayer: ->
    @player = new YT.Player 'movie',
      videoId: '6QOQGZTnTeo'
      events:
        'onReady': (e) ->
          e.target.playVideo()
