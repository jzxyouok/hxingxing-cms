/*need select plugin static files be included in the template before this*/

    (function(jsGrid, $, undefined) {

        var NumberField = jsGrid.Field;
        function Select2Field(config) {
          this.items = [];
          this.selectedIndex = -1;
          this.valueField = "";
          this.textField = "";
          this.imgField = "";

          if (config.valueField && config.items.length)
            this.valueType = typeof config.items[0][config.valueField];
          this.sorter = this.valueType;
          NumberField.call(this, config);
        }

        Select2Field.prototype = new NumberField({
          align: "left",
          valueType: "number",

          itemTemplate: function(value) {
            var items = this.items,
                valueField = this.valueField,
                textField = this.textField,
                imgField = this.imgField,
                resultItem;

            if(valueField) {
              resultItem = $.grep(items, function(item, index) {
                return item[valueField] === value;
              })[0] || {};
            }
            else
              resultItem = items[value];

            var result = (textField ? resultItem[textField] : resultItem);
            return (result === undefined || result === null) ? "" : result;
          },

          filterTemplate: function() {
            if(!this.filtering)
              return "";

            var grid = this._grid,
                $result = this.filterControl = this._createSelect();
            this._applySelect($result, this);

            if(this.autosearch) {
              $result.on("change", function(e) {
                grid.search();
              });
            }

            return $result;
          },

          insertTemplate: function() {
            if(!this.inserting)
              return "";

            var $result = this.insertControl = this._createSelect();
            this._applySelect($result, this);
            return $result;
          },

          editTemplate: function(value) {
            if(!this.editing)
              return this.itemTemplate(value);

            var $result = this.editControl = this._createSelect();
            (value !== undefined) && $result.val(value);
            this._applySelect($result, this);
            return $result;
          },

          filterValue: function() {
            var val = this.filterControl.val();
            return this.valueType === "number" ? parseInt(val || 0, 10) : val;
          },

          insertValue: function() {
            var val = this.insertControl.val();
            return this.valueType === "number" ? parseInt(val || 0, 10) : val;
          },

          editValue: function() {
            var val = this.editControl.val();
            return this.valueType === "number" ? parseInt(val || 0, 10) : val;
          },

          _applySelect: function(item, self)
          {
            setTimeout(function() {
              var selectSiteIcon = function(opt)
              {
                var img = '';
                try {
                  img = opt.element.attributes.img.value;
                } catch(e) {}
                if (!opt.id || !img)
                  return opt.text;
                var res = $('<span><img src="' + img + '" class="img-flag"/> ' + opt.text + '</span>');
                return res;
              }
              item.select2({
                width: self.width,
                templateResult: selectSiteIcon,
                templateSelection: selectSiteIcon
              });
            });
          },

          _createSelect: function() {
            var $result = $("<select>")/*.attr('width', self.selectWidth)*/,
              valueField = this.valueField,
              textField = this.textField,
              imgField = this.imgField,
              selectedIndex = this.selectedIndex;

            var $option;
            $.each(this.items, function(index, item) {
              var value = valueField ? item[valueField] : index,
                  text = textField ? item[textField] : item,
                  img = imgField ? item[imgField] : '';

              var $optgroup = $("<optgroup>")
                  .attr('label',text)
                  .appendTo($result);

              $.each(item['children'], function(indexI, itemI) {
                  var valueI = valueField ? itemI[valueField] : indexI,
                  textI = textField ? itemI[textField] : itemI,
                  imgI = imgField ? itemI[imgField] : '';

                  $option = $("<option>")
                      .attr("value", valueI)
                      .attr("img", imgI)
                      .text(textI)
                      .appendTo($optgroup);
              });

              $option.prop("selected", (selectedIndex === index));
            });

            return $result;
          }
        });

        jsGrid.fields.select2 = jsGrid.Select2Field = Select2Field;

    }(jsGrid, jQuery));