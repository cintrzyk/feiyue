class Feiyue.Views.PostsShow extends Backbone.View

  el: '#content'

  initialize: ->
    @$('#news_sgallery').sGallery ->
      fullScreenEnabled: true
