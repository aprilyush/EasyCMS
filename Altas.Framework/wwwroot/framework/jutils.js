var jutils = {};
//参数设置，若用默认值可以省略以下面代
$(function() {
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
});

function toQueryPair(key, value) {
    if (typeof value == 'undefined') {
        return key;
    }
    return key + '=' + encodeURIComponent(value === null ? '' : String(value));
} 
function toQueryString(obj) {
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
} 
//dialog弹窗
jutils.dialogForm = function(title,url,data,callFunc) {
    //弹出即全屏
    if (data) {
        var queryStr = toQueryString(data);
        url += "?" + queryStr;
    }
    var index1 = layer.open({
        title: title,
        type: 2,
        content: url,
        skin: 'layui-layer-lan',
        area: ['800px', '600px'],
        maxmin: true,
        yes: function (index, layero) {
            layer.close(index);
        }, cancel: function (index, layero) {
            //if (confirm('确定要关闭么')) { //只有当点击confirm框的确定时，该层才会关闭
            //    layer.close(index);
            //}
            return true;
        }, end: function() {
            if ($.isFunction(callFunc)) {
                callFunc();
            }
        }
    });
    layer.full(index1);

}

jutils.dialog = function (title, url, data, area, callFunc) {
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
        skin: 'layui-layer-lan',
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

};
//关闭弹出
jutils.closeForm = function() {
    var index = parent.layer.getFrameIndex(window.name);
    if (index) {
        parent.layer.close(index);
    }
}

