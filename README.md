<!--
 * @Author: your name
 * @Date: 2020-12-28 17:31:14
 * @LastEditTime: 2021-03-10 16:36:07
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \undefinede:\开源\Atlass开发框架\EasyCMS\README.md
-->

# EasyCms
  <font face="黑体" color=#FF0000>禁止使用，禁止使用，禁止使用，正在升级net5.0,升级若依的UI和权限重构</font>
&emsp;&emsp;EasyCms后台管理系统 基于Asp.net Core的后台快速开发框架，可用于快速开发企业后台管理系统，企业站，微信公众号和小程序后台。
## 发展目标
&emsp;&emsp;EasyCms是基于Atlass Framework实现一个产品化的项目，Atlass Framework原来是实现一个适合自己公司项目的基础开发框架。  
 &emsp;&emsp;由于本人近两年一直和本地一家公司长期合为政府部门做CMS系统以及其他后台管理系统，自认为还是比较了解这些部门需要什么样的cms管理系统，需要哪些功能，
 所以目标是实现一个适合这些部门的功能相对完善的cms系统。  

 ## 目标客户为：
 **满足大部分企业建站需求，政府部门，事业单位使用的CMS管理系统**
## 技术介绍
+ 基于Aspnet core3.1  
+ ORM使用[FreeSql](https://github.com/dotnetcore/FreeSql),默认使用mysql数据库
+ [Redis](https://github.com/tporadowski/redis)操作使用[csredis](https://github.com/2881099/csredis)
+ 缓存使用[EasyCaching](https://github.com/dotnetcore/EasyCaching)
+ 后台模板使用H+，如果有赞助的话，后期买个admui替换掉。
+ 静态页面生成模板引擎：[VTemplate.Engine](https://github.com/jasonyush/VTemplate.Engine)强大的模板引擎能够实现任何你想要的页面静态化
+ 定时任务采用[hangfire](https://github.com/HangfireIO/Hangfire)
+ 其他就不列举了。。
## 演示地址：
 windows2016服务器：http://cms.atlass.cn:9090  
 debian10服务器：http://cmsl.atlass.cn/  
 因项目在开发中，不再提供后台演示用户，只演示前台，用于展示模板的渲染能力，如果感兴趣，请下载源码  
 本地超级管理员 admin 123123  
 包含Mysql,SqlServer,PostgreSql三个数据库的脚本
## 依赖环境
  [模板使用文档](https://www.yuque.com/jasonyush/easycms/dorh3a)
## 依赖环境
 .net5.0, redis,mysql,SqlServer,PostgreSql
## 功能列表（只列出CMS模块的）
+ [x] 栏目管理
+ [x] 文章管理
+ [x] 模板管理
+ [x] 模板匹配
+ [x] 静态页面生成（可以实现完全静态页面访问，也可以使用路由方式访问，没静态页面要求的，建议使用路由方式）
+ [X] 前台IP访问限制
+ [X] 站点信息设置
+ [X] 上传设置，水印设置
+ [X] 文章内容插入视频，大文件分片上传，播放器使用ckplayer
+ [x] 提供文章，栏目，站点信息的常用数据源，用于页面渲染调用
+ [x] 广告管理
+ [x] 通讯录
+ [x] 会议管理
+ [ ] 站点总访问量，在线人数统计
+ [ ] 栏目权限，文章数据权限
+ [ ] 意见反馈
+ [ ] 前台用户中心(这个功能感觉不是很必要，除非需要实现普通用户投稿)
## [样图]  
![Image](资料/home.png)
## [更新日志(详细)](Update.md) 
## 2020-05-19
1. 首页模板渲染静态页面
2. 栏目模板路由渲染
3. VTemplate.Engine适配
## 2020-05-16
1. 内容管理
2. 栏目管理
3. 模板管理
## 2020-05-11
 1. 升级到asp.net core 3.1  
 2. 重写定时任务   
 3. 架构拆分，部分重构  
 4. orm框架更新为Freesql  
 5. 页面按钮全部更改为权限控制  
 6. 日志框架更新为serilog,增加异常写数据库  
 7. 重构RequestHelper类库  
 8. 开启日常更新，增加CMS功能  