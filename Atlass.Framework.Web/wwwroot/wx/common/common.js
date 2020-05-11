
window.onload = function () {
    //适配
    document.documentElement.style.fontSize = document.documentElement.getBoundingClientRect().width / 750 * 100 + 'px';
    if (document.documentElement.getBoundingClientRect().width > 750) {
        document.documentElement.style.fontSize = '100px';
    }
    // 阻止双击放大
    var lastTouchEnd = 0;
    document.addEventListener('touchstart', function (event) {
        if (event.touches.length > 1) {
            event.preventDefault();
        }
    });
    document.addEventListener('touchend', function (event) {
        var now = (new Date()).getTime();
        if (now - lastTouchEnd <= 300) {
            event.preventDefault();
        }
        lastTouchEnd = now;
    }, false);

    // 阻止双指放大
    document.addEventListener('gesturestart', function (event) {
        event.preventDefault();
    });
}

// 阻止双指放大
document.addEventListener('gesturestart', function (event) {
    event.preventDefault();
});
var jutils = {};
jutils.ajaxGet = function (url, data, okfunc) {
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        cache: false,
        data: data,
        //contentType: 'application/x-www-form-urlencoded',
        success: function (res) {
            if (res.statusCode === 200) {
                
                if ($.isFunction(okfunc)) {
                    okfunc(res);
                }
            } else {
                alert(res.msg);
            }
        }, beforeSend: function (data, textStatus, jqXHr) {

        },
        error: function (jqXHr, textStatus, errorMsg) {
            alert('请求异常');
        }
        //},
        //complete: function (jqXHr, textStatus) {
        //    layer.msg('请求异常', { time: 2000, icon: 5 });
        //}
    });
}
//post请求
jutils.ajaxPost = function (url, data, okfunc) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        cache: false,
        data: data,
        //contentType:'application/x-www-form-urlencoded',
        success: function (res) {
            if (res.statusCode === 200) {
               
                if ($.isFunction(okfunc)) {
                    okfunc(res);
                }
            } else {
                alert(res.msg);
            }
        }, beforeSend: function (data, textStatus, jqXHr) {

        },
        error: function (jqXHr, textStatus, errorMsg) {
            alert('请求异常');
        }
        //complete: function (jqXHr, textStatus) {
        //    layer.msg('请求异常', { time: 2000, icon: 5 });
        //}
    });
}