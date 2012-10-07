Class('PilonColTitle')({
  prototype:
    init: (template, data) ->
      @data = data

      @elements = {}
      @elements.cont        = $(template)
      @elements.colName     = @elements.cont.find '.col-name'
      @elements.controlsBtn = @elements.cont.find '.btn-ctrl'

      @elements.colName.val data.name

      @popOverTools = @elements.controlsBtn.popover
        title     : 'A title!',
        content   : 'Some content!'
        placement : 'bottom'

      @bindEvents()

    bindEvents: ->
      @elements.colName.on 'change keyup input paste', (ev) =>
        @triggerChange ev, 'col-name-change'

    # createTools: ->
    #   @

    triggerChange: (ev, type) ->
      @elements.cont.trigger 'change' , {
        origEv: ev
        type  : type
      }

    getElement: ->
      @elements.cont
})