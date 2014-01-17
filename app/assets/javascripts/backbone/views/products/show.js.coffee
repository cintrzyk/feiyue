class Feiyue.Views.ProductsShow extends Backbone.View

  el: '#content'

  events:
    "click .ask-for-price": "showForm"
    "click .send-for-price": "send"

  initialize: ->
    @$('#amount-price')
      .attr('value', 1)
      .attr('min', 1)

  showForm: (event) ->
    event.preventDefault()
    @product_id = $(event.target).attr('product_id')
    @email_input = @$('#email-price')
    @$('#email-price,#amount-price').toggleClass('hidden')
    @email_input.focus()
    $button = @$(event.target)
    $button
      .removeClass('ask-for-price')
      .addClass('send-for-price')
      .html(' <i class="fa fa-share" style="width: 30px;"></i> ')

  send: (event) ->
    event.preventDefault()
    if @validEmail()
      @$('#email-price,#amount-price').toggleClass('hidden')
      $.ajax
        url: Routes.spree_ask_price_path(@product_id, @$('#amount-price').val(), @email_input.val()),
        type: 'POST'

      @$('.send-for-price').after("<span class='blue pull-right'>Wij geven u merkt al snel.</span>")
      @$('.send-for-price').hide()
    else
      alert "Email is not valid"

  validEmail: ->
    pattern = /[a-z0-9!#$%&'*+/=?^_{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/
    pattern.test(@email_input.val())
