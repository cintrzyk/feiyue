class Feiyue.Views.ContactsNew extends Backbone.View

  el: '#content'

  house_min: 1
  house_max: 80
  house_step: 0.1

  installation_size: 3000
  installation_min_size: 1000
  installation_max_size: 15000

  events:
    "focusout .house-input": "set_house_input"

  initialize: ->
    @init_house_sizes(@house_min, @house_max, @house_step)
    @init_house_sliders(@house_min, @house_max, @house_step)
    @init_installation_size()
    @focus_on_error_input()

  init_house_sizes: (min, max, step) ->
    @$(".house-input").each ->
      $el = $(this)
      $el.attr('min', min)
      $el.attr('max', max)
      $el.attr('step', step)
      value = $el.val() || min
      $el.val(value)

  init_installation_size: ->
    $installation = @$('#contact_size')
    $installation.val($installation.val() || @installation_size)
    $installation.attr("min", @installation_min_size)
    $installation.attr("max", @installation_max_size)

  init_house_sliders: (min, max, step) ->
    $(".house-slider").each ->
      $slider = $(@)
      $input = $slider.prev('.house-input')
      value = parseFloat($input.val()) || 0
      $slider.slider
        value: value
        range: "min"
        min: min
        max: max
        step: step
        slide: (event, ui) ->
          $input.val(ui.value)

  set_house_input: (event) ->
    $input = @$(event.currentTarget)
    $slider = $input.next('.house-slider')
    value = parseFloat($input.val())
    $slider.slider("value", value)

  focus_on_error_input: ->
    @$('.field_with_errors input').first().focus()
