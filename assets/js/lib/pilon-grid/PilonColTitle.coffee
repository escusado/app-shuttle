Class('PilonColTitle')({
  prototype:
    init: (data, template) ->

      @elements = {}
      @elements.cont        = $(template)
      @elements.colName     = @elements.cont.find '.col-name'
      @elements.controlsBtn = @elements.cont.find '.btn-ctrl'

      @bindEvents()

    bindEvents: ->
      @elements.colName.on 'change keyup input paste', (ev) =>
        @triggerChange ev, 'col-name-change'

      @elements.controlsBtn.popover
          title     : 'A title!',
          content   : 'Some content!'
          placement : 'bottom'

    triggerChange: (ev, type) ->
      @elements.cont.trigger 'change' , {
        origEv: ev
        type  : type
      }
})