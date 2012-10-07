Class('ContentTypeClass')({
  prototype:
    init: (template, initData) ->
      @element = $($(template).html()) #jqueryfy template

      @element.find('.body').append new PilonGrid().getElement()

      # @element

    getElement: ->
      @element

})