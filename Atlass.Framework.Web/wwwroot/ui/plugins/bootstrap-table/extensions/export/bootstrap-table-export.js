/**
 * @author zhixin wen <wenzhixin2010@gmail.com>
 * extensions: https://github.com/kayalshri/tableExport.jquery.plugin
 */

(function ($) {
    'use strict';
    var sprintf = $.fn.bootstrapTable.utils.sprintf;

    var TYPE_NAME = {
        csv: 'CSV',
        txt: 'TXT',
        doc: 'Word',
        excel: 'Excel'
    };

    $.extend($.fn.bootstrapTable.defaults, {
        showExport: false,
        exportDataType: 'all', // basic, all, selected
        exportTypes: ['csv', 'txt', 'doc', 'excel'],
        exportOptions: {
        	ignoreColumn: [0]  //忽略列索引
        }
    });

    $.extend($.fn.bootstrapTable.defaults.icons, {
        export: 'glyphicon glyphicon-save'
    });

    $.extend($.fn.bootstrapTable.locales, {
        formatExport: function () {
            return '导出';
        }
    });
    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales);

    var BootstrapTable = $.fn.bootstrapTable.Constructor,
        _initToolbar = BootstrapTable.prototype.initToolbar;

    BootstrapTable.prototype.initToolbar = function () {
        this.showToolbar = this.options.showExport;

        _initToolbar.apply(this, Array.prototype.slice.apply(arguments));

        if (this.options.showExport) {
            var that = this,
                $btnGroup = this.$toolbar.find('>.btn-group'),
                $export = $btnGroup.find('div.export');

            if (!$export.length) {
                $export = $([
                    '<div class="export btn-group">',
                        '<button class="btn' +
                            sprintf(' btn-%s', this.options.buttonsClass) +
                            sprintf(' btn-%s', this.options.iconSize) +
                            ' dropdown-toggle" ' +
                            'title="' + this.options.formatExport() + '" ' +
                            'data-toggle="dropdown" type="button">',
                            sprintf('<i class="%s %s"></i> ', this.options.iconsPrefix, this.options.icons.export),
                            '<span class="caret"></span>',
                        '</button>',
                        '<ul class="dropdown-menu" role="menu">',
                        '</ul>',
                    '</div>'].join('')).appendTo($btnGroup);

                var $menu = $export.find('.dropdown-menu'),
                    exportTypes = this.options.exportTypes;

                if (typeof this.options.exportTypes === 'string') {
                    var types = this.options.exportTypes.slice(1, -1).replace(/ /g, '').split(',');

                    exportTypes = [];
                    $.each(types, function (i, value) {
                        exportTypes.push(value.slice(1, -1));
                    });
                }
                $.each(exportTypes, function (i, type) {
                    if (TYPE_NAME.hasOwnProperty(type)) {
                        $menu.append(['<li data-type="' + type + '">',
                                '<a href="javascript:void(0)">',
                                    TYPE_NAME[type],
                                '</a>',
                            '</li>'].join(''));
                    }
                });

                $menu.find('li').click(function () {
                    var type = $(this).data('type'),
                        doExport = function () {
                            that.$el.tableExport($.extend({}, that.options.exportOptions, {
                                type: type,
                                escape: false
                            }));
                        };

                    if (that.options.exportDataType === 'all' && that.options.pagination) {
                        that.$el.one(that.options.sidePagination === 'server' ? 'post-body.bs.table' : 'page-change.bs.table', function () {
                            doExport();
                            that.togglePagination();
                        });
                        that.togglePagination();
                    } else if (that.options.exportDataType === 'selected') {
                        //修改sidePagination属性为server无法导出选中数据
                    	var trs = that.$body.children(); 
                    	for (var i = 0; i < trs.length; i++) {
                    	    var $this = $(trs[i]);
                    	    if(!$this.find(sprintf('[name="%s"]',that.options.selectItemName)).prop('checked')){
                    	      $this['hide']();
                    	 }}
                    	doExport();
                    	that.getRowsHidden(true);
                    } else {
                        doExport();
                    }
                });
            }
        }
    };
})(jQuery);
