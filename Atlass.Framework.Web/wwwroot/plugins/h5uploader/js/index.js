var vm = new Vue({
    el: '#jddk',
    data: {
        imgs:[],
        addShow:true,
        mltoast:{
            show:false,
            text:''
        }
    },
    mounted:function(){
        this.login();
    },
    methods:{
        // 选择图片
        chooseImg:function(e){
            var that = this;
            var files = e.target.files;
            var imgsLength = this.imgs.length;
            var maxLength = 3;
             //还可以上传的图片数量
            var count = maxLength - imgsLength;
            // 限制最多3张
            if (imgsLength >= maxLength) {
                this.addShow = false;
                this.toast('最多上传3张');
            }
            if(files.length >= 3){
                this.addShow = false;
                this.toast('最多上传3张');
            }
            // 有选择图片
            if (count != 0) {
                if(files.length == 1){
                    canvasResize(files[0], {
                            crop: false,
                            quality: 0.9,
                            rotate: 0,
                            callback(baseStr) {
                                that.imgs.push(baseStr)
                            }
                        })
                }else{
                    for (let i = 0; i < count; i++) {
                        canvasResize(files[i], {
                            crop: false,
                            quality: 0.9,
                            rotate: 0,
                            callback(baseStr) {
                                that.imgs.push(baseStr)
                            }
                        })
                    }  
                }
            }
        },
        // 删除图片
        delImg:function(index){
            this.imgs.splice(index,1);
            this.addShow = true;
        },
        // 登录
        login:function(){
            
            $.ajax({
                url:'http://test.360guanggu.com/xyzl/weixin.php/Index/test?type=1&uid=3',
                dataType:'json',
                success:function(res){
                    console.log(res)
                },
                error:function(){
                    console.log('error')
                }
            })
            console.log('dddddddddd')
            $.ajax({
                url: 'http://test.360guanggu.com/xyzl/weixin.php/Member/question_list',
                dataType: 'json',
                success: function (e) {
                    console.log(e)
                }
            })
        },
        // 上传到后台
        submit:function(){
        
            var that = this;
            var form = new FormData();
            form.append("type", "1");
            form.append("image", that.imgs);
            form.append("question", "33333");
            form.append("is_anonym", 1);
            $.ajax({
                url: 'http://test.360guanggu.com/xyzl/weixin.php/Member/question_add',
                dataType: 'json',
                type:'POST',
                data:form,
                processData: false,
                contentType: false,
                success: function (res) {
                    console.log(res)
                },
                error: function () {
                    console.log('error')
                }
            })

            // axios({
            //     url: 'http://test.360guanggu.com/xyzl/weixin.php/Member/question_detail',
            //     method:'post',
            //     data: {
            //         type: 1,
            //         image: that.imgs,
            //         question:'33333',
            //         is_anonym:1
            //     },
            //     headers: {"Content-Type": "multipart/form-data"}
            // })
            // .then(function(res) {
            //     console.log(res)
            // })
            // .catch(function(error) {
            //     console.log(error);
            // });
        },
        // toast
        // toast:function(text){
        //     this.mltoast.text = text;
        //     this.mltoast.show = true;
        //     setTimeout(() => {
        //       this.mltoast.show = false;
        //     }, 1500)
        // }
      
    }
})