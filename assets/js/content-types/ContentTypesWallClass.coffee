Class('ContentTypesWallClass')({
  prototype:
    init: (element, initData) ->
      @element = if typeof element is 'string' then $(element) else element
      @element.data('pilon-grid', this)


      #TODO CRUD de content_types
      
      @element.append new ContentTypeClass('.content_type-template').getElement()
      @element.append new ContentTypeClass('.content_type-template').getElement()
      @element.append new ContentTypeClass('.content_type-template').getElement()
})