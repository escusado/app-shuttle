(function() {

  Class('ContentTypesWallClass')({
    prototype: {
      init: function(element, initData) {
        this.element = typeof element === 'string' ? $(element) : element;
        this.element.data('grid-editor', this);
        this.element.append(new ContentTypeClass('.content_type-template').getElement());
        this.element.append(new ContentTypeClass('.content_type-template').getElement());
        return this.element.append(new ContentTypeClass('.content_type-template').getElement());
      }
    }
  });

}).call(this);
