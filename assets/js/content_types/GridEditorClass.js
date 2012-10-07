(function() {

  Class('GridEditorClass')({
    prototype: {
      init: function(element, type, initData) {
        return this.element = typeof element === 'string' ? $(element) : element;
      }
    }
  });

}).call(this);
