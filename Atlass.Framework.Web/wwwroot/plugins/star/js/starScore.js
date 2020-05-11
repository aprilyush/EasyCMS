function scoreFun(object,opts){
	// 默认属性
	var defaults={
		fen_d:16,  // 每个a的宽度
		ScoreGrade:10,  // a的个数
		types:["很不满意",
		       "差得太离谱，与卖家描述的严重不符，非常不满",
		       "不满意",
		       "部分有破损，与卖家描述的不符，不满意",
		       "一般",
		       "质量一般",
		       "没有卖家描述的那么好",
		       "满意",
		       "质量不错，与卖家描述的基本一致，还是挺满意的",
		       "非常满意",
		       "很差",
		       "差",
		       "一般",
		       "好",
		       "很好"],
		       nameScore:"fenshu",
		       parent:"star_score",
		       attitude:"attitude"};
		options=$.extend({},defaults,opts);
		var countScore=object.find("."+options.nameScore);  // 找到名为“fenshu”的类
		var startParent=object.find("."+options.parent);    // 找到名为“star_score”的类
		var atti=object.find("."+options.attitude);    // 找到名为“attitude”的类
		var now_cli;
		var fen_cli;
		var atu;
		var fen_d=options.fen_d;     // 每个a的宽度
		var len=options.ScoreGrade;  // 把a的个数赋值给len
		startParent.width(fen_d*len); //包含a的div盒子的宽度
		var preA=(5/len);
		for(var i=0;i<len;i++){
			var newSpan=$("<a href='javascript:void(0)'></a>");     // 不整体刷新页面的情况下，可以使用void(0)
			newSpan.css({"left":0,"width":fen_d*(i+1),"z-index":len-i});  // 设置a的宽度、层级
			newSpan.appendTo(startParent)
		}                                    //  把a放到类名为“star_score”的div里
	  startParent.find("a").each(          // each（）方法
	  	function(index,element){
		  	$(this).click(function(){        // 点击事件
		  	now_cli=index;                   // 当前a的索引值
		  	show(index,$(this))             //  调用show方法
		  });
		  $(this).mouseenter(function(){    /* mouseenter事件(与 mouseover 事件不同，只有在鼠标指针穿过被选元素时，
		  	                                 才会触发 mouseenter 事件。如果鼠标指针穿过任何子元素，同样会触发 mouseover 事件。) */
        show(index,$(this))
		  });
		  $(this).mouseleave(function(){    // mouseleave事件 
		  	if(now_cli>=0){
		  		var scor=preA*(parseInt(now_cli)+1);         // 评分
		  		startParent.find("a").removeClass("clibg");  // 清除a的“clibg”类
		  		startParent.find("a").eq(now_cli).addClass("clibg"); // eq()选择器，选取索引值为“now_cli”的a，给它加上“clibg”类
		  		var ww=fen_d*(parseInt(now_cli)+1);                  // 当前a的宽度
		  		startParent.find("a").eq(now_cli).css({"width":ww,"left":"0"});  // 给索引值为“now_cli”的a加上宽度“ww”和left值
		  		if(countScore){
		  			countScore.text(scor)
		  		} 
		  	}else{
		  		startParent.find("a").removeClass("clibg");
		  		if(countScore){
		  			countScore.text("")
		  		}
		  	}
		  })
		});
 
      // show方法
		  function show(num,obj){
		  	var n=parseInt(num)+1;
		  	var lefta=num*fen_d;
		  	var ww=fen_d*n;
		  	var scor=preA*n;                        // 评分
		  	(len>5)?atu=options.types[parseInt(num)]:atu=options.types[parseInt(num)+10];       // 用户态度
		  	object.find("a").removeClass("clibg");  // 清除所有a的“clibg”类
		  	obj.addClass("clibg");                  // 给当前a添加“clibg”类
		  	obj.css({"width":ww,"left":"0"});       // 给当前a添加宽度“ww”和left值
		  	countScore.text(scor);                  // 显示评分
		  	atti.text(atu);                        // 显示用户态度
		  }
		};