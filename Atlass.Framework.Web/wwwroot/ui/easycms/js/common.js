/**
 * 通用方法封装处理
 * Copyright (c) 2019 ruoyi 
 */
$(function() {
	
    //  layer扩展皮肤
    if (window.layer !== undefined) {
        layer.config({
            extend: 'moon/style.css',
            skin: 'layer-ext-moon'
        });
    }
	
    // 回到顶部绑定
    if ($.fn.toTop !== undefined) {
        $('#scroll-up').toTop();
    }
	
    // 气泡弹出框特效（移到元素时）
    $(document).on("mouseenter", '.table [data-toggle="popover"]', function() {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function() {
            $(_this).popover('hide');
        });
    })

    // 气泡弹出框特效（离开元素时）
    $(document).on("mouseleave", '.table [data-toggle="popover"]', function() {
        var _this = this;
        setTimeout(function() {
            if (!$(".popover:hover").length) $(_this).popover("hide");
        }, 100);
    });
    // 按下ESC按钮关闭弹层
    $('body', document).on('keyup', function(e) {
        if (e.which === 27) {
            $.modal.closeAll();
        }
    });
});

(function ($) {
    'use strict';
    $.fn.toTop = function(opt) {
        var elem = this;
        var win = (opt && opt.hasOwnProperty('win')) ? opt.win : $(window);
        var doc = (opt && opt.hasOwnProperty('doc')) ? opt.doc : $('html, body');
        var options = $.extend({
            autohide: true,
            offset: 50,
            speed: 500,
            position: true,
            right: 15,
            bottom: 5
        }, opt);
        elem.css({
            'cursor': 'pointer'
        });
        if (options.autohide) {
            elem.css('display', 'none');
        }
        if (options.position) {
            elem.css({
                'position': 'fixed',
                'right': options.right,
                'bottom': options.bottom,
            });
        }
        elem.click(function() {
            doc.animate({
                scrollTop: 0
            }, options.speed);
        });
        win.scroll(function() {
            var scrolling = win.scrollTop();
            if (options.autohide) {
                if (scrolling > options.offset) {
                    elem.fadeIn(options.speed);
                } else elem.fadeOut(options.speed);
            }
        });
    };
})(jQuery);

/** 刷新选项卡 */
var refreshItem = function(){
    var topWindow = $(window.parent.document);
    var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-id');
    var target = $('.RuoYi_iframe[data-id="' + currentId + '"]', topWindow);
    var url = target.attr('src');
    target.attr('src', url).ready();
}

/** 关闭选项卡 */
var closeItem = function(dataId){
	var topWindow = $(window.parent.document);
	if(!jutils.empty(dataId)){
	    // window.parent.$.modal.closeLoading();
	    // // 根据dataId关闭指定选项卡
	    // $('.menuTab[data-id="' + dataId + '"]', topWindow).remove();
	    // // 移除相应tab对应的内容区
        // $('.mainContent .RuoYi_iframe[data-id="' + dataId + '"]', topWindow).remove();
        
        $('.menuTab[data-id="' + dataId + '"]', topWindow).find('i').click();
	    return;
	}
	var panelUrl = window.frameElement.getAttribute('data-panel');
	$('.page-tabs-content .active i', topWindow).click();
	if(!jutils.empty(panelUrl)){
	    $('.menuTab[data-id="' + panelUrl + '"]', topWindow).addClass('active').siblings('.menuTab').removeClass('active');
	    $('.mainContent .RuoYi_iframe', topWindow).each(function() {
	        if ($(this).data('id') == panelUrl) {
	            $(this).show().siblings('.RuoYi_iframe').hide();
	            return false;
            }
        });
    }
}

