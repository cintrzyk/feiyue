class Feiyue.Views.HomeIndex extends Backbone.View

  el: '#wrapper'

  events: ->
    "click #playYT": "play"

  play: (e) ->
    e.preventDefault()
    $(e.target)
      .hide()
      .parent()
      .next().removeClass('hidden')
