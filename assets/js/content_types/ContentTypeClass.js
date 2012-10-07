(function() {

  Class('ContentTypeClass')({
    prototype: {
      init: function(template, initData) {
        this.element = $($(template).html());
        this.element.find('.body').append(new pilonGrid().getElement());
        return this.element;
      },
      getElement: function() {
        return this.element;
      }
    }
  });

}).call(this);