/** 创建选项卡 */
function createMenuItem(tabId,dataUrl, menuName, isRefresh) {
    tabId=tabId||9046;
    var pframe=window.frameElement;
    var panelUrl =dataUrl;
    if(pframe){
        panelUrl = pframe.getAttribute('data-id');
    }
    dataIndex =Math.floor((Math.random() * 100) + 1);
    flag = true;
    if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;
    var topWindow = $(window.parent.document);
    // 选项卡菜单已存在
    $('.menuTab', topWindow).each(function() {
        if ($(this).data('id') == tabId) {
            if (!$(this).hasClass('active')) {
                $(this).addClass('active').siblings('.menuTab').removeClass('active');
                scrollToTab(this);
                $('.page-tabs-content').animate({ marginLeft: ""}, "fast");
                // 显示tab对应的内容区
                $('.mainContent .RuoYi_iframe', topWindow).each(function() {
                    if ($(this).data('id') == tabId) {
                        $(this).show().siblings('.RuoYi_iframe').hide();
                        return false;
                    }
                });
            }
            if (isRefresh) {
            	refreshTab();
            }
            flag = false;
            return false;
        }
    });
    // 选项卡菜单不存在
    if (flag) {
        var str = '<a href="javascript:;" class="active menuTab" data-id="' + tabId + '" data-panel="' + panelUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
        $('.menuTab', topWindow).removeClass('active');

        // 添加选项卡对应的iframe
        var str1 = '<iframe class="RuoYi_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + tabId + '" data-panel="' + panelUrl + '" seamless></iframe>';
        $('.mainContent', topWindow).find('iframe.RuoYi_iframe').hide().parents('.mainContent').append(str1);
        
        window.parent.$.modal.loading("数据加载中，请稍后...");
        $('.mainContent iframe:visible', topWindow).load(function () {
            window.parent.$.modal.closeLoading();
        });

        // 添加选项卡
        $('.menuTabs .page-tabs-content', topWindow).append(str);
        scrollToTab($('.menuTab.active', topWindow));
    }
    return false;
}

// 刷新iframe
function refreshTab() {
	var topWindow = $(window.parent.document);
	var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-id');
	var target = $('.RuoYi_iframe[data-id="' + currentId + '"]', topWindow);
    var url = target.attr('src');
	target.attr('src', url).ready();
}

// 滚动到指定选项卡
function scrollToTab(element) {
    var topWindow = $(window.parent.document);
    var marginLeftVal = calSumWidth($(element).prevAll()),
    marginRightVal = calSumWidth($(element).nextAll());
    // 可视区域非tab宽度
    var tabOuterWidth = calSumWidth($(".content-tabs", topWindow).children().not(".menuTabs"));
    //可视区域tab宽度
    var visibleWidth = $(".content-tabs", topWindow).outerWidth(true) - tabOuterWidth;
    //实际滚动宽度
    var scrollVal = 0;
    if ($(".page-tabs-content", topWindow).outerWidth() < visibleWidth) {
        scrollVal = 0;
    } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
        if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
            scrollVal = marginLeftVal;
            var tabElement = element;
            while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content", topWindow).outerWidth() - visibleWidth)) {
                scrollVal -= $(tabElement).prev().outerWidth();
                tabElement = $(tabElement).prev();
            }
        }
    } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
        scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
    }
    $('.page-tabs-content', topWindow).animate({ marginLeft: 0 - scrollVal + 'px' }, "fast");
}

//计算元素集合的总宽度
function calSumWidth(elements) {
    var width = 0;
    $(elements).each(function() {
        width += $(this).outerWidth(true);
    });
    return width;
}

/** 密码规则范围验证 */
function checkpwd(chrtype, password) {
    if (chrtype == 1) {
        if(!$.common.numValid(password)){
            $.modal.alertWarning("密码只能为0-9数字");
            return false;
        }
    } else if (chrtype == 2) {
        if(!$.common.enValid(password)){
            $.modal.alertWarning("密码只能为a-z和A-Z字母");
            return false;
        }
    } else if (chrtype == 3) {
        if(!$.common.enNumValid(password)){
            $.modal.alertWarning("密码必须包含字母以及数字");
            return false;
        }
    } else if (chrtype == 4) {
        if(!$.common.charValid(password)){
            $.modal.alertWarning("密码必须包含字母、数字、以及特殊符号<font color='red'>~!@#$%^&*()-=_+</font>");
            return false;
        }
    }
    return true;
}


// 动态加载css文件
function loadCss(file, headElem) {
    var link = document.createElement('link');
    link.href = file;
    link.rel = 'stylesheet';
    link.type = 'text/css';
    if (headElem) headElem.appendChild(link);
    else document.getElementsByTagName('head')[0].appendChild(link);
}

// 动态加载js文件
function loadJs(file, headElem) {
    var script = document.createElement('script');
    script.src = file;
    script.type = 'text/javascript';
    if (headElem) headElem.appendChild(script);
    else document.getElementsByTagName('head')[0].appendChild(script);
}

