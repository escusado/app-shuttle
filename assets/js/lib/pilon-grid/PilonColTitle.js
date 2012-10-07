(function() {

  Class('PilonColTitle')({
    prototype: {
      init: function(data, template) {
        this.elements = {};
        this.elements.cont = $(template);
        this.elements.colName = this.elements.cont.find('.col-name');
        this.elements.controlsBtn = this.elements.cont.find('.btn-ctrl');
        return this.bindEvents();
      },
      bindEvents: function() {
        var _this = this;
        this.elements.colName.on('change keyup input paste', function(ev) {
          return _this.triggerChange(ev, 'col-name-change');
        });
        return this.elements.controlsBtn.popover({
          title: 'A title!',
          content: 'Some content!',
          placement: 'bottom'
        });
      },
      triggerChange: function(ev, type) {
        return this.elements.cont.trigger('change', {
          origEv: ev,
          type: type
        });
      }
    }
  });

}).call(this);
