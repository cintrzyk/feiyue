#= require_self
#= require_tree ./views

window.Feiyue =
  Views: {}

  init: ->
    viewName = $('body').data('view')
    @currentView = new Feiyue.Views[viewName]() if Feiyue.Views[viewName]?

jQuery ->
  Feiyue.init()

  $(".to-top").click ->
    $("html, body").animate({ scrollTop: 0 }, "slow")
