(function() {

  Class('pilonGrid')({
    prototype: {
      init: function(options) {
        var defaults;
        defaults = {
          template: '.pilon-grid',
          colWidth: 100,
          colPadding: 4
        };
        options = $.extend(true, defaults, options);
        this.pilonTemplate = $($(options.template).html());
        this.tmpls = {
          cont: this.pilonTemplate.find('.pilon-cont-template').html(),
          colTitle: this.pilonTemplate.find('.pilon-col-header-template').html(),
          rowTitle: this.pilonTemplate.find('.pilon-row-header-template').html(),
          row: this.pilonTemplate.find('.pilon-row-template').html(),
          field: this.pilonTemplate.find('.pilon-row-field-template').html()
        };
        this.elements = {};
        this.elements.cont = $(this.templates.cont);
        this.elements.colHeader = this.elements.cont.find('.col-header');
        this.elements.rowHeader = this.elements.cont.find('.row-header');
        this.elements.gridContent = this.elements.cont.find('.content');
        if (options.data != null) {
          return this.gridData = options.data;
        } else {
          return this.gridData = {
            colHeader: [
              {
                name: false,
                controlGroups: [
                  {
                    title: 'Validations',
                    type: 'form',
                    controls: [
                      {
                        label: 'Presence:',
                        type: 'checkbox',
                        value: false
                      }, {
                        label: 'Presence error:',
                        type: 'input',
                        value: false
                      }
                    ]
                  }, {
                    type: 'remove'
                  }
                ]
              }
            ],
            grid: [[false]]
          };
        }
      },
      renderGrid: function() {
        var _this = this;
        return this.gridData.colHeader.each(function(i, titleData) {
          return _this.elements.colHeader.append(new PilonColTitle(titleData, _this.tmpls.colTitle));
        });
      },
      addColumn: function(index) {
        if (index != null) {
          return index = index;
        }
      },
      getElement: function() {
        return this.element.body;
      }
    }
  });

}).call(this);
