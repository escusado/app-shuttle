Class('ContentTypeClass')({
  prototype:
    init: (template, initData) ->
      @element = $($(template).html()) #jqueryfy template

      @element.find('.body').append new pilonGrid().getElement()

      @element

    getElement: ->
      @element

})