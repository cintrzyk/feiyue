class Feiyue.Views.HomeFaq extends Backbone.View

  el: '#faq-list'

  events:
    "click li": "display_answer"

  display_answer: (event) ->
    $li = @$(event.currentTarget)
    $li.find('p').toggleClass('hidden')
