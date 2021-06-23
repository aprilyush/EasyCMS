;(function ($) {
    "use strict";
    $.fn.easyTable = function (option, param) {
        //如果是调用方法
        if (typeof option == 'string') {
            return $.fn.easyTable.methods[option](this, param);
        }

        //如果是初始化组件
        let _option = $.extend({}, $.fn.easyTable.defaults, option || {});
        let target = $(this);
        target.bootstrapTable(_option);

        //初始化后自执行
        target.easyTable("selectedEvent");
        return target;
    };

    $.fn.easyTable.methods = {
        search: function (target) {
            // 从第一页开始
           // target.bootstrapTable('refresh', {pageNumber: 1});

            if($('#toolbar .multiple')){
                $('#toolbar .multiple').addClass('disabled');
            }

            // 非单个禁用
            if ($('#toolbar .single')) {
                $('#toolbar .single').addClass('disabled');
            }

            target.bootstrapTable("refresh",{
                silent: true,
                pageNumber:1
            });

        },
        load: function (target, data) {
            if ($('#toolbar .multiple')) {
                $('#toolbar .multiple').addClass('disabled');
            }

            // 非单个禁用
            if ($('#toolbar .single')) {
                $('#toolbar .single').addClass('disabled');
            }

            target.bootstrapTable("load",data);
        },
        getPagination: function (target, params) {
            var pagination = {
                pageSize: params.limit,                         //页面大小
                pageIndex: (params.offset / params.limit) + 1,   //页码
                sort: params.sort,      //排序列名
                sortType: params.order //排位命令（desc，asc）
            };
            return pagination;
        },
        selected: function (target){
            return target.bootstrapTable('getSelections');
        },
        selectedEvent:function (target){
            //点击事件
            target.on("check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table", function () {
                let rows = target.bootstrapTable("getSelections").length;
                if($('#toolbar .multiple')){
                    $('#toolbar .multiple').toggleClass('disabled', rows<1);                }

                // 非单个禁用
                if($('#toolbar .single'))
                {
                    $('#toolbar .single').toggleClass('disabled', rows!=1);
                }
            });
            if($('#searchForm')){
                $('#searchButton').on('click',function(){
                    target.bootstrapTable("refresh", { silent: true, pageNumber: 1});
                });
                $('#resetButton').on('click',function(){
                    $('#searchForm')[0].reset();
                    document.getElementById("searchForm").reset();
                    target.bootstrapTable("refresh",{
                        silent: true,
                        pageNumber: 1
                    });
                })
            }
        }

    };

    $.fn.easyTable.defaults = {
        method: 'POST',                      // 请求方式（*）
        toolbar: '#toolbar',                // 工具按钮用哪个容器
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",   // 编码类型
        striped: true,                      // 是否显示行间隔色
        cache: false,                       // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   // 是否显示分页（*）
        sortable: true,                     // 是否启用排序
        sortStable: true,                   // 设置为 true 将获得稳定的排序
        sortName: 'id',                     // 排序列名称
        sortOrder: "desc",                  // 排序方式
        sidePagination: "server",           // 分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      // 初始化加载第一页，默认第一页,并记录
        pageSize: 10,                       // 每页的记录行数（*）
        pageList: "10, 25, 50, 100",        // 可供选择的每页的行数（*）
        search: false,                      // 是否显示表格搜索
        strictSearch: false,
        showSearch:true,
        showSearchButton: true,                    //显示搜索按钮
         searchSelector: false,
         visibleSearch: false,
        showButtonIcons: true,
        showButtonText: true,
        showSearchClearButton: false,
        showColumns: true,                  // 是否显示所有的列（选择显示的列）
        showRefresh: true,                  // 是否显示刷新按钮
        showToggle: true,                   // 是否显示详细视图和列表视图的切换按钮
        minimumCountColumns: 2,             // 最少允许的列数
        clickToSelect: true,                // 是否启用点击选中行
        height: undefined,                  // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     // 每一行的唯一标识，一般为主键列
        cardView: false,                    // 是否显示详细视图
        detailView: false,                  // 是否显示父子表
        totalField: 'total',
        dataField: 'rows',
        columns: [],
        queryParamsType: '',//设置为limit时候是没有pageNumber返回的
        ajaxOptions: {
            // headers: {"Authorization":'Bearer '+localStorage.getItem('nfApiToken')}
        },
        queryParams: function (params) {
            var p = {
                pageNumber: params.pageNumber,
                pageSize: params.pageSize
            }
            return p;
        },
        onLoadSuccess: function (data) {

        },
        onLoadError: function (status, s) {
            if (s.statusText != "abort") {
                layer.msg('请求失败', {icon: 2, time: 3000, shift: 5});
            }
        },
        onClickRow:function(ow, $element, field){

        }
    };
})(window.jQuery);