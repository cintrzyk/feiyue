class Feiyue.Views.HomeProfit extends Backbone.View

  el: '#content'

  data: null

  total_cash: 0

  years:
    min: 20
    max: 30
    value: 25
  price:
    min: 0.1
    max: 0.5
    step: 0.01
    value: 0.23
  wats:
    min: 1500
    max: 15000
    step: 100
    value: 3000

  events:
    "slidechange #slider-price,#slider-wats,#slider-years": "slidechange"

  initialize: ->
    @set_production()
    @set_wat_btw()
    @set_montage_btw()
    @init_settings_view()
    @update_data()
    @draw_total_donut()
    @draw_bar_chart()
    @draw_line_chart()

  slidechange: (event, ui) ->
    $slider = @$(event.currentTarget)
    @update_data()
    @draw_total_donut()
    @draw_bar_chart()
    @draw_line_chart()
    @set_production()
    @set_wat_btw()
    @set_montage_btw()

  set_total_cash: ->
    @total_cash = @data[@data.length - 1].cash if @data

  update_data: ->
    @data = @get_data()
    @set_total_cash()
    @$('#plus_year').text(@get_plus_year() - @data[0].year + 1)

  draw_total_donut: ->
    @$('#total-donut').html("")
    Morris.Donut({
      element: 'total-donut',
      data: [
        { label: "Geïnvesteerd", value: @wats.value * 1.47 + @wats.value * 0.41 }
        { label: "Rendement", value: @total_cash }
      ]
      formatter: (y, data) -> accounting.formatMoney(y, "€ ", 2, ".", ",")
      colors: ["yellow", "#739c3e"]
    })

  draw_line_chart: ->
    @$('#line-chart').html("")
    Morris.Line({
      element: 'line-chart',
      data: @data
      xkey: 'year'
      ykeys: ['income']
      labels: ['Rendement']
      lineColors: ["#00adee"],
      pointFillColors: ["#ff9600"],
      yLabelFormat: (y) -> accounting.formatMoney(y, "€", 2, ".", ",")
      gridTextSize: 14
    })

  draw_bar_chart: ->
    @$('#bar-chart').html("")
    Morris.Bar({
      element: 'bar-chart'
      data: @data
      xkey: 'year'
      ykeys: ['cash']
      labels: ["Rendement"]
      barColors: ["#00adee"]
      yLabelFormat: (y) -> accounting.formatMoney(y, "€", 2, ".", ",")
      gridTextSize: 14
    })

  set_wat_btw: ->
    @$('#wats_btw').text(accounting.formatMoney(@wats.value*1.47, "€", 2, ".", ","))

  set_montage_btw: ->
    @$('#montage_btw').text(accounting.formatMoney(@wats.value*0.41, "€", 2, ".", ","))

  set_production: ->
    @$('#production_of_installation').text(accounting.formatNumber(@wats.value*0.98, 0, "."))

  init_slider: (slider_id, values, $el) ->
    @$(slider_id).slider
      range: "min"
      value: values.value
      min: values.min
      max: values.max
      step: values.step
      slide: (event, ui) ->
        $el.text(ui.value)
        values.value = parseFloat(ui.value)

  init_settings_view: ->
    $price_span = @$('span.price')
    $wats_span = @$('span.wats')
    $years_span = @$('span.years')
    $price_span.text(@price.value)
    $wats_span.text(@wats.value)
    $years_span.text(@years.value)

    @init_slider('#slider-price', @price, $price_span)
    @init_slider('#slider-wats', @wats, $wats_span)
    @init_slider('#slider-years', @years, $years_span)

  get_data: ->
    calculate = (user_price, user_wats, after_years) ->
      if (valid_price(user_price) && valid_wats(user_wats) && after_years > 0 && after_years < 31)
        current_year = parseInt(new Date().getFullYear(), 10)
        montage_cost = user_wats * 0.41
        start_loan = - user_wats * 1.47 # - montage_cost
        production_year_decline = 0.008
        interest_rate_loan = 0.03
        year_price_increase = 0.03
        tax = 0.21
        inverter_cost__after_11y = 550
        inverter_cost__after_21y = 550
        sum = 0
        income = 0
        loan_principal = 0
        result = []

        for i in [1..after_years] by 1
          loan_principal = parseInt((start_loan * interest_rate_loan).toFixed(0), 10) if (start_loan < 0)
          income = parseInt(loan_principal + tax_of_artisan_deductions(i, loan_principal, montage_cost, tax) + get_electricity_saving(i, user_wats, user_price, production_year_decline, year_price_increase), 10)
          start_loan = parseInt(start_loan + income, 10)

          start_loan -= inverter_cost__after_11y if (i == 11)
          start_loan -= inverter_cost__after_21y if (i == 21)
          result.push({"year": current_year.toString(), "cash": start_loan, "income": income})
          current_year++
        return result
      else
        false

    tax_of_artisan_deductions = (after_years, loan_principal, montage_cost, tax) ->
      sum = 0
      sum += parseInt((montage_cost * tax).toFixed(0), 10) if (after_years == 1)
      sum -= loan_principal * tax if (loan_principal < 0)
      parseInt(sum.toFixed(0), 10)

    get_electricity_price = (after_years, user_price, year_price_increase) ->
      return user_price if (after_years == 1)
      get_electricity_price(after_years - 1, user_price, year_price_increase) * (1.0 + year_price_increase)

    get_expected_production = (after_years, user_wats, production_year_decline) ->
      return user_wats * 0.9 if (after_years == 1)
      get_expected_production(after_years - 1, user_wats, production_year_decline) * (1.0 - production_year_decline)

    get_electricity_saving = (after_years, user_wats, user_price, production_year_decline, year_price_increase) ->
      parseInt((get_expected_production(after_years, user_wats, production_year_decline) * get_electricity_price(after_years, user_price, year_price_increase)).toFixed(0), 10)

    valid_price = (value) ->
      value > 0 and value < 1000

    valid_wats = (value) ->
      value > 0 and value < 100000000

    calculate(@price.value, @wats.value, @years.value)

  get_plus_year: ->
    for y in @data
      return y.year if y.cash >= 0
      ""
