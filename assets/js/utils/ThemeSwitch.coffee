Class('ThemeSwitch')({
  prototype:
    init: (element) ->
      @element = $(element)
      @currentTheme = 'night'

      @bindEvents()

    bindEvents: ->
      @element.click =>
        @toggleTheme()

    toggleTheme: ->
      if @currentTheme is 'night' then @dusk() else @dawn()

    dusk: ->
      $('body').removeClass('night').addClass 'day'
      $('.navbar').removeClass 'navbar-inverse'
      @element.addClass('btn-inverse').find('i').removeClass('icon-black').addClass 'icon-white'
      @currentTheme = 'day'
    
    dawn: ->
      $('body').removeClass('day').addClass 'night'
      $('.navbar').addClass 'navbar-inverse'
      @element.removeClass('btn-inverse').find('i').removeClass('icon-white').addClass 'icon-black'
      @currentTheme = 'night'
})