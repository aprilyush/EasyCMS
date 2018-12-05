;(function ($) {
    var defaults = {
        id: null,
        title: '新标签',
        url: null,
        close: null
    };
    $.altasTab = {
       
        open: function (options) {
            var _this=this;
            var opts = $.extend(defaults, options || {});
            this.options=opts;
            //$.altasTab.data.onClosed = opts.close;
            var flag = true;
            if (opts.url == undefined || $.trim(opts.url).length === 0) return false;
            // console.log(dataId);
            // 选项卡菜单已存在
            $('.J_menuTab').each(function () {
                if ($(this).data('id') === opts.id) {
                    if (!$(this).hasClass('active')) {
                        $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                        $.altasTab.scrollToTab(this);
                        // 显示tab对应的内容区
                        $('.J_mainContent .J_iframe').each(function () {
                            if ($(this).data('id') === opts.id) {
                                $(this).show().siblings('.J_iframe').hide();
                                return false;
                            }
                        });
                    }
                    flag = false;
                    return false;
                }
            });

            // 选项卡菜单不存在
            if (flag) {
                var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + opts.id + '" id="' + opts.id + '">' + opts.title + ' <i class="fa fa-times-circle"></i></a>';
                $('.J_menuTab').removeClass('active');

                // 添加选项卡对应的iframe
                var str1 = '<iframe class="J_iframe" name="iframe' + opts.id + '" width="100%" height="100%" src="' + opts.url + '" frameborder="0" data-id="' + opts.id + '" seamless></iframe>';
                $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

                //显示loading提示
                var lindex = layer.msg('加载中', {
                    icon: 16
                    , shade: 0.01
                });
                $('.J_mainContent iframe:visible').load(function () {
                    //iframe加载完成后隐藏loading提示
                    layer.close(lindex);
                });
                // 添加选项卡
                $('.J_menuTabs .page-tabs-content').append(str);
                $.altasTab.scrollToTab($('.J_menuTab.active'));
            }

            return false;
        },
        scrollToTab: function (element) {
            var marginLeftVal = $.altasTab.calSumWidth($(element).prevAll()), marginRightVal = $.altasTab.calSumWidth($(element).nextAll());
            // 可视区域非tab宽度
            var tabOuterWidth = $.altasTab.calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
            //可视区域tab宽度
            var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
            //实际滚动宽度
            var scrollVal = 0;
            if ($(".page-tabs-content").outerWidth() < visibleWidth) {
                scrollVal = 0;
            } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
                if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                    scrollVal = marginLeftVal;
                    var tabElement = element;
                    while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                        scrollVal -= $(tabElement).prev().outerWidth();
                        tabElement = $(tabElement).prev();
                    }
                }
            } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
                scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
            }
            $('.page-tabs-content').animate({
                marginLeft: 0 - scrollVal + 'px'
            }, "fast");
        },
        close: function (closeTabId) {
            //console.log(this);
            if (!closeTabId) {
                return false;
                //closeTabId = this.options.id;
            }
            var $this = $('#' + closeTabId);
            var currentWidth = $this.width();

            // 当前元素处于活动状态
            if ($this.hasClass('active')) {

                // 当前元素后面有同辈元素，使后面的一个元素处于活动状态
                if ($this.next('.J_menuTab').size()) {

                    var activeId = $this.next('.J_menuTab:eq(0)').data('id');
                    $this.next('.J_menuTab:eq(0)').addClass('active');

                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });

                    var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                    if (marginLeftVal < 0) {
                        $('.page-tabs-content').animate({
                            marginLeft: (marginLeftVal + currentWidth) + 'px'
                        }, "fast");
                    }

                    //  移除当前选项卡
                    $this.remove();
                  
                    // 移除tab对应的内容区
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == closeTabId) {
                            $(this).remove();
                            return false;
                        }
                    });
                }
              //  var onClose = options.onClose ? options.onClose.toFunc() : null
                // 当前元素后面没有同辈元素，使当前元素的上一个元素处于活动状态
                if ($this.prev('.J_menuTab').size()) {
                    var activeId = $this.prev('.J_menuTab:last').data('id');
                    $this.prev('.J_menuTab:last').addClass('active');
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });

                    //  移除当前选项卡
                    $this.remove();

                    // 移除tab对应的内容区
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == closeTabId) {
                            $(this).remove();
                            return false;
                        }
                    });
                }
                var onClose= this.options.close;
                if(onClose){
                    onClose.apply(this);
                }
            }
            // 当前元素不处于活动状态
            else {
                //  移除当前选项卡
                $this.remove();

                // 移除相应tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') === closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
                $.altasTab.scrollToTab($('.J_menuTab.active'));
            }
            return false;
        },
        //点击选项卡激活
        activeTab: function (tabId) {
            var $this = $('#' + tabId);
            if (!$this.hasClass('active')) {
                //var currentId = $(this).data('id');
               
                // 显示tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') === tabId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });
                $this.addClass('active').siblings('.J_menuTab').removeClass('active');
                $.altasTab.scrollToTab($this);
            }
            
           
        },
        //刷新
        refreshTab: function() {
            var $tab = $('.page-tabs-content').find('a.active');
            var dataid = $tab.data('id');
            var target = $('.J_iframe[data-id="' + dataid + '"]');
            var url = target.attr('src');
            var lindex = layer.msg('加载中', {
                icon: 16
                , shade: 0.01
            });
            target.attr('src', url).load(function () {
                layer.close(lindex);
            });
            return false;
        },
        //计算元素集合的总宽度
        calSumWidth: function (elements) {
            var width = 0;
            $(elements).each(function () {
                width += $(this).outerWidth(true);
            });
            return width;
        }



    };

    //$.altas.data = {
    //    win: null,
    //    onClosed: function () { }
    //};

})(jQuery);