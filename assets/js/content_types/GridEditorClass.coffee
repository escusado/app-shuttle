Class('GridEditorClass')({
  prototype:
    init: (element, type, initData) ->
      @element = if typeof element is 'string' then $(element) else element
})