//ajax请求
jutils.ajax = function (type, asysc, url, data, okfunc) {
    var isasync = asysc || true;
    $.ajax({
        async: isasync,//默认为true异步，如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。 
        url: url,
        type: type,
        dataType: 'json',
        cache: false,
        data:data,
        //contentType: 'application/x-www-form-urlencoded',
        success: function (res) {
            if (res.statusCode === 200 || res.code===0) {
                jutils.success(res.msg);
                if ($.isFunction(okfunc)) {
                    okfunc(res);
                }
            } else {
              jutils.error(res.msg);
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
}
//get请求
jutils.ajaxGet = function (url, data, okfunc) {
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        cache: false,
        data: data,
        //contentType: 'application/x-www-form-urlencoded',
        success: function(res) {
            if (res.statusCode === 200) {
                jutils.success(res.msg);
                if ($.isFunction(okfunc)) {
                    okfunc(res);
                }
            } else {
                jutils.error(res.msg);
            }
        }, beforeSend: function (data, textStatus, jqXHr) {
           
        },
        error: function(jqXHr, textStatus, errorMsg) {
            jutils.error('请求异常');
        }
        //},
        //complete: function (jqXHr, textStatus) {
        //    layer.msg('请求异常', { time: 2000, icon: 5 });
        //}
    });
}
//post请求
jutils.ajaxPost= function (url, data, okfunc) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        cache: false,
        data: data,
        //contentType:'application/x-www-form-urlencoded',
        success: function (res) {
            if (res.statusCode === 200) {
                jutils.success(res.msg);
                if ($.isFunction(okfunc)) {
                    okfunc(res);
                }
            } else {
                jutils.error(res.msg);
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
}


//toastr通知
jutils.success = function(msg) {
    //msg = msg || '操作成功';
    if (msg) {
        toastr.success(msg);
    }
   
}
jutils.error = function (msg) {
    msg = msg || '操作失败';
    toastr.error(msg);
}
jutils.warn = function (msg) {
    msg = msg || '操作警告';
    toastr.warning(msg);
}
jutils.info = function (msg) {
    msg = msg || '信息提示';
    toastr.info(msg);
}

//确认框molv
jutils.confirm = function (msg, okfunc) {
    var btn = ['确认', '取消'];
    var title = "温馨提示";
    var lan = jutils.getCookie('webLang');
    if (lan === 'en') {
        title = 'Prompt';
        btn = ["Confirm", "Cancel"];
    }
    layer.confirm(msg, {
        title: title,
        skin: 'layui-layer-lan',
        btn: btn //按钮
    }, function (index) {
        layer.close(index);
        okfunc();
    }, function () {
      
    });
}
jutils.confirmEn = function (msg, okfunc) {
    var title = 'Prompt';
    var btn = ["Confirm", "Cancel"];
    layer.confirm(msg, {
        title: title,
        skin: 'layui-layer-lan',
        btn: btn //按钮
    }, function (index) {
        layer.close(index);
        okfunc();
    }, function () {

    });
}
jutils.pad = function(str, totalLen) {
    var len = str.toString().length;
    while (len < totalLen) {
        str = "0" + str;
        len++;
    }
    return str;
}
//弹出框
$.dialog = function(opts) {
    var defaults = {
        id: null,
        title: '信息窗',
        width: "600px",
        height: "500px",
        url: '',
        shade: 0.3,
        btn: ['确认', '关闭'],
        btnclass: ['btn btn-primary', 'btn btn-danger'],
        callBack: null
    };
    var options = $.extend(defaults, options);
    var _width = top.$(window).width() > parseInt(options.width.replace('px', '')) ? options.width : top.$(window).width() + 'px';
    var _height = top.$(window).height() > parseInt(options.height.replace('px', '')) ? options.height : top.$(window).height() + 'px';
    top.layer.open({
        id: options.id,
        type: 2,
        shade: options.shade,
        title: options.title,
        fix: false,
        area: [_width, _height],
        content: options.url,
        btn: options.btn,
        btnclass: options.btnclass,
        yes: function () {
            options.callBack(options.id);
        }, cancel: function () {
            return true;
        }
    });
}


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


//填充表单
jutils.loadFormData = function (form, data) {
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

};

jutils.getCookie = function(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;

};
jutils.setCookie = function(name, value) {
    var date = new Date();
    var ms = 100 * 24 * 3600 * 1000;
    date.setTime(date.getTime() + ms);
    document.cookie = name + "=" + escape(value) + ";expires=" + date.toGMTString();
};

jutils.resetValidateSrc = function() {
    var lan = jutils.getCookie('webLang');
    if (lan === 'en') {
        var obj = document.getElementById('validateScript');
        if (obj != null) {
            obj.src = '/plugins/nice_validate/local/en.js';
        }
    }
};
jutils.loadLangI18 = function(url) {
    var i18nLanguage = jutils.getCookie('webLang');

    if (i18nLanguage !== 'en') {
        i18nLanguage = 'zh';
    }
    jQuery.i18n.properties({
        name: 'common',
        //path: '/Lang/B_Obituary/i18n/', //资源文件路径
        path: url,
        mode: 'map', //用Map的方式使用资源文件中的值
        language: i18nLanguage,
        callback: function() { //加载成功后设置显示内容
            //console.log("i18n赋值中...");
            try {
                // $('#fucktest').text($.i18n.prop('orderno'));
                ////初始化页面元素
                //if ($('[data-i18n-placeholder]').length > 0) {
                //    $('[data-i18n-placeholder]').each(function () {
                //        $(this).attr('placeholder', $.i18n.prop($(this).data('i18n-placeholder')));
                //    });
                //}

                // console.log($('[data-i18n-text]').length);
                if ($('[data-i18n-text]').length > 0) {
                    //console.log('test');
                    $('[data-i18n-text]').each(function () {
                        var key = $(this).data('i18n-text');
                        var val = $.i18n.prop(key);
                        $(this).text(val);
                    });
                }
                //$('[data-i18n-text]').each(function () {
                //    //如果text里面还有html需要过滤掉
                //    var html = $(this).html();
                //    var reg = /<(.*)>/;
                //    if (reg.test(html)) {
                //        var htmlValue = reg.exec(html)[0];
                //        $(this).html(htmlValue + $.i18n.prop($(this).data('i18n-text')));
                //    } else {
                //        var t = $.i18n.prop($(this).data('i18n-text'));
                //        console.log(t);
                //        $(this).text(t);
                //    }
                //});
                if ($('[data-i18n-value]').length > 0) {
                    $('[data-i18n-value]').each(function() {
                        $(this).val($.i18n.prop($(this).data('i18n-value')));
                    });
                }

            } catch (ex) {
                console.log(ex);
            }
            //console.log("i18n写入完毕");
        }
    });

};

//生成基本操作按钮 [{text:'按钮',func:'ok',color:'btn-danger',icon:fa-edit'}]
jutils.initToolBar = function (id, isDefault, extBtn) {
    extBtn = extBtn || [];
    var html = '';
    if (isDefault) {
        var add = '新建', edit = "修改", del = "删除";
        var lang = jutils.getCookie('webLang');
        if (lang === "en") {
            add = "Add";
            edit = "Edit";
            del = "Delete";
        }
        // html += '<div class="btn-group">';
        //html += '<button class="btn btn-success " type = "button" onclick = "refresh()" > <i class="fa fa-refresh"></i>&nbsp; 刷新</button>';
        html +=
            '<button class="btn btn-primary " type="button" onclick="add()"><i class="fa fa-plus"></i>&nbsp;' + add+'</button>';
        html +=
            '<button class="btn btn-info " type="button" onclick="edit()"><i class="fa fa-edit"></i>&nbsp;' + edit +'</button>';
        html += '<button class="btn btn-danger" type="button" onclick="del()"><i class="fa fa-trash"></i> ' + del +'</button>';
        //html += '</div >';
    }

    if (extBtn.length > 0) {
        // html += '<div class="btn-group">';
        html +=
            '<button class="btn btn-info " type="button" onclick="edit()"><i class="fa fa-edit"></i>&nbsp;修改</button>';
        //html += '</div >';
    }

    $(id).append(html);
};