(function ($) {
    "use strict";
    $.fn.easyTreeTable = function (option, param) {
        //如果是调用方法
        if (typeof option == 'string') {
            return $.fn.easyTreeTable.methods[option](this, param);
        }

        //如果是初始化组件
        var _option = $.extend({}, $.fn.easyTreeTable.defaults, option || {});
        var target = $(this);
        target.bootstrapTreeTable(_option);
        return target;
    };

    $.fn.easyTreeTable.methods = {
        search: function (target, param) {
            return target.bootstrapTreeTable('refresh', param);
        },
        getRowById: function (target, id) {
            var tree = target.data('bootstrap.tree.table');
            for (var row in tree.data_obj) {
                if (tree.data_obj[row]) {
                    if (tree.data_obj[row].Id == id) {
                        return tree.data_obj[row];
                    }
                }
            }
        },
        expandRowById: function (target, id) {
            return target.bootstrapTreeTable('expandRow', id);
        }
    };

    $.fn.easyTreeTable.defaults = {
        method: 'GET',
        code: "Id",
        parentCode: "ParentId",
        bordered: true,
        expandColumn: '1',
        expandAll: false,
        expandFirst: true
    };
})(jQuery);