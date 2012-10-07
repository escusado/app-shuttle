#TODO:
#Implement row header title and tooltip controls
Class('pilonGrid')({
  prototype:
    init: (options) ->
      #config vars
      defaults = {
        template   : '.pilon-grid'
        colWidth   : 100
        colPadding : 4
        #data: Json encoded data passed troug options
      }

      options = $.extend yes, defaults, options

      @pilonTemplate = $($(options.template).html()) #jqueryfy template

      #Templates
      @tmpls = {
        cont     : @pilonTemplate.find('.pilon-cont-template').html()
        colTitle : @pilonTemplate.find('.pilon-col-header-template').html()
        rowTitle : @pilonTemplate.find('.pilon-row-header-template').html()
        row      : @pilonTemplate.find('.pilon-row-template').html()
        field    : @pilonTemplate.find('.pilon-row-field-template').html()
      }
      
      @elements = {}
      @elements.cont        = $(@templates.cont)
      @elements.colHeader   = @elements.cont.find '.col-header'
      @elements.rowHeader   = @elements.cont.find '.row-header'
      @elements.gridContent = @elements.cont.find '.content'

      if options.data?
        @gridData = options.data
      else
        @gridData =
          colHeader: [
            {
              name: no #column name
              controlGroups: [ #tooltip controls
                { 
                  title: 'Validations'
                  type: 'form'
                  controls:[
                    {
                      label  : 'Presence:'
                      type   : 'checkbox'
                      value: no
                    },
                    {
                      label  : 'Presence error:'
                      type   : 'input'
                      value: no
                    }
                  ]
                },
                {
                  type   : 'remove'
                }
              ]
            }
          ],
          grid:[
            #row
            [no]
          ]

    renderGrid: ->
      #build header
      @gridData.colHeader.each (i, titleData) =>
        #set column name
        @elements.colHeader.append new PilonColTitle titleData, @tmpls.colTitle
        


    addColumn: (index) ->
      if index? then index = index

    getElement: ->
      @element.body

})