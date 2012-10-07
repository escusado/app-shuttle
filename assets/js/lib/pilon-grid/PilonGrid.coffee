#TODO:
#Implement row header title and tooltip controls
Class('PilonGrid')({
  prototype:
    init: (options) ->
      #config vars
      defaults = {
        template   : '.pilon-grid-template'
        colWidth   : 100
        colPadding : 4
        #data: Json encoded data passed troug options
      }

      options = $.extend yes, defaults, options

      @pilonTemplate = $(options.template) #jqueryfy template

      #Templates
      @tmpls = {
        cont     : @pilonTemplate.find('.pilon-cont-template').html()
        colTitle : @pilonTemplate.find('.pilon-col-header-template').html()
        rowTitle : @pilonTemplate.find('.pilon-row-header-template').html()
        row      : @pilonTemplate.find('.pilon-row-template').html()
        field    : @pilonTemplate.find('.pilon-row-field-template').html()
      }

      @elements = {}
      @elements.cont        = $(@tmpls.cont)
      @elements.colHeader   = @elements.cont.find '.col-header'
      @elements.rowHeader   = @elements.cont.find '.row-header'
      @elements.gridContent = @elements.cont.find '.content'

      if options.data?
        @gridData = options.data
      else
        @gridData =
          colHeader: [
            {
              name: 'name' #column name
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
            #rows array
            {name: 'name-title'}
          ]

      @renderGrid()

    renderGrid: ->
      #build header
      for titleData, i in @gridData.colHeader
        #set column name
        @elements.colHeader.append new PilonColTitle(@tmpls.colTitle, titleData).getElement()

      #build grid
      for rowData, i in @gridData.grid


    addColumn: (index) ->
      if index? then index = index

    getElement: ->
      @elements.cont

})