;window.jutils = {};
(function($, jutils) {
    "use strict";
    let currentPage={
        isAdmin:false,
        buttonPermissions:[]
    };
    $.extend(jutils, {
        getQueryParam : function (paramName) {
            var reg = new RegExp("(^|&)" + paramName + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        },
        toQueryPair:function(key, value) {
            if(typeof value == 'undefined') {
                  return key;
             }
             return key + '=' + encodeURIComponent(value === null ? '' : String(value));
        },
        toQueryString:function(obj) {
            var ret = [];
            for (var key in obj) {
                key = encodeURIComponent(key);
                var values = obj[key];
                if (values && values.constructor == Array) {//数组 
                    var queryValues = [];
                    for (var i = 0, len = values.length, value; i < len; i++) {
                        value = values[i];
                        queryValues.push(jutils.toQueryPair(key, value));
                    }
                    ret = ret.concat(queryValues);
                } else { //字符串 
                    ret.push(jutils.toQueryPair(key, values));
                }
            }
            return ret.join('&');
        },
        getChecked:function(name){
            //获取checkbox选中的值,返回数组[]
            var checkeds =[];
            $('input:checkbox[name="' + name + '"]:checked').each(function (i) {
                checkeds.push($(this).val());
            });
            return checkeds;
        },
        dialogFull:function (title, url, data, callFunc) {
            //弹出即全屏
            if (data) {
                var queryStr = jutils.toQueryString(data);
                url += "?" + queryStr;
            }
            var index1 = layer.open({
                title: title,
                type: 2,
                content: url,
                //skin: 'layui-layer-lan',
                area: ['800px', '600px'],
                maxmin: true,
                yes: function (index, layero) {
                    layer.close(index);
                }, cancel: function (index, layero) {
                    //if (confirm('确定要关闭么')) { //只有当点击confirm框的确定时，该层才会关闭
                    //    layer.close(index);
                    //}
                    return true;
                }, end: function () {
                    if ($.isFunction(callFunc)) {
                        callFunc();
                    }
                }
            });
            layer.full(index1);

        },
        dialog : function (title, url, data, area, callFunc) {
            //弹出即全屏
            if (data) {
                var queryStr = jutils.toQueryString(data);
                url += "?" + queryStr;
            }
           
            let area2 =['900px', '600px'];
            if (area) {
                area2 = [area[0] + 'px', area[1] +'px'];
            }
            var index1 = layer.open({
                title: title,
                type: 2,
                content: url,
                //skin: 'layui-layer-lan',
                area: area2,
                maxmin: true,
                yes: function (index, layero) {
                    layer.close(index);
                },
                cancel: function (index, layero) {
                    return true;
                },
                end: function () {
                    if ($.isFunction(callFunc)) {
                        callFunc();
                    }
                }
            });

        },
        dialogTop : function (title, url, data, area, callFunc) {
            //在最上层弹出
            if (data) {
                var queryStr = jutils.toQueryString(data);
                url += "?" + queryStr;
            }
            let area2 = [$(window).width() + 'px', $(window).height() + 'px'];
            if (area) {
                area2 = [area[0] + 'px', area[1] + 'px'];
            }
            let index1 = parent.layer.open({
                title: title,
                type: 2,
                content: url,
                area: area2,
                maxmin: false,
                yes: function (index, layero) {
                    layer.close(index);
                },
                cancel: function (index, layero) {
                    return true;
                },
                end: function () {
                    if ($.isFunction(callFunc)) {
                        callFunc();
                    }
                }
            });

        },
        closeDialog: function () {//关闭弹出
            var index = parent.layer.getFrameIndex(window.name);
            if (index) {
                parent.layer.close(index);
            }
        },
        ajax : function (type, asysc, url, data, okfunc) {
            var isasync = asysc || true;
            $.ajax({
                async: isasync,//默认为true异步，如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。 
                url: url,
                type: type,
                dataType: 'json',
                cache: false,
                data: data,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (res) {
                    if (res.status) {
                        if (res.message) {
                            jutils.success(res.message);
                        }
                    } else {
                        if (res.message) {
                            jutils.error(res.message);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {
                    jutils.loading("请求中。。");
                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                },
                complete: function (jqXHr, textStatus) {
                    jutils.closeLoading();
                }
            });
        },
        ajaxGet : function (url, data, okfunc) {
            $.ajax({
                url: url,
                type: 'get',
                dataType: 'json',
                cache: false,
                data: data,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (res) {
                    if (res.status) {
                        if (res.message) {
                            jutils.success(res.message);
                        }
                    } else {
                        if (res.message) {
                            jutils.error(res.message);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {
                    jutils.loading("请求中。。");
                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                },
                complete: function (jqXHr, textStatus) {
                    jutils.closeLoading();
                }
            });
        },
        ajaxPost : function (url, data, okfunc) {
            $.ajax({
                url: url,
                type: 'post',
                dataType: 'json',
                cache: false,
                data: data,
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (res) {
                    if (res.status) {
                        if (res.message) {
                            jutils.success(res.message);
                        }
                    } else {
                        if (res.message) {
                            jutils.error(res.message);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {
                         jutils.loading("请求中。。");
                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                },
                complete: function (jqXHr, textStatus) {
                   //layer.msg('请求异常', { time: 2000, icon: 5 });
                    jutils.closeLoading();
                }
            });
        },
        /** 消息提示 弹窗状态码
        // modal_status = {
        //     SUCCESS: "success",
        //     FAIL: "error",
        //     WARNING: "warning"
        // };*/
        loading:function(message){
            $.blockUI({message: '<div class="loaderbox"><div class="loading-activity"></div> ' + message + '</div>'});
        },
        closeLoading:function(){
            setTimeout(function () {
                $.unblockUI();
            }, 50);
        },
        msg: function(content, type) {
            if (type) {
                layer.msg(content, { icon:type, time: 3000, shift: 5 });
            } else {
                layer.msg(content);
            }
        },
        success : function (msg) {
            //msg = msg || '操作成功';
            if (msg) {
               jutils.msg(msg,1)
            }

        },
        error : function (msg) {
            msg = msg || '操作失败';
            jutils.msg(msg,2)
        },
        warn: function (msg) {
            msg = msg || '操作警告';
            jutils.msg(msg,0)
        },
        confirm : function (msg, okfunc) {
            layer.confirm(msg, {
                icon: 3,
                title: '温馨提示',
                skin: 'layui-layer-lan',
                btn: ['确认', '取消']
            }, function (index) {
                layer.close(index);
                okfunc();
            }, function () {

            });
        },
        //判断空字符串
        empty: function (str) {
            if (!str || str == "" || str == undefined)
                return true;

            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        },
        emptyId: function (str) {
            if (!str || str == "" || str == undefined||str==0)
                return true;

            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        },
        padLeft: function (str, totalLen) {
            var len = str.toString().length;
            while (len < totalLen) {
                str = "0" + str;
                len++;
            }
            return str;
        },
        padRight : function (str, totalLen) {
            var len = str.toString().length;
            while (len < totalLen) {
                str = str + "0";
                len++;
            }
            return str;
        },
         //过程字符换行
        splitLine:function (str, splitLength) {
            if (!str) {
                return '';
            }
            splitLength = splitLength || 20;
            var len = str.length;
            var count = len / splitLength;
            var remainCount = len % splitLength;
            if (remainCount > 0) {
                count++;
            }
            var splitHtml = '';
            for (var i = 0; i < count; i++) {
                var sindex = i * splitLength;
                splitHtml += str.substr(sindex, splitLength);
                if (i < count - 1) {
                    splitHtml += '<br/>'
                }
            }
            return splitHtml;
        },
        getCookie :function (name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            if (arr = document.cookie.match(reg))
                return unescape(arr[2]);
            else
                return null;

        },
        setCookie: function (name, value) {
            var date = new Date();
            var ms = 100 * 24 * 3600 * 1000;
            date.setTime(date.getTime() + ms);
            document.cookie = name + "=" + escape(value) + ";expires=" + date.toGMTString();
        },
        formatFunc:function(str) {    //格式化显示
            return str > 9 ? str : '0' + str
         },
        toLocalTime:function (localTime) {
            if (!localTime || localTime == '0001-01-01 00:00:00' ||
                localTime == '1900-01-01 00:00:00' || localTime == '1753-01-01 00:00:00') {
                return '-';
            }
            return localTime;

        },
        toLocalDate:function (utcTime) {
            if (utcTime == '0001-01-01T00:00:00Z' || utcTime == '1900-01-01T00:00:00Z') {
                return '-';
            }
            var jsDate = new Date(utcTime);
            var year = jsDate.getFullYear();
            var mon = formatFunc(jsDate.getMonth() + 1);
            var day = formatFunc(jsDate.getDate());
            var dateStr = year + '-' + mon + '-' + day;
            return dateStr;
        },
        toLocalMonth:function (utcTime) {
            if (utcTime == '0001-01-01T00:00:00Z' || utcTime == '1900-01-01T00:00:00Z') {
                return '-';
            }
            var jsDate = new Date(utcTime);
            var year = jsDate.getFullYear();
            var mon = formatFunc(jsDate.getMonth() + 1);
            var day = formatFunc(jsDate.getDate());
            var dateStr = year + '-' + mon + '-01';
            return dateStr;
        },
        timezoneOffset:function () {
            var time = new Date();
            var timeOffset = time.getTimezoneOffset();
            return timeOffset;
        },
        localTime:function () {
            var jsDate = new Date();
            var year = jsDate.getFullYear();
            var mon = formatFunc(jsDate.getMonth() + 1);
            var day = formatFunc(jsDate.getDate());
            var hour = jsDate.getHours();
            //var noon = hour >= 12 ? 'PM' : 'AM';
            //hour = hour >= 12 ? hour - 12 : hour;
            hour = formatFunc(hour);
            var min = formatFunc(jsDate.getMinutes());
            var seconds = formatFunc(jsDate.getSeconds());
            var dateStr = year + '-' + mon + '-' + day + ' ' + hour + ':' + min + ':' + seconds;
            return dateStr;
        },
        localTimeString:function () {
        var jsDate = new Date();
        var year = jsDate.getFullYear();
        var mon = formatFunc(jsDate.getMonth() + 1);
        var day = formatFunc(jsDate.getDate());
        var hour = jsDate.getHours();
        //var noon = hour >= 12 ? 'PM' : 'AM';
        //hour = hour >= 12 ? hour - 12 : hour;
        hour = formatFunc(hour);
        var min = formatFunc(jsDate.getMinutes());
        var seconds = formatFunc(jsDate.getSeconds());
        var dateStr = year + mon + day + hour + min + seconds;
        return dateStr;
        },
        // 格式为 yyyy-MM-dd HH:mm:ss
        formatDate: function (v, format) {
            if (!v) return "";
            var d = v;
            if (typeof v === 'string') {
                if (v.indexOf("/Date(") > -1)
                    d = new Date(parseInt(v.replace("/Date(", "").replace(")/", ""), 10));
                else
                    d = new Date(Date.parse(v.replace(/-/g, "/").replace("T", " ").split(".")[0]));
            }
            var o = {
                "M+": d.getMonth() + 1,  //month
                "d+": d.getDate(),       //day
                "H+": d.getHours(),      //hour
                "m+": d.getMinutes(),    //minute
                "s+": d.getSeconds(),    //second
                "q+": Math.floor((d.getMonth() + 3) / 3),  //quarter
                "S": d.getMilliseconds() //millisecondjsonca4
            };
            if (/(y+)/.test(format)) {
                format = format.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
        },
        /*
 网页可见区域宽： document.body.clientWidth
网页可见区域高： document.body.clientHeight
网页可见区域宽： document.body.offsetWidth (包括边线的宽)
网页可见区域高： document.body.offsetHeight (包括边线的高)
网页正文全文宽： document.body.scrollWidth
网页正文全文高： document.body.scrollHeight
网页被卷去的高： document.body.scrollTop
网页被卷去的左： document.body.scrollLeft
网页正文部分上： window.screenTop
网页正文部分左： window.screenLeft
屏幕分辨率的高： window.screen.height
屏幕分辨率的宽： window.screen.width
屏幕可用工作区高度： window.screen.availHeight
屏幕可用工作区宽度： window.screen.availWidth
*/
        documentSize:function () {
            return {
                width: document.body.clientWidth,
                height: document.body.clientHeight
            };
        },
        windowSize : function () {
            return {
                width: window.screen.availHeight,
                height: window.screen.availHeight
            };
        },
        back : function () {
            window.location.href = document.referrer;
        },
        openLink: function (href, target) {
            var a = document.createElement('a')
            if (target) {
                a.target = target;
            }
            else {
                a.target = '_blank';
            }
            a.href = href;
            a.click();
        },
      openTab: function (tabId,title, url, isRefresh) {
          // 选卡页方式打开
        createMenuItem(tabId,url, title, isRefresh);
      },
      refreshTab: function () {
          refreshItem();
        },
     parentTab: function (title, url) {
            //选卡页同一页签打开
        var dataId = window.frameElement.getAttribute('data-id');
        createMenuItem(url, title);
        closeItem(dataId);
    },
    // 关闭选项卡
    closeTab: function (tabId) {
       const dataId = window.frameElement.getAttribute('data-id');
        tabId=tabId||dataId;

       closeItem(tabId);
    },
        //发送消息，从弹出的Iframe页面发送到母页面
        // 传递对象请先构造一个完整结构 var result = { }
    postMessage:function(title,msg){
            let mesageBody = {title:title,data:msg }
            window.parent.postMessage(mesageBody, '*');
        },
        //接收消息，接收来之弹出的iframe页面的消息
    handleMessage:function(handFunc){
            window.addEventListener('message',
                 function (e) {
                    if ($.isFunction(handFunc)) {
                        handFunc(e.data);
                    }
            },false);
        },
    //移除工具条上的按钮权限
    toolbarPermission:function()
    {
        console.log('自动执行了:toolbarPermission');
        if($('#toolbar') && top.buttonPermissionModel){
            let isAdmin=top.buttonPermissionModel.isAdmin;
            currentPage.isAdmin=isAdmin;
            if(isAdmin){
                return;
            }

            let buttonPermissionList=top.buttonPermissionModel.buttonPermissions;
            currentPage.buttonPermissions=buttonPermissionList;
            let menuId = self.frameElement.getAttribute('data-id');
            if (menuId) {
                const menu=buttonPermissionList.filter(function(currentValue,index,arr){
                           return currentValue.menuId==menuId;
                })
                if(menu.length===0){
                    $('#toolbar').empty();
                    return;
                }
                const buttons=menu[0].buttons;
                if(buttons.length===0){
                    $('#toolbar').empty();
                    return;
                }
                $('#toolbar').find('a').each(function(){
                         let roleTag=$(this).data('role');
                         if(roleTag!='0'){
                             if(buttons.indexOf(roleTag)<0){
                                 $(this).remove();
                             }
                         }
                })

            }
        }else{
            if($('#toolbar')){
                $('#toolbar').empty();
            }
        }
    },
    //data:[{roleTag:'sys:user:add',button:'<a href='#'>添加</>'}]
    buttonPermissions:function(data){
            //表格内的按钮权限去除
        console.log('执行了:buttonPermissions');
        let buttonPermissionHtml=[];
        if(top.buttonPermissionModel){
            let isAdmin=currentPage.isAdmin;
            if(isAdmin){
                for (let i = 0; i <data.length ; i++) {
                    buttonPermissionHtml.push(data[i].button);
                }
                return buttonPermissionHtml.join('');
            }

            let buttonPermissionList=currentPage.buttonPermissions;
            let menuId = self.frameElement.getAttribute('data-id');
            if (menuId) {
                const menu=buttonPermissionList.filter(function(currentValue,index,arr){
                    return currentValue.menuId==menuId;
                })
                if(menu.length===0){
                    return '';
                }
                const buttons=menu[0].buttons;
                if(buttons.length===0){
                    return '';
                }
                data.forEach(function(item, index){
                    if(buttons.indexOf(item.roleTag)>=0){
                        buttonPermissionHtml.push(item.button);
                    }
                });

            }
        }

        return buttonPermissionHtml.join('');;
     },

    });

  //执行自动删除toolbar上的菜单
  jutils.toolbarPermission();
})(window.jQuery, window.jutils);

$.fn.initFormData = function (formdata) {
    let element = $(this);
    if (!!formdata) {
        for (let key in formdata) {
            let $id = element.find('#' + key);
            let value = $.trim(formdata[key]).replace(/&nbsp;/g, '');
            let type = $id.attr('type');
            if ($id.hasClass("select2-hidden-accessible")) {
                type = "select";
            }
            switch (type) {
                case "checkbox":
                    if (value == $id.val()) {
                        $id.attr("checked", 'checked');
                    } else {
                        $id.removeAttr("checked");
                    }
                    break;
                case "radio":
                     $('input:radio[name="'+key+'"]').each(function () {
                        let nowVal = $(this).val();
                         if (nowVal == value) {
                             if($(this).hasClass('icheck')){
                                 $(this).iCheck('check');
                             }else{
                                 $(this).attr("checked", true);
                             }

                        } else {
                             if($(this).hasClass('icheck')){
                                 $(this).iCheck('uncheck');
                             }else{
                                 $(this).removeAttr("checked");
                             }

                        }
                    });
                    break;
                case "select":
                    //$id.val(value).trigger("change");
                    $id.val(value);
                    break;
                default:
                    $id.val(value);
                    break;
            }
        };
        return false;
    }
    var postdata = {};
    element.find('input,select,textarea').each(function (r) {
        var $this = $(this);
        var id = $this.attr('id');
        var type = $this.attr('type');
        switch (type) {
            case "checkbox":
                postdata[id] = $this.is(":checked");
                break;
            case "select":
                postdata[id] = $this.val();
                break;
            default:
                var value = $this.val() == "" ? "&nbsp;" : $this.val();
                if (!$.request("keyValue")) {
                    value = value.replace(/&nbsp;/g, '');
                }
                postdata[id] = value;
                break;
        }
    });
    return postdata;
};
$.fn.getFormData =function(){
     let formList= $(this).serializeArray();
     let data={};
    formList.forEach((item,index,array)=>{
        data[item.name]=item.value;
    })
    return data;
}
$.fn.selectText=function(){
    return $(this).find("option:selected").text();
}
