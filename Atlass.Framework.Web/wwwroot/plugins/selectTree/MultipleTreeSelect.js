(function(e){e.fn.extend({slimScroll:function(f){var a=e.extend({width:"auto",height:"250px",size:"7px",color:"#000",position:"right",distance:"1px",start:"top",opacity:.4,alwaysVisible:!1,disableFadeOut:!1,railVisible:!1,railColor:"#333",railOpacity:.2,railDraggable:!0,railClass:"slimScrollRail",barClass:"slimScrollBar",wrapperClass:"slimScrollDiv",allowPageScroll:!1,wheelStep:20,touchScrollStep:200,borderRadius:"7px",railBorderRadius:"7px"},f);this.each(function(){function v(d){if(r){d=d||window.event;
    var c=0;d.wheelDelta&&(c=-d.wheelDelta/120);d.detail&&(c=d.detail/3);e(d.target||d.srcTarget||d.srcElement).closest("."+a.wrapperClass).is(b.parent())&&n(c,!0);d.preventDefault&&!k&&d.preventDefault();k||(d.returnValue=!1)}}function n(d,g,e){k=!1;var f=b.outerHeight()-c.outerHeight();g&&(g=parseInt(c.css("top"))+d*parseInt(a.wheelStep)/100*c.outerHeight(),g=Math.min(Math.max(g,0),f),g=0<d?Math.ceil(g):Math.floor(g),c.css({top:g+"px"}));l=parseInt(c.css("top"))/(b.outerHeight()-c.outerHeight());g=
    l*(b[0].scrollHeight-b.outerHeight());e&&(g=d,d=g/b[0].scrollHeight*b.outerHeight(),d=Math.min(Math.max(d,0),f),c.css({top:d+"px"}));b.scrollTop(g);b.trigger("slimscrolling",~~g);w();p()}function x(){u=Math.max(b.outerHeight()/b[0].scrollHeight*b.outerHeight(),30);c.css({height:u+"px"});var a=u==b.outerHeight()?"none":"block";c.css({display:a})}function w(){x();clearTimeout(B);l==~~l?(k=a.allowPageScroll,C!=l&&b.trigger("slimscroll",0==~~l?"top":"bottom")):k=!1;C=l;u>=b.outerHeight()?k=!0:(c.stop(!0,
    !0).fadeIn("fast"),a.railVisible&&m.stop(!0,!0).fadeIn("fast"))}function p(){a.alwaysVisible||(B=setTimeout(function(){a.disableFadeOut&&r||y||z||(c.fadeOut("slow"),m.fadeOut("slow"))},1E3))}var r,y,z,B,A,u,l,C,k=!1,b=e(this);if(b.parent().hasClass(a.wrapperClass)){var q=b.scrollTop(),c=b.siblings("."+a.barClass),m=b.siblings("."+a.railClass);x();if(e.isPlainObject(f)){if("height"in f&&"auto"==f.height){b.parent().css("height","auto");b.css("height","auto");var h=b.parent().parent().height();b.parent().css("height",
    h);b.css("height",h)}else"height"in f&&(h=f.height,b.parent().css("height",h),b.css("height",h));if("scrollTo"in f)q=parseInt(a.scrollTo);else if("scrollBy"in f)q+=parseInt(a.scrollBy);else if("destroy"in f){c.remove();m.remove();b.unwrap();return}n(q,!1,!0)}}else if(!(e.isPlainObject(f)&&"destroy"in f)){a.height="auto"==a.height?b.parent().height():a.height;q=e("<div></div>").addClass(a.wrapperClass).css({position:"relative",overflow:"hidden",width:a.width,height:a.height});b.css({overflow:"hidden",
    width:a.width,height:a.height});var m=e("<div></div>").addClass(a.railClass).css({width:a.size,height:"100%",position:"absolute",top:0,display:a.alwaysVisible&&a.railVisible?"block":"none","border-radius":a.railBorderRadius,background:a.railColor,opacity:a.railOpacity,zIndex:90}),c=e("<div></div>").addClass(a.barClass).css({background:a.color,width:a.size,position:"absolute",top:0,opacity:a.opacity,display:a.alwaysVisible?"block":"none","border-radius":a.borderRadius,BorderRadius:a.borderRadius,MozBorderRadius:a.borderRadius,
    WebkitBorderRadius:a.borderRadius,zIndex:99}),h="right"==a.position?{right:a.distance}:{left:a.distance};m.css(h);c.css(h);b.wrap(q);b.parent().append(c);b.parent().append(m);a.railDraggable&&c.bind("mousedown",function(a){var b=e(document);z=!0;t=parseFloat(c.css("top"));pageY=a.pageY;b.bind("mousemove.slimscroll",function(a){currTop=t+a.pageY-pageY;c.css("top",currTop);n(0,c.position().top,!1)});b.bind("mouseup.slimscroll",function(a){z=!1;p();b.unbind(".slimscroll")});return!1}).bind("selectstart.slimscroll",
    function(a){a.stopPropagation();a.preventDefault();return!1});m.hover(function(){w()},function(){p()});c.hover(function(){y=!0},function(){y=!1});b.hover(function(){r=!0;w();p()},function(){r=!1;p()});b.bind("touchstart",function(a,b){a.originalEvent.touches.length&&(A=a.originalEvent.touches[0].pageY)});b.bind("touchmove",function(b){k||b.originalEvent.preventDefault();b.originalEvent.touches.length&&(n((A-b.originalEvent.touches[0].pageY)/a.touchScrollStep,!0),A=b.originalEvent.touches[0].pageY)});
    x();"bottom"===a.start?(c.css({top:b.outerHeight()-c.outerHeight()}),n(0,!0)):"top"!==a.start&&(n(e(a.start).position().top,null,!0),a.alwaysVisible||c.hide());window.addEventListener?(this.addEventListener("DOMMouseScroll",v,!1),this.addEventListener("mousewheel",v,!1)):document.attachEvent("onmousewheel",v)}});return this}});e.fn.extend({slimscroll:e.fn.slimScroll})})(jQuery);
