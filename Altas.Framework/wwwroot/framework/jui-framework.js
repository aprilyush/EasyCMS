var clients = {
    user: {},
    menu: [],
    status: {}
};
$(function () {
    initHplus();
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


//start hplus
function initHplus(){

     //菜单点击事件
     $('#side-menu').on('click', '.J_menuItem', function() {

        var dataUrl = $(this).attr('href'),
            dataId = $(this).data('id');
        var menuName = $.trim($(this).text());
        $.altasTab.open({
            id: dataId,
            title: menuName,
            url: dataUrl,
            close: function() {
               // console.log(menuName);
            }
        });

        return false;
    });
    //关闭选项卡
    $('.J_menuTabs').on('click', '.J_menuTab i', function () {
        var dataId = $(this).parents('.J_menuTab').data('id');
        //console.log(dataId);
        $.altasTab.close(dataId);
    });
    //激活选项卡
    $('.J_menuTabs').on('click', '.J_menuTab', function () {
        var currentId = $(this).data('id');
        $.altasTab.activeTab(currentId);
    });
    //双击刷新
    $('.J_menuTabs').on('dblclick', '.J_menuTab', function () {
        $.altasTab.refreshTab();
    });
    //刷新当前
    $('.J_tabRefreshActive').on('click', function () {
        $.altasTab.refreshTab();
    });
    //关闭其他
    $('.J_tabCloseOther').on('click', function() {
        $('.page-tabs-content').children("[data-id]").not(":first").not(".active").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').css("margin-left", "0");
    });
    // 左移按扭
   // $('.J_tabLeft').on('click', scrollTabLeft);

    // 右移按扭
   // $('.J_tabRight').on('click', scrollTabRight);

    // 关闭全部
    $('.J_tabCloseAll').on('click', function () {
        $('.page-tabs-content').children("[data-id]").not(":first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').children("[data-id]:first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').show();
            $(this).addClass("active");
        });
        $('.page-tabs-content').css("margin-left", "0");
    });
    //菜单点击事件结束

       // 打开右侧边栏
       $('.right-sidebar-toggle').click(function () {
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    // 右侧边栏使用slimscroll
    $('.sidebar-container').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10
    });

    //固定菜单栏
    $('.sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9,
        alwaysVisible: false
    });

    // 菜单切换
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });


    // 侧边栏高度
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");
    }
    fix_height();

    $(window).bind("load resize click scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    //侧边栏滚动
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $('.full-height-scroll').slimScroll({
        height: '100%'
    });

    $('#side-menu>li').click(function () {
        if ($('body').hasClass('mini-navbar')) {
            NavToggle();
        }
    });
    $('#side-menu>li li a').click(function () {
        if ($(window).width() < 769) {
            NavToggle();
        }
    });

    $('.nav-close').click(NavToggle);

    //ios浏览器兼容性处理
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
        $('#content-main').css('overflow-y', 'auto');
    }


     // 收起左侧菜单
     $('#collapsemenu').click(function () {
        if ($('#collapsemenu').is(':checked')) {
            $("body").addClass('mini-navbar');
            SmoothlyMenu();

            if (localStorageSupport) {
                localStorage.setItem("collapse_menu", 'on');
            }

        } else {
            $("body").removeClass('mini-navbar');
            SmoothlyMenu();

            if (localStorageSupport) {
                localStorage.setItem("collapse_menu", 'off');
            }
        }
    });

    // 固定宽度
    $('#boxedlayout').click(function () {
        if ($('#boxedlayout').is(':checked')) {
            $("body").addClass('boxed-layout');
            $('#fixednavbar').prop('checked', false);
            $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
            $("body").removeClass('fixed-nav');
            if (localStorageSupport) {
                localStorage.setItem("fixednavbar", 'off');
            }


            if (localStorageSupport) {
                localStorage.setItem("boxedlayout", 'on');
            }
        } else {
            $("body").removeClass('boxed-layout');

            if (localStorageSupport) {
                localStorage.setItem("boxedlayout", 'off');
            }
        }
    });

    // 默认主题
    $('.s-skin-0').click(function () {
        $("body").removeClass("skin-1");
        $("body").removeClass("skin-2");
        $("body").removeClass("skin-3");
        return false;
    });

    // 蓝色主题
    $('.s-skin-1').click(function () {
        $("body").removeClass("skin-2");
        $("body").removeClass("skin-3");
        $("body").addClass("skin-1");
        return false;
    });

    // 黄色主题
    $('.s-skin-3').click(function () {
        $("body").removeClass("skin-1");
        $("body").removeClass("skin-2");
        $("body").addClass("skin-3");
        return false;
    });

    if (localStorageSupport) {
        var collapse = localStorage.getItem("collapse_menu");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");

        if (collapse == 'on') {
            $('#collapsemenu').prop('checked', 'checked')
        }
        if (fixednavbar == 'on') {
            $('#fixednavbar').prop('checked', 'checked')
        }
        if (boxedlayout == 'on') {
            $('#boxedlayout').prop('checked', 'checked')
        }
    }

    if (localStorageSupport) {

        var collapse = localStorage.getItem("collapse_menu");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");

        var body = $('body');

        if (collapse == 'on') {
            if (!body.hasClass('body-small')) {
                body.addClass('mini-navbar');
            }
        }

        if (fixednavbar == 'on') {
            $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
            body.addClass('fixed-nav');
        }

        if (boxedlayout == 'on') {
            body.addClass('boxed-layout');
        }
    }
}
//判断浏览器是否支持html5本地存储
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}

$(window).bind("load resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('mini-navbar');
        $('.navbar-static-side').fadeIn();
    }
});

function NavToggle() {
    $('.navbar-minimalize').trigger('click');
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 100);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 300);
    } else {
        $('#side-menu').removeAttr('style');
    }
}
//end hplus

//初始化菜单
function initMenuList(data) {
    if (!$.isArray(data)) {
        return;
    }
    var arr, reg = new RegExp("(^| )webLang=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        lang = unescape(arr[2]);
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
                            
                            for (var k = 0; k < thirdmlen; k++) {
                               
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
       $('#side-menu').append(html);
    }
    
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
                var sonmenu =$.grep(menuList, function (e, i) {
                        return e.parent_id === v.id;
                    });
                list= list.concat(sonmenu);
            }
        });
    }
    return list;
}

function modifyPwd() {
    jutils.dialog('changePwd', '/Login/ModifyPwd','密码修改');
}

