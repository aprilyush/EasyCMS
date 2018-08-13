var clients = {
    user: {},
    menu: [],
    status: {}
};
$(function () {
    $.ajax({
        async: true,
        url: "/Home/GetRoleMenu?time="+new Date(),
        type: "GET",
        data: null,
        cache: false,
        dataType: 'json',
        timeout: 5000,
        success: function (res, textStatus, jqXHr) {
            if (res.statusCode === 200) {
                clients.menu = res.data.menu;
                clients.user = res.data.user;
                clients.status = res.data.status;
                initMenuList(clients.menu);
                $('#side-menu').metisMenu();
            } else {
                clients.user.id = '';
            }
        }

    });
});

function initMenuList(data) {
    if (!$.isArray(data)) {
        return;
    }
    var html = '';
    var dlen = data.length;
    if (dlen > 0) {
        //var modules = $.grep(data, function (e, i) {
        //    return e.menu_type === 0;
        //});
        var module = $.grep(data, function (e, i) {
            return e.menu_type === 0&&e.parent_id ==='0';
        });
        //var menus = $.grep(modules, function (e, i) {
        //    return e.menu_type ===1;
        //});
        var modulelen = module.length;
        for (var i = 0; i < modulelen; i++) {
            var moduleId = module[i].id;
            html += '<li><a href="#"><i class="' + module[i].menu_icon+'" ></i><span class="nav-label">' + module[i].menu_name+'</span><span class="fa arrow"></span></a>';
            html += '<ul class="nav nav-second-level">';
            var menus = $.grep(data, function (e, i) {
                return e.parent_id === moduleId;
            });
            var mlen = menus.length;
            if (mlen > 0) {
                for (var j = 0; j < mlen; j++) {
                    if (menus[j].menu_type === 1) {
                        html += '<li><a class="J_menuItem" href = "' + menus[j].menu_url + '" data-id="' + menus[j].id +'">' + menus[j].menu_name+'</a></li>';
                    } else {
                        var menuId = menus[j].id;
                        html += '<li><a href="#"><i class="' + module[i].menu_icon +'" ></i>' + menus[j].menu_name + '<span class="fa arrow"></span></a>';
                        var thirdMenu = $.grep(data, function (e, i) {
                            return e.parent_id === menuId;
                        });
                        var thirdmlen = thirdMenu.length;
                        if (thirdmlen > 0) {
                            html += '<ul class="nav nav-third-level">';
                            
                            for (var k= 0; k< thirdmlen; k++) {
                                html += '<li><a class="J_menuItem" href = "' + thirdMenu[k].menu_url + '" data-id="' + thirdMenu[k].id + '">' + thirdMenu[k].menu_name + '</a></li>';
                            }
                            html += '</ul>';
                        }
                        html += '</li>';
                    }
                }
            }
            html += '</ul>';
            html += '</li>';
        }
    }
    if (html !== '') {
       // console.log(html);
       $('#side-menu').append(html);
    }


    //if (clients.user.UserLevel === 0) {
    //    setTimeout(function() {
    //       $.naviTab.addTab('1', '../extui/home.html', "首页");
    //        //$.naviTab.closeTab('0');
    //    }, 1000);
    //}
}





//获取子菜单
function getchildMenus(pid) {
    var list = [];
    var menuList = clients.menu;
    if (menuList.length > 0) {
        list= $.grep(menuList,function(e,i) {
            return e.parent_id === pid;
        });

        $.each(list, function (i, v) {
            if (v.menu_type === 0) {
                var sonmenu =
                    $.grep(menuList, function (e, i) {
                        return e.parent_id === v.id;
                    });
                list= list.concat(sonmenu);
            }
        });
    }
    return list;
}


//打开navitab插件
//调用事例$.naviTab.addTab('gagga', 'https://www.baidu.com', '百度');
;(function($) {
    $.naviTab ={
          addTab: function(dataId, dataUrl, menuName) {
            var flag = true;
            if (dataUrl == undefined || $.trim(dataUrl).length === 0) return false;
             // console.log(dataId);
            // 选项卡菜单已存在
            $('.J_menuTab').each(function () {
                if ($(this).data('id') === dataId) {
                    if (!$(this).hasClass('active')) {
                        $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                        $.naviTab.scrollToTab(this);
                        // 显示tab对应的内容区
                        $('.J_mainContent .J_iframe').each(function () {
                            if ($(this).data('id') === dataId) {
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
                var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataId + '" id="' + dataId+'">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
                $('.J_menuTab').removeClass('active');

                // 添加选项卡对应的iframe
                var str1 = '<iframe class="J_iframe" name="iframe' + dataId + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataId + '" seamless></iframe>';
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
                $.naviTab.scrollToTab($('.J_menuTab.active'));
            }
            return false;
        },
        closeTab: function (closeTabId) {
            //var closeTabId = $(this).parents('.J_menuTab').data('id');
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
            }
            // 当前元素不处于活动状态
            else {
                //  移除当前选项卡
                $this.remove();

                // 移除相应tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
                $.naviTab.scrollToTab($('.J_menuTab.active'));
            }
            return false;
        },
        //滚动到指定选项卡
        scrollToTab:function(element) {

            var marginLeftVal = $.naviTab.calSumWidth($(element).prevAll()), marginRightVal = $.naviTab.calSumWidth($(element).nextAll());
            // 可视区域非tab宽度
            var tabOuterWidth = $.naviTab.calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
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
        //计算元素集合的总宽度
        calSumWidth:function(elements) {
            var width = 0;
            $(elements).each(function () {
                width += $(this).outerWidth(true);
            });
            return width;
        }
    }
})(jQuery);

//修改密码
function modifyPwd() {
   jutils.dialog('changePwd', '/Login/ModifyPwd','密码修改');
    //$.naviTab.addTab('gagga', 'https://www.baidu.com', '百度');
}