(function ($) {
    var $target_element;
    var defaults = {
        /*  textLabel: "",*/
        zNodes: [],
        async: {
            enable: false,
            url: ""
        },
        callback: {
            onCheck: function (treeNode) {

            }
        },
        chkStyle: "checkbox"
        , radioType: "all",
        height: 'auto'
    };

    var DrawMultipleTree = function (target_element, options) {
        this.$target_element = $(target_element);
        _self = this;

        var $options = function () {
            return $.extend({}, defaults, options, _self.$target_element.data());//合并业务数据
        }
        /*避免共用同一个配置时两边干扰*/
        this.options = cloneObj(new $options());
        this.init();
    }

    function GenNonDuplicateID(randomLength) {
        return Number(Math.random().toString().substr(3, randomLength) +new Date().getTime()).toString(36)
    }

    var cloneObj = function (obj) {
        var newObj = {};
        if (obj instanceof Array) {
            newObj = [];
        }
        for (var key in obj) {
            var val = obj[key];
            newObj[key] = typeof val === 'object' ? cloneObj(val) : val;
        }
        return newObj;
    };
    /**
     *
     * 成员和方法
     */
    DrawMultipleTree.prototype = {
        constructor: DrawMultipleTree,
        init: function () {
            var _self = this;
            this.targetOffset = this.$target_element.offset();
            this.$target_element.nameLabel = this.$target_element.attr("name");
            this.$target_element.idLabel = this.$target_element.attr("id");
            this.$target_element.checks = this.$target_element.attr("checks");
            this.$target_element.textLabel = this.$target_element.attr("textLabel");
            /*为了增加但页面应用的兼容性增加id属性*/
            if (this.$target_element.idLabel === undefined || this.$target_element.idLabel === "") {
                this.$target_element.idLabel = GenNonDuplicateID(3);
            }
            if (this.$target_element.nameLabel === undefined || this.$target_element.nameLabel === "") {
                this.$target_element.nameLabel = GenNonDuplicateID(3);
            }
            this.$target_element.attr("name",  this.$target_element.textLabel === "" ? this.$target_element.nameLabel + "text" :  this.$target_element.textLabel);
            /*默认以当前元素为选项容器*/
            /*初始化树容器*/
            this.init_tree_container = init_tree_container.call(this);
            this.init_ztree = init_ztree.call(this)
            /*给元素绑定点击事件*/
            bind_element_click_event.call(this)
            /*挂载树容器*/

        },
        /*获取选中的选项*/
        getChecks: function (type) {
            var zTreeObj = this.$zTreeObj
            nodes = zTreeObj.getCheckedNodes(true),
                v = "";
            rv = "";
            for (var i = 0, l = nodes.length; i < l; i++) {
                v += nodes[i].name + ",";
                rv += nodes[i].id + ",";
            }
            if (v.length > 0) v = v.substring(0, v.length - 1);
            if (rv.length > 0) rv = rv.substring(0, rv.length - 1);

            if("val"===type)
                return rv;
            if("text"===type)
                return v;
        }
    }
    var bind_element_click_event = function () {
        var tree_container = this.tree_container;
        this.$target_element.click(function (event) {
            event.stopPropagation();
            if(!tree_container.is(':visible')){
                tree_container.slideDown("fast");
            }else{
                tree_container.animate({height: 'toggle', opacity: 'toggle'}, "fast");
            }
        });
        this.all_container. mouseleave(function () {

            if(tree_container.is(':visible') ){

                tree_container.animate({height: 'toggle', opacity: 'toggle'}, "fast");
            }
        });
        /*解决鼠标快速移动不兼容问题*/
        this.tree_container.find("a").mouseleave(function (event) {
            event.stopPropagation();
        });
        this.tree_container.find("span").mouseleave(function (event) {
            event.stopPropagation();
        });

    }
    /*绘制容器和样式*/
    var init_tree_container = function () {
        this.ztreeid = this.$target_element.idLabel + "_zTree";
         this.$target_element.css({display:'block'});
        this.all_container = this.$target_element.wrap('<div class="mts-container" style="inline-block;position: relative;"/>').parent();
        this.tree_container = $('<div   class="menuContent" style="display:none;background-color: white; position: absolute;z-index:110004;border: solid 1px;border-radius: 5px;padding-bottom: 10px" >' +
            '<ul id="' + this.ztreeid + '" class="ztree" style="padding:0 0;margin-top:0;border: none;border-radius: 5px;  height:'+this.options.height+'; width:' +getelementwidth(this.$target_element) + '; background-color: white"></ul>' +
            '</div>').insertAfter(this.$target_element);
        this.checked_val_element = $('<input type="hidden" name="' +
            this.$target_element.nameLabel + '">').insertAfter(this.tree_container);
        $('#'+this.ztreeid).slimScroll({
            height: this.options.height,
            width:getelementwidth(this.$target_element)
        });

        return this;
    }
    function getelementwidth(element){

        return element.outerWidth()-2;
    }
    var init_ztree = function () {
        var inner_$target_element = this.$target_element;
        var inner_$checked_val_element = this.checked_val_element;
        var inner_$checks = this.$target_element.checks;
       var callback_$oncheck = this.options.callback.onCheck;
        ztreeonAsyncSuccess = function (event, treeId, treeNode, msg) {
            zTreeObj.setting.callback.onCheck();
            $('#'+treeId).find("a").mouseleave(function (event) {
                event.stopPropagation();
            });
            $('#'+treeId).find("span").mouseleave(function (event) {
                event.stopPropagation();
            });
        };
        var initNodeCheckeState = function (checks, nodes) {
            if (checks != "" && checks != undefined && checks != null) {
               var checks_array= checks.split(',');
                for (var i = 0; i < nodes.length; i++) {
                    for(var t = 0; t < checks_array.length; t++){
                        if ((""+nodes[i].id)===checks_array[t]) {
                            nodes[i].checked = true
                        }
                    }

                }
            }
            return nodes;
        }
        var ztreeOnCheck = function (e, treeId, treeNode) {

            nodes = zTreeObj.getCheckedNodes(true),
                v = "";
            rv = "";
            for (var i = 0, l = nodes.length; i < l; i++) {
                v += nodes[i].name + ",";
                rv += nodes[i].id + ",";
            }
            if (v.length > 0) v = v.substring(0, v.length - 1);
            if (rv.length > 0) rv = rv.substring(0, rv.length - 1);
            inner_$target_element.val(v);
            inner_$checked_val_element.attr("value", rv);
            callback_$oncheck(nodes);
        }
        var setting = {
            check: {
                enable: true,
                chkboxType: {"Y": "", "N": ""},
                chkStyle:this.options.chkStyle,
                radioType:this.options.radioType
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: ztreeOnCheck,
                onAsyncSuccess: ztreeonAsyncSuccess,
                onClick: function (e, treeId, treeNode, clickFlag) {

                    zTreeObj.checkNode(treeNode, !treeNode.checked, true);
                    zTreeObj.setting.callback.onCheck();
                }
            },
            async: this.options.async

        };
        /*异步完成后设置初始选中的值*/
        setting.async.dataFilter = function (treeId, parentNode, responseData) {
            if (responseData) {
                initNodeCheckeState(inner_$checks, responseData);
            }
            return responseData;
        };
        this.options.zNodes = initNodeCheckeState(inner_$checks, this.options.zNodes)
        var zTreeObj = $.fn.zTree.init($("#" + this.ztreeid), setting, this.options.zNodes);
        zTreeObj.setting.callback.onCheck();
        this.$zTreeObj = zTreeObj;
        return this

    }

    var DrawNormalTree = function (target_element, options) {
        this.$target_element = $(target_element);
        this.$target_element.hide();
    }

    /**
     * 多选模式
     * @param options
     * @returns {*}
     */
    $.fn.drawMultipleTree = function (options) {
        var option = arguments[0], value
        args = arguments;
        this.each(function () {
            var $this = $(this);
            data = $this.data('drawMultipleTree')
            if (!data) {
                $.data(this, 'drawMultipleTree', new DrawMultipleTree(this, options));
            }
            if (typeof option === 'string') {

                value = data[option](args[1]);

            }

        });
        return typeof value !== 'undefined' ? value : this;
    };
})(jQuery)
