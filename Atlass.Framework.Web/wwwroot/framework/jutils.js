;window.jutils = {};
(function($, jutils) {
    "use strict";
    $.extend(jutils, {
        initToastr: function () {
            //console.log('initToastr');
            //参数设置，若用默认值可以省略以下面代
            toastr.options = {
                "closeButton": true, //是否显示关闭按钮
                "debug": false, //是否使用debug模式
                "newestOnTop": false,
                "progressBar": true,//进度条
                //"positionClass": "toast-top-full-width", //弹出窗的位置
                "preventDuplicates": true,//允许重复弹出
                "onclick": null,
                "showDuration": "300", //显示的动画时间
                "hideDuration": "1000", //消失的动画时间
                "timeOut": "3000", //展现时间
                "extendedTimeOut": "0", //加长展示时间
                "showEasing": "swing", //显示时的动画缓冲方式
                "hideEasing": "linear", //消失时的动画缓冲方式
                "showMethod": "fadeIn", //显示时的动画方式
                "hideMethod": "fadeOut" //消失时的动画方式

            };
        },
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
                        queryValues.push(toQueryPair(key, value));
                    }
                    ret = ret.concat(queryValues);
                } else { //字符串 
                    ret.push(toQueryPair(key, values));
                }
            }
            return ret.join('&');
        },
        dialogForm:function (title, url, data, callFunc) {
            //弹出即全屏
            if (data) {
                var queryStr = toQueryString(data);
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
                var queryStr = toQueryString(data);
                url += "?" + queryStr;
            }
            area = area || ['800px', '600px'];
            var index1 = layer.open({
                title: title,
                type: 2,
                content: url,
                //skin: 'layui-layer-lan',
                area: area,
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
        closeForm: function () {//关闭弹出
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
                //contentType: 'application/x-www-form-urlencoded',
                success: function (res) {
                    if (res.status) {
                        if (res.msg) {
                            jutils.success(res.msg);
                        }
                    } else {
                        if (res.msg) {
                            jutils.error(res.msg);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {

                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                }
                //complete: function (jqXHr, textStatus) {
                //    layer.msg('请求异常', { time: 2000, icon: 5 });
                //}
            });
        },
        ajaxGet : function (url, data, okfunc) {
            $.ajax({
                url: url,
                type: 'get',
                dataType: 'json',
                cache: false,
                data: data,
                //contentType: 'application/x-www-form-urlencoded',
                success: function (res) {
                    if (res.status) {
                        if (res.msg) {
                            jutils.success(res.msg);
                        }
                    } else {
                        if (res.msg) {
                            jutils.error(res.msg);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {

                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                }
                //},
                //complete: function (jqXHr, textStatus) {
                //    layer.msg('请求异常', { time: 2000, icon: 5 });
                //}
            });
        },
        ajaxPost : function (url, data, okfunc) {
            $.ajax({
                url: url,
                type: 'post',
                dataType: 'json',
                cache: false,
                data: data,
                //contentType:'application/x-www-form-urlencoded',
                success: function (res) {
                    if (res.status) {
                        if (res.msg) {
                            jutils.success(res.msg);
                        }
                    } else {
                        if (res.msg) {
                            jutils.error(res.msg);
                        }
                    }
                    if ($.isFunction(okfunc)) {
                        okfunc(res);
                    }
                }, beforeSend: function (data, textStatus, jqXHr) {

                },
                error: function (jqXHr, textStatus, errorMsg) {
                    jutils.error('请求异常');
                }
                //complete: function (jqXHr, textStatus) {
                //    layer.msg('请求异常', { time: 2000, icon: 5 });
                //}
            });
        },
        //toastr通知
        success : function (msg) {
            //msg = msg || '操作成功';
            if (msg) {
                toastr.success(msg);
            }

        },
        error : function (msg) {
            msg = msg || '操作失败';
            toastr.error(msg);
        },
        warn: function (msg) {
            msg = msg || '操作警告';
            toastr.warning(msg);
        },
        info: function (msg) {
            msg = msg || '信息提示';
            toastr.info(msg);
        },
        confirm : function (msg, okfunc) {
            var btn = ['确认', '取消'];
            var title = "温馨提示";
            layer.confirm(msg, {
                title: title,
                skin: 'layui-layer-lan',
                btn: btn //按钮
            }, function (index) {
                layer.close(index);
                okfunc();
            }, function () {

            });
        },
        loadFormData: function (form, data) {
            if (form == null || typeof data == "undefined")
                return;
            for (var name in data) {
                var val = data[name];
                //!_checkField(name, val&& !_npCombotreeField(name, val)
                if (!_checkField(name, val)) {
                    form.find("input[id=\"" + name + "\"]").val(val);
                    form.find("textarea[id=\"" + name + "\"]").val(val);
                    form.find("select[id=\"" + name + "\"]").val(val);
                }
            }
            function _checkField(pName, pValue) {
                var cc = $(form).find("input[id=\"" + pName + "\"][type=radio], input[name=\"" + pName + "\"][type=checkbox]");
                if (cc.length) {
                    //cc._propAttr('checked', false);
                    cc.each(function () {
                        var f = $(this);
                        f.prop("checked", false);
                        if (f.val() === String(pValue) || $.inArray(f.val(), $.isArray(pValue) ? pValue : [pValue]) >= 0) {
                            f.prop("checked", true);
                        }
                    });
                    return true;
                }
                return false;
            }

        },
        //判断空字符串
        empty: function (str) {
            if (!str || str == "" || obj == undefined)
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
        //生成基本操作按钮 [{text:'按钮',func:'ok',color:'btn-danger',icon:fa-edit'}]
        initToolBar: function (id, isDefault, extBtn) {
            extBtn = extBtn || [];
            var html = '';
            if (isDefault) {
                var add = '新建', edit = "修改", del = "删除";
                // html += '<div class="btn-group">';
                //html += '<button class="btn btn-success " type = "button" onclick = "refresh()" > <i class="fa fa-refresh"></i>&nbsp; 刷新</button>';
                html +=
                    '<button class="btn btn-primary " type="button" onclick="add()"><i class="fa fa-plus"></i>&nbsp;' + add + '</button>';
                html +=
                    '<button class="btn btn-info " type="button" onclick="edit()"><i class="fa fa-edit"></i>&nbsp;' + edit + '</button>';
                html += '<button class="btn btn-danger" type="button" onclick="del()"><i class="fa fa-trash"></i> ' + del + '</button>';
                //html += '</div >';
            }

            if (extBtn.length > 0) {
                // html += '<div class="btn-group">';
                html +=
                    '<button class="btn btn-info " type="button" onclick="edit()"><i class="fa fa-edit"></i>&nbsp;修改</button>';
                //html += '</div >';
            }

            $(id).append(html);
        },
        //加载表格外权限按钮
        initToolBarRole:function (id, extBtn) {
            if (window.top === window.self) {
                return;
            }
            extBtn = extBtn || [];
            var iframeId = self.frameElement.getAttribute('data-id');
            if (iframeId) {
                var jsonstr = localStorage.getItem('role_funcs');
                var funcs = $.parseJSON(jsonstr);//JSON.parse(jsonstr);
                //console.log(funcs);
                if (funcs.length > 0) {
                    var menus = funcs.filter(function (currentValue, index, arr) {
                        return currentValue.parent_id === iframeId && currentValue.in_table === 0;
                    });

                    if (menus.length > 0) {
                        var html = '';
                        for (var i = 0; i < menus.length; i++) {
                            var menu = menus[i];
                            html += '<button class="btn btn-default btn-outline" type="button" onclick="' + menu.func_name + '()">';
                            html += '<i class="' + menu.menu_icon + '"></i>&nbsp;' + menu.menu_name + '</button>';
                        }
                        $(id).prepend(html);
                    }
                }
            }
        },
        //加载表格内按钮
        initToolBarRow: function (dataid) {
            if (window.top === window.self) {
                return;
            }
            var iframeId = self.frameElement.getAttribute('data-id');
            if (iframeId) {

                var jsonstr = localStorage.getItem('role_funcs');
                var funcs = JSON.parse(jsonstr);
                if (funcs.length > 0) {
                    var menus = funcs.filter(function (currentValue, index, arr) {
                        return currentValue.parent_id === iframeId && currentValue.in_table === 1;
                    });

                    if (menus.length > 0) {
                        var html = '';
                        for (var i = 0; i < menus.length; i++) {
                            var menu = menus[i];
                            html += '<a class="btn btn-white btn-bitbucket" title = "' +
                                menu.menu_name + '"  href = "javascript:void(0);" onclick = "' +
                                menu.func_name + '(this)" data-id="' + dataid + '" >';
                            html += '<i class="' + menu.menu_icon + '"></i></a >';
                        }
                        return html;
                    }
                }
            }

            return '';
        }
    });

    jutils.initToastr();
})(window.jQuery, window.jutils);

$.fn.initFormData = function (formdate) {
    var element = $(this);
    if (!!formdate) {
        for (var key in formdate) {
            var $id = element.find('#' + key);
            var value = $.trim(formdate[key]).replace(/&nbsp;/g, '');
            var type = $id.attr('type');
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
                        var nowVal = $(this).val();
                         if (nowVal == value) {
                            $(this).attr("checked", true);
                        } else {
                            $(this).removeAttr("checked");
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
