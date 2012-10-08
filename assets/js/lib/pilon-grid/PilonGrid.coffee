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
        col      : @pilonTemplate.find('.pilon-col-template').html()
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
              name: 'myColumna' #column name
              type: 'string' #field type
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
            {myColumna: 'A: name-title'},
            {myColumna: 'B: name-title'},
            {myColumna: 'C: name-title'}
          ]

      @renderGrid()

    renderGrid: ->
      for titleData, i in @gridData.colHeader
        #build header
        @elements.colHeader.append   new PilonColTitle(@tmpls.colTitle, titleData).getElement()

        #Buld column data
        newColumn = $(@tmpls.col).addClass @gridData.colHeader.name

        #traverse entries looking for col value
        for entry, i in  @gridData.grid
          for colName, value of entry
            # newColumn.append new PilonField(colName, value)
          # @elements.gridContent.append 



    addColumn: (index) ->
      if index? then index = index

    getElement: ->
      @elements.cont

})