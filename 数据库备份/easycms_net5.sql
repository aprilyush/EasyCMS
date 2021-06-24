/*
 Navicat Premium Data Transfer

 Source Server         : mysql123123
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : easycms_net5

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 24/06/2021 10:47:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告标题',
  `ad_href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接',
  `ad_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告图',
  `enable_status` tinyint(1) NOT NULL,
  `image_width` int(11) NOT NULL COMMENT '显示宽度',
  `image_height` int(11) NOT NULL COMMENT '显示高度',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES (1, '广告测试', 'www.badu.com', '/upfiles/images/20210419/f4f1e4166661432991c83c70daa1e528.png', 1, 100, 150, '2020-06-22 11:35:01', 'admin', '2021-04-19 09:48:01', 'admin');
INSERT INTO `cms_ad` VALUES (2, '广告二', 'www.baidu.com', '/upfiles/images/20210419/607ce176569ee4364cca7013.png', 1, 100, 100, '2021-04-19 09:48:41', 'admin', '2021-04-19 09:48:41', 'admin');

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '栏目名称',
  `channel_index` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '栏目索引',
  `parent_id` int(11) NOT NULL COMMENT '上级栏目',
  `channel_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '栏目图片',
  `channel_href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '外链',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `channel_template` int(11) NOT NULL DEFAULT 0 COMMENT '栏目模板',
  `content_template` int(10) NOT NULL DEFAULT 0 COMMENT '内容模板',
  `drawing_enable` tinyint(255) NOT NULL DEFAULT 0 COMMENT '渲染标识：1-渲染，0-不渲染 根据需要判断',
  `link_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '链接类型：0-默认，1-链接到第一篇文章,2-链接到子栏目',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '栏目信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES (1, '产品', '产品', 0, '/upfiles/images/20210422/95f632254bfe477f8aa9ab1d3a6e4b7b.jpg', '', 1, 0, 0, 1, 0, 'admin', '2020-05-13 10:10:42', 'admin', '2021-04-22 10:29:45');
INSERT INTO `cms_channel` VALUES (6, '新闻动态', '新闻动态', 0, '/upfiles/images/20210422/a88f6a835b364cf59541729481717a9d.jpg', '', 2, 0, 0, 1, 0, 'admin', '2020-05-19 12:32:13', 'admin', '2021-04-22 10:30:09');
INSERT INTO `cms_channel` VALUES (8, '联系我们', '联系我们', 0, '/upfiles/images/20210422/4bfdfca8de40453b8498085b451b01f2.jpg', '', 7, 7, 5, 1, 1, 'admin', '2020-05-19 12:33:01', 'admin', '2021-04-22 11:29:59');
INSERT INTO `cms_channel` VALUES (10, 'Banner', 'Banner', 0, '/upfiles/images/20210422/e11590b8a8324cce9dc60c052643dfe4.png', '', 0, 0, 0, 0, 0, 'admin', '2020-05-19 12:41:15', 'admin', '2021-04-22 10:32:36');
INSERT INTO `cms_channel` VALUES (13, '成功案例', '成功案例', 0, '/upfiles/images/20210422/80a16910fe7c42b2b5a07e6286526240.jpg', '', 3, 0, 0, 1, 0, 'admin', '2021-04-22 10:30:47', 'admin', '2021-04-22 10:30:47');
INSERT INTO `cms_channel` VALUES (14, '关于我们', '关于我们', 0, '/upfiles/images/20210422/e6aa9e456cd24f8bb7d9c1fd77b99bc7.jpg', '', 6, 7, 5, 1, 1, 'admin', '2021-04-22 10:55:42', 'admin', '2021-04-22 11:29:51');
INSERT INTO `cms_channel` VALUES (15, '专业服务', '专业服务', 0, '/upfiles/images/20210422/6080ec04569ee42f08ea754e.jpg', '', 4, 0, 0, 0, 0, 'admin', '2021-04-22 11:22:47', 'admin', '2021-04-22 11:23:11');
INSERT INTO `cms_channel` VALUES (16, '友情链接', '友情链接', 0, '', '', 8, 0, 0, 0, 0, 'admin', '2021-04-23 14:12:57', 'admin', '2021-04-23 14:12:57');

-- ----------------------------
-- Table structure for cms_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章标题',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `summary` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '简介',
  `cover_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '封面图片',
  `dept_id` bigint(11) NOT NULL COMMENT '作者归属部门',
  `channel_id` int(11) NOT NULL COMMENT '栏目id',
  `ip_limit` tinyint(2) NOT NULL COMMENT '是否开启ip访问限制',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '标签',
  `content_status` tinyint(3) NOT NULL COMMENT '文章状态 0-待审，1-通过，2-草稿，100-审核不通过',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '作者',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '来源',
  `content_href` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '外链',
  `hit_count` int(11) NOT NULL DEFAULT 0 COMMENT '点击量',
  `is_top` tinyint(2) NOT NULL COMMENT '是否置顶 0-不置顶，1-置顶',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐 0-不推荐，1-推荐',
  `publish_time` datetime(0) NOT NULL COMMENT '自定义发布时间',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`, `publish_time`) USING BTREE,
  INDEX `idx_channel`(`channel_id`, `publish_time`) USING BTREE,
  INDEX `idx_creator`(`create_by`, `publish_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_content
-- ----------------------------
INSERT INTO `cms_content` VALUES (17, '联系我们', '联系我们', '<p>&nbsp; &nbsp; &nbsp; &nbsp;EasyCms<br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>地址：无锡市新吴区新洲生态园</p></li><li><p>总机：15961820351</p></li><li><p>电邮：461733078@qq.com</p></li></ul><p><br/></p><p><br/></p>', '', '', 0, 8, 0, '', 1, 'EasyCMS', 'EasyCMS', '', 0, 0, 0, '2020-06-03 14:22:06', 'admin', '2020-06-03 14:22:06', 'admin', '2020-06-03 14:22:06');
INSERT INTO `cms_content` VALUES (28, '专业快速', '', '', '', '/upfiles/images/20210422/6080e16a569ee42550277267.jpg', 0, 10, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 10:36:55', 'admin', '2021-04-22 10:37:34', 'admin', '2021-04-22 11:12:05');
INSERT INTO `cms_content` VALUES (29, '完美适配PC和移动端', '', '', '', '/upfiles/images/20210422/4d365835e4eb48d5a0517bdbf097ae4c.jpg', 0, 10, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 10:37:35', 'admin', '2021-04-22 10:37:45', 'admin', '2021-04-22 11:11:39');
INSERT INTO `cms_content` VALUES (30, '做您的建站专家', '', '', '', '/upfiles/images/20210422/819aa785f8e9411193015c37d75160be.jpg', 0, 10, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 11:12:05', 'admin', '2021-04-22 11:12:50', 'admin', '2021-04-22 11:12:50');
INSERT INTO `cms_content` VALUES (31, 'JS基础库', '', '<p>从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>', '从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。', '/upfiles/images/20210422/4aa8fc8fe07d48c3bb531cc946e03bdc.png', 0, 1, 0, '', 1, 'EasyCMS', '', '', 1, 0, 0, '2021-04-22 11:16:41', 'admin', '2021-04-22 11:17:36', 'admin', '2021-04-22 11:17:48');
INSERT INTO `cms_content` VALUES (32, 'CSS处理', '', '<p><span style=\"color: rgb(171, 171, 171); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; text-align: center; background-color: rgb(255, 255, 255);\">从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</span></p>', '从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。', '/upfiles/images/20210422/e1944cd801364c20b3fa71b75894642f.png', 0, 1, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 11:17:51', 'admin', '2021-04-22 11:18:04', 'admin', '2021-04-22 11:18:04');
INSERT INTO `cms_content` VALUES (33, '兼容性', '', '<p><span style=\"color: rgb(171, 171, 171); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; text-align: center; background-color: rgb(255, 255, 255);\">从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</span></p>', '从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。', '/upfiles/images/20210422/86c84803902640ab83311427cc56c3ab.png', 0, 1, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 11:18:05', 'admin', '2021-04-22 11:18:18', 'admin', '2021-04-22 11:18:18');
INSERT INTO `cms_content` VALUES (34, '响应式', '', '<p><span style=\"color: rgb(171, 171, 171); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; text-align: center; background-color: rgb(255, 255, 255);\">从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</span></p>', '从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。', '/upfiles/images/20210422/a5d17b315a314ef7a1962c5138963083.png', 0, 1, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-22 11:18:19', 'admin', '2021-04-22 11:18:30', 'admin', '2021-04-22 11:18:30');
INSERT INTO `cms_content` VALUES (35, '1 对 1 前端指导', '', '<p><span style=\"color: rgb(173, 173, 173); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</span></p>', '更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。', '/upfiles/images/20210422/48f624eaea7c41b1874c94364e912425.jpg', 0, 15, 0, '', 1, 'EasyCMS', '', '', 1, 0, 0, '2021-04-22 11:23:18', 'admin', '2021-04-22 11:23:44', 'admin', '2021-04-22 11:24:40');
INSERT INTO `cms_content` VALUES (36, '1 对 1 前端指导', '', '<p><span style=\"color: rgb(173, 173, 173); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</span></p>', '更有多个包含不同主题的Web组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。', '/upfiles/images/20210422/c614ef7f2a3c4f7eb55cfbf341d3f8ce.jpg', 0, 15, 0, '', 1, 'EasyCMS', '', '', 1, 0, 0, '2021-04-22 11:23:53', 'admin', '2021-04-22 11:24:16', 'admin', '2021-04-22 11:24:34');
INSERT INTO `cms_content` VALUES (37, '意甲彩经：罗马拒绝女神，蓝鹰客场折翼', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【罗马vs亚特兰大】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【比赛时间】北京时间4月23日00点30分</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【比赛性质】意甲</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【重要伤停】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">罗马：扎尼奥洛、斯莫林、库姆布拉、沙拉维、斯皮纳佐拉、佩德罗；迪亚瓦拉停赛</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">亚特兰大：哈特鲍尔</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【过往战绩】 双方近10次交锋，罗马1胜4平5负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【近期战绩】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">近10场：罗马5胜2平3负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">近10场：亚特兰大7胜0平3负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【足彩分析】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">罗马上轮客场1比3不敌都灵，近5轮联赛仅胜1场；亚特兰大上轮主场1比0胜尤文，联赛取得五连胜。两队近3次交手，亚特兰大全胜。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">亚洲指数给出亚特兰大客场让平半，后期升到半球，罗马虽然近况不佳，但还不至于在主场被亚特兰大让到半球，指数如此操作对罗马侮辱性极强，有刻意夸大两队差距之嫌，亚特兰大并没有客场让半球的优势，预计客场打不出来。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">综合分析，看好罗马不败。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【预测结果】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">足彩：罗马胜、平</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">预测比分：2比1、1比1</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">———————————————————————————————————————</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【那不勒斯vs拉齐奥】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【比赛时间】北京时间4月23日02点45分</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【比赛性质】意甲</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【重要伤停】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">那不勒斯：古拉姆、奥斯皮纳；德姆停赛</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">拉齐奥：费利佩、安德森、米纳拉</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【过往战绩】 双方近10次交锋，那不勒斯7胜1平2负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【近期战绩】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">近10场：那不勒斯7胜2平1负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">近10场：拉齐奥6胜0平4负</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【足彩分析】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">那不勒斯上轮主场1比1平国米，近7个联赛主场6胜1平；拉齐奥上轮主场5比3胜贝内文托，联赛取得五连胜。两队近期交手，那不勒斯在主场对拉齐奥保持四连胜。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">亚洲指数给出那不勒斯让半球，两队近期表现都不错，一时难分伯仲，不过细看两队近期的对手，那不勒斯击败过米兰、罗马、打平国米，而拉齐奥近期所击败的全是中下游球队，论比赛质量还是那不勒斯要高些，再加上那不勒斯在主场对拉齐奥有较大优势，因此本场还是倾向于那不勒斯多一些。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">综合分析，看好那不勒斯取胜。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">【预测结果】</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">足彩：那不勒斯胜 竞彩（—1）让球胜平负：那不勒斯平</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">预测比分：3比2、2比1</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">（鱼缸没有鱼）</p><p><br/></p>', '亚洲指数给出那不勒斯让半球，两队近期表现都不错，一时难分伯仲，不过细看两队近期的对手，那不勒斯击败过米兰、罗马、打平国米，而拉齐奥近期所击败的全是中下游球队，论比赛质量还是那不勒斯要高些，再加上那不勒斯在主场对拉齐奥有较大优势，因此本场还是倾向于那不勒斯多一些。', '', 0, 6, 0, '', 1, '鱼缸没有鱼', '直播吧', '', 1, 0, 0, '2021-04-22 13:36:20', 'admin', '2021-04-22 13:37:47', 'admin', '2021-04-22 13:37:47');
INSERT INTO `cms_content` VALUES (38, '退役十年后复出，前江苏队梯队教练王杰进入南京城市中甲名单', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 近期公布的中甲升班马南京城市新赛季一线队大名单，包括了已经退役十年的前江苏队员王杰，39岁的他将复出重返球场。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">王杰出生于1982年4月4日，职业生涯长期效力江苏舜天。2010赛季结束后，王杰在江苏舜天退役，接着成为了江苏队的梯队教练。此前，他曾在江苏U20梯队担任助理教练。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">根据南京城市队新赛季一线队名单，39岁的王杰选择了39号球衣。目前，南京城市队已经抵达了大连赛区，正式开启了2021赛季的征程。</p><p><br/></p>', '近期公布的中甲升班马南京城市新赛季一线队大名单，包括了已经退役十年的前江苏队员王杰，39岁的他将复出重返球场', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:37:48', 'admin', '2021-04-22 13:38:17', 'admin', '2021-04-22 13:38:17');
INSERT INTO `cms_content` VALUES (39, '瓜帅：曼联正处于最好的状态 这是我们所经历过的最艰难的赛季', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 在逆转击败维拉之后，曼城主帅瓜迪奥拉在接受采访时表示，如果今天球队输球，那么之后的比赛会变得危险，因为现在曼联正处于最好的状态。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">瓜迪奥拉这样谈道：“如果今天我们输球，那么之后的比赛会变得危险，因为现在曼联正处于最好的状态，他们赢得了很多比赛的胜利，而且我有这样一种感觉，在他们需要赢得胜利的时候，他们就能够做到这一点。”</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">“考虑到我们本赛季一直以来的比赛方式，我们配得上赢得胜利，并获得现在的积分优势。当赛季进入到最后五场比赛的时候，一切都取决于我们自己，这是一个很好的推动力。”</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">“我们确切地知道我们需要什么，这就是我们现在的比赛方式，球员们非常投入，并且知道我们有多接近冠军，我们还要为联赛杯决赛以及欧冠的比赛做准备。我们已经很接近了，这是我们所经历过的最艰难的赛季，但我们有着令人难以置信的稳定，我们需要完成这个赛季，踢好最后几场比赛。”</p><p><br/></p>', '在逆转击败维拉之后，曼城主帅瓜迪奥拉在接受采访时表示，如果今天球队输球，那么之后的比赛会变得危险，因为现在曼联正处于最好的状态。\r\n\r\n', '', 0, 6, 0, '', 1, '于硕', '直播吧', '', 1, 0, 0, '2021-04-22 13:38:17', 'admin', '2021-04-22 13:38:49', 'admin', '2021-04-22 13:38:49');
INSERT INTO `cms_content` VALUES (40, '王上源致谢球迷：终于又在球场听到呐喊，希望下场把胜利带给你们', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯&nbsp;河南嵩山龙门球员王上源更新微博，他感谢了昨晚在现场为球队加油助威的河南球迷。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">在昨晚进行的中超首轮比赛中，河南嵩山龙门1-2不敌深圳队，现场有不少河南球迷为球队加油。而在比赛结束后，嵩山龙门主帅哈维尔“抱怨”本队球迷的看台位置不理想，他说：“<span style=\"border: 0px; margin: 0px; padding: 0px;\">我们作为主队，但是今天远道而来的球迷座位位置不是很理想。无论人多与少，球迷对我们而言非常重要。</span>”</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">今天中午，王上源更新微博，表达了对于球迷的感谢，他写道：“新赛季，新变化，新目标。终于又在球场听到了你们的呐喊，调整好自己，相信好运终会到来。希望下场能把胜利带给你们，河南加油！”</p><p><br/></p>', '河南嵩山龙门球员王上源更新微博，他感谢了昨晚在现场为球队加油助威的河南球迷', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:38:50', 'admin', '2021-04-22 13:39:20', 'admin', '2021-04-22 13:39:20');
INSERT INTO `cms_content` VALUES (41, '金钟夫：来中国前就看好尹鸿博，中国足球的改革日韩此前也经历过', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯&nbsp;日前，河北队主帅金钟夫接受了《足球报》的采访，采访中他谈及了自己的执教经历、理念以及目标等方面的问题。还表示他在来中国前就很看好尹鸿博，中国足球如今的改革，日韩联赛此前也经历过。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">----为何选择来中国并执教河北队？</strong></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">我没有刻意选择中国或河北，但感觉有一种奇妙的缘分在里面。在我之前马尔康来到球队，如今河北队完成了中性名的改革并代表了几千万人口，这跟我当初在韩国执教庆南FC时很相似。<strong style=\"border: 0px; margin: 0px; padding: 0px;\">此番是很多奇妙因素的作用，让我来到这里</strong>。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">----对中超与河北队有哪些感受？</strong></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">如今的中超已经不像此前有那么多高价外援，俱乐部在调整薪资的同时进行瘦身，这是一个很困难的过程。<strong style=\"border: 0px; margin: 0px; padding: 0px;\">中国足球经历的这些变化，是职业联赛发展过程中的一部分，日本和韩国联赛也经历过类似的过程</strong>。这种变化可能是一个转折的开始，是为了未来长期发展而走的很重要的一条路。走好了，未来就可以稳定发展。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">目前，<strong style=\"border: 0px; margin: 0px; padding: 0px;\">在这个困难面前俱乐部给予我足够的信任与支持，给我足够的权力让我按照自己的理念去管理球队，支持力度非常大</strong>。虽然谈投资人很敏感，但球队在正常运营，而且续约球员的同时还有像塞尔纳斯这样的引援，在这些坚持里我看到了希望。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">----培养年轻球员的目标</strong></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">我当年退役之后从事校园足球，其实是权力斗争的牺牲品，后来拿到了校园足球的最高荣誉并回归职业足球。培养年轻球员是我的一个希望，我从事教练员的生涯就是因为热爱足球和培养年轻球员，<strong style=\"border: 0px; margin: 0px; padding: 0px;\">希望我在中国能培养更多的年轻球员，给他们更多的机会</strong>。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">----还有没有其他的目标？</strong></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">我觉得首先是要稳定住球队，这是最主要的目标。<strong style=\"border: 0px; margin: 0px; padding: 0px;\">然后通过联赛，让更多的年轻球员有上升的机会，这也是主要的目标</strong>。此外，我相信所有的主教练都有一个憧憬，那就是杀入前几名，这可能很困难，但我们会全力以赴。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">另外，来到球队之后我发现球员的实力比我在韩国时想象的要更优秀。包括他们的竞技能力、贯彻教练员的思想能力（执行力）。不足之处是，<strong style=\"border: 0px; margin: 0px; padding: 0px;\">我在韩国时打造一支球队总会有比较多的时间，逐步提升他们的体能、速度、身体机能，还有战术体系。但现在留给我们的时间太短了</strong>，这就是职业联赛的残酷之处。所以，我们现在主要针对即将开始的联赛，进行较多的技战术方面的准备。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">-<strong style=\"border: 0px; margin: 0px; padding: 0px;\">---对于尹鸿博的看法</strong></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">来中国之前我看了去年联赛的比赛视频，尹鸿博的资料我也看了很多。他在边路有非常好的传中（能力），我们在前面有马尔康这个支点，所以他对球队的帮助非常大。另外，他还可以自己突击，自己射门，这是优秀球员具备的能力。<strong style=\"border: 0px; margin: 0px; padding: 0px;\">来中国之前我就看好他，对他很关注</strong>。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">----如何看待今年会与“老对手崔康熙”的交手？</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">没有特别的准备，时间上确实太紧张了。所以，最近也没怎么联系。不过在K联赛的时候，全北第一，我们（庆南FC）第二，当时全北最怕的就是我们庆南。<strong style=\"border: 0px; margin: 0px; padding: 0px;\">我想在中超，崔康熙教练也要警惕一下我们</strong>。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">（博伊德沃特）</p><p><br/></p>', '河北队主帅金钟夫接受了《足球报》的采访，采访中他谈及了自己的执教经历、理念以及目标等方面的问题。还表示他在来中国前就很看好尹鸿博，中国足球如今的改革，日韩联赛此前也经历过。', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:39:21', 'admin', '2021-04-22 13:39:55', 'admin', '2021-04-22 13:39:55');
INSERT INTO `cms_content` VALUES (42, '童心未泯保持好心情，申花入驻赛区酒店亲子楼', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 据申花新闻官马悦报道，这次申花队在苏州赛区入驻的是酒店亲子楼，房间的布置也处处彰显了童心。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">4月19日，申花全队抵达苏州入驻了赛区酒店。明晚20:00，申花队将在首轮的压轴大战对阵老对手北京国安，本场比赛也将对球迷开放。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">关于申花入驻赛区酒店的一些细节，马悦在微博晒图并透露：“比赛将至调节心情，这次申花入驻的是酒店的亲子楼，童心未泯，时刻保持好心情。猜猜这是哪个球员的房间？（线索在图中）”</p><p><br/></p>', '据申花新闻官马悦报道，这次申花队在苏州赛区入驻的是酒店亲子楼，房间的布置也处处彰显了童', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:39:57', 'admin', '2021-04-22 13:40:31', 'admin', '2021-04-22 13:40:31');
INSERT INTO `cms_content` VALUES (43, '马竞CEO公开信：为欧超产生的混乱致歉 加入欧超本为捍卫马竞利益', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 马竞CEO吉尔-马林近日给马竞会员们写了一封公开信，在信中他对欧超产生的混乱表示了歉意，也解释了马竞在超级联赛中的地位和加入其中的初衷。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">以下为公开信内容：</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">我希望你和你的家庭在我们正在经历的这个复杂时期感觉良好。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">首先，我想对最近几天在欧洲足坛产生的混乱表示歉意，然后我会详细解释马竞的立场和我们所做的决定。而且我想亲自做这件事，而不是通过媒体或我们的网站。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">正如你们所知，我们刚刚连续第九次取得了参加欧冠小组赛的资格，这是为巩固马竞在欧洲伟大球队中的地位所做的巨大努力的结果，也是你和所有马竞球迷的支持的结果。我们必须为共同实现这一目标而感到自豪：球员、教练组、球迷和俱乐部。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">马竞已经在欧洲顶级俱乐部中赢得了一席之地，这让我们当今在西甲和ECA（欧洲俱乐部协会）中都能贡献我们的意见和经验，在经济极端困难的时候，我们也始终在寻找足球的可持续性。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">在这个意义上，俱乐部决定接受加入超级联赛的邀请，目的是在于捍卫马德里竞技的利益，因为该组织的主要目标之一就是在维护整个足球大家庭团结的标准下，与欧足联对话和谈判，并寻求新的模式以促进体育和经济权利的平衡管理</strong>。我们加入的确实是比我们更大且理念不同的俱乐部，但我们当时不能不加入它们，因为它们是足球世界内容的主要生产者。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">然而，我们被纳入该集团的条件和所期待的情况没有得到满足。因此，今天我们最终决定不再巩固我们对该项目的支持</strong>。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">尽管如此，马德里竞技队将会继续尽可能地参与旨在改善我们运动的论坛、组织和机构，以寻求解决方案。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">我们的义务是继续为俱乐部在未来几十年里提供在体育、经济和社会层面的稳定性</strong>。近年来我们所取得的成长是在最大限度地尊重我们的身份和价值观的前提下实现的。从逻辑上讲，这不是一项容易的任务，我们也从来没有为此做过这么多事情，但这都是为了俱乐部的稳定，为了恢复和保持其在欧洲的伟大地位，为了颂扬我们的历史，为了向我们的传奇人物致敬，为了给球迷提供更全面的服务，为了改善我们的设施，为了扩大青训学院男女队的结构…...</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\"><strong style=\"border: 0px; margin: 0px; padding: 0px;\">一些球迷有时可能不同意某些决定，但你应该知道，所有的决定的做出都是出于为马竞谋求最好的信念</strong>。如今在我们面前，无论从短期还是中期来看，都有令我们所有人兴奋的挑战：我们正在还剩7场比赛的情况下争夺着联赛冠军，我们在世界各地的球迷正在呈指数增长，特别是在儿童中；我们正在努力改善我们的基础设施，旨在为所有马竞球迷提供更好的服务...... 所有的这些挑战都在我们的能力范围之内。如果我们能团结一致，相互尊重并相互帮助，如果我们继续谦虚地工作，付出最大的努力，我相信我们会实现这些目标。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">常务董事米格尔-安赫尔-吉尔</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">（Vicente）</p><p><br/></p>', '马竞CEO吉尔-马林近日给马竞会员们写了一封公开信，在信中他对欧超产生的混乱表示了歉意，也解释了马竞在超级联赛中的地位和加入其中的初衷。', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:40:35', 'admin', '2021-04-22 13:41:09', 'admin', '2021-04-22 13:41:09');
INSERT INTO `cms_content` VALUES (44, '进球网：欧超最初的讨论在15-16赛季就已开始，巴托梅乌是领头人', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 据进球网报道，关于欧洲超级联赛最初的讨论在2015-16赛季就已经开始，当时计划的领头人是前巴萨主席巴托梅乌。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">报道表示，巴托梅乌在担任巴萨俱乐部主席期间领导了数年的欧超联赛谈判，最初的讨论在2015-16赛季就已经开始，当时参与的俱乐部有巴塞罗那、尤文图斯、皇家马德里、曼联和阿森纳，他们希望推动一个五年计划来促成欧超联赛，而这一系列的讨论最后演变为我们后来所见到的十二支球队的阵容。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">进球网表示，2015-16赛季，欧洲几支顶级俱乐部就已经在考虑创办一项由豪门球队组成的赛事的可能性。不过，这些讨论并没有什么成果，欧足联和欧洲俱乐部协会在事态进一步发展事前安抚了各支俱乐部。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">然而，巴托梅乌与尤文图斯主席、前欧洲俱乐部协会主席阿涅利一起推动了欧超联赛的实现，为这项潜在的新赛事奠定了基础。很快，皇马的弗洛伦蒂诺以及曼联和阿森纳也加入其中。当时，欧足联和欧洲俱乐部协会签署了一份新的协议，确定了2021年之前的欧冠联赛模式。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">2018年，在看到欧足联的资金分配计划后，在巴萨作为关键领头人之一的情况下，成立欧洲超级联赛的提议加快了进程。当时，巴托梅乌是巴萨俱乐部唯一一个熟悉该计划的董事会成员，他和另外两名高管私底下努力让欧超联赛成为现实。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">巴托梅乌和其他与欧超联赛相关的人士签署了一份保密协议，以防止赛事的形式被泄露，其中包括欧超联赛如何与各国的国内联赛合作，以及参与的各支俱乐部如何获得和分配收入。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">在皇家马德里，弗洛伦蒂诺也完全倾注到欧超联赛的计划当中，他愿意做任何事情来推动这项赛事成为现实。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">该计划在2020年敲定之后，巴托梅乌准备向巴萨董事会分享这一消息，尽管当时他自己的主席之位已经风雨飘摇。他向巴萨董事会介绍了欧超联赛的计划，董事会则批准签署了一份意向文件，但由于保密协议的存在，巴萨董事会的成员也无法看到这份意向文件的内容。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">当时，巴萨董事会仍信任巴托梅乌，在巴托梅乌辞职的那一天，他公布了这个计划，这个计划并没有对俱乐部作出任何承诺，而且仍需要转变成为一份有约束力的合同。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">巴托梅乌的继任者拉波尔塔在看到欧超联赛的钱能给俱乐部带来的好处之后，于周六签署了合同。但尽管如此，这份文件仍然不完整，因为还有一些事情未确定，例如钱要怎么分配。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">钱并不会在十二支参与的俱乐部之间平均分配，关于这个问题，欧超联赛一直都没有完全决定怎么做。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">巴萨俱乐部现在仍对欧洲超级联赛有信心，他们告诉进球网：“我们相信这是一项可以提供更多财政资源的、非常有吸引力的体育赛事，也因为我们将维持国内联赛。”</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">现在，随着几乎所有创始球队的退出，巴萨仍然相信欧超联赛会与欧足联进行谈判，尝试达成一项新的协议，这就是为什么直到现在，巴萨仍未发布公告宣布退出。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">（地精杀手）</p><p><br/></p>', '据进球网报道，关于欧洲超级联赛最初的讨论在2015-16赛季就已经开始，当时计划的领头人是前巴萨主席巴托梅乌。', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:41:11', 'admin', '2021-04-22 13:41:43', 'admin', '2021-04-22 13:41:43');
INSERT INTO `cms_content` VALUES (45, '邮报：英超BIG6均净亏800万镑，可能还需向其他六队支付赔偿', '', '<p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 据《每日邮报》报道，英超BIG6已经在试图建立欧洲超级联赛的过程中损失了数千万美元，而这一计划在当地时间周二以耻辱性的失败告终。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">《邮报》获悉，12家创始俱乐部分别以800万英镑的价格购买了欧超联赛的股份，6家英国俱乐部总计花费4800万英镑，购买股份所筹集的资金原本将用于建设赛事基础设施，展开与转播公司和各大商业伙伴的谈判，以及支付法律费用等等。目前还不清楚这笔钱已经花了多少，也不清楚在欧超联赛计划启动不到3天就崩溃后，这笔钱是否会返还给各大俱乐部。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">英超BIG6也可能被迫向其他6家欧超联赛创始俱乐部支付赔偿，因为他们违反了已经签署的欧超联赛23年合同中的一项条款，该条款规定他们在欧超联赛启动的前3年不能选择离开。不过考虑到来自外界的巨大压力，目前尚不清楚该条款是否会得到执行。律师们表示，这些合同条款将鼓励俱乐部在面临预期的抗议时，为了避免巨额处罚，仍然能够坚持这一有争议的项目</p><p><br/></p>', '英超BIG6已经在试图建立欧洲超级联赛的过程中损失了数千万美元，而这一计划在当地时间周二以耻辱性的失败告终。', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:41:45', 'admin', '2021-04-22 13:42:13', 'admin', '2021-04-22 13:42:13');
INSERT INTO `cms_content` VALUES (46, '斯基拉：尤文准备开启谈判，与夸德拉多续约至2023年', '', '<p style=\"text-align:center\"><img id=\"20210423092821\" class=\"easycms-player\" src=\"/static/images/video-clip.png\" player=\"h5\" playurl=\"/upfiles/videos/20210423/608222b0569ee43f780188f2.mp4\" style=\"width:400px; height: 400px;\"/></p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">直播吧4月22日讯 据意大利记者斯基拉透露，尤文准备与队内球员夸德拉多开启续约谈判，希望将他的合同延长一年。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">夸德拉多目前的合同将在2022年到期，斯基拉指出，尤文希望与这位32岁的右后卫续约至2023年，并准备开启相关的谈判。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">夸德拉多2015年从切尔西租借加盟尤文，两年后被斑马军团买断，至今为尤文出战215场比赛，贡献17粒进球和53次助攻。</p><p style=\"border: 0px; margin: 20px auto 0px; padding: 0px; font-size: 14px; line-height: 25px; word-break: normal; text-align: justify; font-family: 宋体, &quot;Arial Narrow&quot;, HELVETICA; white-space: normal;\">（木子）</p><p><a href=\"/upfiles/videos/20210422/60812856569ee467f0f8f92d.bak\">powerplants.bak</a></p><p><a href=\"/upfiles/attachments/20210422/60812ba4569ee424c0b26fb0..csv\">picc-2021-03-22.csv</a></p>', '据意大利记者斯基拉透露，尤文准备与队内球员夸德拉多开启续约谈判，希望将他的合同延长一年', '', 0, 6, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-22 13:42:15', 'admin', '2021-04-22 13:42:45', 'admin', '2021-04-23 09:30:54');
INSERT INTO `cms_content` VALUES (47, '关于我们', '', '<div class=\"recommend__container\" style=\"box-sizing: inherit; color: rgb(64, 72, 91); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Liberation Sans&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Wenquanyi Micro Hei&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;ST Heiti&quot;, SimHei, SimSun, &quot;WenQuanYi Zen Hei Sharp&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><div class=\"recommend-block recommend-project\" id=\"recommend-project__container\" style=\"box-sizing: inherit; margin-bottom: 32px;\"><div class=\"recommend-projects\" style=\"box-sizing: inherit;\"><div class=\"ui items\" style=\"box-sizing: inherit; margin-top: 1.5em; margin-right: 0em; margin-bottom: 0em !important; margin-left: 0em;\"><div class=\"item\" style=\"box-sizing: inherit; table-layout: fixed; display: table; margin: 0px 0px 16px; width: 247.368px; min-height: 0px; background: transparent; padding: 0em; border: none; border-radius: 0rem; box-shadow: none; transition: box-shadow 0.2s ease 0s, -webkit-box-shadow 0.2s ease 0s; min-width: 100%; font-size: 1em;\"><div class=\"recommend-list\" style=\"box-sizing: inherit; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column;\"><div class=\"recommend-project__describe text-muted\" style=\"box-sizing: inherit; word-break: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 3; display: -webkit-box; -webkit-box-orient: vertical;\">RuiJi.Net是一个.net分布式抓取、提取框架。支持分布式下载，分布式提取及cookie自管理。RuiJi.Net可以通过轮询使用服务器上IP地址和代理服务器的形式进行抓取操作</div></div></div><div class=\"item\" style=\"box-sizing: inherit; table-layout: fixed; display: table; margin: 0px 0px 16px; width: 247.368px; min-height: 0px; background: transparent; padding: 0em; border: none; border-radius: 0rem; box-shadow: none; transition: box-shadow 0.2s ease 0s, -webkit-box-shadow 0.2s ease 0s; min-width: 100%; font-size: 1em;\"><div class=\"recommend-list\" style=\"box-sizing: inherit; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column;\"><div class=\"recommend-project-info d-flex-between\" style=\"box-sizing: inherit; display: flex; -webkit-box-align: center; align-items: center; -webkit-box-pack: justify; justify-content: space-between; word-break: break-all; margin-bottom: 4px;\"><div class=\"recommend-project__name d-align-center\" style=\"box-sizing: inherit; display: flex; -webkit-box-align: center; align-items: center; color: rgb(0, 89, 128); align-self: start; -webkit-box-flex: 1; flex: 1 1 0%; max-width: 70%;\"><a href=\"https://gitee.com/JeffreySu/WeiXinMPSDK\" target=\"_blank\" style=\"box-sizing: inherit; background: transparent; color: rgb(0, 89, 128); text-decoration-line: none; cursor: pointer; vertical-align: top; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\"><strong style=\"box-sizing: inherit;\">WeiXinMPSDK</strong></a><div class=\"project-label\" style=\"box-sizing: inherit; display: inline-block; vertical-align: bottom; margin-left: 4px; flex-shrink: 0;\"><a class=\"ui small label git-project-gvp-badge gvp-label js-popup-default\" href=\"https://gitee.com/gvp\" target=\"_blank\" title=\"GVP - Gitee 最有价值开源项目\" style=\"box-sizing: inherit; text-decoration-line: none; cursor: pointer; position: relative; display: inline-block; line-height: 1; vertical-align: initial; margin: 0em; padding: 2px 5px; border-radius: 0.285714rem; transition: background 0.1s ease 0s; font-size: 0.785714rem; background: linear-gradient(to right, rgba(253, 235, 144, 0.5), rgba(238, 218, 160, 0.5)) !important; color: rgb(193, 154, 38) !important; border: 1px solid rgba(210, 191, 134, 0.5) !important;\">GVP</a></div></div><a class=\"project-stars-count-box js-project-stars-count-box d-flex\" href=\"https://gitee.com/JeffreySu/WeiXinMPSDK/star\" style=\"box-sizing: inherit; background: transparent; color: rgb(0, 89, 128); text-decoration-line: none; cursor: pointer; text-align: right; align-self: flex-start; white-space: nowrap; margin-left: 8px; -webkit-box-align: baseline; align-items: baseline; display: flex !important;\"><span class=\"iconfont icon-star\" style=\"box-sizing: inherit; font-size: 1em; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: initial; margin-right: 2px; color: rgb(149, 157, 165); font-family: iconfont !important;\"></span><div class=\"stars-count\" style=\"box-sizing: inherit; padding: 0px 4px;\">1.1K</div></a></div><div class=\"recommend-project__describe text-muted\" style=\"box-sizing: inherit; word-break: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 3; display: -webkit-box; -webkit-box-orient: vertical;\">微信公众平台SDK Senparc.Weixin for C#，支持.NET Framework及.NET Core。已支持微信公众号、小程序、小游戏、企业号、企业微信、开放平台、微信支付、JSSDK、微信周边等全平台。 WeChat SDK for C#.</div></div></div><div class=\"item\" style=\"box-sizing: inherit; table-layout: fixed; display: table; margin: 0px 0px 0em; width: 247.368px; min-height: 0px; background: transparent; padding: 0em; border: none; border-radius: 0rem; box-shadow: none; transition: box-shadow 0.2s ease 0s, -webkit-box-shadow 0.2s ease 0s; min-width: 100%; font-size: 1em;\"><div class=\"recommend-list\" style=\"box-sizing: inherit; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column;\"><div class=\"recommend-project-info d-flex-between\" style=\"box-sizing: inherit; display: flex; -webkit-box-align: center; align-items: center; -webkit-box-pack: justify; justify-content: space-between; word-break: break-all; margin-bottom: 4px;\"><div class=\"recommend-project__name d-align-center\" style=\"box-sizing: inherit; display: flex; -webkit-box-align: center; align-items: center; color: rgb(0, 89, 128); align-self: start; -webkit-box-flex: 1; flex: 1 1 0%; max-width: 70%;\"><a href=\"https://gitee.com/monksoul/Xamarin.Android.SDK\" target=\"_blank\" style=\"box-sizing: inherit; background: transparent; color: rgb(0, 89, 128); text-decoration-line: none; cursor: pointer; vertical-align: top; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\"><strong style=\"box-sizing: inherit;\">Xamarin.Android.SDK</strong></a><div class=\"project-label\" style=\"box-sizing: inherit; display: inline-block; vertical-align: bottom; margin-left: 4px; flex-shrink: 0;\"><span class=\"iconfont icon-recommended js-popup-default\" style=\"box-sizing: inherit; font-size: 1em; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: top; color: rgb(254, 115, 0); font-family: iconfont !important;\"></span></div></div><a class=\"project-stars-count-box js-project-stars-count-box d-flex\" href=\"https://gitee.com/monksoul/Xamarin.Android.SDK/star\" style=\"box-sizing: inherit; background: transparent; color: rgb(0, 89, 128); text-decoration-line: none; cursor: pointer; text-align: right; align-self: flex-start; white-space: nowrap; margin-left: 8px; -webkit-box-align: baseline; align-items: baseline; display: flex !important;\"><span class=\"iconfont icon-star\" style=\"box-sizing: inherit; font-size: 1em; -webkit-font-smoothing: antialiased; display: inline-block; vertical-align: initial; margin-right: 2px; color: rgb(149, 157, 165); font-family: iconfont !important;\"></span><div class=\"stars-count\" style=\"box-sizing: inherit; padding: 0px 4px;\">74</div></a></div><div class=\"recommend-project__describe text-muted\" style=\"box-sizing: inherit; word-break: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 3; display: -webkit-box; -webkit-box-orient: vertical;\">Xamarin.Android 绑定原生Android第三方包集合。</div></div></div></div></div></div></div><div id=\"recent-visits__container\" style=\"box-sizing: inherit; color: rgb(64, 72, 91); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Liberation Sans&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Wenquanyi Micro Hei&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;ST Heiti&quot;, SimHei, SimSun, &quot;WenQuanYi Zen Hei Sharp&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><div class=\"recommend-block recent_visits\" style=\"box-sizing: inherit; margin-bottom: 32px;\"><div class=\"header\" style=\"box-sizing: inherit; margin-bottom: 16px;\"><br/></div></div></div>', '', '', 0, 14, 0, '', 1, '', '', '', 1, 0, 0, '2021-04-23 09:10:18', 'admin', '2021-04-23 09:10:47', 'admin', '2021-04-23 09:10:47');
INSERT INTO `cms_content` VALUES (48, '直播吧', '', '', '', '', 0, 16, 0, '', 1, '', '', 'https://www.zhibo8.cc/', 1, 0, 0, '2021-04-23 14:15:00', 'admin', '2021-04-23 14:15:23', 'admin', '2021-04-23 14:15:23');
INSERT INTO `cms_content` VALUES (49, '百度', '', '', '', '', 0, 16, 0, '', 1, '', '', 'https://www.baidu.com/', 1, 0, 0, '2021-04-23 14:15:30', 'admin', '2021-04-23 14:15:38', 'admin', '2021-04-23 14:15:38');
INSERT INTO `cms_content` VALUES (50, '博客园', '', '', '', '', 0, 16, 0, '', 1, '', '', 'https://www.cnblogs.com/', 1, 0, 0, '2021-04-23 14:15:49', 'admin', '2021-04-23 14:15:59', 'admin', '2021-04-23 14:15:59');
INSERT INTO `cms_content` VALUES (51, 'Github', '', '', '', '', 0, 16, 0, '', 1, '', '', 'https://github.com/', 1, 0, 0, '2021-04-23 14:16:07', 'admin', '2021-04-23 14:16:17', 'admin', '2021-04-23 14:16:17');
INSERT INTO `cms_content` VALUES (52, 'Youtube', '', '', '', '', 0, 16, 0, '', 1, '', '', 'https://www.youtube.com/', 1, 0, 0, '2021-04-23 14:16:18', 'admin', '2021-04-23 14:16:33', 'admin', '2021-04-23 14:16:33');
INSERT INTO `cms_content` VALUES (53, '无锡富华官网', '', '<p>无锡富华官网</p><p>&nbsp; &nbsp;<img src=\"../..\\upfiles\\images\\20210423\\60827507569ee448c40d324e.png\" title=\"微信截图_20210423151901.png\" alt=\"微信截图_20210423151901.png\" width=\"814\" height=\"693\" style=\"width: 814px; height: 693px;\"/></p>', '', '/upfiles/images/20210423/608274f5569ee448c40d324c.png', 0, 13, 0, '', 1, 'EasyCMS', 'EasyCMS', '', 1, 0, 0, '2021-04-23 15:17:51', 'admin', '2021-04-23 15:20:07', 'admin', '2021-04-23 15:20:07');
INSERT INTO `cms_content` VALUES (54, '江苏真源官网', '', '<p><img src=\"../..\\upfiles\\images\\20210423\\6082753d569ee448c40d3251.png\" title=\"微信截图_20210423151833.png\" alt=\"微信截图_20210423151833.png\" width=\"1073\" height=\"591\" style=\"width: 1073px; height: 591px;\"/></p>', '', '/upfiles/images/20210423/60827534569ee448c40d324f.png', 0, 13, 0, '', 1, 'EasyCMS', '直播吧', '', 1, 0, 0, '2021-04-23 15:20:08', 'admin', '2021-04-23 15:20:40', 'admin', '2021-04-23 15:20:40');
INSERT INTO `cms_content` VALUES (55, '某电力内部CMS', '', '<p><img src=\"../..\\upfiles\\images\\20210423\\60827562569ee448c40d3258.png\" style=\"\" title=\"微信图片_20210422151146.png\"/></p><p><img src=\"../..\\upfiles\\images\\20210423\\60827562569ee448c40d3254.png\" style=\"\" title=\"微信图片_20210422151128.png\"/></p><p><img src=\"../..\\upfiles\\images\\20210423\\60827562569ee448c40d3256.png\" style=\"\" title=\"微信图片_20210422151140.png\"/></p><p><br/></p>', '', '/upfiles/images/20210423/6082755a569ee448c40d3252.png', 0, 13, 0, '', 1, 'EasyCMS', 'EasyCMS', '', 1, 0, 0, '2021-04-23 15:20:46', 'admin', '2021-04-23 15:21:18', 'admin', '2021-04-23 15:21:18');

-- ----------------------------
-- Table structure for cms_content_image
-- ----------------------------
DROP TABLE IF EXISTS `cms_content_image`;
CREATE TABLE `cms_content_image`  (
  `int` int(255) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_sort` int(255) NOT NULL,
  `image_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `insert_time` datetime(0) NOT NULL,
  PRIMARY KEY (`int`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_content_image
-- ----------------------------

-- ----------------------------
-- Table structure for cms_ip_manager
-- ----------------------------
DROP TABLE IF EXISTS `cms_ip_manager`;
CREATE TABLE `cms_ip_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '起始ip',
  `end_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束ip',
  `start_ip_val` bigint(255) NOT NULL COMMENT '起始ip值',
  `end_ip_val` bigint(255) NOT NULL COMMENT '结束ip值',
  `limit_enable` tinyint(2) NOT NULL COMMENT '0-不限制，1-限制',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ip访问限制信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ip_manager
-- ----------------------------
INSERT INTO `cms_ip_manager` VALUES (52, '192.168.1.12', '192.168.1.210', 3232235787, 3232235985, 1, '测试ip限制33', 'admin', '2021-04-19 13:41:41', 'admin', '2021-04-19 13:59:54');
INSERT INTO `cms_ip_manager` VALUES (53, '192.168.1.120', '192.168.1.150', 3232235895, 3232235925, 0, 'fdsfsd', 'admin', '2021-04-19 14:00:07', 'admin', '2021-04-19 14:00:07');

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '站点名称',
  `site_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网站LOGO',
  `site_favicon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '地址栏图标',
  `site_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网站网址',
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'SEO标题',
  `site_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'SEO关键词',
  `site_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'SEO描述',
  `site_copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '版权信息',
  `site_icp` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '备案号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '站点设置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES (1, 'EasyCMS-易思内容管理系统', '/static/images/logo.png', '/favicon.ico', 'http://cms.atlass.com', 'EasyCMS站点 -  Powered by cms.atlass.com', 'CMS,内容管理系统，企业建站，新闻发布，EasyCMS', 'EasyCMS内容管理系统，企业建站首选，基于.net core开源免费高性能，新闻发布系统', 'Copyright © 2012-2020 EasyCMS. 易思CMS 版权所有', '苏ICP备17017410号-2');

-- ----------------------------
-- Table structure for cms_template
-- ----------------------------
DROP TABLE IF EXISTS `cms_template`;
CREATE TABLE `cms_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板名称',
  `template_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板文件',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '生成的文件名，单页模板使用',
  `template_mode` int(11) NOT NULL COMMENT '模板类型，1-首页，2-栏目模板，3-内容模板，4-单页模板,5-包含文件',
  `pid` int(11) NOT NULL COMMENT '1-首页，2-栏目模板，3-内容模板，4-单页模板,5-包含文件',
  `template_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '模板内容',
  `is_default` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否为默认模板 0-否，1-是',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '模板信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_template
-- ----------------------------
INSERT INTO `cms_template` VALUES (5, '新闻详情', 'T_新闻详情.html', '', 3, 3, '<!DOCTYPE html>\n<html>\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0\">\n    <meta name=\"applicable-device\" content=\"pc,mobile\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>{$content.title}</title>\n    <meta name=\"keywords\" content=\"{$content.title}\">\n    <meta name=\"description\" content=\"{$content.title}\">\n    <link rel=\"stylesheet\" href=\"/static/layui/css/layui.css\">\n    <link rel=\"stylesheet\" href=\"/static/css/index.css\">\n</head>\n\n<body>\n    <!-- nav部分 -->\n    <vt:include file=\"Template/include/navi.html\" charset=\"utf-8\" />\n   <div class=\"banner news\">\n        <img class=\"banImage\" src=\"/static/images/news.jpg\" alt=\"\">\n    </div>\n    <!-- main部分 -->\n    <div class=\"main-newsdate\" style=\"margin-top:10px;\">\n        <div class=\"layui-container\">\n            <p class=\"news\" style=\"line-height:50px;\">{$content.location}</p>\n            <h1>{$content.title length=30}</h1>\n            <p class=\"pushtime\">\n                来源：<span>{$content.source}</span>&nbsp;&nbsp;&nbsp;&nbsp;作者：<span>{$content.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;阅读：<span>{$content.hit_count}</span>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<span>{$content.publish_time formatter=\'yyyy-MM-dd\'}</span>\n\n            </p>\n            <div class=\"content\">\n                {$content.content}\n            </div>\n        </div>\n    </div>\n    <!-- footer部分 -->\n    <vt:include file=\"Template/include/footer.html\" charset=\"utf-8\" />\n</body>\n</html>\n\n', 1, '1', '2020-05-15 10:53:30', 'admin', '2021-04-22 16:42:20');
INSERT INTO `cms_template` VALUES (6, '首页模板', 'T_首页模板.html', 'index.html', 1, 1, '<!DOCTYPE html>\r\n<html id=\"doc\">\r\n<!-- head部分 -->\r\n<vt:include id=\"navi\" file=\"Template/include/header.html\" charset=\"utf-8\" />\r\n<body>\r\n    <!-- nav部分 -->\r\n    <vt:include id=\"navi\" file=\"Template/include/navi.html\" charset=\"utf-8\" />\r\n    <!-- banner部分 -->\r\n    <div>\r\n        <div class=\"layui-carousel\" id=\"banner\">\r\n            <div carousel-item>\r\n                <vt:template name=\"contents\" channelIndex=\"Banner\" startNum=\"1\" total=\"3\">\r\n                    <vt:foreach from=\"$#.contents\" item=\"#.content\" index=\"#.i\">\r\n                        <div>\r\n                            <img src=\"{$#.content.cover_image}\">\r\n                            <!--<div class=\"panel\">\r\n                                <p class=\"title\">{$#.content.title}</p>\r\n                                <p>{$#.content.title}</p>\r\n                            </div>-->\r\n                        </div>\r\n                    </vt:foreach>\r\n                </vt:template>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <!-- main部分 -->\r\n    <div class=\"main-product\">\r\n        <div class=\"layui-container\">\r\n            <p class=\"title\">专为前端而研制的<span>核心产品</span></p>\r\n            <div class=\"layui-row layui-col-space25\">\r\n                <vt:template name=\"contents\" channelIndex=\"产品\" startNum=\"1\" total=\"4\">\r\n                    <vt:foreach from=\"$#.contents\" item=\"#.content\" index=\"#.i\">\r\n                        <div class=\"layui-col-sm6 layui-col-md3\">\r\n                            <div class=\"content\">\r\n                                <div><img src=\"{$#.content.cover_image}\"></div>\r\n                                <div>\r\n                                    <p class=\"label\">{$#.content.title}</p>\r\n                                    <p>{$#.content.summary}</p>\r\n                                </div>\r\n                                <a href=\"{$#.content.content_href }\">查看产品 ></a>\r\n                            </div>\r\n                        </div>\r\n\r\n                    </vt:foreach>\r\n                </vt:template>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"main-service\">\r\n        <div class=\"layui-container\">\r\n            <p class=\"title\">为客户打造完美的<span>专业服务</span></p>\r\n            <div class=\"layui-row layui-col-space25 layui-col-space80\">\r\n                <vt:template name=\"contents\" channelIndex=\"专业服务\" startNum=\"1\" total=\"2\">\r\n                    <vt:foreach from=\"$#.contents\" item=\"#.content\" index=\"#.i\">\r\n                        <div class=\"layui-col-sm6\">\r\n                            <div class=\"content\">\r\n                                <div class=\"content-left\"><img src=\"{$#.content.cover_image}\"></div>\r\n                                <div class=\"content-right\">\r\n                                    <p class=\"label\">{$#.content.title}</p>\r\n                                    <span></span>\r\n                                    <p>{$#.content.summary}</p>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </vt:foreach>\r\n                </vt:template>\r\n            </div>\r\n            <div class=\"service-more\">\r\n                <vt:template name=\"channel\" channelIndex=\"专业服务\">\r\n                    <a href=\"{$#.channel.channel_href}\">查看更多</a>\r\n                </vt:template>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <!-- footer部分 -->\r\n    <vt:include file=\"Template/include/footer.html\" charset=\"utf-8\" />\r\n\r\n    <script type=\'text/javascript\' src=\'/content/visit\'></script>\r\n</body>\r\n</html>\r\n\r\n', 1, '11297175912976384', '2020-05-19 12:19:12', '11297175912976384', '2020-05-20 16:32:57');
INSERT INTO `cms_template` VALUES (7, '栏目模板', 'T_栏目模板.html', '', 2, 2, '<!DOCTYPE html>\n<html id=\"doc\">\n<!-- head部分 -->\n<vt:include id=\"navi\" file=\"Template/include/header.html\" charset=\"utf-8\" />\n<body>\n    <!-- nav部分 -->\n    <vt:include file=\"Template/include/navi.html\" charset=\"utf-8\" />\n    <!-- banner部分 -->\n    <div class=\"banner news\">\n        <img class=\"banImage\" src=\"{$channel.channel_image}\" alt=\"\">\n        <div class=\"title\">\n            <p>{$channel.channel_name}</p>\n        </div>\n    </div>\n    <!-- main -->\n    <div class=\"main-news\">\n        <div class=\"layui-container\">\n            <div class=\"layui-row layui-col-space20\">\n                <vt:foreach id=\"contents\" from=\"$contents\" item=\"content\" index=\"i\" startNum=\"1\" total=\"10\" >\n                    <div class=\"layui-col-lg6 content\">\n                        <div>\n                            <div class=\"news-img\">\n                                <a href=\"{$content.content_href}\">\n                                    <img src=\"{$content.cover_image}\" onerror=\"javascript:this.src=\'/static/images/biglogo.png\';\" style=\"width:184px;height:142px;\">\n                                </a>\n                            </div><div class=\"news-panel\">\n                                <strong><a href=\"{$content.content_href}\">{$content.title length=\'17\'}</a></strong>\n                                <p class=\"detail\">\n                                    <span>{$content.summary length=\'60\'}</span>\n                                    <a href=\"{$content.content_href}\">[详细]</a>\n                                </p>\n                                <p class=\"read-push\">阅读 <span>{$content.hit_count}</span>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<span>{$content.publish_time formatter=\'yyyy-MM-dd\'}</span></p>\n                            </div>\n                        </div>\n                    </div>\n\n                    <vt:foreachelse />\n                    <article class=\"post-27 post type-post status-publish format-standard hentry category-news\">\n                        <div class=\"layui-col-lg6 content\">\n                            <p class=\"detail\">暂时没有数据。。。</p>\n                        </div>\n                    </article>\n                </vt:foreach>\n            </div>\n            <div id=\"newsPage\"></div>\n        </div>\n    </div>\n    <!-- footer部分 -->\n    <vt:include file=\"Template/include/footer.html\" charset=\"utf-8\" />\n</body>\n</html>\n\n', 1, '11297175912976384', '2020-05-19 14:44:13', '11297175912976384', '2020-05-28 11:00:10');
INSERT INTO `cms_template` VALUES (8, 'footer', 'footer.html', '', 5, 5, '<!-- footer部分 -->\r\n<div class=\"footer\">\r\n    <div class=\"layui-container\">\r\n        <p class=\"footer-web\">\r\n            <vt:template name=\"contents\" channelIndex=\"友情链接\" startNum=\"1\" total=\"6\">\r\n                <vt:foreach from=\"$#.contents\" item=\"#.content\" index=\"#.i\">\r\n                    <a href=\"{$:#.content.content_href}\" target=\"_blank\">{$:#.content.title }</a>\r\n                </vt:foreach>\r\n            </vt:template>\r\n        </p>\r\n        <div class=\"layui-row footer-contact\">\r\n            <div class=\"layui-col-sm2 layui-col-lg1\">\r\n                <img src=\"/static/img/erweima.jpg\">\r\n            </div>\r\n            <div class=\"layui-col-sm10 layui-col-lg11\">\r\n                <div class=\"layui-row\">\r\n                    <div class=\"layui-col-sm6 layui-col-md8 layui-col-lg9 textCenter\">\r\n                        <p class=\"contact-top\"><span class=\"right\">该模板版权归 <a href=\"#\" target=\"_blank\">cms.atlass.com</a> 所有</span></p>\r\n                        <p class=\"contact-bottom\"><span class=\"right\">{$site.site_icp}</span></p>\r\n                    </div>\r\n                    <div class=\"layui-col-sm6 layui-col-md4 layui-col-lg3\">\r\n                        <p class=\"contact-top\"><i class=\"layui-icon layui-icon-cellphone\"></i>&nbsp;15961820351&nbsp;&nbsp;&nbsp;(9:00-18:00)</p>\r\n                        <p class=\"contact-bottom\"><i class=\"layui-icon layui-icon-home\"></i>&nbsp;461733078@qq.com</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<script src=\"/static/layui/layui.js\"></script>\r\n<!--[if lt IE 9]>\r\n  <script src=\"https://cdn.staticfile.org/html5shiv/r29/html5.min.js\"></script>\r\n  <script src=\"https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js\"></script>\r\n<![endif]-->\r\n<script>\r\n    layui.config({\r\n        base: \'/static/js/\'\r\n    }).use(\'firm\');\r\n</script>', 0, '11297175912976384', '2020-05-27 11:20:00', '11297175912976384', '2020-05-27 11:22:45');
INSERT INTO `cms_template` VALUES (9, 'navi', 'navi.html', '', 5, 5, '  <!-- nav部分 -->\n<div class=\"nav index\">\n    <div class=\"layui-container\">\n        <!-- 公司logo -->\n        <div class=\"nav-logo\">\n            <a href=\"/index.html\">\n                <img src=\"/static/images/logo.png\" alt=\"EasyCMS内容管理系统\" width=\"200\" height=\"40\">\n            </a>\n        </div>\n        <div class=\"nav-list\">\n            <button>\n                <span></span><span></span><span></span>\n            </button>\n            <ul class=\"layui-nav\" lay-filter=\"\">\n                <vt:foreach from=\"$#.channels\" item=\"navi\" index=\"i\">\n                    <!--vt[]-->\n                    <vt:if var=\"navi.drawing_enable\" value=\"1\">\n                        <li class=\"layui-nav-item\"><a href=\"{$navi.channel_href}\">{$navi.channel_name}</a></li>\n                        <vt:else />\n                    </vt:if>\n                </vt:foreach>\n            </ul>\n        </div>\n    </div>\n</div>', 0, '11297175912976384', '2020-05-27 11:20:34', 'admin', '2021-04-22 15:02:46');
INSERT INTO `cms_template` VALUES (10, '右边热门新闻', 'right.html', '', 5, 5, '<div class=\"col-md-3 col-sm-3 hidden-xs sidebar\">\n\n  <aside id=\"recent-posts-2\" class=\"widget widget_recent_entries\">\n    <h3 class=\"widget-title\">热门新闻</h3>\n    <ul>\n      <stl:contents channelIndex=\"新闻动态\" scope=\"SelfAndChildren\" totalNum=\"8\" order=\"Hits\">\n        <li>\n          <stl:a>\n            <stl:content type=\"Title\"></stl:content>\n          </stl:a>\n        </li>\n      </stl:contents>\n    </ul>\n  </aside>\n  <aside id=\"black-studio-tinymce-2\" class=\"widget widget_black_studio_tinymce\">\n    <h3 class=\"widget-title\">广告位</h3>\n    <div class=\"textwidget\">\n      <p>\n        <stl:contents channelIndex=\"广告位同步测试\" totalNum=\"1\">\n          <img class=\"aligncenter size-full wp-image-57\" src=\"{Content.ImageUrl}\" alt=\"\" width=\"325\" height=\"607\" />\n        </stl:contents>\n      </p>\n    </div>\n  </aside>\n</div>', 0, '11297175912976384', '2020-05-27 11:21:04', '11297175912976384', '2020-05-27 11:21:49');
INSERT INTO `cms_template` VALUES (11, 'header脚本', 'header.html', '', 5, 5, ' <!-- head部分 -->\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0\">\r\n    <meta name=\"applicable-device\" content=\"pc,mobile\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <title>{$site.site_title}</title>\r\n    <meta name=\"Keywords\" content=\"{$site.site_keyword}\" />\r\n    <meta name=\"Description\" content=\"{$site.site_description}\" />\r\n    <link rel=\"stylesheet\" href=\"/static/layui/css/layui.css\">\r\n    <link rel=\"stylesheet\" href=\"/static/css/index.css\">\r\n</head>', 0, '11297175912976384', '2020-05-28 10:36:08', '11297175912976384', '2020-05-28 10:36:08');
INSERT INTO `cms_template` VALUES (13, '产品展示模板', 'T_产品展示模板.html', '', 2, 2, '<!DOCTYPE html>\n<html id=\"doc\">\n<!-- head部分 -->\n<vt:include id=\"navi\" file=\"Template/include/header.html\" charset=\"utf-8\" />\n<body>\n    <!-- nav部分 -->\n    <vt:include file=\"Template/include/navi.html\" charset=\"utf-8\" />\n    <!-- banner部分 -->\n    <div class=\"banner news\">\n        <img class=\"banImage\" src=\"{$channel.channel_image}\" alt=\"\">\n        <div class=\"title\">\n            <p>{$channel.channel_name}</p>\n        </div>\n    </div>\n    <!-- main -->\n    <div class=\"main-news\">\n        <div class=\"layui-container\">\n            <div class=\"layui-row layui-col-space20\">\n                <vt:foreach id=\"contents\" from=\"$contents\" item=\"content\" index=\"i\" total=\"10\" paging=\"1\">\n                    <div class=\"layui-col-lg6 content\">\n                        <div>\n                            <div class=\"news-img\">\n                                <a href=\"{$content.content_href}\">\n                                    <img src=\"{$content.cover_image}\" onerror=\"javascript:this.src=\'/static/images/biglogo.png\';\" style=\"width:184px;height:142px;\">\n                                </a>\n                            </div><div class=\"news-panel\">\n                                <strong><a href=\"{$content.content_href}\">{$content.title length=\'17\'}</a></strong>\n                                <p class=\"detail\">\n                                    <span>{$content.summary length=\'60\'}</span>\n                                    <a href=\"{$content.content_href}\">[详细]</a>\n                                </p>\n                                <p class=\"read-push\">阅读 <span>{$content.hit_count}</span>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<span>{$content.publish_time formatter=\'yyyy-MM-dd\'}</span></p>\n                            </div>\n                        </div>\n                    </div>\n\n                    <vt:foreachelse />\n                    <article class=\"post-27 post type-post status-publish format-standard hentry category-news\">\n                        <div class=\"layui-col-lg6 content\">\n                            <p class=\"detail\">暂时没有数据。。。</p>\n                        </div>\n                    </article>\n                </vt:foreach>\n            </div>\n            <div id=\"newsPage\"></div>\n        </div>\n    </div>\n    <!-- footer部分 -->\n    <vt:include id=\"navi\" file=\"Template/include/footer.html\" charset=\"utf-8\" />\n</body>\n</html>\n\n', 0, 'admin', '2021-04-22 14:03:52', 'admin', '2021-04-22 14:03:52');
INSERT INTO `cms_template` VALUES (14, '成功案例模板', 'T_成功案例模板.html', '', 2, 2, '<!DOCTYPE html>\n<html id=\"doc\">\n<!-- head部分 -->\n<vt:include id=\"navi\" file=\"Template/include/header.html\" charset=\"utf-8\" />\n<body>\n    <!-- nav部分 -->\n    <vt:include file=\"Template/include/navi.html\" charset=\"utf-8\" />\n    <!-- banner部分 -->\n    <div class=\"banner news\">\n        <img class=\"banImage\" src=\"{$channel.channel_image}\" alt=\"\">\n        <div class=\"title\">\n            <p>{$channel.channel_name}</p>\n        </div>\n    </div>\n    <!-- main -->\n    <div class=\"main-news\">\n        <div class=\"layui-container\">\n            <div class=\"layui-row layui-col-space20\">\n                <vt:foreach id=\"contents\" from=\"$contents\" item=\"content\" index=\"i\" total=\"10\" paging=\"1\">\n                    <div class=\"layui-col-lg6 content\">\n                        <div>\n                            <div class=\"news-img\">\n                                <a href=\"{$content.content_href}\">\n                                    <img src=\"{$content.cover_image}\" onerror=\"javascript:this.src=\'/static/images/biglogo.png\';\" style=\"width:184px;height:142px;\">\n                                </a>\n                            </div><div class=\"news-panel\">\n                                <strong><a href=\"{$content.content_href}\">{$content.title length=\'17\'}</a></strong>\n                                <p class=\"detail\">\n                                    <span>{$content.summary length=\'60\'}</span>\n                                    <a href=\"{$content.content_href}\">[详细]</a>\n                                </p>\n                                <p class=\"read-push\">阅读 <span>{$content.hit_count}</span>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<span>{$content.publish_time formatter=\'yyyy-MM-dd\'}</span></p>\n                            </div>\n                        </div>\n                    </div>\n\n                    <vt:foreachelse />\n                    <article class=\"post-27 post type-post status-publish format-standard hentry category-news\">\n                        <div class=\"layui-col-lg6 content\">\n                            <p class=\"detail\">暂时没有数据。。。</p>\n                        </div>\n                    </article>\n                </vt:foreach>\n            </div>\n            <div id=\"newsPage\"></div>\n        </div>\n    </div>\n    <!-- footer部分 -->\n    <vt:include file=\"Template/include/footer.html\" charset=\"utf-8\" />\n</body>\n</html>\n\n', 0, 'admin', '2021-04-22 14:05:10', 'admin', '2021-04-22 14:05:23');

-- ----------------------------
-- Table structure for cms_upload_set
-- ----------------------------
DROP TABLE IF EXISTS `cms_upload_set`;
CREATE TABLE `cms_upload_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_watermark` tinyint(1) NOT NULL,
  `watermark_type` tinyint(1) NOT NULL,
  `image_width` int(11) NOT NULL,
  `image_height` int(11) NOT NULL,
  `watermark_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_opacity` tinyint(4) NOT NULL,
  `image_quality` tinyint(4) NOT NULL,
  `water_postion` tinyint(255) NOT NULL,
  `watermark_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `font_size` int(11) NOT NULL,
  `font_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_extname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `media_extname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attache_extname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `max_file_size` bigint(11) NOT NULL,
  `max_media_size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'cms上传设置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_upload_set
-- ----------------------------
INSERT INTO `cms_upload_set` VALUES (1, 1, 1, 300, 150, '/static/images/logo.png', 6, 70, 9, 'EasyCMS', 50, '#e81c9a', 'gif,jpg,jpeg,bmp,png,pneg,webp', 'flv,mid,midi,mov,mp3,mp4,mpg,mpeg,ogg,mkv', 'zip,rar,7z,js,css,txt,doc,docx,ppt,pptx,xls,xlsx,pdf,bak,csv', 300, 2048);

-- ----------------------------
-- Table structure for cms_visit
-- ----------------------------
DROP TABLE IF EXISTS `cms_visit`;
CREATE TABLE `cms_visit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visit_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_visit
-- ----------------------------
INSERT INTO `cms_visit` VALUES (1, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-05 09:22:12');
INSERT INTO `cms_visit` VALUES (2, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-05 09:22:15');
INSERT INTO `cms_visit` VALUES (3, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-05 09:22:18');
INSERT INTO `cms_visit` VALUES (4, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-05 09:22:21');
INSERT INTO `cms_visit` VALUES (5, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-08 16:51:19');
INSERT INTO `cms_visit` VALUES (6, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-08 16:55:07');
INSERT INTO `cms_visit` VALUES (7, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-08 16:55:09');
INSERT INTO `cms_visit` VALUES (8, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-08 16:55:28');
INSERT INTO `cms_visit` VALUES (9, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-08 16:55:45');
INSERT INTO `cms_visit` VALUES (10, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:02:05');
INSERT INTO `cms_visit` VALUES (11, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:02:17');
INSERT INTO `cms_visit` VALUES (12, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:02:18');
INSERT INTO `cms_visit` VALUES (13, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:02:21');
INSERT INTO `cms_visit` VALUES (14, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:06:07');
INSERT INTO `cms_visit` VALUES (15, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:06:09');
INSERT INTO `cms_visit` VALUES (16, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-09 14:07:51');
INSERT INTO `cms_visit` VALUES (17, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:18');
INSERT INTO `cms_visit` VALUES (18, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:20');
INSERT INTO `cms_visit` VALUES (19, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:21');
INSERT INTO `cms_visit` VALUES (20, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:22');
INSERT INTO `cms_visit` VALUES (21, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:25');
INSERT INTO `cms_visit` VALUES (22, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-10 13:05:27');
INSERT INTO `cms_visit` VALUES (23, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-11 14:30:44');
INSERT INTO `cms_visit` VALUES (24, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 10:11:26');
INSERT INTO `cms_visit` VALUES (25, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 14:40:22');
INSERT INTO `cms_visit` VALUES (26, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:03:40');
INSERT INTO `cms_visit` VALUES (27, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:03:51');
INSERT INTO `cms_visit` VALUES (28, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:09:38');
INSERT INTO `cms_visit` VALUES (29, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:11:58');
INSERT INTO `cms_visit` VALUES (30, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:13');
INSERT INTO `cms_visit` VALUES (31, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:26');
INSERT INTO `cms_visit` VALUES (32, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:41');
INSERT INTO `cms_visit` VALUES (33, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:42');
INSERT INTO `cms_visit` VALUES (34, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:42');
INSERT INTO `cms_visit` VALUES (35, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:42');
INSERT INTO `cms_visit` VALUES (36, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:44');
INSERT INTO `cms_visit` VALUES (37, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:12:57');
INSERT INTO `cms_visit` VALUES (38, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:17:00');
INSERT INTO `cms_visit` VALUES (39, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:18:53');
INSERT INTO `cms_visit` VALUES (40, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:21:09');
INSERT INTO `cms_visit` VALUES (41, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 15:21:29');
INSERT INTO `cms_visit` VALUES (42, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-15 15:47:35');
INSERT INTO `cms_visit` VALUES (43, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:11:53');
INSERT INTO `cms_visit` VALUES (44, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:14:17');
INSERT INTO `cms_visit` VALUES (45, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:16:30');
INSERT INTO `cms_visit` VALUES (46, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:16:39');
INSERT INTO `cms_visit` VALUES (47, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:17:19');
INSERT INTO `cms_visit` VALUES (48, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:17:22');
INSERT INTO `cms_visit` VALUES (49, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.38 Safari/537.36 Edg/84.0.522.15', '2020-06-15 17:18:23');
INSERT INTO `cms_visit` VALUES (50, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-16 09:10:25');
INSERT INTO `cms_visit` VALUES (51, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-16 09:53:47');
INSERT INTO `cms_visit` VALUES (52, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-19 14:55:00');
INSERT INTO `cms_visit` VALUES (53, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-19 15:03:33');
INSERT INTO `cms_visit` VALUES (54, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-19 15:35:32');
INSERT INTO `cms_visit` VALUES (55, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-19 16:10:20');
INSERT INTO `cms_visit` VALUES (56, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-19 17:17:11');
INSERT INTO `cms_visit` VALUES (57, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-22 10:06:15');
INSERT INTO `cms_visit` VALUES (58, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-22 10:37:29');
INSERT INTO `cms_visit` VALUES (59, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-22 11:18:02');
INSERT INTO `cms_visit` VALUES (60, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-22 11:18:03');
INSERT INTO `cms_visit` VALUES (61, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-06-22 11:18:06');
INSERT INTO `cms_visit` VALUES (62, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-08-17 09:59:10');
INSERT INTO `cms_visit` VALUES (63, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-08-17 12:52:28');
INSERT INTO `cms_visit` VALUES (64, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-08-17 14:38:24');
INSERT INTO `cms_visit` VALUES (65, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-11-02 10:58:14');
INSERT INTO `cms_visit` VALUES (66, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-11-06 16:12:43');
INSERT INTO `cms_visit` VALUES (67, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-11-16 09:33:46');
INSERT INTO `cms_visit` VALUES (68, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-11-17 11:10:30');
INSERT INTO `cms_visit` VALUES (69, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', '2020-11-19 13:58:39');
INSERT INTO `cms_visit` VALUES (70, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-23 11:18:54');
INSERT INTO `cms_visit` VALUES (71, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-28 16:02:12');
INSERT INTO `cms_visit` VALUES (72, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-03-10 10:55:01');
INSERT INTO `cms_visit` VALUES (73, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-03-15 09:42:08');
INSERT INTO `cms_visit` VALUES (74, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-03-30 10:10:15');
INSERT INTO `cms_visit` VALUES (75, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-03-31 08:42:23');
INSERT INTO `cms_visit` VALUES (76, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-04-20 10:31:53');
INSERT INTO `cms_visit` VALUES (77, '192.168.1.210', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2021-04-20 10:32:25');

-- ----------------------------
-- Table structure for code_column
-- ----------------------------
DROP TABLE IF EXISTS `code_column`;
CREATE TABLE `code_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `column_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字段名称',
  `sort_num` int(11) NOT NULL COMMENT '字段位置',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '字段描述',
  `can_null` int(3) NOT NULL COMMENT '是否可空，0-不可空，1-可空',
  `type_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '数据库类型，字符串，varchar',
  `type_text_full` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '数据库类型，字符串，varchar(255)',
  `max_length` int(11) NOT NULL COMMENT '字段最大长度',
  `dbtype` int(10) NOT NULL COMMENT '数据库枚举类型int值',
  `cstype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'C# 类型',
  `is_identity` int(10) NOT NULL COMMENT '自增 0-不是，1-是',
  `is_primary` int(10) NULL DEFAULT NULL COMMENT '主键 0-不是，1-是',
  `sync_time` datetime(0) NOT NULL COMMENT '同步时间',
  `update_time` datetime(0) NOT NULL COMMENT '最新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tname`(`table_name`, `sort_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 711 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成，表的字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_column
-- ----------------------------
INSERT INTO `code_column` VALUES (348, 'cms_channel', 'id', 12, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (349, 'cms_channel', 'channel_href', 17, '外链', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (350, 'cms_channel', 'channel_image', 16, '栏目图片', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (351, 'cms_channel', 'channel_index', 14, '栏目索引', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (352, 'cms_channel', 'channel_name', 13, '栏目名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (353, 'cms_channel', 'channel_template', 19, '栏目模板', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (354, 'cms_channel', 'content_template', 20, '内容模板', 0, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (355, 'cms_channel', 'create_by', 23, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (356, 'cms_channel', 'create_time', 24, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (357, 'cms_channel', 'drawing_enable', 21, '渲染标识：1-渲染，0-不渲染 根据需要判断', 0, 'tinyint', 'tinyint(255)', 255, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (358, 'cms_channel', 'link_type', 22, '链接类型：0-默认，1-链接到第一篇文章,2-链接到子栏目', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (359, 'cms_channel', 'parent_id', 15, '上级栏目', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (360, 'cms_channel', 'sort_num', 18, '排序', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (361, 'cms_channel', 'update_by', 25, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (362, 'cms_channel', 'update_time', 26, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (363, 'cms_content', 'id', 27, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (364, 'cms_content', 'author', 38, '作者', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (365, 'cms_content', 'channel_id', 34, '栏目id', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (366, 'cms_content', 'content', 30, '文章内容', 0, 'longtext', 'longtext', -1, 751, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (367, 'cms_content', 'content_href', 40, '外链', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (368, 'cms_content', 'content_status', 37, '文章状态 0-待审，1-通过，2-草稿，100-审核不通过', 0, 'tinyint', 'tinyint(3)', 3, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (369, 'cms_content', 'cover_image', 32, '封面图片', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (370, 'cms_content', 'create_by', 45, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (371, 'cms_content', 'create_time', 46, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (372, 'cms_content', 'dept_id', 33, '作者归属部门', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (373, 'cms_content', 'hit_count', 41, '点击量', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (374, 'cms_content', 'ip_limit', 35, '是否开启ip访问限制', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (375, 'cms_content', 'is_recommend', 43, '是否推荐 0-不推荐，1-推荐', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (376, 'cms_content', 'is_top', 42, '是否置顶 0-不置顶，1-置顶', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (377, 'cms_content', 'publish_time', 44, '自定义发布时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (378, 'cms_content', 'source', 39, '来源', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (379, 'cms_content', 'sub_title', 29, '副标题', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (380, 'cms_content', 'summary', 31, '简介', 0, 'text', 'text', -1, 752, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (381, 'cms_content', 'tags', 36, '标签', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (382, 'cms_content', 'title', 28, '文章标题', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (383, 'cms_content', 'update_by', 47, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (384, 'cms_content', 'update_time', 48, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (385, 'cms_content_image', 'int', 49, '', 0, 'int', 'int(255)', 255, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (386, 'cms_content_image', 'image_sort', 51, '', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (387, 'cms_content_image', 'image_title', 52, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (388, 'cms_content_image', 'image_url', 50, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (389, 'cms_content_image', 'insert_time', 53, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (390, 'cms_ip_manager', 'id', 54, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (391, 'cms_ip_manager', 'create_by', 61, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (392, 'cms_ip_manager', 'create_time', 62, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (393, 'cms_ip_manager', 'end_ip', 56, '结束ip', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (394, 'cms_ip_manager', 'end_ip_val', 58, '结束ip值', 0, 'bigint', 'bigint(255)', 255, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (395, 'cms_ip_manager', 'limit_enable', 59, '0-不限制，1-限制', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (396, 'cms_ip_manager', 'remark', 60, '', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (397, 'cms_ip_manager', 'start_ip', 55, '起始ip', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (398, 'cms_ip_manager', 'start_ip_val', 57, '起始ip值', 0, 'bigint', 'bigint(255)', 255, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (399, 'cms_ip_manager', 'update_by', 63, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (400, 'cms_ip_manager', 'update_time', 64, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (401, 'cms_site', 'id', 65, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (402, 'cms_site', 'site_copyright', 73, '版权信息', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (403, 'cms_site', 'site_description', 72, 'SEO描述', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (404, 'cms_site', 'site_favicon', 68, '地址栏图标', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (405, 'cms_site', 'site_icp', 74, '备案号', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (406, 'cms_site', 'site_keyword', 71, 'SEO关键词', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (407, 'cms_site', 'site_logo', 67, '网站LOGO', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (408, 'cms_site', 'site_name', 66, '站点名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (409, 'cms_site', 'site_title', 70, 'SEO标题', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (410, 'cms_site', 'site_url', 69, '网站网址', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (411, 'cms_template', 'id', 75, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (412, 'cms_template', 'create_by', 83, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (413, 'cms_template', 'create_time', 84, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (414, 'cms_template', 'file_name', 78, '生成的文件名，单页模板使用', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (415, 'cms_template', 'is_default', 82, '是否为默认模板 0-否，1-是', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (416, 'cms_template', 'pid', 80, '1-首页，2-栏目模板，3-内容模板，4-单页模板,5-包含文件', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (417, 'cms_template', 'template_content', 81, '模板内容', 0, 'longtext', 'longtext', -1, 751, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (418, 'cms_template', 'template_file', 77, '模板文件', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (419, 'cms_template', 'template_mode', 79, '模板类型，1-首页，2-栏目模板，3-内容模板，4-单页模板,5-包含文件', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (420, 'cms_template', 'template_name', 76, '模板名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (421, 'cms_template', 'update_by', 85, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (422, 'cms_template', 'update_time', 86, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (423, 'cms_upload_set', 'id', 87, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (424, 'cms_upload_set', 'attache_extname', 101, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (425, 'cms_upload_set', 'font_color', 98, '', 0, 'varchar', 'varchar(10)', 10, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (426, 'cms_upload_set', 'font_size', 97, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (427, 'cms_upload_set', 'image_extname', 99, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (428, 'cms_upload_set', 'image_height', 91, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (429, 'cms_upload_set', 'image_opacity', 93, '', 0, 'tinyint', 'tinyint(4)', 4, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (430, 'cms_upload_set', 'image_quality', 94, '', 0, 'tinyint', 'tinyint(4)', 4, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (431, 'cms_upload_set', 'image_width', 90, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (432, 'cms_upload_set', 'max_file_size', 102, '', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (433, 'cms_upload_set', 'max_media_size', 103, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (434, 'cms_upload_set', 'media_extname', 100, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (435, 'cms_upload_set', 'open_watermark', 88, '', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (436, 'cms_upload_set', 'water_postion', 95, '', 0, 'tinyint', 'tinyint(255)', 255, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (437, 'cms_upload_set', 'watermark_image', 92, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (438, 'cms_upload_set', 'watermark_type', 89, '', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (439, 'cms_upload_set', 'watermark_word', 96, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (440, 'cms_visit', 'id', 104, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (441, 'cms_visit', 'browser', 106, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (442, 'cms_visit', 'ip', 105, '', 0, 'varchar', 'varchar(20)', 20, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (443, 'cms_visit', 'visit_time', 107, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (444, 'code_column', 'id', 108, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (445, 'code_column', 'can_null', 113, '是否可空，0-不可空，1-可空', 0, 'int', 'int(3)', 3, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (446, 'code_column', 'column_name', 110, '字段名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (447, 'code_column', 'comment', 112, '字段描述', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (448, 'code_column', 'cstype', 118, 'C# 类型', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (449, 'code_column', 'dbtype', 117, '数据库枚举类型int值', 0, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (450, 'code_column', 'is_identity', 119, '自增 0-不是，1-是', 0, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (451, 'code_column', 'is_primary', 120, '主键 0-不是，1-是', 1, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (452, 'code_column', 'max_length', 116, '字段最大长度', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (453, 'code_column', 'sort_num', 111, '字段位置', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (454, 'code_column', 'sync_time', 121, '同步时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (455, 'code_column', 'table_name', 109, '表名', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (456, 'code_column', 'type_text', 114, '数据库类型，字符串，varchar', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (457, 'code_column', 'type_text_full', 115, '数据库类型，字符串，varchar(255)', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (458, 'code_column', 'update_time', 122, '最新时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (459, 'code_table', 'id', 123, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (460, 'code_table', 'db_name', 124, '数据库', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (461, 'code_table', 'entity_name', 126, '代码生成 实体类名称', 1, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (462, 'code_table', 'remark', 128, '表描述', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (463, 'code_table', 'sync_time', 129, '首次同步时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (464, 'code_table', 'table_name', 125, '表名', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (465, 'code_table', 'table_type', 127, '表类型 0-表，1-视图，2-存储过程', 0, 'int', 'int(2)', 2, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (466, 'code_table', 'update_time', 130, '最新同步时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (467, 'easy_log', 'id', 131, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (468, 'easy_log', 'log_message', 133, '', 0, 'mediumtext', 'mediumtext', -1, 750, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (469, 'easy_log', 'log_summary', 132, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (470, 'easy_log', 'log_time', 135, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (471, 'easy_log', 'log_type', 134, '', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (472, 'exam_record', 'id', 136, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (473, 'exam_record', 'course_code', 137, '课程代码', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (474, 'exam_record', 'course_flag', 142, '专业课1：是 0：你收', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (475, 'exam_record', 'course_name', 138, '课程名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (476, 'exam_record', 'course_score', 139, '得分', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (477, 'exam_record', 'exam_time', 140, '考试时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (478, 'exam_record', 'remark', 141, '备注', 1, 'tinytext', 'tinytext', -1, 749, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (479, 'fh_product', 'id', 143, '', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (480, 'fh_product', 'create_by', 147, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (481, 'fh_product', 'create_time', 146, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (482, 'fh_product', 'product_name', 144, '产品名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (483, 'fh_product', 'product_type', 148, '0-产品，1-调配工时', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (484, 'fh_product', 'remark', 149, '', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (485, 'fh_product', 'sort_num', 145, '排序', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (486, 'fh_product_process', 'id', 150, '', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (487, 'fh_product_process', 'deploy_hour', 156, '调配的工时', 0, 'decimal', 'decimal(5,1)', 5, 0, 'Decimal', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (488, 'fh_product_process', 'fix_num', 154, '产品的定额数量', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (489, 'fh_product_process', 'process_name', 152, '工序名称', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (490, 'fh_product_process', 'process_type', 155, '0-产品，1-调配工时', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (491, 'fh_product_process', 'product_id', 151, '', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (492, 'fh_product_process', 'sort_num', 153, '', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (499, 'fh_time_bill', 'id', 163, '', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (500, 'fh_time_bill', 'create_by', 170, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (501, 'fh_time_bill', 'create_time', 171, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (502, 'fh_time_bill', 'deploy_hour', 167, '调配工时', 0, 'decimal', 'decimal(5,1)', 5, 0, 'Decimal', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (503, 'fh_time_bill', 'is_holiday', 169, '0-不是，1-是', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (504, 'fh_time_bill', 'remark', 174, '', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (505, 'fh_time_bill', 'staff_id', 164, '员工id', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (506, 'fh_time_bill', 'staff_name', 165, '员工名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (507, 'fh_time_bill', 'update_by', 172, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (508, 'fh_time_bill', 'update_time', 173, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (509, 'fh_time_bill', 'work_date', 168, '工作日期', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (510, 'fh_time_bill', 'work_num', 166, '实际配额数量', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (511, 'fh_time_process', 'id', 175, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (512, 'fh_time_process', 'bill_id', 176, '工时表Id', 0, 'bigint', 'bigint(11)', 11, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (513, 'fh_time_process', 'deploy_hour', 181, '调配工时', 0, 'decimal', 'decimal(5,1)', 5, 0, 'Decimal', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (514, 'fh_time_process', 'is_holiday', 184, '法定假日', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (515, 'fh_time_process', 'process_id', 178, '工序id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (516, 'fh_time_process', 'process_type', 179, '0-产品，1-调配工时', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (517, 'fh_time_process', 'product_id', 177, '产品id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (518, 'fh_time_process', 'staff_id', 182, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (519, 'fh_time_process', 'work_date', 183, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (520, 'fh_time_process', 'work_num', 180, '实际配额数量', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (521, 'hangfire_task', 'id', 185, '', 0, 'char', 'char(24)', 24, 254, 'String', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (522, 'hangfire_task', 'assembly_namespace', 189, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (523, 'hangfire_task', 'class_name', 190, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (524, 'hangfire_task', 'cron_express', 191, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (525, 'hangfire_task', 'excute_status', 192, '', 0, 'tinyint', 'tinyint(2)', 2, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (526, 'hangfire_task', 'excute_time', 188, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (527, 'hangfire_task', 'remark', 187, '', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (528, 'hangfire_task', 'task_name', 186, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (529, 'login_info', 'id', 193, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (530, 'login_info', 'browser', 196, '浏览器信息', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (531, 'login_info', 'device_info', 195, '设备信息', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (532, 'login_info', 'login_message', 202, '日志内容', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (533, 'login_info', 'login_name', 194, '登录名', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (534, 'login_info', 'login_status', 201, '0-失败，1-成功', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (535, 'login_info', 'osinfo', 197, '操作系统', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (536, 'login_info', 'real_address', 199, '真实地址', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (537, 'login_info', 'request_ip', 198, 'ip', 0, 'varchar', 'varchar(20)', 20, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (538, 'login_info', 'request_time', 200, '访问时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (539, 'sys_citys', 'id', 203, '', 0, 'bigint', 'bigint(255)', 255, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (540, 'sys_citys', 'city_code', 207, '', 0, 'int', 'int(12)', 12, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (541, 'sys_citys', 'city_level', 208, '', 0, 'int', 'int(2)', 2, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (542, 'sys_citys', 'name', 205, '', 0, 'varchar', 'varchar(100)', 100, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (543, 'sys_citys', 'province_code', 206, '', 0, 'int', 'int(12)', 12, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (544, 'sys_citys', 'zipcode', 204, '', 0, 'int', 'int(12)', 12, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (545, 'sys_dept', 'id', 209, '部门id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (546, 'sys_dept', 'ancestors', 212, '祖级列表', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (547, 'sys_dept', 'create_by', 221, '创建者', 0, 'varchar', 'varchar(64)', 64, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (548, 'sys_dept', 'create_time', 222, '创建时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (549, 'sys_dept', 'del_flag', 220, '删除标志（0代表存在 2代表删除）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (550, 'sys_dept', 'dept_name', 213, '部门名称', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (551, 'sys_dept', 'dept_status', 219, '部门状态（0正常 1停用）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (552, 'sys_dept', 'dept_type', 211, '部门类型（0公司，1部门）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (553, 'sys_dept', 'email', 218, '邮箱', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (554, 'sys_dept', 'leader', 216, '负责人', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (555, 'sys_dept', 'leader_id', 215, '负责人ID', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (556, 'sys_dept', 'order_num', 214, '显示顺序', 0, 'int', 'int(4)', 4, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (557, 'sys_dept', 'parent_id', 210, '父部门id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (558, 'sys_dept', 'phone', 217, '联系电话', 0, 'varchar', 'varchar(11)', 11, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (559, 'sys_dept', 'remark', 225, '备注', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (560, 'sys_dept', 'update_by', 223, '更新者', 0, 'varchar', 'varchar(64)', 64, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (561, 'sys_dept', 'update_time', 224, '更新时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (562, 'sys_dictionary', 'id', 226, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (563, 'sys_dictionary', 'create_person', 233, '创建人', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (564, 'sys_dictionary', 'create_time', 234, '创建时间', 0, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (565, 'sys_dictionary', 'dic_code', 230, '字典编码', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (566, 'sys_dictionary', 'dic_name', 227, '字典名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (567, 'sys_dictionary', 'dic_value', 228, '字典值', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (568, 'sys_dictionary', 'parent_id', 229, '字典项', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (569, 'sys_dictionary', 'remark', 232, '备注', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (570, 'sys_dictionary', 'sort_num', 231, '排序', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (571, 'sys_menu', 'id', 235, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (572, 'sys_menu', 'create_person', 242, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (573, 'sys_menu', 'create_time', 243, '', 0, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (574, 'sys_menu', 'iframe', 244, '是否在iframe打开现在都是', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (575, 'sys_menu', 'menu_icon', 247, '菜单icon', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (576, 'sys_menu', 'menu_level', 245, '菜单层级', 0, 'tinyint', 'tinyint(4)', 4, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (577, 'sys_menu', 'menu_name', 236, '菜单名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (578, 'sys_menu', 'menu_sort', 239, '排序', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (579, 'sys_menu', 'menu_type', 246, '类型：0-目录，1-菜单', 0, 'tinyint', 'tinyint(4)', 4, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (580, 'sys_menu', 'menu_url', 237, '菜单链接', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (581, 'sys_menu', 'parent_id', 240, '上级菜单', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (582, 'sys_menu', 'remark', 241, '备注', 1, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (583, 'sys_menu', 'role_tag', 238, '权限标识', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (584, 'sys_operate', 'id', 248, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (585, 'sys_operate', 'func_sort', 251, '排序', 0, 'int', 'int(5)', 5, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (586, 'sys_operate', 'func_title', 249, '按钮名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (587, 'sys_operate', 'menu_id', 252, '菜单Id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (588, 'sys_operate', 'role_tag', 250, '权限标识', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (589, 'sys_position', 'id', 253, '岗位ID', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (590, 'sys_position', 'create_by', 258, '创建者', 0, 'varchar', 'varchar(64)', 64, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (591, 'sys_position', 'create_time', 259, '创建时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (592, 'sys_position', 'post_code', 254, '岗位编码', 0, 'varchar', 'varchar(64)', 64, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (593, 'sys_position', 'post_name', 255, '岗位名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (594, 'sys_position', 'post_sort', 256, '显示顺序', 0, 'int', 'int(4)', 4, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (595, 'sys_position', 'post_status', 257, '状态（0正常 1停用）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (596, 'sys_position', 'remark', 262, '备注', 1, 'varchar', 'varchar(500)', 500, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (597, 'sys_position', 'update_by', 260, '更新者', 0, 'varchar', 'varchar(64)', 64, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (598, 'sys_position', 'update_time', 261, '更新时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (599, 'sys_role', 'id', 263, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (600, 'sys_role', 'create_person', 269, '创建人', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (601, 'sys_role', 'create_time', 270, '创建时间', 0, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (602, 'sys_role', 'remark', 271, '备注', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (603, 'sys_role', 'role_code', 265, '角色编码', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (604, 'sys_role', 'role_name', 264, '角色名称', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (605, 'sys_role', 'role_sort', 266, '排序', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (606, 'sys_role', 'role_status', 268, '角色状态(0:正常，1:禁用)', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (607, 'sys_role', 'role_super', 267, '超管(1:是，0:不是)', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (608, 'sys_role_authorize', 'id', 272, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (609, 'sys_role_authorize', 'create_person', 276, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (610, 'sys_role_authorize', 'create_time', 277, '', 0, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (611, 'sys_role_authorize', 'menu_id', 274, '菜单或者操作id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (612, 'sys_role_authorize', 'menu_pid', 275, '上级id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (613, 'sys_role_authorize', 'role_id', 273, '角色id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (614, 'sys_user', 'id', 278, '用户id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (615, 'sys_user', 'create_by', 293, '创建人', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (616, 'sys_user', 'create_time', 294, '创建时间', 0, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (617, 'sys_user', 'del_flag', 292, '删除标志（0代表存在 1代表删除）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (618, 'sys_user', 'dept_id', 287, '部门', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (619, 'sys_user', 'dept_name', 288, '部门', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (620, 'sys_user', 'email', 283, '邮箱', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (621, 'sys_user', 'gender', 284, '用户性别（1男 0女 2未知）', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (622, 'sys_user', 'is_super', 285, '是否是超管(0-不是，1-是)', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (623, 'sys_user', 'login_name', 279, '登录账号', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (624, 'sys_user', 'mobile_phone', 282, '手机号码', 0, 'varchar', 'varchar(20)', 20, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (625, 'sys_user', 'pass_word', 280, '密码', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (626, 'sys_user', 'remark', 290, '备注', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (627, 'sys_user', 'role_id', 286, '角色id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (628, 'sys_user', 'update_by', 295, '更新人', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (629, 'sys_user', 'update_time', 296, '更新时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (630, 'sys_user', 'user_avatar', 289, '用户头像', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (631, 'sys_user', 'user_name', 281, '用户名', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (632, 'sys_user', 'user_status', 291, '账号状态(0-正常，1-禁用)', 0, 'int', 'int(1)', 1, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (633, 'sys_user_position', 'id', 297, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (634, 'sys_user_position', 'create_by', 301, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (635, 'sys_user_position', 'create_time', 300, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (636, 'sys_user_position', 'position_id', 299, '职位id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (637, 'sys_user_position', 'user_id', 298, '用户id', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (638, 'sys_validate_code', 'id', 302, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (639, 'sys_validate_code', 'create_time', 306, '', 1, 'datetime', 'datetime(3)', 3, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (640, 'sys_validate_code', 'note_code', 304, '', 1, 'varchar', 'varchar(10)', 10, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (641, 'sys_validate_code', 'tel', 303, '', 1, 'varchar', 'varchar(15)', 15, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (642, 'sys_validate_code', 'validate_type', 305, '', 1, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (643, 'work_address_book', 'id', 307, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (644, 'work_address_book', 'address', 315, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (645, 'work_address_book', 'department_name', 310, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (646, 'work_address_book', 'dept_id', 309, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (647, 'work_address_book', 'inner_tel', 313, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (648, 'work_address_book', 'insert_time', 318, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (649, 'work_address_book', 'mobile', 314, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (650, 'work_address_book', 'profile', 316, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (651, 'work_address_book', 'real_name', 308, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (652, 'work_address_book', 'sort_num', 317, '', 0, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (653, 'work_address_book', 'work_job', 312, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (654, 'work_address_book', 'work_number', 311, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (655, 'work_notice', 'id', 319, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (656, 'work_notice', 'dept_ids', 328, '', 0, 'varchar', 'varchar(500)', 500, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (657, 'work_notice', 'insert_id', 324, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (658, 'work_notice', 'insert_time', 323, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (659, 'work_notice', 'n_content', 322, '', 0, 'text', 'text', -1, 752, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (660, 'work_notice', 'n_time', 321, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (661, 'work_notice', 'n_title', 320, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (662, 'work_notice', 'nick_name', 325, '', 1, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (663, 'work_notice', 'received_count', 327, '', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (664, 'work_notice', 'total_depts', 326, '', 0, 'int', 'int(10)', 10, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (665, 'work_notice_reply', 'id', 329, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (666, 'work_notice_reply', 'dept_id', 334, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (667, 'work_notice_reply', 'dept_name', 335, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (668, 'work_notice_reply', 'nick_name', 332, '', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (669, 'work_notice_reply', 'notice_id', 330, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (670, 'work_notice_reply', 'reply_status', 336, '', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (671, 'work_notice_reply', 'reply_time', 333, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (672, 'work_notice_reply', 'user_id', 331, '', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_column` VALUES (684, 'cms_ad', 'id', 1, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (685, 'cms_ad', 'ad_href', 3, '链接', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (686, 'cms_ad', 'ad_image', 4, '广告图', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (687, 'cms_ad', 'ad_title', 2, '广告标题', 0, 'varchar', 'varchar(255)', 255, 253, 'String', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (688, 'cms_ad', 'create_by', 9, '创建人', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (689, 'cms_ad', 'create_time', 8, '创建时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (690, 'cms_ad', 'enable_status', 5, '', 0, 'tinyint', 'tinyint(1)', 1, 1, 'SByte', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (691, 'cms_ad', 'image_height', 7, '显示高度', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (692, 'cms_ad', 'image_width', 6, '显示宽度', 0, 'int', 'int(11)', 11, 3, 'Int32', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (693, 'cms_ad', 'update_by', 11, '更新人', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (694, 'cms_ad', 'update_time', 10, '更新时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-27 14:29:10', '2021-04-27 14:29:10');
INSERT INTO `code_column` VALUES (700, 'sys_sql_log', 'id', 1, '数据Id', 0, 'int', 'int(255)', 255, 3, 'Int32', 1, 1, '2021-04-29 11:49:50', '2021-04-29 11:49:50');
INSERT INTO `code_column` VALUES (701, 'sys_sql_log', 'elapsed_time', 4, '耗时毫秒', 0, 'bigint', 'bigint(20)', 20, 8, 'Int64', 0, 0, '2021-04-29 11:49:50', '2021-04-29 11:49:50');
INSERT INTO `code_column` VALUES (702, 'sys_sql_log', 'excute_time', 5, '执行时间', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-04-29 11:49:50', '2021-04-29 11:49:50');
INSERT INTO `code_column` VALUES (703, 'sys_sql_log', 'sql_string', 3, '执行sql字符串', 0, 'mediumtext', 'mediumtext', -1, 750, 'String', 0, 0, '2021-04-29 11:49:50', '2021-04-29 11:49:50');
INSERT INTO `code_column` VALUES (704, 'sys_sql_log', 'table_name', 2, '表名', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-04-29 11:49:50', '2021-04-29 11:49:50');
INSERT INTO `code_column` VALUES (705, 'fh_staff', 'id', 1, '', 0, 'int', 'int(11)', 11, 3, 'Int32', 1, 1, '2021-05-17 15:07:09', '2021-05-17 15:07:09');
INSERT INTO `code_column` VALUES (706, 'fh_staff', 'create_by', 5, '', 0, 'varchar', 'varchar(30)', 30, 253, 'String', 0, 0, '2021-05-17 15:07:09', '2021-05-17 15:07:09');
INSERT INTO `code_column` VALUES (707, 'fh_staff', 'create_time', 4, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-05-17 15:07:09', '2021-05-17 15:07:09');
INSERT INTO `code_column` VALUES (708, 'fh_staff', 'hiredate', 3, '', 0, 'datetime', 'datetime', -1, 12, 'DateTime', 0, 0, '2021-05-17 15:07:09', '2021-05-17 15:07:09');
INSERT INTO `code_column` VALUES (709, 'fh_staff', 'staff_disable', 6, '0-正常，1-禁用', 0, 'int', 'int(255)', 255, 3, 'Int32', 0, 0, '2021-05-17 15:07:09', '2021-05-17 15:07:09');
INSERT INTO `code_column` VALUES (710, 'fh_staff', 'staff_name', 2, '', 0, 'varchar', 'varchar(50)', 50, 253, 'String', 0, 0, '2021-05-17 15:07:09', '2021-05-17 15:07:09');

-- ----------------------------
-- Table structure for code_table
-- ----------------------------
DROP TABLE IF EXISTS `code_table`;
CREATE TABLE `code_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '数据库',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `entity_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '代码生成 实体类名称',
  `table_type` int(2) NOT NULL COMMENT '表类型 0-表，1-视图，2-存储过程',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表描述',
  `sync_time` datetime(0) NOT NULL COMMENT '首次同步时间',
  `update_time` datetime(0) NOT NULL COMMENT '最新同步时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tname`(`table_name`, `update_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '表数据信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_table
-- ----------------------------
INSERT INTO `code_table` VALUES (76, '', 'cms_ad', 'cms_ad', 0, '广告信息表', '2021-04-27 13:59:24', '2021-04-27 14:29:10');
INSERT INTO `code_table` VALUES (77, '', 'cms_channel', 'cms_channel', 0, '栏目信息表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (78, '', 'cms_content', 'cms_content', 0, '内容表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (79, '', 'cms_content_image', 'cms_content_image', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (80, '', 'cms_ip_manager', 'cms_ip_manager', 0, 'ip访问限制信息表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (81, '', 'cms_site', 'cms_site', 0, '站点设置信息表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (82, '', 'cms_template', 'cms_template', 0, '模板信息表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (83, '', 'cms_upload_set', 'cms_upload_set', 0, 'cms上传设置信息', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (84, '', 'cms_visit', 'cms_visit', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (85, '', 'code_column', 'code_column', 0, '代码生成，表的字段信息', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (86, '', 'code_table', 'code_table', 0, '表数据信息', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (87, '', 'easy_log', 'easy_log', 0, '系统日志', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (88, '', 'exam_record', 'exam_record', 0, '自考成绩表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (89, '', 'fh_product', 'fh_product', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (90, '', 'fh_product_process', 'fh_product_process', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (91, '', 'fh_staff', 'fh_staff', 0, '', '2021-04-27 13:59:24', '2021-05-17 15:07:09');
INSERT INTO `code_table` VALUES (92, '', 'fh_time_bill', 'fh_time_bill', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (93, '', 'fh_time_process', 'fh_time_process', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (94, '', 'hangfire_task', 'hangfire_task', 0, 'hangfire任务管理表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (95, '', 'login_info', 'login_info', 0, '登录日志表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (96, '', 'sys_citys', 'sys_citys', 0, '行政区域表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (97, '', 'sys_dept', 'sys_dept', 0, '部门表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (98, '', 'sys_dictionary', 'sys_dictionary', 0, '字典表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (99, '', 'sys_menu', 'sys_menu', 0, '菜单表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (100, '', 'sys_operate', 'sys_operate', 0, '按钮操作表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (101, '', 'sys_position', 'sys_position', 0, '岗位信息表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (102, '', 'sys_role', 'sys_role', 0, '用户角色表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (103, '', 'sys_role_authorize', 'sys_role_authorize', 0, '角色权限表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (104, '', 'sys_user', 'sys_user', 0, '系统用户表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (105, '', 'sys_user_position', 'sys_user_position', 0, '用户职位表', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (106, '', 'sys_validate_code', 'sys_validate_code', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (107, '', 'work_address_book', 'work_address_book', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (108, '', 'work_notice', 'work_notice', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (109, '', 'work_notice_reply', 'work_notice_reply', 0, '', '2021-04-27 13:59:24', '2021-04-27 13:59:24');
INSERT INTO `code_table` VALUES (110, '', 'sys_sql_log', 'sys_sql_log', 0, 'sql执行日志\r\n', '2021-04-29 11:49:28', '2021-04-29 11:49:50');

-- ----------------------------
-- Table structure for crontab_history
-- ----------------------------
DROP TABLE IF EXISTS `crontab_history`;
CREATE TABLE `crontab_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务id',
  `excute_time` datetime(0) NOT NULL COMMENT '执行时间',
  `excute_result` int(5) NOT NULL COMMENT '直接结果：0-正常，1-异常',
  `elapsed_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '执行耗时',
  `error_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务执行结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crontab_history
-- ----------------------------
INSERT INTO `crontab_history` VALUES (1, '5eaabde6c1a509138ce04e80', '2021-06-24 10:21:05', 1, '18毫秒', 'this exception from job listener：   at Atlass.Framework.Jobs.TestJob.Excute(Dictionary`2 jobParams) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Jobs\\Jobs\\TestJob.cs:line 47');

-- ----------------------------
-- Table structure for easy_log
-- ----------------------------
DROP TABLE IF EXISTS `easy_log`;
CREATE TABLE `easy_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `log_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `log_type` tinyint(2) NOT NULL,
  `log_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_time`(`log_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easy_log
-- ----------------------------
INSERT INTO `easy_log` VALUES (1, 'hangfireJob任务', '2021/6/24 10:21:05', 1, '2021-06-24 10:21:05');

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '课程代码',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名称',
  `course_score` int(255) NOT NULL COMMENT '得分',
  `exam_time` datetime(0) NOT NULL COMMENT '考试时间',
  `remark` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '备注',
  `course_flag` int(255) NOT NULL COMMENT '专业课1：是 0：你收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '自考成绩表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES (1, '00015', '英语（二）', 89, '2019-04-14 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (2, '03708', '中国近现代史纲要', 70, '2019-04-13 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (3, '03709', '马克思主义基本原理概论', 72, '2019-04-13 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (4, '03871', '市场调查与市场分析', 64, '2020-08-01 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (5, '05962', '招聘管理', 66, '2019-06-29 00:00:00', '                    ', 1);
INSERT INTO `exam_record` VALUES (6, '05963', '绩效管理', 68, '2019-10-20 00:00:00', '                    ', 1);
INSERT INTO `exam_record` VALUES (7, '06090', '人员素质测评理论与方法', 61, '2020-01-05 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (8, '06091', '薪酬管理', 60, '2019-10-20 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (9, '06092', '工作分析', 62, '2020-04-01 00:00:00', '2020年10月17日 上午 ：52\r\n2019年10月19日 上午 ：62', 1);
INSERT INTO `exam_record` VALUES (10, '06093', '人力资源开发与管理', 54, '2020-08-01 00:00:00', '2020年08月01日 下午    48\r\n2019年06月30日 下午    54\r\n', 1);
INSERT INTO `exam_record` VALUES (11, '10052', '职业生涯规划与管理', 71, '2019-04-14 00:00:00', '                    ', 1);
INSERT INTO `exam_record` VALUES (12, '30466', '员工关系管理', 62, '2019-10-19 00:00:00', '                    ', 0);
INSERT INTO `exam_record` VALUES (13, '30584', '员工培训管理', 65, '2020-08-03 00:00:00', '2020年08月03日 下午  65\r\n2020年01月04日 下午   49', 0);

-- ----------------------------
-- Table structure for fh_product
-- ----------------------------
DROP TABLE IF EXISTS `fh_product`;
CREATE TABLE `fh_product`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品名称',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime(0) NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `product_type` int(255) NOT NULL COMMENT '0-产品，1-调配工时',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_product
-- ----------------------------
INSERT INTO `fh_product` VALUES (70, 'ET907', 10, '2021-05-18 10:54:54', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (71, 'ZS004', 1, '2021-05-18 11:11:29', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (72, 'ZS005', 2, '2021-05-18 11:11:58', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (73, 'ZS006', 3, '2021-05-18 11:17:19', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (74, 'ZS007', 4, '2021-05-18 11:19:06', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (75, 'ZT削飞边', 5, '2021-05-18 11:19:25', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (76, 'T901', 6, '2021-05-18 11:20:11', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (77, 'ET902', 7, '2021-05-18 11:20:40', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (78, 'T904', 8, '2021-05-18 11:21:43', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (79, 'T905', 9, '2021-05-18 11:22:09', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (80, 'ET911', 11, '2021-05-18 11:22:33', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (81, 'T915', 12, '2021-05-18 11:24:18', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (82, 'ET926', 13, '2021-05-18 13:06:18', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (83, 'ET927', 14, '2021-05-18 13:09:07', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (84, 'PT583', 19, '2021-05-18 13:09:27', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (85, 'ET933', 15, '2021-05-18 13:27:52', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (86, 'PT160', 16, '2021-05-18 13:29:24', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (87, 'PT200', 17, '2021-05-18 13:30:59', 'admin', 0, NULL);
INSERT INTO `fh_product` VALUES (88, 'PT286', 18, '2021-05-18 13:31:44', 'admin', 0, NULL);

-- ----------------------------
-- Table structure for fh_product_process
-- ----------------------------
DROP TABLE IF EXISTS `fh_product_process`;
CREATE TABLE `fh_product_process`  (
  `id` bigint(11) NOT NULL,
  `product_id` bigint(11) NOT NULL,
  `process_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '工序名称',
  `sort_num` int(255) NOT NULL,
  `fix_num` int(11) NOT NULL COMMENT '产品的定额数量',
  `process_type` int(255) NOT NULL COMMENT '0-产品，1-调配工时',
  `deploy_hour` decimal(5, 1) NOT NULL COMMENT '调配的工时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_product_process
-- ----------------------------
INSERT INTO `fh_product_process` VALUES (160322733232197, 70, 'ET907-GJ注塑', 1, 6600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232198, 70, 'ET907-XG注塑', 2, 23000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232199, 70, '测芯片', 3, 5000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232200, 70, '剪脚', 4, 22000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232201, 70, '装芯片', 5, 4000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232202, 70, '绕线', 6, 5600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232203, 70, 'F3.EM焊接（检）', 7, 6000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232204, 70, 'F4焊接（检）', 8, 5500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232205, 70, '装下盖', 9, 6000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232206, 70, 'ET907(注+剪+检)注塑', 10, 3000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232207, 70, '镭刻、包装', 11, 6200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160322733232208, 70, 'LG镭刻、包装', 12, 5600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160326810386501, 71, 'ZS004-ZZZJ注塑', 1, 1340, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160326927097925, 72, 'ZS005-ZZZJ注塑', 1, 2700, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328243720261, 73, 'ZS006-ZZZJ-V1注塑', 1, 2500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328243720262, 73, 'ZS006(007)-HT注塑', 2, 25000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328243720263, 73, 'ZS006(009)-ZT注塑', 3, 5300, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328243720264, 73, 'ZS006(010)-TG注塑', 4, 11500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328681250885, 74, 'ZS007-ZZZJ注塑', 1, 2400, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328761053253, 75, '装配、包装', 1, 9300, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328946241605, 76, 'T901注塑 ', 1, 2800, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328946241606, 76, '仅包装 ', 1, 22000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160328946241607, 76, '镭刻', 1, 9000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329067331653, 77, 'ET902(注+剪+检)注塑', 1, 1700, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329323122757, 78, 'T904镭刻1#机 ', 1, 1440, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329323122758, 78, 'T904镭刻2#机 ', 1, 1200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329323122759, 78, 'T904镭刻3#机', 1, 1200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329432195141, 79, 'T905注塑', 1, 1500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329527230533, 80, 'ET911注塑', 1, 1010, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703749, 81, '剪脚 ', 1, 17000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703750, 81, '装芯片 ', 1, 3000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703751, 81, '绕线 ', 1, 5000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703752, 81, '焊接（检） ', 1, 5000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703753, 81, '镭刻、', 1, 4500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160329957703754, 81, '初始化 包装', 1, 4500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066373, 82, '926-GJ注塑', 1, 9500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066374, 82, ' ET926(注+剪+检)注塑 ', 2, 3000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066375, 82, 'ET926注塑（全自动）', 3, 2600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066376, 82, ' ET926注塑(半自动) ', 4, 2350, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066377, 82, '贴芯片', 5, 5500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066378, 82, ' 镭刻926 ', 6, 7100, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066379, 82, '镭刻1.2.3号机 ', 7, 1440, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355028066380, 82, '包装', 8, 4080, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810565, 83, 'ET927注塑 ', 1, 2900, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810566, 83, '装芯片 ', 2, 4000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810567, 83, '剪脚', 3, 4000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810568, 83, ' 绕线 ', 4, 1600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810569, 83, '上锡(测试) ', 5, 2600, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810570, 83, '套中间件(测试) ', 6, 4200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810571, 83, '镭刻 ', 7, 3500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810572, 83, '镭刻（带LOGO）', 8, 4500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810573, 83, ' 初始化（FDX) ', 9, 5500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810574, 83, '初始化（HDX） ', 10, 5000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355720810575, 83, '包装(简)', 11, 5500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355802746949, 84, '绕线 ', 1, 270, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160355802746950, 84, '天线测试裹绝缘胶带 ', 2, 360, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160359366754373, 84, '烧程序 ', 3, 700, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160359366754374, 84, '装OLED导光柱CCD ', 4, 100, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160359366754375, 84, '组装 ', 5, 100, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160359366754376, 84, '检验测试', 6, 110, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360328499269, 85, 'ET933-XG注塑 ', 1, 23000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360328499270, 85, '镭刻 ', 1, 7500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360328499271, 85, '装下盖', 1, 7500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360702275653, 86, '绕线 ', 1, 400, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360702275654, 86, '烧程序 ', 1, 1500, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360702275655, 86, '组装加贴液晶 ', 1, 150, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360702275656, 86, '镭刻外壳 ', 1, 2200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160360702275657, 86, '检验测试', 1, 550, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878981, 87, '绕线 ', 1, 200, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878982, 87, '烧程序 ', 1, 248, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878983, 87, '装电池簧片 ', 1, 480, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878984, 87, '组装', 1, 77, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878985, 87, ' 镭刻外壳 ', 1, 2000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878986, 87, '超声波', 1, 2160, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361091878987, 87, ' 测试(包装）', 1, 65, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361276948549, 88, '绕线 ', 1, 105, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361276948550, 88, '装配 ', 1, 20, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (160361276948551, 88, '包装', 1, 85, 0, 0.0);

-- ----------------------------
-- Table structure for fh_staff
-- ----------------------------
DROP TABLE IF EXISTS `fh_staff`;
CREATE TABLE `fh_staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hiredate` datetime(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_disable` int(255) NOT NULL COMMENT '0-正常，1-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_staff
-- ----------------------------
INSERT INTO `fh_staff` VALUES (1, '蒲晓渝', '2021-03-30 00:00:00', '2021-03-30 10:15:53', 'admin', 0);
INSERT INTO `fh_staff` VALUES (2, '蒲华磊', '2017-03-30 00:00:00', '2021-03-30 10:16:02', 'admin', 0);
INSERT INTO `fh_staff` VALUES (3, '于硕', '2021-03-30 00:00:00', '2021-03-30 10:20:13', 'admin', 0);

-- ----------------------------
-- Table structure for fh_time_bill
-- ----------------------------
DROP TABLE IF EXISTS `fh_time_bill`;
CREATE TABLE `fh_time_bill`  (
  `id` bigint(11) NOT NULL,
  `staff_id` int(11) NOT NULL COMMENT '员工id',
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '员工名称',
  `work_num` int(11) NOT NULL COMMENT '实际配额数量',
  `deploy_hour` decimal(5, 1) NOT NULL COMMENT '调配工时',
  `work_date` datetime(0) NOT NULL COMMENT '工作日期',
  `is_holiday` int(11) NOT NULL COMMENT '0-不是，1-是',
  `day_hour` decimal(5, 1) NOT NULL COMMENT '当日完成工时',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_meal` int(3) NOT NULL COMMENT '饭补8元',
  `is_encourage` int(3) NOT NULL COMMENT '鼓励奖20元',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_staff`(`staff_id`, `work_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_time_bill
-- ----------------------------
INSERT INTO `fh_time_bill` VALUES (143323429118021, 3, '于硕', 1, 100.0, '2021-03-31 00:00:00', 1, 0.0, 'admin', '2021-03-31 10:04:34', 'admin', '2021-03-31 10:04:34', '嘿嘿', 0, 0);
INSERT INTO `fh_time_bill` VALUES (143323952558149, 2, '蒲华磊', 1553, 0.0, '2021-03-31 00:00:00', 0, 0.0, 'admin', '2021-03-31 10:06:41', 'admin', '2021-03-31 10:06:41', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (143324256452677, 1, '蒲晓渝', 2765, 0.0, '2021-03-31 00:00:00', 0, 0.0, 'admin', '2021-03-31 10:07:56', 'admin', '2021-03-31 10:07:56', '哈哈', 0, 0);
INSERT INTO `fh_time_bill` VALUES (143341757521989, 3, '于硕', 10000, 0.0, '2021-03-30 00:00:00', 0, 0.0, 'admin', '2021-03-31 11:19:08', 'admin', '2021-03-31 11:19:08', '哈哈', 0, 0);
INSERT INTO `fh_time_bill` VALUES (153307330478149, 3, '于硕', 2455, 0.0, '2021-04-28 00:00:00', 0, 4.7, 'admin', '2021-04-28 15:09:10', 'admin', '2021-04-28 15:09:10', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (153334668718149, 1, '蒲晓渝', 1333, 13.0, '2021-04-27 00:00:00', 0, 19.7, 'admin', '2021-04-28 17:00:24', '', '0001-01-01 00:00:00', '备注份饭', 0, 0);
INSERT INTO `fh_time_bill` VALUES (153343358767173, 2, '蒲华磊', 1344, 0.0, '2021-04-28 00:00:00', 1, 6.3, 'admin', '2021-04-28 17:35:45', 'admin', '2021-04-28 17:35:45', '范德萨发生的', 0, 0);
INSERT INTO `fh_time_bill` VALUES (158573285695557, 2, '蒲华磊', 1222, 0.0, '2021-05-13 00:00:00', 0, 3.1, 'admin', '2021-05-13 12:16:23', 'admin', '2021-05-13 12:16:23', '是', 0, 0);
INSERT INTO `fh_time_bill` VALUES (158575692570693, 2, '蒲华磊', 134, 0.0, '2021-05-12 00:00:00', 1, 0.2, 'admin', '2021-05-13 12:26:11', 'admin', '2021-05-13 12:26:11', '订单', 0, 0);
INSERT INTO `fh_time_bill` VALUES (160374533587013, 2, '蒲华磊', 4040, 0.0, '2021-05-18 00:00:00', 0, 15.0, 'admin', '2021-05-18 14:25:41', '', '0001-01-01 00:00:00', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (160375849164869, 3, '于硕', 13401, 0.0, '2021-05-18 00:00:00', 0, 37.2, 'admin', '2021-05-18 14:31:02', '', '0001-01-01 00:00:00', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (161005123244101, 3, '于硕', 600, 0.0, '2021-05-20 00:00:00', 0, 3.8, 'admin', '2021-05-20 09:11:33', 'admin', '2021-05-20 09:11:33', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (161005152571461, 3, '于硕', 600, 0.0, '2021-05-20 00:00:00', 0, 3.8, 'admin', '2021-05-20 09:11:41', 'admin', '2021-05-20 09:11:41', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (161006143795269, 2, '蒲华磊', 600, 0.0, '2021-05-20 00:00:00', 0, 3.8, 'admin', '2021-05-20 09:15:44', 'admin', '2021-05-20 09:15:44', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (161006959665221, 1, '蒲晓渝', 600, 0.0, '2021-05-20 00:00:00', 0, 3.4, 'admin', '2021-05-20 09:19:02', 'admin', '2021-05-20 09:19:02', NULL, 0, 0);
INSERT INTO `fh_time_bill` VALUES (162421664989253, 3, '于硕', 100, 0.0, '2021-05-24 00:00:00', 0, 0.6, 'admin', '2021-05-24 09:15:29', '', '0001-01-01 00:00:00', NULL, 1, 1);
INSERT INTO `fh_time_bill` VALUES (162421723746373, 3, '于硕', 120, 0.0, '2021-05-21 00:00:00', 0, 0.7, 'admin', '2021-05-24 09:15:43', '', '0001-01-01 00:00:00', NULL, 0, 1);

-- ----------------------------
-- Table structure for fh_time_process
-- ----------------------------
DROP TABLE IF EXISTS `fh_time_process`;
CREATE TABLE `fh_time_process`  (
  `id` bigint(20) NOT NULL,
  `bill_id` bigint(11) NOT NULL COMMENT '工时表Id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '产品名称',
  `process_id` bigint(20) NOT NULL COMMENT '工序id',
  `process_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '工序名称',
  `process_type` int(255) NOT NULL COMMENT '0-产品，1-调配工时',
  `work_num` int(11) NOT NULL COMMENT '实际配额数量',
  `deploy_hour` decimal(5, 1) NOT NULL COMMENT '调配工时',
  `day_hour` decimal(5, 1) NOT NULL COMMENT '当日总工时',
  `staff_id` int(11) NOT NULL,
  `work_date` datetime(0) NOT NULL,
  `is_holiday` int(11) NOT NULL COMMENT '法定假日',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bill`(`bill_id`) USING BTREE,
  INDEX `idx_process`(`process_id`) USING BTREE,
  INDEX `idx_staff`(`staff_id`, `work_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_time_process
-- ----------------------------
INSERT INTO `fh_time_process` VALUES (158573285769285, 158573285695557, 1, 'PT289', 142989528420421, '镭刻', 0, 1222, 0.0, 3.1, 2, '2021-05-13 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (158575692648517, 158575692570693, 1, 'PT289', 142989528420421, '镭刻', 0, 12, 0.0, 0.0, 2, '2021-05-12 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (158575692648518, 158575692570693, 1, 'PT289', 142989528424517, '打胶', 0, 122, 0.0, 0.2, 2, '2021-05-12 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (160377471135813, 160375849164869, 72, 'ZS005', 160326927097925, 'ZS005-ZZZJ注塑', 0, 13401, 0.0, 37.2, 3, '2021-05-18 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (160384050978885, 160374533587013, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 1340, 0.0, 7.5, 2, '2021-05-18 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (160384050987077, 160374533587013, 72, 'ZS005', 160326927097925, 'ZS005-ZZZJ注塑', 0, 2700, 0.0, 15.0, 2, '2021-05-18 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161005123395653, 161005123244101, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 100, 0.0, 0.8, 3, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161005123399749, 161005123244101, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 500, 0.0, 3.8, 3, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161005152575557, 161005152571461, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 100, 0.0, 0.8, 3, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161005152575558, 161005152571461, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 500, 0.0, 3.8, 3, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161006334971973, 161006143795269, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 100, 0.0, 0.8, 2, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161006710657093, 161006143795269, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 500, 0.0, 3.8, 2, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161006959775813, 161006959665221, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 100, 0.0, 0.6, 1, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (161006959779909, 161006959665221, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 500, 0.0, 3.4, 1, '2021-05-20 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (162423157456965, 162421664989253, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 100, 0.0, 0.6, 3, '2021-05-24 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (162423223099461, 162421723746373, 71, 'ZS004', 160326810386501, 'ZS004-ZZZJ注塑', 0, 120, 0.0, 0.7, 3, '2021-05-21 00:00:00', 0);

-- ----------------------------
-- Table structure for hangfire_task
-- ----------------------------
DROP TABLE IF EXISTS `hangfire_task`;
CREATE TABLE `hangfire_task`  (
  `id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `excute_time` datetime(0) NOT NULL,
  `assembly_namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `excute_status` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'hangfire任务管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hangfire_task
-- ----------------------------
INSERT INTO `hangfire_task` VALUES ('5eaabde6c1a509138ce04e80', '测试任务', '测试写日志，1小时写一次', '2021-04-16 08:58:44', 'Atlass.Framework.Jobs', 'TestJob', '0 */1 * * *', 1);

-- ----------------------------
-- Table structure for login_info
-- ----------------------------
DROP TABLE IF EXISTS `login_info`;
CREATE TABLE `login_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名',
  `device_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '设备信息',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '浏览器信息',
  `osinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '操作系统',
  `request_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip',
  `real_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '真实地址',
  `request_time` datetime(0) NOT NULL COMMENT '访问时间',
  `login_status` int(255) NOT NULL COMMENT '0-失败，1-成功',
  `login_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_info
-- ----------------------------
INSERT INTO `login_info` VALUES (1, 'admin', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-06-24 09:23:50', 1, '登录成功');

-- ----------------------------
-- Table structure for sys_citys
-- ----------------------------
DROP TABLE IF EXISTS `sys_citys`;
CREATE TABLE `sys_citys`  (
  `id` bigint(255) NOT NULL,
  `zipcode` int(12) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province_code` int(12) NOT NULL,
  `city_code` int(12) NOT NULL,
  `city_level` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_citys
-- ----------------------------
INSERT INTO `sys_citys` VALUES (973409355640737792, 11, '北京市', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737793, 12, '天津市', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737794, 13, '河北省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737795, 14, '山西省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737796, 15, '内蒙古自治区', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737797, 21, '辽宁省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737798, 22, '吉林省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737799, 23, '黑龙江省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737800, 31, '上海市', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737801, 32, '江苏省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737802, 33, '浙江省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737803, 34, '安徽省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737804, 35, '福建省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737805, 36, '江西省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737806, 37, '山东省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737807, 41, '河南省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737808, 42, '湖北省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737809, 43, '湖南省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737810, 44, '广东省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737811, 45, '广西壮族自治区', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737812, 46, '海南省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737813, 50, '重庆市', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737814, 51, '四川省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737815, 52, '贵州省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737816, 53, '云南省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737817, 54, '西藏自治区', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737818, 61, '陕西省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737819, 62, '甘肃省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737820, 63, '青海省', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737821, 64, '宁夏回族自治区', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973409355640737822, 65, '新疆维吾尔自治区', 0, 0, 1);
INSERT INTO `sys_citys` VALUES (973480166451974144, 1101, '北京市', 11, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168448, 1201, '天津市', 12, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168449, 1301, '石家庄市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168450, 1302, '唐山市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168451, 1303, '秦皇岛市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168452, 1304, '邯郸市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168453, 1305, '邢台市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168454, 1306, '保定市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168455, 1307, '张家口市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168456, 1308, '承德市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168457, 1309, '沧州市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168458, 1310, '廊坊市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168459, 1311, '衡水市', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168460, 1390, '省直辖', 13, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168461, 1401, '太原市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168462, 1402, '大同市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168463, 1403, '阳泉市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168464, 1404, '长治市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168465, 1405, '晋城市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168466, 1406, '朔州市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168467, 1407, '晋中市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168468, 1408, '运城市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168469, 1409, '忻州市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168470, 1410, '临汾市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168471, 1411, '吕梁市', 14, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168472, 1501, '呼和浩特市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168473, 1502, '包头市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168474, 1503, '乌海市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168475, 1504, '赤峰市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168476, 1505, '通辽市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168477, 1506, '鄂尔多斯市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168478, 1507, '呼伦贝尔市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168479, 1508, '巴彦淖尔市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168480, 1509, '乌兰察布市', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168481, 1522, '兴安盟', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168482, 1525, '锡林郭勒盟', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168483, 1529, '阿拉善盟', 15, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168484, 2101, '沈阳市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168485, 2102, '大连市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168486, 2103, '鞍山市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168487, 2104, '抚顺市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168488, 2105, '本溪市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168489, 2106, '丹东市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168490, 2107, '锦州市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168491, 2108, '营口市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168492, 2109, '阜新市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168493, 2110, '辽阳市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168494, 2111, '盘锦市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168495, 2112, '铁岭市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168496, 2113, '朝阳市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168497, 2114, '葫芦岛市', 21, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168498, 2201, '长春市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168499, 2202, '吉林市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168500, 2203, '四平市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168501, 2204, '辽源市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168502, 2205, '通化市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168503, 2206, '白山市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168504, 2207, '松原市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168505, 2208, '白城市', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168506, 2224, '延边朝鲜族自治州', 22, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168507, 2301, '哈尔滨市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168508, 2302, '齐齐哈尔市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168509, 2303, '鸡西市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168510, 2304, '鹤岗市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168511, 2305, '双鸭山市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168512, 2306, '大庆市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168513, 2307, '伊春市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168514, 2308, '佳木斯市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168515, 2309, '七台河市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168516, 2310, '牡丹江市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168517, 2311, '黑河市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168518, 2312, '绥化市', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168519, 2327, '大兴安岭地区', 23, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168520, 3101, '上海市', 31, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168521, 3201, '南京市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168522, 3202, '无锡市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168523, 3203, '徐州市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168524, 3204, '常州市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168525, 3205, '苏州市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168526, 3206, '南通市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168527, 3207, '连云港市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168528, 3208, '淮安市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168529, 3209, '盐城市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168530, 3210, '扬州市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168531, 3211, '镇江市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168532, 3212, '泰州市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168533, 3213, '宿迁市', 32, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168534, 3301, '杭州市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168535, 3302, '宁波市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168536, 3303, '温州市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168537, 3304, '嘉兴市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168538, 3305, '湖州市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168539, 3306, '绍兴市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168540, 3307, '金华市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168541, 3308, '衢州市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168542, 3309, '舟山市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168543, 3310, '台州市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168544, 3311, '丽水市', 33, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168545, 3401, '合肥市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168546, 3402, '芜湖市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168547, 3403, '蚌埠市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168548, 3404, '淮南市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168549, 3405, '马鞍山市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168550, 3406, '淮北市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168551, 3407, '铜陵市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168552, 3408, '安庆市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168553, 3410, '黄山市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168554, 3411, '滁州市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168555, 3412, '阜阳市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168556, 3413, '宿州市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168557, 3415, '六安市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168558, 3416, '亳州市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168559, 3417, '池州市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168560, 3418, '宣城市', 34, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168561, 3501, '福州市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168562, 3502, '厦门市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168563, 3503, '莆田市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168564, 3504, '三明市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168565, 3505, '泉州市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168566, 3506, '漳州市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168567, 3507, '南平市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168568, 3508, '龙岩市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168569, 3509, '宁德市', 35, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168570, 3601, '南昌市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168571, 3602, '景德镇市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168572, 3603, '萍乡市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168573, 3604, '九江市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168574, 3605, '新余市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168575, 3606, '鹰潭市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168576, 3607, '赣州市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168577, 3608, '吉安市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168578, 3609, '宜春市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168579, 3610, '抚州市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168580, 3611, '上饶市', 36, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168581, 3701, '济南市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168582, 3702, '青岛市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168583, 3703, '淄博市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168584, 3704, '枣庄市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168585, 3705, '东营市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168586, 3706, '烟台市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168587, 3707, '潍坊市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168588, 3708, '济宁市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168589, 3709, '泰安市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168590, 3710, '威海市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168591, 3711, '日照市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168592, 3712, '莱芜市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168593, 3713, '临沂市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168594, 3714, '德州市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168595, 3715, '聊城市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168596, 3716, '滨州市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168597, 3717, '菏泽市', 37, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168598, 4101, '郑州市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168599, 4102, '开封市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168600, 4103, '洛阳市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168601, 4104, '平顶山市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168602, 4105, '安阳市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168603, 4106, '鹤壁市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168604, 4107, '新乡市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168605, 4108, '焦作市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168606, 4109, '濮阳市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168607, 4110, '许昌市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168608, 4111, '漯河市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168609, 4112, '三门峡市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168610, 4113, '南阳市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168611, 4114, '商丘市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168612, 4115, '信阳市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168613, 4116, '周口市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168614, 4117, '驻马店市', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168615, 4190, '省直辖', 41, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168616, 4201, '武汉市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168617, 4202, '黄石市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168618, 4203, '十堰市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168619, 4205, '宜昌市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168620, 4206, '襄阳市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168621, 4207, '鄂州市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168622, 4208, '荆门市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168623, 4209, '孝感市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168624, 4210, '荆州市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168625, 4211, '黄冈市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168626, 4212, '咸宁市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168627, 4213, '随州市', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168628, 4228, '恩施土家族苗族自治州', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168629, 4290, '省直辖', 42, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168630, 4301, '长沙市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168631, 4302, '株洲市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168632, 4303, '湘潭市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168633, 4304, '衡阳市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168634, 4305, '邵阳市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168635, 4306, '岳阳市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168636, 4307, '常德市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168637, 4308, '张家界市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168638, 4309, '益阳市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168639, 4310, '郴州市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168640, 4311, '永州市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168641, 4312, '怀化市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168642, 4313, '娄底市', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168643, 4331, '湘西土家族苗族自治州', 43, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168644, 4401, '广州市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168645, 4402, '韶关市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168646, 4403, '深圳市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168647, 4404, '珠海市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168648, 4405, '汕头市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168649, 4406, '佛山市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168650, 4407, '江门市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168651, 4408, '湛江市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168652, 4409, '茂名市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168653, 4412, '肇庆市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168654, 4413, '惠州市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168655, 4414, '梅州市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168656, 4415, '汕尾市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168657, 4416, '河源市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168658, 4417, '阳江市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168659, 4418, '清远市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168660, 4419, '东莞市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168661, 4420, '中山市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168662, 4451, '潮州市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168663, 4452, '揭阳市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168664, 4453, '云浮市', 44, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168665, 4501, '南宁市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168666, 4502, '柳州市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168667, 4503, '桂林市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168668, 4504, '梧州市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168669, 4505, '北海市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168670, 4506, '防城港市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168671, 4507, '钦州市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168672, 4508, '贵港市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168673, 4509, '玉林市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168674, 4510, '百色市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168675, 4511, '贺州市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168676, 4512, '河池市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168677, 4513, '来宾市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168678, 4514, '崇左市', 45, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168679, 4601, '海口市', 46, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168680, 4602, '三亚市', 46, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168681, 4603, '三沙市', 46, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168682, 4604, '儋州市', 46, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168683, 4690, '省直辖', 46, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168684, 5001, '市辖区', 50, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168685, 5002, '县', 50, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168686, 5101, '成都市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168687, 5103, '自贡市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168688, 5104, '攀枝花市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168689, 5105, '泸州市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168690, 5106, '德阳市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168691, 5107, '绵阳市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168692, 5108, '广元市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168693, 5109, '遂宁市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168694, 5110, '内江市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168695, 5111, '乐山市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168696, 5113, '南充市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168697, 5114, '眉山市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168698, 5115, '宜宾市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168699, 5116, '广安市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168700, 5117, '达州市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168701, 5118, '雅安市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168702, 5119, '巴中市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168703, 5120, '资阳市', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168704, 5132, '阿坝藏族羌族自治州', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168705, 5133, '甘孜藏族自治州', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168706, 5134, '凉山彝族自治州', 51, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168707, 5201, '贵阳市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168708, 5202, '六盘水市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168709, 5203, '遵义市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168710, 5204, '安顺市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168711, 5205, '毕节市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168712, 5206, '铜仁市', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168713, 5223, '黔西南布依族苗族自治州', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168714, 5226, '黔东南苗族侗族自治州', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168715, 5227, '黔南布依族苗族自治州', 52, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168716, 5301, '昆明市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168717, 5303, '曲靖市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168718, 5304, '玉溪市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168719, 5305, '保山市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168720, 5306, '昭通市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168721, 5307, '丽江市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168722, 5308, '普洱市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168723, 5309, '临沧市', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168724, 5323, '楚雄彝族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168725, 5325, '红河哈尼族彝族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168726, 5326, '文山壮族苗族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168727, 5328, '西双版纳傣族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168728, 5329, '大理白族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168729, 5331, '德宏傣族景颇族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168730, 5333, '怒江傈僳族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168731, 5334, '迪庆藏族自治州', 53, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168732, 5401, '拉萨市', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168733, 5402, '日喀则市', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168734, 5403, '昌都市', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168735, 5404, '林芝市', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168736, 5405, '山南市', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168737, 5424, '那曲地区', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168738, 5425, '阿里地区', 54, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168739, 6101, '西安市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168740, 6102, '铜川市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168741, 6103, '宝鸡市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168742, 6104, '咸阳市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168743, 6105, '渭南市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168744, 6106, '延安市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168745, 6107, '汉中市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168746, 6108, '榆林市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168747, 6109, '安康市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168748, 6110, '商洛市', 61, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168749, 6201, '兰州市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168750, 6202, '嘉峪关市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168751, 6203, '金昌市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168752, 6204, '白银市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168753, 6205, '天水市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168754, 6206, '武威市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168755, 6207, '张掖市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168756, 6208, '平凉市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168757, 6209, '酒泉市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168758, 6210, '庆阳市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168759, 6211, '定西市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168760, 6212, '陇南市', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168761, 6229, '临夏回族自治州', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168762, 6230, '甘南藏族自治州', 62, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168763, 6301, '西宁市', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168764, 6302, '海东市', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168765, 6322, '海北藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168766, 6323, '黄南藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168767, 6325, '海南藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168768, 6326, '果洛藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168769, 6327, '玉树藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168770, 6328, '海西蒙古族藏族自治州', 63, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168771, 6401, '银川市', 64, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168772, 6402, '石嘴山市', 64, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168773, 6403, '吴忠市', 64, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168774, 6404, '固原市', 64, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168775, 6405, '中卫市', 64, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168776, 6501, '乌鲁木齐市', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168777, 6502, '克拉玛依市', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168778, 6504, '吐鲁番市', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168779, 6505, '哈密市', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168780, 6523, '昌吉回族自治州', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168781, 6527, '博尔塔拉蒙古自治州', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168782, 6528, '巴音郭楞蒙古自治州', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168783, 6529, '阿克苏地区', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168784, 6530, '克孜勒苏柯尔克孜自治州', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168785, 6531, '喀什地区', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168786, 6532, '和田地区', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168787, 6540, '伊犁哈萨克自治州', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168788, 6542, '塔城地区', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168789, 6543, '阿勒泰地区', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480166456168790, 6590, '自治区直辖县级行政区划', 65, 0, 2);
INSERT INTO `sys_citys` VALUES (973480327509053440, 110101, '东城区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247744, 110102, '西城区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247745, 110105, '朝阳区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247746, 110106, '丰台区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247747, 110107, '石景山区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247748, 110108, '海淀区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247749, 110109, '门头沟区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247750, 110111, '房山区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247751, 110112, '通州区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247752, 110113, '顺义区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247753, 110114, '昌平区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247754, 110115, '大兴区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247755, 110116, '怀柔区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247756, 110117, '平谷区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247757, 110118, '密云区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247758, 110119, '延庆区', 11, 1101, 3);
INSERT INTO `sys_citys` VALUES (973480327513247759, 120101, '和平区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247760, 120102, '河东区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247761, 120103, '河西区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247762, 120104, '南开区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247763, 120105, '河北区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247764, 120106, '红桥区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247765, 120110, '东丽区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247766, 120111, '西青区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247767, 120112, '津南区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247768, 120113, '北辰区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247769, 120114, '武清区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247770, 120115, '宝坻区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247771, 120116, '滨海新区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247772, 120117, '宁河区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247773, 120118, '静海区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247774, 120119, '蓟州区', 12, 1201, 3);
INSERT INTO `sys_citys` VALUES (973480327513247775, 130102, '长安区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247776, 130104, '桥西区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247777, 130105, '新华区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247778, 130107, '井陉矿区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247779, 130108, '裕华区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247780, 130109, '藁城区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247781, 130110, '鹿泉区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247782, 130111, '栾城区', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247783, 130121, '井陉县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247784, 130123, '正定县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247785, 130125, '行唐县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247786, 130126, '灵寿县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247787, 130127, '高邑县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247788, 130128, '深泽县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247789, 130129, '赞皇县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247790, 130130, '无极县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247791, 130131, '平山县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247792, 130132, '元氏县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247793, 130133, '赵县', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247794, 130183, '晋州市', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247795, 130184, '新乐市', 13, 1301, 3);
INSERT INTO `sys_citys` VALUES (973480327513247796, 130202, '路南区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247797, 130203, '路北区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247798, 130204, '古冶区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247799, 130205, '开平区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247800, 130207, '丰南区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247801, 130208, '丰润区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247802, 130209, '曹妃甸区', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247803, 130223, '滦县', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247804, 130224, '滦南县', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247805, 130225, '乐亭县', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247806, 130227, '迁西县', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247807, 130229, '玉田县', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247808, 130281, '遵化市', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247809, 130283, '迁安市', 13, 1302, 3);
INSERT INTO `sys_citys` VALUES (973480327513247810, 130302, '海港区', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247811, 130303, '山海关区', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247812, 130304, '北戴河区', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247813, 130306, '抚宁区', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247814, 130321, '青龙满族自治县', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247815, 130322, '昌黎县', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247816, 130324, '卢龙县', 13, 1303, 3);
INSERT INTO `sys_citys` VALUES (973480327513247817, 130402, '邯山区', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247818, 130403, '丛台区', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247819, 130404, '复兴区', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247820, 130406, '峰峰矿区', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247821, 130421, '邯郸县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247822, 130423, '临漳县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247823, 130424, '成安县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247824, 130425, '大名县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247825, 130426, '涉县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247826, 130427, '磁县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247827, 130428, '肥乡县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247828, 130429, '永年县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247829, 130430, '邱县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247830, 130431, '鸡泽县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247831, 130432, '广平县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247832, 130433, '馆陶县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247833, 130434, '魏县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247834, 130435, '曲周县', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247835, 130481, '武安市', 13, 1304, 3);
INSERT INTO `sys_citys` VALUES (973480327513247836, 130502, '桥东区', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247837, 130503, '桥西区', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247838, 130521, '邢台县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247839, 130522, '临城县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247840, 130523, '内丘县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247841, 130524, '柏乡县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247842, 130525, '隆尧县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247843, 130526, '任县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247844, 130527, '南和县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247845, 130528, '宁晋县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247846, 130529, '巨鹿县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247847, 130530, '新河县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247848, 130531, '广宗县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247849, 130532, '平乡县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247850, 130533, '威县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247851, 130534, '清河县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247852, 130535, '临西县', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247853, 130581, '南宫市', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247854, 130582, '沙河市', 13, 1305, 3);
INSERT INTO `sys_citys` VALUES (973480327513247855, 130602, '竞秀区', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247856, 130606, '莲池区', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247857, 130607, '满城区', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247858, 130608, '清苑区', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247859, 130609, '徐水区', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247860, 130623, '涞水县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247861, 130624, '阜平县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247862, 130626, '定兴县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247863, 130627, '唐县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247864, 130628, '高阳县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247865, 130629, '容城县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247866, 130630, '涞源县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247867, 130631, '望都县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247868, 130632, '安新县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247869, 130633, '易县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247870, 130634, '曲阳县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247871, 130635, '蠡县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247872, 130636, '顺平县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247873, 130637, '博野县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247874, 130638, '雄县', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247875, 130681, '涿州市', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247876, 130683, '安国市', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247877, 130684, '高碑店市', 13, 1306, 3);
INSERT INTO `sys_citys` VALUES (973480327513247878, 130702, '桥东区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247879, 130703, '桥西区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247880, 130705, '宣化区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247881, 130706, '下花园区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247882, 130708, '万全区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247883, 130709, '崇礼区', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247884, 130722, '张北县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247885, 130723, '康保县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247886, 130724, '沽源县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247887, 130725, '尚义县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247888, 130726, '蔚县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247889, 130727, '阳原县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247890, 130728, '怀安县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247891, 130730, '怀来县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247892, 130731, '涿鹿县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247893, 130732, '赤城县', 13, 1307, 3);
INSERT INTO `sys_citys` VALUES (973480327513247894, 130802, '双桥区', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247895, 130803, '双滦区', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247896, 130804, '鹰手营子矿区', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247897, 130821, '承德县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247898, 130822, '兴隆县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247899, 130823, '平泉县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247900, 130824, '滦平县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247901, 130825, '隆化县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247902, 130826, '丰宁满族自治县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247903, 130827, '宽城满族自治县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247904, 130828, '围场满族蒙古族自治县', 13, 1308, 3);
INSERT INTO `sys_citys` VALUES (973480327513247905, 130902, '新华区', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247906, 130903, '运河区', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247907, 130921, '沧县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247908, 130922, '青县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247909, 130923, '东光县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247910, 130924, '海兴县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247911, 130925, '盐山县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247912, 130926, '肃宁县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247913, 130927, '南皮县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247914, 130928, '吴桥县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247915, 130929, '献县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247916, 130930, '孟村回族自治县', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247917, 130981, '泊头市', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247918, 130982, '任丘市', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247919, 130983, '黄骅市', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247920, 130984, '河间市', 13, 1309, 3);
INSERT INTO `sys_citys` VALUES (973480327513247921, 131002, '安次区', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247922, 131003, '广阳区', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247923, 131022, '固安县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247924, 131023, '永清县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247925, 131024, '香河县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247926, 131025, '大城县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247927, 131026, '文安县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247928, 131028, '大厂回族自治县', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247929, 131081, '霸州市', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247930, 131082, '三河市', 13, 1310, 3);
INSERT INTO `sys_citys` VALUES (973480327513247931, 131102, '桃城区', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247932, 131103, '冀州区', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247933, 131121, '枣强县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247934, 131122, '武邑县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247935, 131123, '武强县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247936, 131124, '饶阳县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247937, 131125, '安平县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247938, 131126, '故城县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247939, 131127, '景县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247940, 131128, '阜城县', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247941, 131182, '深州市', 13, 1311, 3);
INSERT INTO `sys_citys` VALUES (973480327513247942, 139001, '定州市', 13, 1390, 3);
INSERT INTO `sys_citys` VALUES (973480327513247943, 139002, '辛集市', 13, 1390, 3);
INSERT INTO `sys_citys` VALUES (973480327513247944, 140105, '小店区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247945, 140106, '迎泽区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247946, 140107, '杏花岭区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247947, 140108, '尖草坪区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247948, 140109, '万柏林区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247949, 140110, '晋源区', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247950, 140121, '清徐县', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247951, 140122, '阳曲县', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247952, 140123, '娄烦县', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247953, 140181, '古交市', 14, 1401, 3);
INSERT INTO `sys_citys` VALUES (973480327513247954, 140202, '城区', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247955, 140203, '矿区', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247956, 140211, '南郊区', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247957, 140212, '新荣区', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247958, 140221, '阳高县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247959, 140222, '天镇县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247960, 140223, '广灵县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247961, 140224, '灵丘县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247962, 140225, '浑源县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247963, 140226, '左云县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247964, 140227, '大同县', 14, 1402, 3);
INSERT INTO `sys_citys` VALUES (973480327513247965, 140302, '城区', 14, 1403, 3);
INSERT INTO `sys_citys` VALUES (973480327513247966, 140303, '矿区', 14, 1403, 3);
INSERT INTO `sys_citys` VALUES (973480327513247967, 140311, '郊区', 14, 1403, 3);
INSERT INTO `sys_citys` VALUES (973480327513247968, 140321, '平定县', 14, 1403, 3);
INSERT INTO `sys_citys` VALUES (973480327513247969, 140322, '盂县', 14, 1403, 3);
INSERT INTO `sys_citys` VALUES (973480327513247970, 140402, '城区', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247971, 140411, '郊区', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247972, 140421, '长治县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247973, 140423, '襄垣县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247974, 140424, '屯留县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247975, 140425, '平顺县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247976, 140426, '黎城县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247977, 140427, '壶关县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247978, 140428, '长子县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247979, 140429, '武乡县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247980, 140430, '沁县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247981, 140431, '沁源县', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247982, 140481, '潞城市', 14, 1404, 3);
INSERT INTO `sys_citys` VALUES (973480327513247983, 140502, '城区', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247984, 140521, '沁水县', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247985, 140522, '阳城县', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247986, 140524, '陵川县', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247987, 140525, '泽州县', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247988, 140581, '高平市', 14, 1405, 3);
INSERT INTO `sys_citys` VALUES (973480327513247989, 140602, '朔城区', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247990, 140603, '平鲁区', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247991, 140621, '山阴县', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247992, 140622, '应县', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247993, 140623, '右玉县', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247994, 140624, '怀仁县', 14, 1406, 3);
INSERT INTO `sys_citys` VALUES (973480327513247995, 140702, '榆次区', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513247996, 140721, '榆社县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513247997, 140722, '左权县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513247998, 140723, '和顺县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513247999, 140724, '昔阳县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248000, 140725, '寿阳县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248001, 140726, '太谷县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248002, 140727, '祁县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248003, 140728, '平遥县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248004, 140729, '灵石县', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248005, 140781, '介休市', 14, 1407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248006, 140802, '盐湖区', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248007, 140821, '临猗县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248008, 140822, '万荣县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248009, 140823, '闻喜县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248010, 140824, '稷山县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248011, 140825, '新绛县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248012, 140826, '绛县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248013, 140827, '垣曲县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248014, 140828, '夏县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248015, 140829, '平陆县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248016, 140830, '芮城县', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248017, 140881, '永济市', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248018, 140882, '河津市', 14, 1408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248019, 140902, '忻府区', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248020, 140921, '定襄县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248021, 140922, '五台县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248022, 140923, '代县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248023, 140924, '繁峙县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248024, 140925, '宁武县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248025, 140926, '静乐县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248026, 140927, '神池县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248027, 140928, '五寨县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248028, 140929, '岢岚县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248029, 140930, '河曲县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248030, 140931, '保德县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248031, 140932, '偏关县', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248032, 140981, '原平市', 14, 1409, 3);
INSERT INTO `sys_citys` VALUES (973480327513248033, 141002, '尧都区', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248034, 141021, '曲沃县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248035, 141022, '翼城县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248036, 141023, '襄汾县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248037, 141024, '洪洞县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248038, 141025, '古县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248039, 141026, '安泽县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248040, 141027, '浮山县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248041, 141028, '吉县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248042, 141029, '乡宁县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248043, 141030, '大宁县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248044, 141031, '隰县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248045, 141032, '永和县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248046, 141033, '蒲县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248047, 141034, '汾西县', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248048, 141081, '侯马市', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248049, 141082, '霍州市', 14, 1410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248050, 141102, '离石区', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248051, 141121, '文水县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248052, 141122, '交城县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248053, 141123, '兴县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248054, 141124, '临县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248055, 141125, '柳林县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248056, 141126, '石楼县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248057, 141127, '岚县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248058, 141128, '方山县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248059, 141129, '中阳县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248060, 141130, '交口县', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248061, 141181, '孝义市', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248062, 141182, '汾阳市', 14, 1411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248063, 150102, '新城区', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248064, 150103, '回民区', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248065, 150104, '玉泉区', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248066, 150105, '赛罕区', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248067, 150121, '土默特左旗', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248068, 150122, '托克托县', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248069, 150123, '和林格尔县', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248070, 150124, '清水河县', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248071, 150125, '武川县', 15, 1501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248072, 150202, '东河区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248073, 150203, '昆都仑区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248074, 150204, '青山区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248075, 150205, '石拐区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248076, 150206, '白云鄂博矿区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248077, 150207, '九原区', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248078, 150221, '土默特右旗', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248079, 150222, '固阳县', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248080, 150223, '达尔罕茂明安联合旗', 15, 1502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248081, 150302, '海勃湾区', 15, 1503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248082, 150303, '海南区', 15, 1503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248083, 150304, '乌达区', 15, 1503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248084, 150402, '红山区', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248085, 150403, '元宝山区', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248086, 150404, '松山区', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248087, 150421, '阿鲁科尔沁旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248088, 150422, '巴林左旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248089, 150423, '巴林右旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248090, 150424, '林西县', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248091, 150425, '克什克腾旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248092, 150426, '翁牛特旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248093, 150428, '喀喇沁旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248094, 150429, '宁城县', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248095, 150430, '敖汉旗', 15, 1504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248096, 150502, '科尔沁区', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248097, 150521, '科尔沁左翼中旗', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248098, 150522, '科尔沁左翼后旗', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248099, 150523, '开鲁县', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248100, 150524, '库伦旗', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248101, 150525, '奈曼旗', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248102, 150526, '扎鲁特旗', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248103, 150581, '霍林郭勒市', 15, 1505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248104, 150602, '东胜区', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248105, 150603, '康巴什区', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248106, 150621, '达拉特旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248107, 150622, '准格尔旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248108, 150623, '鄂托克前旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248109, 150624, '鄂托克旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248110, 150625, '杭锦旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248111, 150626, '乌审旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248112, 150627, '伊金霍洛旗', 15, 1506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248113, 150702, '海拉尔区', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248114, 150703, '扎赉诺尔区', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248115, 150721, '阿荣旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248116, 150722, '莫力达瓦达斡尔族自治旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248117, 150723, '鄂伦春自治旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248118, 150724, '鄂温克族自治旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248119, 150725, '陈巴尔虎旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248120, 150726, '新巴尔虎左旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248121, 150727, '新巴尔虎右旗', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248122, 150781, '满洲里市', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248123, 150782, '牙克石市', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248124, 150783, '扎兰屯市', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248125, 150784, '额尔古纳市', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248126, 150785, '根河市', 15, 1507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248127, 150802, '临河区', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248128, 150821, '五原县', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248129, 150822, '磴口县', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248130, 150823, '乌拉特前旗', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248131, 150824, '乌拉特中旗', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248132, 150825, '乌拉特后旗', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248133, 150826, '杭锦后旗', 15, 1508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248134, 150902, '集宁区', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248135, 150921, '卓资县', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248136, 150922, '化德县', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248137, 150923, '商都县', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248138, 150924, '兴和县', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248139, 150925, '凉城县', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248140, 150926, '察哈尔右翼前旗', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248141, 150927, '察哈尔右翼中旗', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248142, 150928, '察哈尔右翼后旗', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248143, 150929, '四子王旗', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248144, 150981, '丰镇市', 15, 1509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248145, 152201, '乌兰浩特市', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248146, 152202, '阿尔山市', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248147, 152221, '科尔沁右翼前旗', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248148, 152222, '科尔沁右翼中旗', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248149, 152223, '扎赉特旗', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248150, 152224, '突泉县', 15, 1522, 3);
INSERT INTO `sys_citys` VALUES (973480327513248151, 152501, '二连浩特市', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248152, 152502, '锡林浩特市', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248153, 152522, '阿巴嘎旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248154, 152523, '苏尼特左旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248155, 152524, '苏尼特右旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248156, 152525, '东乌珠穆沁旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248157, 152526, '西乌珠穆沁旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248158, 152527, '太仆寺旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248159, 152528, '镶黄旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248160, 152529, '正镶白旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248161, 152530, '正蓝旗', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248162, 152531, '多伦县', 15, 1525, 3);
INSERT INTO `sys_citys` VALUES (973480327513248163, 152921, '阿拉善左旗', 15, 1529, 3);
INSERT INTO `sys_citys` VALUES (973480327513248164, 152922, '阿拉善右旗', 15, 1529, 3);
INSERT INTO `sys_citys` VALUES (973480327513248165, 152923, '额济纳旗', 15, 1529, 3);
INSERT INTO `sys_citys` VALUES (973480327513248166, 210102, '和平区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248167, 210103, '沈河区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248168, 210104, '大东区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248169, 210105, '皇姑区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248170, 210106, '铁西区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248171, 210111, '苏家屯区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248172, 210112, '浑南区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248173, 210113, '沈北新区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248174, 210114, '于洪区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248175, 210115, '辽中区', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248176, 210123, '康平县', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248177, 210124, '法库县', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248178, 210181, '新民市', 21, 2101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248179, 210202, '中山区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248180, 210203, '西岗区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248181, 210204, '沙河口区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248182, 210211, '甘井子区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248183, 210212, '旅顺口区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248184, 210213, '金州区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248185, 210214, '普兰店区', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248186, 210224, '长海县', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248187, 210281, '瓦房店市', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248188, 210283, '庄河市', 21, 2102, 3);
INSERT INTO `sys_citys` VALUES (973480327513248189, 210302, '铁东区', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248190, 210303, '铁西区', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248191, 210304, '立山区', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248192, 210311, '千山区', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248193, 210321, '台安县', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248194, 210323, '岫岩满族自治县', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248195, 210381, '海城市', 21, 2103, 3);
INSERT INTO `sys_citys` VALUES (973480327513248196, 210402, '新抚区', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248197, 210403, '东洲区', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248198, 210404, '望花区', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248199, 210411, '顺城区', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248200, 210421, '抚顺县', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248201, 210422, '新宾满族自治县', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248202, 210423, '清原满族自治县', 21, 2104, 3);
INSERT INTO `sys_citys` VALUES (973480327513248203, 210502, '平山区', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248204, 210503, '溪湖区', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248205, 210504, '明山区', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248206, 210505, '南芬区', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248207, 210521, '本溪满族自治县', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248208, 210522, '桓仁满族自治县', 21, 2105, 3);
INSERT INTO `sys_citys` VALUES (973480327513248209, 210602, '元宝区', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248210, 210603, '振兴区', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248211, 210604, '振安区', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248212, 210624, '宽甸满族自治县', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248213, 210681, '东港市', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248214, 210682, '凤城市', 21, 2106, 3);
INSERT INTO `sys_citys` VALUES (973480327513248215, 210702, '古塔区', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248216, 210703, '凌河区', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248217, 210711, '太和区', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248218, 210726, '黑山县', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248219, 210727, '义县', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248220, 210781, '凌海市', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248221, 210782, '北镇市', 21, 2107, 3);
INSERT INTO `sys_citys` VALUES (973480327513248222, 210802, '站前区', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248223, 210803, '西市区', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248224, 210804, '鲅鱼圈区', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248225, 210811, '老边区', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248226, 210881, '盖州市', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248227, 210882, '大石桥市', 21, 2108, 3);
INSERT INTO `sys_citys` VALUES (973480327513248228, 210902, '海州区', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248229, 210903, '新邱区', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248230, 210904, '太平区', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248231, 210905, '清河门区', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248232, 210911, '细河区', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248233, 210921, '阜新蒙古族自治县', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248234, 210922, '彰武县', 21, 2109, 3);
INSERT INTO `sys_citys` VALUES (973480327513248235, 211002, '白塔区', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248236, 211003, '文圣区', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248237, 211004, '宏伟区', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248238, 211005, '弓长岭区', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248239, 211011, '太子河区', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248240, 211021, '辽阳县', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248241, 211081, '灯塔市', 21, 2110, 3);
INSERT INTO `sys_citys` VALUES (973480327513248242, 211102, '双台子区', 21, 2111, 3);
INSERT INTO `sys_citys` VALUES (973480327513248243, 211103, '兴隆台区', 21, 2111, 3);
INSERT INTO `sys_citys` VALUES (973480327513248244, 211104, '大洼区', 21, 2111, 3);
INSERT INTO `sys_citys` VALUES (973480327513248245, 211122, '盘山县', 21, 2111, 3);
INSERT INTO `sys_citys` VALUES (973480327513248246, 211202, '银州区', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248247, 211204, '清河区', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248248, 211221, '铁岭县', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248249, 211223, '西丰县', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248250, 211224, '昌图县', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248251, 211281, '调兵山市', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248252, 211282, '开原市', 21, 2112, 3);
INSERT INTO `sys_citys` VALUES (973480327513248253, 211302, '双塔区', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248254, 211303, '龙城区', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248255, 211321, '朝阳县', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248256, 211322, '建平县', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248257, 211324, '喀喇沁左翼蒙古族自治县', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248258, 211381, '北票市', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248259, 211382, '凌源市', 21, 2113, 3);
INSERT INTO `sys_citys` VALUES (973480327513248260, 211402, '连山区', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248261, 211403, '龙港区', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248262, 211404, '南票区', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248263, 211421, '绥中县', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248264, 211422, '建昌县', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248265, 211481, '兴城市', 21, 2114, 3);
INSERT INTO `sys_citys` VALUES (973480327513248266, 220102, '南关区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248267, 220103, '宽城区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248268, 220104, '朝阳区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248269, 220105, '二道区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248270, 220106, '绿园区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248271, 220112, '双阳区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248272, 220113, '九台区', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248273, 220122, '农安县', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248274, 220182, '榆树市', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248275, 220183, '德惠市', 22, 2201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248276, 220202, '昌邑区', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248277, 220203, '龙潭区', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248278, 220204, '船营区', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248279, 220211, '丰满区', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248280, 220221, '永吉县', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248281, 220281, '蛟河市', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248282, 220282, '桦甸市', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248283, 220283, '舒兰市', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248284, 220284, '磐石市', 22, 2202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248285, 220302, '铁西区', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248286, 220303, '铁东区', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248287, 220322, '梨树县', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248288, 220323, '伊通满族自治县', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248289, 220381, '公主岭市', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248290, 220382, '双辽市', 22, 2203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248291, 220402, '龙山区', 22, 2204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248292, 220403, '西安区', 22, 2204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248293, 220421, '东丰县', 22, 2204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248294, 220422, '东辽县', 22, 2204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248295, 220502, '东昌区', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248296, 220503, '二道江区', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248297, 220521, '通化县', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248298, 220523, '辉南县', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248299, 220524, '柳河县', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248300, 220581, '梅河口市', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248301, 220582, '集安市', 22, 2205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248302, 220602, '浑江区', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248303, 220605, '江源区', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248304, 220621, '抚松县', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248305, 220622, '靖宇县', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248306, 220623, '长白朝鲜族自治县', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248307, 220681, '临江市', 22, 2206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248308, 220702, '宁江区', 22, 2207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248309, 220721, '前郭尔罗斯蒙古族自治县', 22, 2207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248310, 220722, '长岭县', 22, 2207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248311, 220723, '乾安县', 22, 2207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248312, 220781, '扶余市', 22, 2207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248313, 220802, '洮北区', 22, 2208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248314, 220821, '镇赉县', 22, 2208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248315, 220822, '通榆县', 22, 2208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248316, 220881, '洮南市', 22, 2208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248317, 220882, '大安市', 22, 2208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248318, 222401, '延吉市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248319, 222402, '图们市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248320, 222403, '敦化市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248321, 222404, '珲春市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248322, 222405, '龙井市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248323, 222406, '和龙市', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248324, 222424, '汪清县', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248325, 222426, '安图县', 22, 2224, 3);
INSERT INTO `sys_citys` VALUES (973480327513248326, 230102, '道里区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248327, 230103, '南岗区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248328, 230104, '道外区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248329, 230108, '平房区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248330, 230109, '松北区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248331, 230110, '香坊区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248332, 230111, '呼兰区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248333, 230112, '阿城区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248334, 230113, '双城区', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248335, 230123, '依兰县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248336, 230124, '方正县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248337, 230125, '宾县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248338, 230126, '巴彦县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248339, 230127, '木兰县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248340, 230128, '通河县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248341, 230129, '延寿县', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248342, 230183, '尚志市', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248343, 230184, '五常市', 23, 2301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248344, 230202, '龙沙区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248345, 230203, '建华区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248346, 230204, '铁锋区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248347, 230205, '昂昂溪区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248348, 230206, '富拉尔基区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248349, 230207, '碾子山区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248350, 230208, '梅里斯达斡尔族区', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248351, 230221, '龙江县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248352, 230223, '依安县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248353, 230224, '泰来县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248354, 230225, '甘南县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248355, 230227, '富裕县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248356, 230229, '克山县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248357, 230230, '克东县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248358, 230231, '拜泉县', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248359, 230281, '讷河市', 23, 2302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248360, 230302, '鸡冠区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248361, 230303, '恒山区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248362, 230304, '滴道区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248363, 230305, '梨树区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248364, 230306, '城子河区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248365, 230307, '麻山区', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248366, 230321, '鸡东县', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248367, 230381, '虎林市', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248368, 230382, '密山市', 23, 2303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248369, 230402, '向阳区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248370, 230403, '工农区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248371, 230404, '南山区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248372, 230405, '兴安区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248373, 230406, '东山区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248374, 230407, '兴山区', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248375, 230421, '萝北县', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248376, 230422, '绥滨县', 23, 2304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248377, 230502, '尖山区', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248378, 230503, '岭东区', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248379, 230505, '四方台区', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248380, 230506, '宝山区', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248381, 230521, '集贤县', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248382, 230522, '友谊县', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248383, 230523, '宝清县', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248384, 230524, '饶河县', 23, 2305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248385, 230602, '萨尔图区', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248386, 230603, '龙凤区', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248387, 230604, '让胡路区', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248388, 230605, '红岗区', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248389, 230606, '大同区', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248390, 230621, '肇州县', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248391, 230622, '肇源县', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248392, 230623, '林甸县', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248393, 230624, '杜尔伯特蒙古族自治县', 23, 2306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248394, 230702, '伊春区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248395, 230703, '南岔区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248396, 230704, '友好区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248397, 230705, '西林区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248398, 230706, '翠峦区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248399, 230707, '新青区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248400, 230708, '美溪区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248401, 230709, '金山屯区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248402, 230710, '五营区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248403, 230711, '乌马河区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248404, 230712, '汤旺河区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248405, 230713, '带岭区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248406, 230714, '乌伊岭区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248407, 230715, '红星区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248408, 230716, '上甘岭区', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248409, 230722, '嘉荫县', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248410, 230781, '铁力市', 23, 2307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248411, 230803, '向阳区', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248412, 230804, '前进区', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248413, 230805, '东风区', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248414, 230811, '郊区', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248415, 230822, '桦南县', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248416, 230826, '桦川县', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248417, 230828, '汤原县', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248418, 230881, '同江市', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248419, 230882, '富锦市', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248420, 230883, '抚远市', 23, 2308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248421, 230902, '新兴区', 23, 2309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248422, 230903, '桃山区', 23, 2309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248423, 230904, '茄子河区', 23, 2309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248424, 230921, '勃利县', 23, 2309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248425, 231002, '东安区', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248426, 231003, '阳明区', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248427, 231004, '爱民区', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248428, 231005, '西安区', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248429, 231025, '林口县', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248430, 231081, '绥芬河市', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248431, 231083, '海林市', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248432, 231084, '宁安市', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248433, 231085, '穆棱市', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248434, 231086, '东宁市', 23, 2310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248435, 231102, '爱辉区', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248436, 231121, '嫩江县', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248437, 231123, '逊克县', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248438, 231124, '孙吴县', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248439, 231181, '北安市', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248440, 231182, '五大连池市', 23, 2311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248441, 231202, '北林区', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248442, 231221, '望奎县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248443, 231222, '兰西县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248444, 231223, '青冈县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248445, 231224, '庆安县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248446, 231225, '明水县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248447, 231226, '绥棱县', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248448, 231281, '安达市', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248449, 231282, '肇东市', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248450, 231283, '海伦市', 23, 2312, 3);
INSERT INTO `sys_citys` VALUES (973480327513248451, 232721, '呼玛县', 23, 2327, 3);
INSERT INTO `sys_citys` VALUES (973480327513248452, 232722, '塔河县', 23, 2327, 3);
INSERT INTO `sys_citys` VALUES (973480327513248453, 232723, '漠河县', 23, 2327, 3);
INSERT INTO `sys_citys` VALUES (973480327513248454, 310101, '黄浦区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248455, 310104, '徐汇区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248456, 310105, '长宁区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248457, 310106, '静安区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248458, 310107, '普陀区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248459, 310109, '虹口区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248460, 310110, '杨浦区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248461, 310112, '闵行区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248462, 310113, '宝山区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248463, 310114, '嘉定区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248464, 310115, '浦东新区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248465, 310116, '金山区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248466, 310117, '松江区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248467, 310118, '青浦区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248468, 310120, '奉贤区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248469, 310151, '崇明区', 31, 3101, 3);
INSERT INTO `sys_citys` VALUES (973480327513248470, 320102, '玄武区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248471, 320104, '秦淮区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248472, 320105, '建邺区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248473, 320106, '鼓楼区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248474, 320111, '浦口区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248475, 320113, '栖霞区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248476, 320114, '雨花台区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248477, 320115, '江宁区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248478, 320116, '六合区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248479, 320117, '溧水区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248480, 320118, '高淳区', 32, 3201, 3);
INSERT INTO `sys_citys` VALUES (973480327513248481, 320205, '锡山区', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248482, 320206, '惠山区', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248483, 320211, '滨湖区', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248484, 320213, '梁溪区', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248485, 320214, '新吴区', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248486, 320281, '江阴市', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248487, 320282, '宜兴市', 32, 3202, 3);
INSERT INTO `sys_citys` VALUES (973480327513248488, 320302, '鼓楼区', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248489, 320303, '云龙区', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248490, 320305, '贾汪区', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248491, 320311, '泉山区', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248492, 320312, '铜山区', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248493, 320321, '丰县', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248494, 320322, '沛县', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248495, 320324, '睢宁县', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248496, 320381, '新沂市', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248497, 320382, '邳州市', 32, 3203, 3);
INSERT INTO `sys_citys` VALUES (973480327513248498, 320402, '天宁区', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248499, 320404, '钟楼区', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248500, 320411, '新北区', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248501, 320412, '武进区', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248502, 320413, '金坛区', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248503, 320481, '溧阳市', 32, 3204, 3);
INSERT INTO `sys_citys` VALUES (973480327513248504, 320505, '虎丘区', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248505, 320506, '吴中区', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248506, 320507, '相城区', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248507, 320508, '姑苏区', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248508, 320509, '吴江区', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248509, 320581, '常熟市', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248510, 320582, '张家港市', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248511, 320583, '昆山市', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248512, 320585, '太仓市', 32, 3205, 3);
INSERT INTO `sys_citys` VALUES (973480327513248513, 320602, '崇川区', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248514, 320611, '港闸区', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248515, 320612, '通州区', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248516, 320621, '海安县', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248517, 320623, '如东县', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248518, 320681, '启东市', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248519, 320682, '如皋市', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248520, 320684, '海门市', 32, 3206, 3);
INSERT INTO `sys_citys` VALUES (973480327513248521, 320703, '连云区', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248522, 320706, '海州区', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248523, 320707, '赣榆区', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248524, 320722, '东海县', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248525, 320723, '灌云县', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248526, 320724, '灌南县', 32, 3207, 3);
INSERT INTO `sys_citys` VALUES (973480327513248527, 320803, '淮安区', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248528, 320804, '淮阴区', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248529, 320812, '清江浦区', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248530, 320813, '洪泽区', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248531, 320826, '涟水县', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248532, 320830, '盱眙县', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248533, 320831, '金湖县', 32, 3208, 3);
INSERT INTO `sys_citys` VALUES (973480327513248534, 320902, '亭湖区', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248535, 320903, '盐都区', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248536, 320904, '大丰区', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248537, 320921, '响水县', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248538, 320922, '滨海县', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248539, 320923, '阜宁县', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248540, 320924, '射阳县', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248541, 320925, '建湖县', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248542, 320981, '东台市', 32, 3209, 3);
INSERT INTO `sys_citys` VALUES (973480327513248543, 321002, '广陵区', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248544, 321003, '邗江区', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248545, 321012, '江都区', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248546, 321023, '宝应县', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248547, 321081, '仪征市', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248548, 321084, '高邮市', 32, 3210, 3);
INSERT INTO `sys_citys` VALUES (973480327513248549, 321102, '京口区', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248550, 321111, '润州区', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248551, 321112, '丹徒区', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248552, 321181, '丹阳市', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248553, 321182, '扬中市', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248554, 321183, '句容市', 32, 3211, 3);
INSERT INTO `sys_citys` VALUES (973480327513248555, 321202, '海陵区', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248556, 321203, '高港区', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248557, 321204, '姜堰区', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248558, 321281, '兴化市', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248559, 321282, '靖江市', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248560, 321283, '泰兴市', 32, 3212, 3);
INSERT INTO `sys_citys` VALUES (973480327513248561, 321302, '宿城区', 32, 3213, 3);
INSERT INTO `sys_citys` VALUES (973480327513248562, 321311, '宿豫区', 32, 3213, 3);
INSERT INTO `sys_citys` VALUES (973480327513248563, 321322, '沭阳县', 32, 3213, 3);
INSERT INTO `sys_citys` VALUES (973480327513248564, 321323, '泗阳县', 32, 3213, 3);
INSERT INTO `sys_citys` VALUES (973480327513248565, 321324, '泗洪县', 32, 3213, 3);
INSERT INTO `sys_citys` VALUES (973480327513248566, 330102, '上城区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248567, 330103, '下城区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248568, 330104, '江干区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248569, 330105, '拱墅区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248570, 330106, '西湖区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248571, 330108, '滨江区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248572, 330109, '萧山区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248573, 330110, '余杭区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248574, 330111, '富阳区', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248575, 330122, '桐庐县', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248576, 330127, '淳安县', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248577, 330182, '建德市', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248578, 330185, '临安市', 33, 3301, 3);
INSERT INTO `sys_citys` VALUES (973480327513248579, 330203, '海曙区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248580, 330204, '江东区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248581, 330205, '江北区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248582, 330206, '北仑区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248583, 330211, '镇海区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248584, 330212, '鄞州区', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248585, 330225, '象山县', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248586, 330226, '宁海县', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248587, 330281, '余姚市', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248588, 330282, '慈溪市', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248589, 330283, '奉化市', 33, 3302, 3);
INSERT INTO `sys_citys` VALUES (973480327513248590, 330302, '鹿城区', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248591, 330303, '龙湾区', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248592, 330304, '瓯海区', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248593, 330305, '洞头区', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248594, 330324, '永嘉县', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248595, 330326, '平阳县', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248596, 330327, '苍南县', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248597, 330328, '文成县', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248598, 330329, '泰顺县', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248599, 330381, '瑞安市', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248600, 330382, '乐清市', 33, 3303, 3);
INSERT INTO `sys_citys` VALUES (973480327513248601, 330402, '南湖区', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248602, 330411, '秀洲区', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248603, 330421, '嘉善县', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248604, 330424, '海盐县', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248605, 330481, '海宁市', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248606, 330482, '平湖市', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248607, 330483, '桐乡市', 33, 3304, 3);
INSERT INTO `sys_citys` VALUES (973480327513248608, 330502, '吴兴区', 33, 3305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248609, 330503, '南浔区', 33, 3305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248610, 330521, '德清县', 33, 3305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248611, 330522, '长兴县', 33, 3305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248612, 330523, '安吉县', 33, 3305, 3);
INSERT INTO `sys_citys` VALUES (973480327513248613, 330602, '越城区', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248614, 330603, '柯桥区', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248615, 330604, '上虞区', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248616, 330624, '新昌县', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248617, 330681, '诸暨市', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248618, 330683, '嵊州市', 33, 3306, 3);
INSERT INTO `sys_citys` VALUES (973480327513248619, 330702, '婺城区', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248620, 330703, '金东区', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248621, 330723, '武义县', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248622, 330726, '浦江县', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248623, 330727, '磐安县', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248624, 330781, '兰溪市', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248625, 330782, '义乌市', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248626, 330783, '东阳市', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248627, 330784, '永康市', 33, 3307, 3);
INSERT INTO `sys_citys` VALUES (973480327513248628, 330802, '柯城区', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248629, 330803, '衢江区', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248630, 330822, '常山县', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248631, 330824, '开化县', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248632, 330825, '龙游县', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248633, 330881, '江山市', 33, 3308, 3);
INSERT INTO `sys_citys` VALUES (973480327513248634, 330902, '定海区', 33, 3309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248635, 330903, '普陀区', 33, 3309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248636, 330921, '岱山县', 33, 3309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248637, 330922, '嵊泗县', 33, 3309, 3);
INSERT INTO `sys_citys` VALUES (973480327513248638, 331002, '椒江区', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248639, 331003, '黄岩区', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248640, 331004, '路桥区', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248641, 331021, '玉环县', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248642, 331022, '三门县', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248643, 331023, '天台县', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248644, 331024, '仙居县', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248645, 331081, '温岭市', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248646, 331082, '临海市', 33, 3310, 3);
INSERT INTO `sys_citys` VALUES (973480327513248647, 331102, '莲都区', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248648, 331121, '青田县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248649, 331122, '缙云县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248650, 331123, '遂昌县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248651, 331124, '松阳县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248652, 331125, '云和县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248653, 331126, '庆元县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248654, 331127, '景宁畲族自治县', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248655, 331181, '龙泉市', 33, 3311, 3);
INSERT INTO `sys_citys` VALUES (973480327513248656, 340102, '瑶海区', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248657, 340103, '庐阳区', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248658, 340104, '蜀山区', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248659, 340111, '包河区', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248660, 340121, '长丰县', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248661, 340122, '肥东县', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248662, 340123, '肥西县', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248663, 340124, '庐江县', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248664, 340181, '巢湖市', 34, 3401, 3);
INSERT INTO `sys_citys` VALUES (973480327513248665, 340202, '镜湖区', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248666, 340203, '弋江区', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248667, 340207, '鸠江区', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248668, 340208, '三山区', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248669, 340221, '芜湖县', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248670, 340222, '繁昌县', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248671, 340223, '南陵县', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248672, 340225, '无为县', 34, 3402, 3);
INSERT INTO `sys_citys` VALUES (973480327513248673, 340302, '龙子湖区', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248674, 340303, '蚌山区', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248675, 340304, '禹会区', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248676, 340311, '淮上区', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248677, 340321, '怀远县', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248678, 340322, '五河县', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248679, 340323, '固镇县', 34, 3403, 3);
INSERT INTO `sys_citys` VALUES (973480327513248680, 340402, '大通区', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248681, 340403, '田家庵区', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248682, 340404, '谢家集区', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248683, 340405, '八公山区', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248684, 340406, '潘集区', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248685, 340421, '凤台县', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248686, 340422, '寿县', 34, 3404, 3);
INSERT INTO `sys_citys` VALUES (973480327513248687, 340503, '花山区', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248688, 340504, '雨山区', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248689, 340506, '博望区', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248690, 340521, '当涂县', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248691, 340522, '含山县', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248692, 340523, '和县', 34, 3405, 3);
INSERT INTO `sys_citys` VALUES (973480327513248693, 340602, '杜集区', 34, 3406, 3);
INSERT INTO `sys_citys` VALUES (973480327513248694, 340603, '相山区', 34, 3406, 3);
INSERT INTO `sys_citys` VALUES (973480327513248695, 340604, '烈山区', 34, 3406, 3);
INSERT INTO `sys_citys` VALUES (973480327513248696, 340621, '濉溪县', 34, 3406, 3);
INSERT INTO `sys_citys` VALUES (973480327513248697, 340705, '铜官区', 34, 3407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248698, 340706, '义安区', 34, 3407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248699, 340711, '郊区', 34, 3407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248700, 340722, '枞阳县', 34, 3407, 3);
INSERT INTO `sys_citys` VALUES (973480327513248701, 340802, '迎江区', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248702, 340803, '大观区', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248703, 340811, '宜秀区', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248704, 340822, '怀宁县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248705, 340824, '潜山县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248706, 340825, '太湖县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248707, 340826, '宿松县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248708, 340827, '望江县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248709, 340828, '岳西县', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248710, 340881, '桐城市', 34, 3408, 3);
INSERT INTO `sys_citys` VALUES (973480327513248711, 341002, '屯溪区', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248712, 341003, '黄山区', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248713, 341004, '徽州区', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248714, 341021, '歙县', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248715, 341022, '休宁县', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248716, 341023, '黟县', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248717, 341024, '祁门县', 34, 3410, 3);
INSERT INTO `sys_citys` VALUES (973480327513248718, 341102, '琅琊区', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248719, 341103, '南谯区', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248720, 341122, '来安县', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248721, 341124, '全椒县', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248722, 341125, '定远县', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248723, 341126, '凤阳县', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248724, 341181, '天长市', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248725, 341182, '明光市', 34, 3411, 3);
INSERT INTO `sys_citys` VALUES (973480327513248726, 341202, '颍州区', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248727, 341203, '颍东区', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248728, 341204, '颍泉区', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248729, 341221, '临泉县', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248730, 341222, '太和县', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248731, 341225, '阜南县', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248732, 341226, '颍上县', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248733, 341282, '界首市', 34, 3412, 3);
INSERT INTO `sys_citys` VALUES (973480327513248734, 341302, '埇桥区', 34, 3413, 3);
INSERT INTO `sys_citys` VALUES (973480327513248735, 341321, '砀山县', 34, 3413, 3);
INSERT INTO `sys_citys` VALUES (973480327513248736, 341322, '萧县', 34, 3413, 3);
INSERT INTO `sys_citys` VALUES (973480327513248737, 341323, '灵璧县', 34, 3413, 3);
INSERT INTO `sys_citys` VALUES (973480327513248738, 341324, '泗县', 34, 3413, 3);
INSERT INTO `sys_citys` VALUES (973480327513248739, 341502, '金安区', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248740, 341503, '裕安区', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248741, 341504, '叶集区', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248742, 341522, '霍邱县', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248743, 341523, '舒城县', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248744, 341524, '金寨县', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248745, 341525, '霍山县', 34, 3415, 3);
INSERT INTO `sys_citys` VALUES (973480327513248746, 341602, '谯城区', 34, 3416, 3);
INSERT INTO `sys_citys` VALUES (973480327513248747, 341621, '涡阳县', 34, 3416, 3);
INSERT INTO `sys_citys` VALUES (973480327513248748, 341622, '蒙城县', 34, 3416, 3);
INSERT INTO `sys_citys` VALUES (973480327513248749, 341623, '利辛县', 34, 3416, 3);
INSERT INTO `sys_citys` VALUES (973480327513248750, 341702, '贵池区', 34, 3417, 3);
INSERT INTO `sys_citys` VALUES (973480327513248751, 341721, '东至县', 34, 3417, 3);
INSERT INTO `sys_citys` VALUES (973480327513248752, 341722, '石台县', 34, 3417, 3);
INSERT INTO `sys_citys` VALUES (973480327513248753, 341723, '青阳县', 34, 3417, 3);
INSERT INTO `sys_citys` VALUES (973480327513248754, 341802, '宣州区', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248755, 341821, '郎溪县', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248756, 341822, '广德县', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248757, 341823, '泾县', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248758, 341824, '绩溪县', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248759, 341825, '旌德县', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248760, 341881, '宁国市', 34, 3418, 3);
INSERT INTO `sys_citys` VALUES (973480327513248761, 350102, '鼓楼区', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248762, 350103, '台江区', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248763, 350104, '仓山区', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248764, 350105, '马尾区', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248765, 350111, '晋安区', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248766, 350121, '闽侯县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248767, 350122, '连江县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248768, 350123, '罗源县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248769, 350124, '闽清县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248770, 350125, '永泰县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248771, 350128, '平潭县', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248772, 350181, '福清市', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248773, 350182, '长乐市', 35, 3501, 3);
INSERT INTO `sys_citys` VALUES (973480327513248774, 350203, '思明区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248775, 350205, '海沧区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248776, 350206, '湖里区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248777, 350211, '集美区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248778, 350212, '同安区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248779, 350213, '翔安区', 35, 3502, 3);
INSERT INTO `sys_citys` VALUES (973480327513248780, 350302, '城厢区', 35, 3503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248781, 350303, '涵江区', 35, 3503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248782, 350304, '荔城区', 35, 3503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248783, 350305, '秀屿区', 35, 3503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248784, 350322, '仙游县', 35, 3503, 3);
INSERT INTO `sys_citys` VALUES (973480327513248785, 350402, '梅列区', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248786, 350403, '三元区', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248787, 350421, '明溪县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248788, 350423, '清流县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248789, 350424, '宁化县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248790, 350425, '大田县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248791, 350426, '尤溪县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248792, 350427, '沙县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248793, 350428, '将乐县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248794, 350429, '泰宁县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248795, 350430, '建宁县', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248796, 350481, '永安市', 35, 3504, 3);
INSERT INTO `sys_citys` VALUES (973480327513248797, 350502, '鲤城区', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248798, 350503, '丰泽区', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248799, 350504, '洛江区', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248800, 350505, '泉港区', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248801, 350521, '惠安县', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248802, 350524, '安溪县', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248803, 350525, '永春县', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248804, 350526, '德化县', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248805, 350581, '石狮市', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248806, 350582, '晋江市', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248807, 350583, '南安市', 35, 3505, 3);
INSERT INTO `sys_citys` VALUES (973480327513248808, 350602, '芗城区', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248809, 350603, '龙文区', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248810, 350622, '云霄县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248811, 350623, '漳浦县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248812, 350624, '诏安县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248813, 350625, '长泰县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248814, 350626, '东山县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248815, 350627, '南靖县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248816, 350628, '平和县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248817, 350629, '华安县', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248818, 350681, '龙海市', 35, 3506, 3);
INSERT INTO `sys_citys` VALUES (973480327513248819, 350702, '延平区', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248820, 350703, '建阳区', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248821, 350721, '顺昌县', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248822, 350722, '浦城县', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248823, 350723, '光泽县', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248824, 350724, '松溪县', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248825, 350725, '政和县', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248826, 350781, '邵武市', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248827, 350782, '武夷山市', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248828, 350783, '建瓯市', 35, 3507, 3);
INSERT INTO `sys_citys` VALUES (973480327513248829, 350802, '新罗区', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248830, 350803, '永定区', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248831, 350821, '长汀县', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248832, 350823, '上杭县', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248833, 350824, '武平县', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248834, 350825, '连城县', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248835, 350881, '漳平市', 35, 3508, 3);
INSERT INTO `sys_citys` VALUES (973480327513248836, 350902, '蕉城区', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248837, 350921, '霞浦县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248838, 350922, '古田县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248839, 350923, '屏南县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248840, 350924, '寿宁县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248841, 350925, '周宁县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248842, 350926, '柘荣县', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248843, 350981, '福安市', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248844, 350982, '福鼎市', 35, 3509, 3);
INSERT INTO `sys_citys` VALUES (973480327513248845, 360102, '东湖区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248846, 360103, '西湖区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248847, 360104, '青云谱区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248848, 360105, '湾里区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248849, 360111, '青山湖区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248850, 360112, '新建区', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248851, 360121, '南昌县', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248852, 360123, '安义县', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248853, 360124, '进贤县', 36, 3601, 3);
INSERT INTO `sys_citys` VALUES (973480327513248854, 360202, '昌江区', 36, 3602, 3);
INSERT INTO `sys_citys` VALUES (973480327513248855, 360203, '珠山区', 36, 3602, 3);
INSERT INTO `sys_citys` VALUES (973480327513248856, 360222, '浮梁县', 36, 3602, 3);
INSERT INTO `sys_citys` VALUES (973480327513248857, 360281, '乐平市', 36, 3602, 3);
INSERT INTO `sys_citys` VALUES (973480327513248858, 360302, '安源区', 36, 3603, 3);
INSERT INTO `sys_citys` VALUES (973480327513248859, 360313, '湘东区', 36, 3603, 3);
INSERT INTO `sys_citys` VALUES (973480327513248860, 360321, '莲花县', 36, 3603, 3);
INSERT INTO `sys_citys` VALUES (973480327513248861, 360322, '上栗县', 36, 3603, 3);
INSERT INTO `sys_citys` VALUES (973480327513248862, 360323, '芦溪县', 36, 3603, 3);
INSERT INTO `sys_citys` VALUES (973480327513248863, 360402, '濂溪区', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248864, 360403, '浔阳区', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248865, 360421, '九江县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248866, 360423, '武宁县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248867, 360424, '修水县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248868, 360425, '永修县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248869, 360426, '德安县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248870, 360428, '都昌县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248871, 360429, '湖口县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248872, 360430, '彭泽县', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248873, 360481, '瑞昌市', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248874, 360482, '共青城市', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248875, 360483, '庐山市', 36, 3604, 3);
INSERT INTO `sys_citys` VALUES (973480327513248876, 360502, '渝水区', 36, 3605, 3);
INSERT INTO `sys_citys` VALUES (973480327513248877, 360521, '分宜县', 36, 3605, 3);
INSERT INTO `sys_citys` VALUES (973480327513248878, 360602, '月湖区', 36, 3606, 3);
INSERT INTO `sys_citys` VALUES (973480327513248879, 360622, '余江县', 36, 3606, 3);
INSERT INTO `sys_citys` VALUES (973480327513248880, 360681, '贵溪市', 36, 3606, 3);
INSERT INTO `sys_citys` VALUES (973480327513248881, 360702, '章贡区', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248882, 360703, '南康区', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248883, 360721, '赣县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248884, 360722, '信丰县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248885, 360723, '大余县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248886, 360724, '上犹县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248887, 360725, '崇义县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248888, 360726, '安远县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248889, 360727, '龙南县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248890, 360728, '定南县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248891, 360729, '全南县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248892, 360730, '宁都县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248893, 360731, '于都县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248894, 360732, '兴国县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248895, 360733, '会昌县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248896, 360734, '寻乌县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248897, 360735, '石城县', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248898, 360781, '瑞金市', 36, 3607, 3);
INSERT INTO `sys_citys` VALUES (973480327513248899, 360802, '吉州区', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248900, 360803, '青原区', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248901, 360821, '吉安县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248902, 360822, '吉水县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248903, 360823, '峡江县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248904, 360824, '新干县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248905, 360825, '永丰县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248906, 360826, '泰和县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248907, 360827, '遂川县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248908, 360828, '万安县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248909, 360829, '安福县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248910, 360830, '永新县', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248911, 360881, '井冈山市', 36, 3608, 3);
INSERT INTO `sys_citys` VALUES (973480327513248912, 360902, '袁州区', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248913, 360921, '奉新县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248914, 360922, '万载县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248915, 360923, '上高县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248916, 360924, '宜丰县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248917, 360925, '靖安县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248918, 360926, '铜鼓县', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248919, 360981, '丰城市', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248920, 360982, '樟树市', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248921, 360983, '高安市', 36, 3609, 3);
INSERT INTO `sys_citys` VALUES (973480327513248922, 361002, '临川区', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248923, 361021, '南城县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248924, 361022, '黎川县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248925, 361023, '南丰县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248926, 361024, '崇仁县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248927, 361025, '乐安县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248928, 361026, '宜黄县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248929, 361027, '金溪县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248930, 361028, '资溪县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248931, 361029, '东乡县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248932, 361030, '广昌县', 36, 3610, 3);
INSERT INTO `sys_citys` VALUES (973480327513248933, 361102, '信州区', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248934, 361103, '广丰区', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248935, 361121, '上饶县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248936, 361123, '玉山县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248937, 361124, '铅山县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248938, 361125, '横峰县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248939, 361126, '弋阳县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248940, 361127, '余干县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248941, 361128, '鄱阳县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248942, 361129, '万年县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248943, 361130, '婺源县', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248944, 361181, '德兴市', 36, 3611, 3);
INSERT INTO `sys_citys` VALUES (973480327513248945, 370102, '历下区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248946, 370103, '市中区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248947, 370104, '槐荫区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248948, 370105, '天桥区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248949, 370112, '历城区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248950, 370113, '长清区', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248951, 370124, '平阴县', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248952, 370125, '济阳县', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248953, 370126, '商河县', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248954, 370181, '章丘市', 37, 3701, 3);
INSERT INTO `sys_citys` VALUES (973480327513248955, 370202, '市南区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248956, 370203, '市北区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248957, 370211, '黄岛区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248958, 370212, '崂山区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248959, 370213, '李沧区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248960, 370214, '城阳区', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248961, 370281, '胶州市', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248962, 370282, '即墨市', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248963, 370283, '平度市', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248964, 370285, '莱西市', 37, 3702, 3);
INSERT INTO `sys_citys` VALUES (973480327513248965, 370302, '淄川区', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248966, 370303, '张店区', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248967, 370304, '博山区', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248968, 370305, '临淄区', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248969, 370306, '周村区', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248970, 370321, '桓台县', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248971, 370322, '高青县', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248972, 370323, '沂源县', 37, 3703, 3);
INSERT INTO `sys_citys` VALUES (973480327513248973, 370402, '市中区', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248974, 370403, '薛城区', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248975, 370404, '峄城区', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248976, 370405, '台儿庄区', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248977, 370406, '山亭区', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248978, 370481, '滕州市', 37, 3704, 3);
INSERT INTO `sys_citys` VALUES (973480327513248979, 370502, '东营区', 37, 3705, 3);
INSERT INTO `sys_citys` VALUES (973480327513248980, 370503, '河口区', 37, 3705, 3);
INSERT INTO `sys_citys` VALUES (973480327513248981, 370505, '垦利区', 37, 3705, 3);
INSERT INTO `sys_citys` VALUES (973480327513248982, 370522, '利津县', 37, 3705, 3);
INSERT INTO `sys_citys` VALUES (973480327513248983, 370523, '广饶县', 37, 3705, 3);
INSERT INTO `sys_citys` VALUES (973480327513248984, 370602, '芝罘区', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248985, 370611, '福山区', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248986, 370612, '牟平区', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248987, 370613, '莱山区', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248988, 370634, '长岛县', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248989, 370681, '龙口市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248990, 370682, '莱阳市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248991, 370683, '莱州市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248992, 370684, '蓬莱市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248993, 370685, '招远市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248994, 370686, '栖霞市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248995, 370687, '海阳市', 37, 3706, 3);
INSERT INTO `sys_citys` VALUES (973480327513248996, 370702, '潍城区', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513248997, 370703, '寒亭区', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513248998, 370704, '坊子区', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513248999, 370705, '奎文区', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249000, 370724, '临朐县', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249001, 370725, '昌乐县', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249002, 370781, '青州市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249003, 370782, '诸城市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249004, 370783, '寿光市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249005, 370784, '安丘市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249006, 370785, '高密市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249007, 370786, '昌邑市', 37, 3707, 3);
INSERT INTO `sys_citys` VALUES (973480327513249008, 370811, '任城区', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249009, 370812, '兖州区', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249010, 370826, '微山县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249011, 370827, '鱼台县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249012, 370828, '金乡县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249013, 370829, '嘉祥县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249014, 370830, '汶上县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249015, 370831, '泗水县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249016, 370832, '梁山县', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249017, 370881, '曲阜市', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249018, 370883, '邹城市', 37, 3708, 3);
INSERT INTO `sys_citys` VALUES (973480327513249019, 370902, '泰山区', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249020, 370911, '岱岳区', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249021, 370921, '宁阳县', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249022, 370923, '东平县', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249023, 370982, '新泰市', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249024, 370983, '肥城市', 37, 3709, 3);
INSERT INTO `sys_citys` VALUES (973480327513249025, 371002, '环翠区', 37, 3710, 3);
INSERT INTO `sys_citys` VALUES (973480327513249026, 371003, '文登区', 37, 3710, 3);
INSERT INTO `sys_citys` VALUES (973480327513249027, 371082, '荣成市', 37, 3710, 3);
INSERT INTO `sys_citys` VALUES (973480327513249028, 371083, '乳山市', 37, 3710, 3);
INSERT INTO `sys_citys` VALUES (973480327513249029, 371102, '东港区', 37, 3711, 3);
INSERT INTO `sys_citys` VALUES (973480327513249030, 371103, '岚山区', 37, 3711, 3);
INSERT INTO `sys_citys` VALUES (973480327513249031, 371121, '五莲县', 37, 3711, 3);
INSERT INTO `sys_citys` VALUES (973480327513249032, 371122, '莒县', 37, 3711, 3);
INSERT INTO `sys_citys` VALUES (973480327513249033, 371202, '莱城区', 37, 3712, 3);
INSERT INTO `sys_citys` VALUES (973480327513249034, 371203, '钢城区', 37, 3712, 3);
INSERT INTO `sys_citys` VALUES (973480327513249035, 371302, '兰山区', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249036, 371311, '罗庄区', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249037, 371312, '河东区', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249038, 371321, '沂南县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249039, 371322, '郯城县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249040, 371323, '沂水县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249041, 371324, '兰陵县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249042, 371325, '费县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249043, 371326, '平邑县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249044, 371327, '莒南县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249045, 371328, '蒙阴县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249046, 371329, '临沭县', 37, 3713, 3);
INSERT INTO `sys_citys` VALUES (973480327513249047, 371402, '德城区', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249048, 371403, '陵城区', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249049, 371422, '宁津县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249050, 371423, '庆云县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249051, 371424, '临邑县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249052, 371425, '齐河县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249053, 371426, '平原县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249054, 371427, '夏津县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249055, 371428, '武城县', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249056, 371481, '乐陵市', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249057, 371482, '禹城市', 37, 3714, 3);
INSERT INTO `sys_citys` VALUES (973480327513249058, 371502, '东昌府区', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249059, 371521, '阳谷县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249060, 371522, '莘县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249061, 371523, '茌平县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249062, 371524, '东阿县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249063, 371525, '冠县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249064, 371526, '高唐县', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249065, 371581, '临清市', 37, 3715, 3);
INSERT INTO `sys_citys` VALUES (973480327513249066, 371602, '滨城区', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249067, 371603, '沾化区', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249068, 371621, '惠民县', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249069, 371622, '阳信县', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249070, 371623, '无棣县', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249071, 371625, '博兴县', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249072, 371626, '邹平县', 37, 3716, 3);
INSERT INTO `sys_citys` VALUES (973480327513249073, 371702, '牡丹区', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249074, 371703, '定陶区', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249075, 371721, '曹县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249076, 371722, '单县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249077, 371723, '成武县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249078, 371724, '巨野县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249079, 371725, '郓城县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249080, 371726, '鄄城县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249081, 371728, '东明县', 37, 3717, 3);
INSERT INTO `sys_citys` VALUES (973480327513249082, 410102, '中原区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249083, 410103, '二七区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249084, 410104, '管城回族区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249085, 410105, '金水区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249086, 410106, '上街区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249087, 410108, '惠济区', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249088, 410122, '中牟县', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249089, 410181, '巩义市', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249090, 410182, '荥阳市', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249091, 410183, '新密市', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249092, 410184, '新郑市', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249093, 410185, '登封市', 41, 4101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249094, 410202, '龙亭区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249095, 410203, '顺河回族区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249096, 410204, '鼓楼区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249097, 410205, '禹王台区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249098, 410211, '金明区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249099, 410212, '祥符区', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249100, 410221, '杞县', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249101, 410222, '通许县', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249102, 410223, '尉氏县', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249103, 410225, '兰考县', 41, 4102, 3);
INSERT INTO `sys_citys` VALUES (973480327513249104, 410302, '老城区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249105, 410303, '西工区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249106, 410304, '瀍河回族区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249107, 410305, '涧西区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249108, 410306, '吉利区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249109, 410311, '洛龙区', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249110, 410322, '孟津县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249111, 410323, '新安县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249112, 410324, '栾川县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249113, 410325, '嵩县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249114, 410326, '汝阳县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249115, 410327, '宜阳县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249116, 410328, '洛宁县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249117, 410329, '伊川县', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249118, 410381, '偃师市', 41, 4103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249119, 410402, '新华区', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249120, 410403, '卫东区', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249121, 410404, '石龙区', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249122, 410411, '湛河区', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249123, 410421, '宝丰县', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249124, 410422, '叶县', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249125, 410423, '鲁山县', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249126, 410425, '郏县', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249127, 410481, '舞钢市', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249128, 410482, '汝州市', 41, 4104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249129, 410502, '文峰区', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249130, 410503, '北关区', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249131, 410505, '殷都区', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249132, 410506, '龙安区', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249133, 410522, '安阳县', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249134, 410523, '汤阴县', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249135, 410526, '滑县', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249136, 410527, '内黄县', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249137, 410581, '林州市', 41, 4105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249138, 410602, '鹤山区', 41, 4106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249139, 410603, '山城区', 41, 4106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249140, 410611, '淇滨区', 41, 4106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249141, 410621, '浚县', 41, 4106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249142, 410622, '淇县', 41, 4106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249143, 410702, '红旗区', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249144, 410703, '卫滨区', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249145, 410704, '凤泉区', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249146, 410711, '牧野区', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249147, 410721, '新乡县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249148, 410724, '获嘉县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249149, 410725, '原阳县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249150, 410726, '延津县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249151, 410727, '封丘县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249152, 410728, '长垣县', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249153, 410781, '卫辉市', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249154, 410782, '辉县市', 41, 4107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249155, 410802, '解放区', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249156, 410803, '中站区', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249157, 410804, '马村区', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249158, 410811, '山阳区', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249159, 410821, '修武县', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249160, 410822, '博爱县', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249161, 410823, '武陟县', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249162, 410825, '温县', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249163, 410882, '沁阳市', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249164, 410883, '孟州市', 41, 4108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249165, 410902, '华龙区', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249166, 410922, '清丰县', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249167, 410923, '南乐县', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249168, 410926, '范县', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249169, 410927, '台前县', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249170, 410928, '濮阳县', 41, 4109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249171, 411002, '魏都区', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249172, 411023, '许昌县', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249173, 411024, '鄢陵县', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249174, 411025, '襄城县', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249175, 411081, '禹州市', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249176, 411082, '长葛市', 41, 4110, 3);
INSERT INTO `sys_citys` VALUES (973480327513249177, 411102, '源汇区', 41, 4111, 3);
INSERT INTO `sys_citys` VALUES (973480327513249178, 411103, '郾城区', 41, 4111, 3);
INSERT INTO `sys_citys` VALUES (973480327513249179, 411104, '召陵区', 41, 4111, 3);
INSERT INTO `sys_citys` VALUES (973480327513249180, 411121, '舞阳县', 41, 4111, 3);
INSERT INTO `sys_citys` VALUES (973480327513249181, 411122, '临颍县', 41, 4111, 3);
INSERT INTO `sys_citys` VALUES (973480327513249182, 411202, '湖滨区', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249183, 411203, '陕州区', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249184, 411221, '渑池县', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249185, 411224, '卢氏县', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249186, 411281, '义马市', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249187, 411282, '灵宝市', 41, 4112, 3);
INSERT INTO `sys_citys` VALUES (973480327513249188, 411302, '宛城区', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249189, 411303, '卧龙区', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249190, 411321, '南召县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249191, 411322, '方城县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249192, 411323, '西峡县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249193, 411324, '镇平县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249194, 411325, '内乡县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249195, 411326, '淅川县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249196, 411327, '社旗县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249197, 411328, '唐河县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249198, 411329, '新野县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249199, 411330, '桐柏县', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249200, 411381, '邓州市', 41, 4113, 3);
INSERT INTO `sys_citys` VALUES (973480327513249201, 411402, '梁园区', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249202, 411403, '睢阳区', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249203, 411421, '民权县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249204, 411422, '睢县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249205, 411423, '宁陵县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249206, 411424, '柘城县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249207, 411425, '虞城县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249208, 411426, '夏邑县', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249209, 411481, '永城市', 41, 4114, 3);
INSERT INTO `sys_citys` VALUES (973480327513249210, 411502, '浉河区', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249211, 411503, '平桥区', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249212, 411521, '罗山县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249213, 411522, '光山县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249214, 411523, '新县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249215, 411524, '商城县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249216, 411525, '固始县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249217, 411526, '潢川县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249218, 411527, '淮滨县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249219, 411528, '息县', 41, 4115, 3);
INSERT INTO `sys_citys` VALUES (973480327513249220, 411602, '川汇区', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249221, 411621, '扶沟县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249222, 411622, '西华县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249223, 411623, '商水县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249224, 411624, '沈丘县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249225, 411625, '郸城县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249226, 411626, '淮阳县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249227, 411627, '太康县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249228, 411628, '鹿邑县', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249229, 411681, '项城市', 41, 4116, 3);
INSERT INTO `sys_citys` VALUES (973480327513249230, 411702, '驿城区', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249231, 411721, '西平县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249232, 411722, '上蔡县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249233, 411723, '平舆县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249234, 411724, '正阳县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249235, 411725, '确山县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249236, 411726, '泌阳县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249237, 411727, '汝南县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249238, 411728, '遂平县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249239, 411729, '新蔡县', 41, 4117, 3);
INSERT INTO `sys_citys` VALUES (973480327513249240, 419001, '济源市', 41, 4190, 3);
INSERT INTO `sys_citys` VALUES (973480327513249241, 420102, '江岸区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249242, 420103, '江汉区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249243, 420104, '硚口区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249244, 420105, '汉阳区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249245, 420106, '武昌区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249246, 420107, '青山区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249247, 420111, '洪山区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249248, 420112, '东西湖区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249249, 420113, '汉南区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249250, 420114, '蔡甸区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249251, 420115, '江夏区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249252, 420116, '黄陂区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249253, 420117, '新洲区', 42, 4201, 3);
INSERT INTO `sys_citys` VALUES (973480327513249254, 420202, '黄石港区', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249255, 420203, '西塞山区', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249256, 420204, '下陆区', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249257, 420205, '铁山区', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249258, 420222, '阳新县', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249259, 420281, '大冶市', 42, 4202, 3);
INSERT INTO `sys_citys` VALUES (973480327513249260, 420302, '茅箭区', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249261, 420303, '张湾区', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249262, 420304, '郧阳区', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249263, 420322, '郧西县', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249264, 420323, '竹山县', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249265, 420324, '竹溪县', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249266, 420325, '房县', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249267, 420381, '丹江口市', 42, 4203, 3);
INSERT INTO `sys_citys` VALUES (973480327513249268, 420502, '西陵区', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249269, 420503, '伍家岗区', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249270, 420504, '点军区', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249271, 420505, '猇亭区', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249272, 420506, '夷陵区', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249273, 420525, '远安县', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249274, 420526, '兴山县', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249275, 420527, '秭归县', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249276, 420528, '长阳土家族自治县', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249277, 420529, '五峰土家族自治县', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249278, 420581, '宜都市', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249279, 420582, '当阳市', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249280, 420583, '枝江市', 42, 4205, 3);
INSERT INTO `sys_citys` VALUES (973480327513249281, 420602, '襄城区', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249282, 420606, '樊城区', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249283, 420607, '襄州区', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249284, 420624, '南漳县', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249285, 420625, '谷城县', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249286, 420626, '保康县', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249287, 420682, '老河口市', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249288, 420683, '枣阳市', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249289, 420684, '宜城市', 42, 4206, 3);
INSERT INTO `sys_citys` VALUES (973480327513249290, 420702, '梁子湖区', 42, 4207, 3);
INSERT INTO `sys_citys` VALUES (973480327513249291, 420703, '华容区', 42, 4207, 3);
INSERT INTO `sys_citys` VALUES (973480327513249292, 420704, '鄂城区', 42, 4207, 3);
INSERT INTO `sys_citys` VALUES (973480327513249293, 420802, '东宝区', 42, 4208, 3);
INSERT INTO `sys_citys` VALUES (973480327513249294, 420804, '掇刀区', 42, 4208, 3);
INSERT INTO `sys_citys` VALUES (973480327513249295, 420821, '京山县', 42, 4208, 3);
INSERT INTO `sys_citys` VALUES (973480327513249296, 420822, '沙洋县', 42, 4208, 3);
INSERT INTO `sys_citys` VALUES (973480327513249297, 420881, '钟祥市', 42, 4208, 3);
INSERT INTO `sys_citys` VALUES (973480327513249298, 420902, '孝南区', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249299, 420921, '孝昌县', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249300, 420922, '大悟县', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249301, 420923, '云梦县', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249302, 420981, '应城市', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249303, 420982, '安陆市', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249304, 420984, '汉川市', 42, 4209, 3);
INSERT INTO `sys_citys` VALUES (973480327513249305, 421002, '沙市区', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249306, 421003, '荆州区', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249307, 421022, '公安县', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249308, 421023, '监利县', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249309, 421024, '江陵县', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249310, 421081, '石首市', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249311, 421083, '洪湖市', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249312, 421087, '松滋市', 42, 4210, 3);
INSERT INTO `sys_citys` VALUES (973480327513249313, 421102, '黄州区', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249314, 421121, '团风县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249315, 421122, '红安县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249316, 421123, '罗田县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249317, 421124, '英山县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249318, 421125, '浠水县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249319, 421126, '蕲春县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249320, 421127, '黄梅县', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249321, 421181, '麻城市', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249322, 421182, '武穴市', 42, 4211, 3);
INSERT INTO `sys_citys` VALUES (973480327513249323, 421202, '咸安区', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249324, 421221, '嘉鱼县', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249325, 421222, '通城县', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249326, 421223, '崇阳县', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249327, 421224, '通山县', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249328, 421281, '赤壁市', 42, 4212, 3);
INSERT INTO `sys_citys` VALUES (973480327513249329, 421303, '曾都区', 42, 4213, 3);
INSERT INTO `sys_citys` VALUES (973480327513249330, 421321, '随县', 42, 4213, 3);
INSERT INTO `sys_citys` VALUES (973480327513249331, 421381, '广水市', 42, 4213, 3);
INSERT INTO `sys_citys` VALUES (973480327513249332, 422801, '恩施市', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249333, 422802, '利川市', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249334, 422822, '建始县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249335, 422823, '巴东县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249336, 422825, '宣恩县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249337, 422826, '咸丰县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249338, 422827, '来凤县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249339, 422828, '鹤峰县', 42, 4228, 3);
INSERT INTO `sys_citys` VALUES (973480327513249340, 429004, '仙桃市', 42, 4290, 3);
INSERT INTO `sys_citys` VALUES (973480327513249341, 429005, '潜江市', 42, 4290, 3);
INSERT INTO `sys_citys` VALUES (973480327513249342, 429006, '天门市', 42, 4290, 3);
INSERT INTO `sys_citys` VALUES (973480327513249343, 429021, '神农架林区', 42, 4290, 3);
INSERT INTO `sys_citys` VALUES (973480327513249344, 430102, '芙蓉区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249345, 430103, '天心区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249346, 430104, '岳麓区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249347, 430105, '开福区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249348, 430111, '雨花区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249349, 430112, '望城区', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249350, 430121, '长沙县', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249351, 430124, '宁乡县', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249352, 430181, '浏阳市', 43, 4301, 3);
INSERT INTO `sys_citys` VALUES (973480327513249353, 430202, '荷塘区', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249354, 430203, '芦淞区', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249355, 430204, '石峰区', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249356, 430211, '天元区', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249357, 430221, '株洲县', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249358, 430223, '攸县', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249359, 430224, '茶陵县', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249360, 430225, '炎陵县', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249361, 430281, '醴陵市', 43, 4302, 3);
INSERT INTO `sys_citys` VALUES (973480327513249362, 430302, '雨湖区', 43, 4303, 3);
INSERT INTO `sys_citys` VALUES (973480327513249363, 430304, '岳塘区', 43, 4303, 3);
INSERT INTO `sys_citys` VALUES (973480327513249364, 430321, '湘潭县', 43, 4303, 3);
INSERT INTO `sys_citys` VALUES (973480327513249365, 430381, '湘乡市', 43, 4303, 3);
INSERT INTO `sys_citys` VALUES (973480327513249366, 430382, '韶山市', 43, 4303, 3);
INSERT INTO `sys_citys` VALUES (973480327513249367, 430405, '珠晖区', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249368, 430406, '雁峰区', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249369, 430407, '石鼓区', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249370, 430408, '蒸湘区', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249371, 430412, '南岳区', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249372, 430421, '衡阳县', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249373, 430422, '衡南县', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249374, 430423, '衡山县', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249375, 430424, '衡东县', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249376, 430426, '祁东县', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249377, 430481, '耒阳市', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249378, 430482, '常宁市', 43, 4304, 3);
INSERT INTO `sys_citys` VALUES (973480327513249379, 430502, '双清区', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249380, 430503, '大祥区', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249381, 430511, '北塔区', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249382, 430521, '邵东县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249383, 430522, '新邵县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249384, 430523, '邵阳县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249385, 430524, '隆回县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249386, 430525, '洞口县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249387, 430527, '绥宁县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249388, 430528, '新宁县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249389, 430529, '城步苗族自治县', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249390, 430581, '武冈市', 43, 4305, 3);
INSERT INTO `sys_citys` VALUES (973480327513249391, 430602, '岳阳楼区', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249392, 430603, '云溪区', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249393, 430611, '君山区', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249394, 430621, '岳阳县', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249395, 430623, '华容县', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249396, 430624, '湘阴县', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249397, 430626, '平江县', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249398, 430681, '汨罗市', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249399, 430682, '临湘市', 43, 4306, 3);
INSERT INTO `sys_citys` VALUES (973480327513249400, 430702, '武陵区', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249401, 430703, '鼎城区', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249402, 430721, '安乡县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249403, 430722, '汉寿县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249404, 430723, '澧县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249405, 430724, '临澧县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249406, 430725, '桃源县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249407, 430726, '石门县', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249408, 430781, '津市市', 43, 4307, 3);
INSERT INTO `sys_citys` VALUES (973480327513249409, 430802, '永定区', 43, 4308, 3);
INSERT INTO `sys_citys` VALUES (973480327513249410, 430811, '武陵源区', 43, 4308, 3);
INSERT INTO `sys_citys` VALUES (973480327513249411, 430821, '慈利县', 43, 4308, 3);
INSERT INTO `sys_citys` VALUES (973480327513249412, 430822, '桑植县', 43, 4308, 3);
INSERT INTO `sys_citys` VALUES (973480327513249413, 430902, '资阳区', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249414, 430903, '赫山区', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249415, 430921, '南县', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249416, 430922, '桃江县', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249417, 430923, '安化县', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249418, 430981, '沅江市', 43, 4309, 3);
INSERT INTO `sys_citys` VALUES (973480327513249419, 431002, '北湖区', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249420, 431003, '苏仙区', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249421, 431021, '桂阳县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249422, 431022, '宜章县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249423, 431023, '永兴县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249424, 431024, '嘉禾县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249425, 431025, '临武县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249426, 431026, '汝城县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249427, 431027, '桂东县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249428, 431028, '安仁县', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249429, 431081, '资兴市', 43, 4310, 3);
INSERT INTO `sys_citys` VALUES (973480327513249430, 431102, '零陵区', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249431, 431103, '冷水滩区', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249432, 431121, '祁阳县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249433, 431122, '东安县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249434, 431123, '双牌县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249435, 431124, '道县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249436, 431125, '江永县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249437, 431126, '宁远县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249438, 431127, '蓝山县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249439, 431128, '新田县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249440, 431129, '江华瑶族自治县', 43, 4311, 3);
INSERT INTO `sys_citys` VALUES (973480327513249441, 431202, '鹤城区', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249442, 431221, '中方县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249443, 431222, '沅陵县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249444, 431223, '辰溪县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249445, 431224, '溆浦县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249446, 431225, '会同县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249447, 431226, '麻阳苗族自治县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249448, 431227, '新晃侗族自治县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249449, 431228, '芷江侗族自治县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249450, 431229, '靖州苗族侗族自治县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249451, 431230, '通道侗族自治县', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249452, 431281, '洪江市', 43, 4312, 3);
INSERT INTO `sys_citys` VALUES (973480327513249453, 431302, '娄星区', 43, 4313, 3);
INSERT INTO `sys_citys` VALUES (973480327513249454, 431321, '双峰县', 43, 4313, 3);
INSERT INTO `sys_citys` VALUES (973480327513249455, 431322, '新化县', 43, 4313, 3);
INSERT INTO `sys_citys` VALUES (973480327513249456, 431381, '冷水江市', 43, 4313, 3);
INSERT INTO `sys_citys` VALUES (973480327513249457, 431382, '涟源市', 43, 4313, 3);
INSERT INTO `sys_citys` VALUES (973480327513249458, 433101, '吉首市', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249459, 433122, '泸溪县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249460, 433123, '凤凰县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249461, 433124, '花垣县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249462, 433125, '保靖县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249463, 433126, '古丈县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249464, 433127, '永顺县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249465, 433130, '龙山县', 43, 4331, 3);
INSERT INTO `sys_citys` VALUES (973480327513249466, 440103, '荔湾区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249467, 440104, '越秀区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249468, 440105, '海珠区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249469, 440106, '天河区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249470, 440111, '白云区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249471, 440112, '黄埔区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249472, 440113, '番禺区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249473, 440114, '花都区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249474, 440115, '南沙区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249475, 440117, '从化区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249476, 440118, '增城区', 44, 4401, 3);
INSERT INTO `sys_citys` VALUES (973480327513249477, 440203, '武江区', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249478, 440204, '浈江区', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249479, 440205, '曲江区', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249480, 440222, '始兴县', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249481, 440224, '仁化县', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249482, 440229, '翁源县', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249483, 440232, '乳源瑶族自治县', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249484, 440233, '新丰县', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249485, 440281, '乐昌市', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249486, 440282, '南雄市', 44, 4402, 3);
INSERT INTO `sys_citys` VALUES (973480327513249487, 440303, '罗湖区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249488, 440304, '福田区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249489, 440305, '南山区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249490, 440306, '宝安区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249491, 440307, '龙岗区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249492, 440308, '盐田区', 44, 4403, 3);
INSERT INTO `sys_citys` VALUES (973480327513249493, 440402, '香洲区', 44, 4404, 3);
INSERT INTO `sys_citys` VALUES (973480327513249494, 440403, '斗门区', 44, 4404, 3);
INSERT INTO `sys_citys` VALUES (973480327513249495, 440404, '金湾区', 44, 4404, 3);
INSERT INTO `sys_citys` VALUES (973480327513249496, 440507, '龙湖区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249497, 440511, '金平区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249498, 440512, '濠江区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249499, 440513, '潮阳区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249500, 440514, '潮南区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249501, 440515, '澄海区', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249502, 440523, '南澳县', 44, 4405, 3);
INSERT INTO `sys_citys` VALUES (973480327513249503, 440604, '禅城区', 44, 4406, 3);
INSERT INTO `sys_citys` VALUES (973480327513249504, 440605, '南海区', 44, 4406, 3);
INSERT INTO `sys_citys` VALUES (973480327513249505, 440606, '顺德区', 44, 4406, 3);
INSERT INTO `sys_citys` VALUES (973480327513249506, 440607, '三水区', 44, 4406, 3);
INSERT INTO `sys_citys` VALUES (973480327513249507, 440608, '高明区', 44, 4406, 3);
INSERT INTO `sys_citys` VALUES (973480327513249508, 440703, '蓬江区', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249509, 440704, '江海区', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249510, 440705, '新会区', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249511, 440781, '台山市', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249512, 440783, '开平市', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249513, 440784, '鹤山市', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249514, 440785, '恩平市', 44, 4407, 3);
INSERT INTO `sys_citys` VALUES (973480327513249515, 440802, '赤坎区', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249516, 440803, '霞山区', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249517, 440804, '坡头区', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249518, 440811, '麻章区', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249519, 440823, '遂溪县', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249520, 440825, '徐闻县', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249521, 440881, '廉江市', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249522, 440882, '雷州市', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249523, 440883, '吴川市', 44, 4408, 3);
INSERT INTO `sys_citys` VALUES (973480327513249524, 440902, '茂南区', 44, 4409, 3);
INSERT INTO `sys_citys` VALUES (973480327513249525, 440904, '电白区', 44, 4409, 3);
INSERT INTO `sys_citys` VALUES (973480327513249526, 440981, '高州市', 44, 4409, 3);
INSERT INTO `sys_citys` VALUES (973480327513249527, 440982, '化州市', 44, 4409, 3);
INSERT INTO `sys_citys` VALUES (973480327513249528, 440983, '信宜市', 44, 4409, 3);
INSERT INTO `sys_citys` VALUES (973480327513249529, 441202, '端州区', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249530, 441203, '鼎湖区', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249531, 441204, '高要区', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249532, 441223, '广宁县', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249533, 441224, '怀集县', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249534, 441225, '封开县', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249535, 441226, '德庆县', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249536, 441284, '四会市', 44, 4412, 3);
INSERT INTO `sys_citys` VALUES (973480327513249537, 441302, '惠城区', 44, 4413, 3);
INSERT INTO `sys_citys` VALUES (973480327513249538, 441303, '惠阳区', 44, 4413, 3);
INSERT INTO `sys_citys` VALUES (973480327513249539, 441322, '博罗县', 44, 4413, 3);
INSERT INTO `sys_citys` VALUES (973480327513249540, 441323, '惠东县', 44, 4413, 3);
INSERT INTO `sys_citys` VALUES (973480327513249541, 441324, '龙门县', 44, 4413, 3);
INSERT INTO `sys_citys` VALUES (973480327513249542, 441402, '梅江区', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249543, 441403, '梅县区', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249544, 441422, '大埔县', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249545, 441423, '丰顺县', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249546, 441424, '五华县', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249547, 441426, '平远县', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249548, 441427, '蕉岭县', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249549, 441481, '兴宁市', 44, 4414, 3);
INSERT INTO `sys_citys` VALUES (973480327513249550, 441502, '城区', 44, 4415, 3);
INSERT INTO `sys_citys` VALUES (973480327513249551, 441521, '海丰县', 44, 4415, 3);
INSERT INTO `sys_citys` VALUES (973480327513249552, 441523, '陆河县', 44, 4415, 3);
INSERT INTO `sys_citys` VALUES (973480327513249553, 441581, '陆丰市', 44, 4415, 3);
INSERT INTO `sys_citys` VALUES (973480327513249554, 441602, '源城区', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249555, 441621, '紫金县', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249556, 441622, '龙川县', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249557, 441623, '连平县', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249558, 441624, '和平县', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249559, 441625, '东源县', 44, 4416, 3);
INSERT INTO `sys_citys` VALUES (973480327513249560, 441702, '江城区', 44, 4417, 3);
INSERT INTO `sys_citys` VALUES (973480327513249561, 441704, '阳东区', 44, 4417, 3);
INSERT INTO `sys_citys` VALUES (973480327513249562, 441721, '阳西县', 44, 4417, 3);
INSERT INTO `sys_citys` VALUES (973480327513249563, 441781, '阳春市', 44, 4417, 3);
INSERT INTO `sys_citys` VALUES (973480327513249564, 441802, '清城区', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249565, 441803, '清新区', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249566, 441821, '佛冈县', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249567, 441823, '阳山县', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249568, 441825, '连山壮族瑶族自治县', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249569, 441826, '连南瑶族自治县', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249570, 441881, '英德市', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249571, 441882, '连州市', 44, 4418, 3);
INSERT INTO `sys_citys` VALUES (973480327513249572, 445102, '湘桥区', 44, 4451, 3);
INSERT INTO `sys_citys` VALUES (973480327513249573, 445103, '潮安区', 44, 4451, 3);
INSERT INTO `sys_citys` VALUES (973480327513249574, 445122, '饶平县', 44, 4451, 3);
INSERT INTO `sys_citys` VALUES (973480327513249575, 445202, '榕城区', 44, 4452, 3);
INSERT INTO `sys_citys` VALUES (973480327513249576, 445203, '揭东区', 44, 4452, 3);
INSERT INTO `sys_citys` VALUES (973480327513249577, 445222, '揭西县', 44, 4452, 3);
INSERT INTO `sys_citys` VALUES (973480327513249578, 445224, '惠来县', 44, 4452, 3);
INSERT INTO `sys_citys` VALUES (973480327513249579, 445281, '普宁市', 44, 4452, 3);
INSERT INTO `sys_citys` VALUES (973480327513249580, 445302, '云城区', 44, 4453, 3);
INSERT INTO `sys_citys` VALUES (973480327513249581, 445303, '云安区', 44, 4453, 3);
INSERT INTO `sys_citys` VALUES (973480327513249582, 445321, '新兴县', 44, 4453, 3);
INSERT INTO `sys_citys` VALUES (973480327513249583, 445322, '郁南县', 44, 4453, 3);
INSERT INTO `sys_citys` VALUES (973480327513249584, 445381, '罗定市', 44, 4453, 3);
INSERT INTO `sys_citys` VALUES (973480327513249585, 450102, '兴宁区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249586, 450103, '青秀区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249587, 450105, '江南区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249588, 450107, '西乡塘区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249589, 450108, '良庆区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249590, 450109, '邕宁区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249591, 450110, '武鸣区', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249592, 450123, '隆安县', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249593, 450124, '马山县', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249594, 450125, '上林县', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249595, 450126, '宾阳县', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249596, 450127, '横县', 45, 4501, 3);
INSERT INTO `sys_citys` VALUES (973480327513249597, 450202, '城中区', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249598, 450203, '鱼峰区', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249599, 450204, '柳南区', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249600, 450205, '柳北区', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249601, 450206, '柳江区', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249602, 450222, '柳城县', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249603, 450223, '鹿寨县', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249604, 450224, '融安县', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249605, 450225, '融水苗族自治县', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249606, 450226, '三江侗族自治县', 45, 4502, 3);
INSERT INTO `sys_citys` VALUES (973480327513249607, 450302, '秀峰区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249608, 450303, '叠彩区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249609, 450304, '象山区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249610, 450305, '七星区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249611, 450311, '雁山区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249612, 450312, '临桂区', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249613, 450321, '阳朔县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249614, 450323, '灵川县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249615, 450324, '全州县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249616, 450325, '兴安县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249617, 450326, '永福县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249618, 450327, '灌阳县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249619, 450328, '龙胜各族自治县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249620, 450329, '资源县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249621, 450330, '平乐县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249622, 450331, '荔浦县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249623, 450332, '恭城瑶族自治县', 45, 4503, 3);
INSERT INTO `sys_citys` VALUES (973480327513249624, 450403, '万秀区', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249625, 450405, '长洲区', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249626, 450406, '龙圩区', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249627, 450421, '苍梧县', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249628, 450422, '藤县', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249629, 450423, '蒙山县', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249630, 450481, '岑溪市', 45, 4504, 3);
INSERT INTO `sys_citys` VALUES (973480327513249631, 450502, '海城区', 45, 4505, 3);
INSERT INTO `sys_citys` VALUES (973480327513249632, 450503, '银海区', 45, 4505, 3);
INSERT INTO `sys_citys` VALUES (973480327513249633, 450512, '铁山港区', 45, 4505, 3);
INSERT INTO `sys_citys` VALUES (973480327513249634, 450521, '合浦县', 45, 4505, 3);
INSERT INTO `sys_citys` VALUES (973480327513249635, 450602, '港口区', 45, 4506, 3);
INSERT INTO `sys_citys` VALUES (973480327513249636, 450603, '防城区', 45, 4506, 3);
INSERT INTO `sys_citys` VALUES (973480327513249637, 450621, '上思县', 45, 4506, 3);
INSERT INTO `sys_citys` VALUES (973480327513249638, 450681, '东兴市', 45, 4506, 3);
INSERT INTO `sys_citys` VALUES (973480327513249639, 450702, '钦南区', 45, 4507, 3);
INSERT INTO `sys_citys` VALUES (973480327513249640, 450703, '钦北区', 45, 4507, 3);
INSERT INTO `sys_citys` VALUES (973480327513249641, 450721, '灵山县', 45, 4507, 3);
INSERT INTO `sys_citys` VALUES (973480327513249642, 450722, '浦北县', 45, 4507, 3);
INSERT INTO `sys_citys` VALUES (973480327513249643, 450802, '港北区', 45, 4508, 3);
INSERT INTO `sys_citys` VALUES (973480327513249644, 450803, '港南区', 45, 4508, 3);
INSERT INTO `sys_citys` VALUES (973480327513249645, 450804, '覃塘区', 45, 4508, 3);
INSERT INTO `sys_citys` VALUES (973480327513249646, 450821, '平南县', 45, 4508, 3);
INSERT INTO `sys_citys` VALUES (973480327513249647, 450881, '桂平市', 45, 4508, 3);
INSERT INTO `sys_citys` VALUES (973480327513249648, 450902, '玉州区', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249649, 450903, '福绵区', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249650, 450921, '容县', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249651, 450922, '陆川县', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249652, 450923, '博白县', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249653, 450924, '兴业县', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249654, 450981, '北流市', 45, 4509, 3);
INSERT INTO `sys_citys` VALUES (973480327513249655, 451002, '右江区', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249656, 451021, '田阳县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249657, 451022, '田东县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249658, 451023, '平果县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249659, 451024, '德保县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249660, 451026, '那坡县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249661, 451027, '凌云县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249662, 451028, '乐业县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249663, 451029, '田林县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249664, 451030, '西林县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249665, 451031, '隆林各族自治县', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249666, 451081, '靖西市', 45, 4510, 3);
INSERT INTO `sys_citys` VALUES (973480327513249667, 451102, '八步区', 45, 4511, 3);
INSERT INTO `sys_citys` VALUES (973480327513249668, 451103, '平桂区', 45, 4511, 3);
INSERT INTO `sys_citys` VALUES (973480327513249669, 451121, '昭平县', 45, 4511, 3);
INSERT INTO `sys_citys` VALUES (973480327513249670, 451122, '钟山县', 45, 4511, 3);
INSERT INTO `sys_citys` VALUES (973480327513249671, 451123, '富川瑶族自治县', 45, 4511, 3);
INSERT INTO `sys_citys` VALUES (973480327513249672, 451202, '金城江区', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249673, 451221, '南丹县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249674, 451222, '天峨县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249675, 451223, '凤山县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249676, 451224, '东兰县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249677, 451225, '罗城仫佬族自治县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249678, 451226, '环江毛南族自治县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249679, 451227, '巴马瑶族自治县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249680, 451228, '都安瑶族自治县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249681, 451229, '大化瑶族自治县', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249682, 451281, '宜州市', 45, 4512, 3);
INSERT INTO `sys_citys` VALUES (973480327513249683, 451302, '兴宾区', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249684, 451321, '忻城县', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249685, 451322, '象州县', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249686, 451323, '武宣县', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249687, 451324, '金秀瑶族自治县', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249688, 451381, '合山市', 45, 4513, 3);
INSERT INTO `sys_citys` VALUES (973480327513249689, 451402, '江州区', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249690, 451421, '扶绥县', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249691, 451422, '宁明县', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249692, 451423, '龙州县', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249693, 451424, '大新县', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249694, 451425, '天等县', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249695, 451481, '凭祥市', 45, 4514, 3);
INSERT INTO `sys_citys` VALUES (973480327513249696, 460105, '秀英区', 46, 4601, 3);
INSERT INTO `sys_citys` VALUES (973480327513249697, 460106, '龙华区', 46, 4601, 3);
INSERT INTO `sys_citys` VALUES (973480327513249698, 460107, '琼山区', 46, 4601, 3);
INSERT INTO `sys_citys` VALUES (973480327513249699, 460108, '美兰区', 46, 4601, 3);
INSERT INTO `sys_citys` VALUES (973480327513249700, 460201, '市辖区', 46, 4602, 3);
INSERT INTO `sys_citys` VALUES (973480327513249701, 460202, '海棠区', 46, 4602, 3);
INSERT INTO `sys_citys` VALUES (973480327513249702, 460203, '吉阳区', 46, 4602, 3);
INSERT INTO `sys_citys` VALUES (973480327513249703, 460204, '天涯区', 46, 4602, 3);
INSERT INTO `sys_citys` VALUES (973480327513249704, 460205, '崖州区', 46, 4602, 3);
INSERT INTO `sys_citys` VALUES (973480327513249705, 460321, '西沙群岛', 46, 4603, 3);
INSERT INTO `sys_citys` VALUES (973480327513249706, 460322, '南沙群岛', 46, 4603, 3);
INSERT INTO `sys_citys` VALUES (973480327513249707, 460323, '中沙群岛的岛礁及其海域', 46, 4603, 3);
INSERT INTO `sys_citys` VALUES (973480327513249708, 469001, '五指山市', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249709, 469002, '琼海市', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249710, 469005, '文昌市', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249711, 469006, '万宁市', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249712, 469007, '东方市', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249713, 469021, '定安县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249714, 469022, '屯昌县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249715, 469023, '澄迈县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249716, 469024, '临高县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249717, 469025, '白沙黎族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249718, 469026, '昌江黎族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249719, 469027, '乐东黎族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249720, 469028, '陵水黎族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249721, 469029, '保亭黎族苗族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249722, 469030, '琼中黎族苗族自治县', 46, 4690, 3);
INSERT INTO `sys_citys` VALUES (973480327513249723, 500101, '万州区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249724, 500102, '涪陵区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249725, 500103, '渝中区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249726, 500104, '大渡口区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249727, 500105, '江北区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249728, 500106, '沙坪坝区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249729, 500107, '九龙坡区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249730, 500108, '南岸区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249731, 500109, '北碚区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249732, 500110, '綦江区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249733, 500111, '大足区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249734, 500112, '渝北区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249735, 500113, '巴南区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249736, 500114, '黔江区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249737, 500115, '长寿区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249738, 500116, '江津区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249739, 500117, '合川区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249740, 500118, '永川区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249741, 500119, '南川区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249742, 500120, '璧山区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249743, 500151, '铜梁区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249744, 500152, '潼南区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249745, 500153, '荣昌区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249746, 500154, '开州区', 50, 5001, 3);
INSERT INTO `sys_citys` VALUES (973480327513249747, 500228, '梁平县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249748, 500229, '城口县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249749, 500230, '丰都县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249750, 500231, '垫江县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249751, 500232, '武隆县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249752, 500233, '忠县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249753, 500235, '云阳县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249754, 500236, '奉节县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249755, 500237, '巫山县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249756, 500238, '巫溪县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249757, 500240, '石柱土家族自治县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249758, 500241, '秀山土家族苗族自治县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249759, 500242, '酉阳土家族苗族自治县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249760, 500243, '彭水苗族土家族自治县', 50, 5002, 3);
INSERT INTO `sys_citys` VALUES (973480327513249761, 510104, '锦江区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249762, 510105, '青羊区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249763, 510106, '金牛区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249764, 510107, '武侯区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249765, 510108, '成华区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249766, 510112, '龙泉驿区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249767, 510113, '青白江区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249768, 510114, '新都区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249769, 510115, '温江区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249770, 510116, '双流区', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249771, 510121, '金堂县', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249772, 510124, '郫县', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249773, 510129, '大邑县', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249774, 510131, '蒲江县', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249775, 510132, '新津县', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249776, 510181, '都江堰市', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249777, 510182, '彭州市', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249778, 510183, '邛崃市', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249779, 510184, '崇州市', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249780, 510185, '简阳市', 51, 5101, 3);
INSERT INTO `sys_citys` VALUES (973480327513249781, 510302, '自流井区', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249782, 510303, '贡井区', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249783, 510304, '大安区', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249784, 510311, '沿滩区', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249785, 510321, '荣县', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249786, 510322, '富顺县', 51, 5103, 3);
INSERT INTO `sys_citys` VALUES (973480327513249787, 510402, '东区', 51, 5104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249788, 510403, '西区', 51, 5104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249789, 510411, '仁和区', 51, 5104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249790, 510421, '米易县', 51, 5104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249791, 510422, '盐边县', 51, 5104, 3);
INSERT INTO `sys_citys` VALUES (973480327513249792, 510502, '江阳区', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249793, 510503, '纳溪区', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249794, 510504, '龙马潭区', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249795, 510521, '泸县', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249796, 510522, '合江县', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249797, 510524, '叙永县', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249798, 510525, '古蔺县', 51, 5105, 3);
INSERT INTO `sys_citys` VALUES (973480327513249799, 510603, '旌阳区', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249800, 510623, '中江县', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249801, 510626, '罗江县', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249802, 510681, '广汉市', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249803, 510682, '什邡市', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249804, 510683, '绵竹市', 51, 5106, 3);
INSERT INTO `sys_citys` VALUES (973480327513249805, 510703, '涪城区', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249806, 510704, '游仙区', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249807, 510705, '安州区', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249808, 510722, '三台县', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249809, 510723, '盐亭县', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249810, 510725, '梓潼县', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249811, 510726, '北川羌族自治县', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249812, 510727, '平武县', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249813, 510781, '江油市', 51, 5107, 3);
INSERT INTO `sys_citys` VALUES (973480327513249814, 510802, '利州区', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249815, 510811, '昭化区', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249816, 510812, '朝天区', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249817, 510821, '旺苍县', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249818, 510822, '青川县', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249819, 510823, '剑阁县', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249820, 510824, '苍溪县', 51, 5108, 3);
INSERT INTO `sys_citys` VALUES (973480327513249821, 510903, '船山区', 51, 5109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249822, 510904, '安居区', 51, 5109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249823, 510921, '蓬溪县', 51, 5109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249824, 510922, '射洪县', 51, 5109, 3);
INSERT INTO `sys_citys` VALUES (973480327513249825, 510923, '大英县', 51, 5109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442048, 511002, '市中区', 51, 5110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442049, 511011, '东兴区', 51, 5110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442050, 511024, '威远县', 51, 5110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442051, 511025, '资中县', 51, 5110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442052, 511028, '隆昌县', 51, 5110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442053, 511102, '市中区', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442054, 511111, '沙湾区', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442055, 511112, '五通桥区', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442056, 511113, '金口河区', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442057, 511123, '犍为县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442058, 511124, '井研县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442059, 511126, '夹江县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442060, 511129, '沐川县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442061, 511132, '峨边彝族自治县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442062, 511133, '马边彝族自治县', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442063, 511181, '峨眉山市', 51, 5111, 3);
INSERT INTO `sys_citys` VALUES (973480327517442064, 511302, '顺庆区', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442065, 511303, '高坪区', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442066, 511304, '嘉陵区', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442067, 511321, '南部县', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442068, 511322, '营山县', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442069, 511323, '蓬安县', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442070, 511324, '仪陇县', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442071, 511325, '西充县', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442072, 511381, '阆中市', 51, 5113, 3);
INSERT INTO `sys_citys` VALUES (973480327517442073, 511402, '东坡区', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442074, 511403, '彭山区', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442075, 511421, '仁寿县', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442076, 511423, '洪雅县', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442077, 511424, '丹棱县', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442078, 511425, '青神县', 51, 5114, 3);
INSERT INTO `sys_citys` VALUES (973480327517442079, 511502, '翠屏区', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442080, 511503, '南溪区', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442081, 511521, '宜宾县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442082, 511523, '江安县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442083, 511524, '长宁县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442084, 511525, '高县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442085, 511526, '珙县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442086, 511527, '筠连县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442087, 511528, '兴文县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442088, 511529, '屏山县', 51, 5115, 3);
INSERT INTO `sys_citys` VALUES (973480327517442089, 511602, '广安区', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442090, 511603, '前锋区', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442091, 511621, '岳池县', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442092, 511622, '武胜县', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442093, 511623, '邻水县', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442094, 511681, '华蓥市', 51, 5116, 3);
INSERT INTO `sys_citys` VALUES (973480327517442095, 511702, '通川区', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442096, 511703, '达川区', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442097, 511722, '宣汉县', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442098, 511723, '开江县', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442099, 511724, '大竹县', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442100, 511725, '渠县', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442101, 511781, '万源市', 51, 5117, 3);
INSERT INTO `sys_citys` VALUES (973480327517442102, 511802, '雨城区', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442103, 511803, '名山区', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442104, 511822, '荥经县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442105, 511823, '汉源县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442106, 511824, '石棉县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442107, 511825, '天全县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442108, 511826, '芦山县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442109, 511827, '宝兴县', 51, 5118, 3);
INSERT INTO `sys_citys` VALUES (973480327517442110, 511902, '巴州区', 51, 5119, 3);
INSERT INTO `sys_citys` VALUES (973480327517442111, 511903, '恩阳区', 51, 5119, 3);
INSERT INTO `sys_citys` VALUES (973480327517442112, 511921, '通江县', 51, 5119, 3);
INSERT INTO `sys_citys` VALUES (973480327517442113, 511922, '南江县', 51, 5119, 3);
INSERT INTO `sys_citys` VALUES (973480327517442114, 511923, '平昌县', 51, 5119, 3);
INSERT INTO `sys_citys` VALUES (973480327517442115, 512002, '雁江区', 51, 5120, 3);
INSERT INTO `sys_citys` VALUES (973480327517442116, 512021, '安岳县', 51, 5120, 3);
INSERT INTO `sys_citys` VALUES (973480327517442117, 512022, '乐至县', 51, 5120, 3);
INSERT INTO `sys_citys` VALUES (973480327517442118, 513201, '马尔康市', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442119, 513221, '汶川县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442120, 513222, '理县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442121, 513223, '茂县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442122, 513224, '松潘县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442123, 513225, '九寨沟县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442124, 513226, '金川县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442125, 513227, '小金县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442126, 513228, '黑水县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442127, 513230, '壤塘县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442128, 513231, '阿坝县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442129, 513232, '若尔盖县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442130, 513233, '红原县', 51, 5132, 3);
INSERT INTO `sys_citys` VALUES (973480327517442131, 513301, '康定市', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442132, 513322, '泸定县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442133, 513323, '丹巴县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442134, 513324, '九龙县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442135, 513325, '雅江县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442136, 513326, '道孚县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442137, 513327, '炉霍县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442138, 513328, '甘孜县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442139, 513329, '新龙县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442140, 513330, '德格县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442141, 513331, '白玉县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442142, 513332, '石渠县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442143, 513333, '色达县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442144, 513334, '理塘县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442145, 513335, '巴塘县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442146, 513336, '乡城县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442147, 513337, '稻城县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442148, 513338, '得荣县', 51, 5133, 3);
INSERT INTO `sys_citys` VALUES (973480327517442149, 513401, '西昌市', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442150, 513422, '木里藏族自治县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442151, 513423, '盐源县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442152, 513424, '德昌县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442153, 513425, '会理县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442154, 513426, '会东县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442155, 513427, '宁南县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442156, 513428, '普格县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442157, 513429, '布拖县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442158, 513430, '金阳县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442159, 513431, '昭觉县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442160, 513432, '喜德县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442161, 513433, '冕宁县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442162, 513434, '越西县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442163, 513435, '甘洛县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442164, 513436, '美姑县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442165, 513437, '雷波县', 51, 5134, 3);
INSERT INTO `sys_citys` VALUES (973480327517442166, 520102, '南明区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442167, 520103, '云岩区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442168, 520111, '花溪区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442169, 520112, '乌当区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442170, 520113, '白云区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442171, 520115, '观山湖区', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442172, 520121, '开阳县', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442173, 520122, '息烽县', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442174, 520123, '修文县', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442175, 520181, '清镇市', 52, 5201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442176, 520201, '钟山区', 52, 5202, 3);
INSERT INTO `sys_citys` VALUES (973480327517442177, 520203, '六枝特区', 52, 5202, 3);
INSERT INTO `sys_citys` VALUES (973480327517442178, 520221, '水城县', 52, 5202, 3);
INSERT INTO `sys_citys` VALUES (973480327517442179, 520222, '盘县', 52, 5202, 3);
INSERT INTO `sys_citys` VALUES (973480327517442180, 520302, '红花岗区', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442181, 520303, '汇川区', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442182, 520304, '播州区', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442183, 520322, '桐梓县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442184, 520323, '绥阳县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442185, 520324, '正安县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442186, 520325, '道真仡佬族苗族自治县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442187, 520326, '务川仡佬族苗族自治县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442188, 520327, '凤冈县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442189, 520328, '湄潭县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442190, 520329, '余庆县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442191, 520330, '习水县', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442192, 520381, '赤水市', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442193, 520382, '仁怀市', 52, 5203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442194, 520402, '西秀区', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442195, 520403, '平坝区', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442196, 520422, '普定县', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442197, 520423, '镇宁布依族苗族自治县', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442198, 520424, '关岭布依族苗族自治县', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442199, 520425, '紫云苗族布依族自治县', 52, 5204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442200, 520502, '七星关区', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442201, 520521, '大方县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442202, 520522, '黔西县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442203, 520523, '金沙县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442204, 520524, '织金县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442205, 520525, '纳雍县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442206, 520526, '威宁彝族回族苗族自治县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442207, 520527, '赫章县', 52, 5205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442208, 520602, '碧江区', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442209, 520603, '万山区', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442210, 520621, '江口县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442211, 520622, '玉屏侗族自治县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442212, 520623, '石阡县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442213, 520624, '思南县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442214, 520625, '印江土家族苗族自治县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442215, 520626, '德江县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442216, 520627, '沿河土家族自治县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442217, 520628, '松桃苗族自治县', 52, 5206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442218, 522301, '兴义市', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442219, 522322, '兴仁县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442220, 522323, '普安县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442221, 522324, '晴隆县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442222, 522325, '贞丰县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442223, 522326, '望谟县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442224, 522327, '册亨县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442225, 522328, '安龙县', 52, 5223, 3);
INSERT INTO `sys_citys` VALUES (973480327517442226, 522601, '凯里市', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442227, 522622, '黄平县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442228, 522623, '施秉县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442229, 522624, '三穗县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442230, 522625, '镇远县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442231, 522626, '岑巩县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442232, 522627, '天柱县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442233, 522628, '锦屏县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442234, 522629, '剑河县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442235, 522630, '台江县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442236, 522631, '黎平县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442237, 522632, '榕江县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442238, 522633, '从江县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442239, 522634, '雷山县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442240, 522635, '麻江县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442241, 522636, '丹寨县', 52, 5226, 3);
INSERT INTO `sys_citys` VALUES (973480327517442242, 522701, '都匀市', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442243, 522702, '福泉市', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442244, 522722, '荔波县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442245, 522723, '贵定县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442246, 522725, '瓮安县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442247, 522726, '独山县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442248, 522727, '平塘县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442249, 522728, '罗甸县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442250, 522729, '长顺县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442251, 522730, '龙里县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442252, 522731, '惠水县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442253, 522732, '三都水族自治县', 52, 5227, 3);
INSERT INTO `sys_citys` VALUES (973480327517442254, 530102, '五华区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442255, 530103, '盘龙区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442256, 530111, '官渡区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442257, 530112, '西山区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442258, 530113, '东川区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442259, 530114, '呈贡区', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442260, 530122, '晋宁县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442261, 530124, '富民县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442262, 530125, '宜良县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442263, 530126, '石林彝族自治县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442264, 530127, '嵩明县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442265, 530128, '禄劝彝族苗族自治县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442266, 530129, '寻甸回族彝族自治县', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442267, 530181, '安宁市', 53, 5301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442268, 530302, '麒麟区', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442269, 530303, '沾益区', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442270, 530321, '马龙县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442271, 530322, '陆良县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442272, 530323, '师宗县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442273, 530324, '罗平县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442274, 530325, '富源县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442275, 530326, '会泽县', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442276, 530381, '宣威市', 53, 5303, 3);
INSERT INTO `sys_citys` VALUES (973480327517442277, 530402, '红塔区', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442278, 530403, '江川区', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442279, 530422, '澄江县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442280, 530423, '通海县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442281, 530424, '华宁县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442282, 530425, '易门县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442283, 530426, '峨山彝族自治县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442284, 530427, '新平彝族傣族自治县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442285, 530428, '元江哈尼族彝族傣族自治县', 53, 5304, 3);
INSERT INTO `sys_citys` VALUES (973480327517442286, 530502, '隆阳区', 53, 5305, 3);
INSERT INTO `sys_citys` VALUES (973480327517442287, 530521, '施甸县', 53, 5305, 3);
INSERT INTO `sys_citys` VALUES (973480327517442288, 530523, '龙陵县', 53, 5305, 3);
INSERT INTO `sys_citys` VALUES (973480327517442289, 530524, '昌宁县', 53, 5305, 3);
INSERT INTO `sys_citys` VALUES (973480327517442290, 530581, '腾冲市', 53, 5305, 3);
INSERT INTO `sys_citys` VALUES (973480327517442291, 530602, '昭阳区', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442292, 530621, '鲁甸县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442293, 530622, '巧家县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442294, 530623, '盐津县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442295, 530624, '大关县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442296, 530625, '永善县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442297, 530626, '绥江县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442298, 530627, '镇雄县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442299, 530628, '彝良县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442300, 530629, '威信县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442301, 530630, '水富县', 53, 5306, 3);
INSERT INTO `sys_citys` VALUES (973480327517442302, 530702, '古城区', 53, 5307, 3);
INSERT INTO `sys_citys` VALUES (973480327517442303, 530721, '玉龙纳西族自治县', 53, 5307, 3);
INSERT INTO `sys_citys` VALUES (973480327517442304, 530722, '永胜县', 53, 5307, 3);
INSERT INTO `sys_citys` VALUES (973480327517442305, 530723, '华坪县', 53, 5307, 3);
INSERT INTO `sys_citys` VALUES (973480327517442306, 530724, '宁蒗彝族自治县', 53, 5307, 3);
INSERT INTO `sys_citys` VALUES (973480327517442307, 530802, '思茅区', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442308, 530821, '宁洱哈尼族彝族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442309, 530822, '墨江哈尼族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442310, 530823, '景东彝族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442311, 530824, '景谷傣族彝族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442312, 530825, '镇沅彝族哈尼族拉祜族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442313, 530826, '江城哈尼族彝族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442314, 530827, '孟连傣族拉祜族佤族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442315, 530828, '澜沧拉祜族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442316, 530829, '西盟佤族自治县', 53, 5308, 3);
INSERT INTO `sys_citys` VALUES (973480327517442317, 530902, '临翔区', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442318, 530921, '凤庆县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442319, 530922, '云县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442320, 530923, '永德县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442321, 530924, '镇康县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442322, 530925, '双江拉祜族佤族布朗族傣族自治县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442323, 530926, '耿马傣族佤族自治县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442324, 530927, '沧源佤族自治县', 53, 5309, 3);
INSERT INTO `sys_citys` VALUES (973480327517442325, 532301, '楚雄市', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442326, 532322, '双柏县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442327, 532323, '牟定县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442328, 532324, '南华县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442329, 532325, '姚安县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442330, 532326, '大姚县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442331, 532327, '永仁县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442332, 532328, '元谋县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442333, 532329, '武定县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442334, 532331, '禄丰县', 53, 5323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442335, 532501, '个旧市', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442336, 532502, '开远市', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442337, 532503, '蒙自市', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442338, 532504, '弥勒市', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442339, 532523, '屏边苗族自治县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442340, 532524, '建水县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442341, 532525, '石屏县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442342, 532527, '泸西县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442343, 532528, '元阳县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442344, 532529, '红河县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442345, 532530, '金平苗族瑶族傣族自治县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442346, 532531, '绿春县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442347, 532532, '河口瑶族自治县', 53, 5325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442348, 532601, '文山市', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442349, 532622, '砚山县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442350, 532623, '西畴县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442351, 532624, '麻栗坡县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442352, 532625, '马关县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442353, 532626, '丘北县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442354, 532627, '广南县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442355, 532628, '富宁县', 53, 5326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442356, 532801, '景洪市', 53, 5328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442357, 532822, '勐海县', 53, 5328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442358, 532823, '勐腊县', 53, 5328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442359, 532901, '大理市', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442360, 532922, '漾濞彝族自治县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442361, 532923, '祥云县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442362, 532924, '宾川县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442363, 532925, '弥渡县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442364, 532926, '南涧彝族自治县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442365, 532927, '巍山彝族回族自治县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442366, 532928, '永平县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442367, 532929, '云龙县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442368, 532930, '洱源县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442369, 532931, '剑川县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442370, 532932, '鹤庆县', 53, 5329, 3);
INSERT INTO `sys_citys` VALUES (973480327517442371, 533102, '瑞丽市', 53, 5331, 3);
INSERT INTO `sys_citys` VALUES (973480327517442372, 533103, '芒市', 53, 5331, 3);
INSERT INTO `sys_citys` VALUES (973480327517442373, 533122, '梁河县', 53, 5331, 3);
INSERT INTO `sys_citys` VALUES (973480327517442374, 533123, '盈江县', 53, 5331, 3);
INSERT INTO `sys_citys` VALUES (973480327517442375, 533124, '陇川县', 53, 5331, 3);
INSERT INTO `sys_citys` VALUES (973480327517442376, 533301, '泸水市', 53, 5333, 3);
INSERT INTO `sys_citys` VALUES (973480327517442377, 533323, '福贡县', 53, 5333, 3);
INSERT INTO `sys_citys` VALUES (973480327517442378, 533324, '贡山独龙族怒族自治县', 53, 5333, 3);
INSERT INTO `sys_citys` VALUES (973480327517442379, 533325, '兰坪白族普米族自治县', 53, 5333, 3);
INSERT INTO `sys_citys` VALUES (973480327517442380, 533401, '香格里拉市', 53, 5334, 3);
INSERT INTO `sys_citys` VALUES (973480327517442381, 533422, '德钦县', 53, 5334, 3);
INSERT INTO `sys_citys` VALUES (973480327517442382, 533423, '维西傈僳族自治县', 53, 5334, 3);
INSERT INTO `sys_citys` VALUES (973480327517442383, 540102, '城关区', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442384, 540103, '堆龙德庆区', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442385, 540121, '林周县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442386, 540122, '当雄县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442387, 540123, '尼木县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442388, 540124, '曲水县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442389, 540126, '达孜县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442390, 540127, '墨竹工卡县', 54, 5401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442391, 540202, '桑珠孜区', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442392, 540221, '南木林县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442393, 540222, '江孜县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442394, 540223, '定日县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442395, 540224, '萨迦县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442396, 540225, '拉孜县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442397, 540226, '昂仁县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442398, 540227, '谢通门县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442399, 540228, '白朗县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442400, 540229, '仁布县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442401, 540230, '康马县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442402, 540231, '定结县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442403, 540232, '仲巴县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442404, 540233, '亚东县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442405, 540234, '吉隆县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442406, 540235, '聂拉木县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442407, 540236, '萨嘎县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442408, 540237, '岗巴县', 54, 5402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442409, 540302, '卡若区', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442410, 540321, '江达县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442411, 540322, '贡觉县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442412, 540323, '类乌齐县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442413, 540324, '丁青县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442414, 540325, '察雅县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442415, 540326, '八宿县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442416, 540327, '左贡县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442417, 540328, '芒康县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442418, 540329, '洛隆县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442419, 540330, '边坝县', 54, 5403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442420, 540402, '巴宜区', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442421, 540421, '工布江达县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442422, 540422, '米林县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442423, 540423, '墨脱县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442424, 540424, '波密县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442425, 540425, '察隅县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442426, 540426, '朗县', 54, 5404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442427, 540502, '乃东区', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442428, 540521, '扎囊县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442429, 540522, '贡嘎县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442430, 540523, '桑日县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442431, 540524, '琼结县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442432, 540525, '曲松县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442433, 540526, '措美县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442434, 540527, '洛扎县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442435, 540528, '加查县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442436, 540529, '隆子县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442437, 540530, '错那县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442438, 540531, '浪卡子县', 54, 5405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442439, 542421, '那曲县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442440, 542422, '嘉黎县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442441, 542423, '比如县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442442, 542424, '聂荣县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442443, 542425, '安多县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442444, 542426, '申扎县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442445, 542427, '索县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442446, 542428, '班戈县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442447, 542429, '巴青县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442448, 542430, '尼玛县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442449, 542431, '双湖县', 54, 5424, 3);
INSERT INTO `sys_citys` VALUES (973480327517442450, 542521, '普兰县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442451, 542522, '札达县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442452, 542523, '噶尔县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442453, 542524, '日土县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442454, 542525, '革吉县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442455, 542526, '改则县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442456, 542527, '措勤县', 54, 5425, 3);
INSERT INTO `sys_citys` VALUES (973480327517442457, 610102, '新城区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442458, 610103, '碑林区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442459, 610104, '莲湖区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442460, 610111, '灞桥区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442461, 610112, '未央区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442462, 610113, '雁塔区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442463, 610114, '阎良区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442464, 610115, '临潼区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442465, 610116, '长安区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442466, 610117, '高陵区', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442467, 610122, '蓝田县', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442468, 610124, '周至县', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442469, 610125, '户县', 61, 6101, 3);
INSERT INTO `sys_citys` VALUES (973480327517442470, 610202, '王益区', 61, 6102, 3);
INSERT INTO `sys_citys` VALUES (973480327517442471, 610203, '印台区', 61, 6102, 3);
INSERT INTO `sys_citys` VALUES (973480327517442472, 610204, '耀州区', 61, 6102, 3);
INSERT INTO `sys_citys` VALUES (973480327517442473, 610222, '宜君县', 61, 6102, 3);
INSERT INTO `sys_citys` VALUES (973480327517442474, 610302, '渭滨区', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442475, 610303, '金台区', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442476, 610304, '陈仓区', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442477, 610322, '凤翔县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442478, 610323, '岐山县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442479, 610324, '扶风县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442480, 610326, '眉县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442481, 610327, '陇县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442482, 610328, '千阳县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442483, 610329, '麟游县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442484, 610330, '凤县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442485, 610331, '太白县', 61, 6103, 3);
INSERT INTO `sys_citys` VALUES (973480327517442486, 610402, '秦都区', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442487, 610403, '杨陵区', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442488, 610404, '渭城区', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442489, 610422, '三原县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442490, 610423, '泾阳县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442491, 610424, '乾县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442492, 610425, '礼泉县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442493, 610426, '永寿县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442494, 610427, '彬县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442495, 610428, '长武县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442496, 610429, '旬邑县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442497, 610430, '淳化县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442498, 610431, '武功县', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442499, 610481, '兴平市', 61, 6104, 3);
INSERT INTO `sys_citys` VALUES (973480327517442500, 610502, '临渭区', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442501, 610503, '华州区', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442502, 610522, '潼关县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442503, 610523, '大荔县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442504, 610524, '合阳县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442505, 610525, '澄城县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442506, 610526, '蒲城县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442507, 610527, '白水县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442508, 610528, '富平县', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442509, 610581, '韩城市', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442510, 610582, '华阴市', 61, 6105, 3);
INSERT INTO `sys_citys` VALUES (973480327517442511, 610602, '宝塔区', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442512, 610603, '安塞区', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442513, 610621, '延长县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442514, 610622, '延川县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442515, 610623, '子长县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442516, 610625, '志丹县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442517, 610626, '吴起县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442518, 610627, '甘泉县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442519, 610628, '富县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442520, 610629, '洛川县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442521, 610630, '宜川县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442522, 610631, '黄龙县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442523, 610632, '黄陵县', 61, 6106, 3);
INSERT INTO `sys_citys` VALUES (973480327517442524, 610702, '汉台区', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442525, 610721, '南郑县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442526, 610722, '城固县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442527, 610723, '洋县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442528, 610724, '西乡县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442529, 610725, '勉县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442530, 610726, '宁强县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442531, 610727, '略阳县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442532, 610728, '镇巴县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442533, 610729, '留坝县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442534, 610730, '佛坪县', 61, 6107, 3);
INSERT INTO `sys_citys` VALUES (973480327517442535, 610802, '榆阳区', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442536, 610803, '横山区', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442537, 610821, '神木县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442538, 610822, '府谷县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442539, 610824, '靖边县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442540, 610825, '定边县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442541, 610826, '绥德县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442542, 610827, '米脂县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442543, 610828, '佳县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442544, 610829, '吴堡县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442545, 610830, '清涧县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442546, 610831, '子洲县', 61, 6108, 3);
INSERT INTO `sys_citys` VALUES (973480327517442547, 610902, '汉滨区', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442548, 610921, '汉阴县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442549, 610922, '石泉县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442550, 610923, '宁陕县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442551, 610924, '紫阳县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442552, 610925, '岚皋县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442553, 610926, '平利县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442554, 610927, '镇坪县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442555, 610928, '旬阳县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442556, 610929, '白河县', 61, 6109, 3);
INSERT INTO `sys_citys` VALUES (973480327517442557, 611002, '商州区', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442558, 611021, '洛南县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442559, 611022, '丹凤县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442560, 611023, '商南县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442561, 611024, '山阳县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442562, 611025, '镇安县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442563, 611026, '柞水县', 61, 6110, 3);
INSERT INTO `sys_citys` VALUES (973480327517442564, 620102, '城关区', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442565, 620103, '七里河区', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442566, 620104, '西固区', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442567, 620105, '安宁区', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442568, 620111, '红古区', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442569, 620121, '永登县', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442570, 620122, '皋兰县', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442571, 620123, '榆中县', 62, 6201, 3);
INSERT INTO `sys_citys` VALUES (973480327517442572, 620201, '嘉峪关市', 62, 6202, 3);
INSERT INTO `sys_citys` VALUES (973480327517442573, 620302, '金川区', 62, 6203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442574, 620321, '永昌县', 62, 6203, 3);
INSERT INTO `sys_citys` VALUES (973480327517442575, 620402, '白银区', 62, 6204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442576, 620403, '平川区', 62, 6204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442577, 620421, '靖远县', 62, 6204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442578, 620422, '会宁县', 62, 6204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442579, 620423, '景泰县', 62, 6204, 3);
INSERT INTO `sys_citys` VALUES (973480327517442580, 620502, '秦州区', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442581, 620503, '麦积区', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442582, 620521, '清水县', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442583, 620522, '秦安县', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442584, 620523, '甘谷县', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442585, 620524, '武山县', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442586, 620525, '张家川回族自治县', 62, 6205, 3);
INSERT INTO `sys_citys` VALUES (973480327517442587, 620602, '凉州区', 62, 6206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442588, 620621, '民勤县', 62, 6206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442589, 620622, '古浪县', 62, 6206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442590, 620623, '天祝藏族自治县', 62, 6206, 3);
INSERT INTO `sys_citys` VALUES (973480327517442591, 620702, '甘州区', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442592, 620721, '肃南裕固族自治县', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442593, 620722, '民乐县', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442594, 620723, '临泽县', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442595, 620724, '高台县', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442596, 620725, '山丹县', 62, 6207, 3);
INSERT INTO `sys_citys` VALUES (973480327517442597, 620802, '崆峒区', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442598, 620821, '泾川县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442599, 620822, '灵台县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442600, 620823, '崇信县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442601, 620824, '华亭县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442602, 620825, '庄浪县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442603, 620826, '静宁县', 62, 6208, 3);
INSERT INTO `sys_citys` VALUES (973480327517442604, 620902, '肃州区', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442605, 620921, '金塔县', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442606, 620922, '瓜州县', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442607, 620923, '肃北蒙古族自治县', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442608, 620924, '阿克塞哈萨克族自治县', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442609, 620981, '玉门市', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442610, 620982, '敦煌市', 62, 6209, 3);
INSERT INTO `sys_citys` VALUES (973480327517442611, 621002, '西峰区', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442612, 621021, '庆城县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442613, 621022, '环县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442614, 621023, '华池县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442615, 621024, '合水县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442616, 621025, '正宁县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442617, 621026, '宁县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442618, 621027, '镇原县', 62, 6210, 3);
INSERT INTO `sys_citys` VALUES (973480327517442619, 621102, '安定区', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442620, 621121, '通渭县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442621, 621122, '陇西县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442622, 621123, '渭源县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442623, 621124, '临洮县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442624, 621125, '漳县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442625, 621126, '岷县', 62, 6211, 3);
INSERT INTO `sys_citys` VALUES (973480327517442626, 621202, '武都区', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442627, 621221, '成县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442628, 621222, '文县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442629, 621223, '宕昌县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442630, 621224, '康县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442631, 621225, '西和县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442632, 621226, '礼县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442633, 621227, '徽县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442634, 621228, '两当县', 62, 6212, 3);
INSERT INTO `sys_citys` VALUES (973480327517442635, 622901, '临夏市', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442636, 622921, '临夏县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442637, 622922, '康乐县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442638, 622923, '永靖县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442639, 622924, '广河县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442640, 622925, '和政县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442641, 622926, '东乡族自治县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442642, 622927, '积石山保安族东乡族撒拉族自治县', 62, 6229, 3);
INSERT INTO `sys_citys` VALUES (973480327517442643, 623001, '合作市', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442644, 623021, '临潭县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442645, 623022, '卓尼县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442646, 623023, '舟曲县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442647, 623024, '迭部县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442648, 623025, '玛曲县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442649, 623026, '碌曲县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442650, 623027, '夏河县', 62, 6230, 3);
INSERT INTO `sys_citys` VALUES (973480327517442651, 630102, '城东区', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442652, 630103, '城中区', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442653, 630104, '城西区', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442654, 630105, '城北区', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442655, 630121, '大通回族土族自治县', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442656, 630122, '湟中县', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442657, 630123, '湟源县', 63, 6301, 3);
INSERT INTO `sys_citys` VALUES (973480327517442658, 630202, '乐都区', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442659, 630203, '平安区', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442660, 630222, '民和回族土族自治县', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442661, 630223, '互助土族自治县', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442662, 630224, '化隆回族自治县', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442663, 630225, '循化撒拉族自治县', 63, 6302, 3);
INSERT INTO `sys_citys` VALUES (973480327517442664, 632221, '门源回族自治县', 63, 6322, 3);
INSERT INTO `sys_citys` VALUES (973480327517442665, 632222, '祁连县', 63, 6322, 3);
INSERT INTO `sys_citys` VALUES (973480327517442666, 632223, '海晏县', 63, 6322, 3);
INSERT INTO `sys_citys` VALUES (973480327517442667, 632224, '刚察县', 63, 6322, 3);
INSERT INTO `sys_citys` VALUES (973480327517442668, 632321, '同仁县', 63, 6323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442669, 632322, '尖扎县', 63, 6323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442670, 632323, '泽库县', 63, 6323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442671, 632324, '河南蒙古族自治县', 63, 6323, 3);
INSERT INTO `sys_citys` VALUES (973480327517442672, 632521, '共和县', 63, 6325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442673, 632522, '同德县', 63, 6325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442674, 632523, '贵德县', 63, 6325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442675, 632524, '兴海县', 63, 6325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442676, 632525, '贵南县', 63, 6325, 3);
INSERT INTO `sys_citys` VALUES (973480327517442677, 632621, '玛沁县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442678, 632622, '班玛县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442679, 632623, '甘德县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442680, 632624, '达日县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442681, 632625, '久治县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442682, 632626, '玛多县', 63, 6326, 3);
INSERT INTO `sys_citys` VALUES (973480327517442683, 632701, '玉树市', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442684, 632722, '杂多县', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442685, 632723, '称多县', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442686, 632724, '治多县', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442687, 632725, '囊谦县', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442688, 632726, '曲麻莱县', 63, 6327, 3);
INSERT INTO `sys_citys` VALUES (973480327517442689, 632801, '格尔木市', 63, 6328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442690, 632802, '德令哈市', 63, 6328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442691, 632821, '乌兰县', 63, 6328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442692, 632822, '都兰县', 63, 6328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442693, 632823, '天峻县', 63, 6328, 3);
INSERT INTO `sys_citys` VALUES (973480327517442694, 640104, '兴庆区', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442695, 640105, '西夏区', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442696, 640106, '金凤区', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442697, 640121, '永宁县', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442698, 640122, '贺兰县', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442699, 640181, '灵武市', 64, 6401, 3);
INSERT INTO `sys_citys` VALUES (973480327517442700, 640202, '大武口区', 64, 6402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442701, 640205, '惠农区', 64, 6402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442702, 640221, '平罗县', 64, 6402, 3);
INSERT INTO `sys_citys` VALUES (973480327517442703, 640302, '利通区', 64, 6403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442704, 640303, '红寺堡区', 64, 6403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442705, 640323, '盐池县', 64, 6403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442706, 640324, '同心县', 64, 6403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442707, 640381, '青铜峡市', 64, 6403, 3);
INSERT INTO `sys_citys` VALUES (973480327517442708, 640402, '原州区', 64, 6404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442709, 640422, '西吉县', 64, 6404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442710, 640423, '隆德县', 64, 6404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442711, 640424, '泾源县', 64, 6404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442712, 640425, '彭阳县', 64, 6404, 3);
INSERT INTO `sys_citys` VALUES (973480327517442713, 640502, '沙坡头区', 64, 6405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442714, 640521, '中宁县', 64, 6405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442715, 640522, '海原县', 64, 6405, 3);
INSERT INTO `sys_citys` VALUES (973480327517442716, 650102, '天山区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442717, 650103, '沙依巴克区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442718, 650104, '新市区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442719, 650105, '水磨沟区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442720, 650106, '头屯河区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442721, 650107, '达坂城区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442722, 650109, '米东区', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442723, 650121, '乌鲁木齐县', 65, 6501, 3);
INSERT INTO `sys_citys` VALUES (973480327517442724, 650202, '独山子区', 65, 6502, 3);
INSERT INTO `sys_citys` VALUES (973480327517442725, 650203, '克拉玛依区', 65, 6502, 3);
INSERT INTO `sys_citys` VALUES (973480327517442726, 650204, '白碱滩区', 65, 6502, 3);
INSERT INTO `sys_citys` VALUES (973480327517442727, 650205, '乌尔禾区', 65, 6502, 3);
INSERT INTO `sys_citys` VALUES (973480327517442728, 650402, '高昌区', 65, 6504, 3);
INSERT INTO `sys_citys` VALUES (973480327517442729, 650421, '鄯善县', 65, 6504, 3);
INSERT INTO `sys_citys` VALUES (973480327517442730, 650422, '托克逊县', 65, 6504, 3);
INSERT INTO `sys_citys` VALUES (973480327517442731, 650502, '伊州区', 65, 6505, 3);
INSERT INTO `sys_citys` VALUES (973480327517442732, 650521, '巴里坤哈萨克自治县', 65, 6505, 3);
INSERT INTO `sys_citys` VALUES (973480327517442733, 650522, '伊吾县', 65, 6505, 3);
INSERT INTO `sys_citys` VALUES (973480327517442734, 652301, '昌吉市', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442735, 652302, '阜康市', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442736, 652323, '呼图壁县', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442737, 652324, '玛纳斯县', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442738, 652325, '奇台县', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442739, 652327, '吉木萨尔县', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442740, 652328, '木垒哈萨克自治县', 65, 6523, 3);
INSERT INTO `sys_citys` VALUES (973480327517442741, 652701, '博乐市', 65, 6527, 3);
INSERT INTO `sys_citys` VALUES (973480327517442742, 652702, '阿拉山口市', 65, 6527, 3);
INSERT INTO `sys_citys` VALUES (973480327517442743, 652722, '精河县', 65, 6527, 3);
INSERT INTO `sys_citys` VALUES (973480327517442744, 652723, '温泉县', 65, 6527, 3);
INSERT INTO `sys_citys` VALUES (973480327517442745, 652801, '库尔勒市', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442746, 652822, '轮台县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442747, 652823, '尉犁县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442748, 652824, '若羌县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442749, 652825, '且末县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442750, 652826, '焉耆回族自治县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442751, 652827, '和静县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442752, 652828, '和硕县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442753, 652829, '博湖县', 65, 6528, 3);
INSERT INTO `sys_citys` VALUES (973480327517442754, 652901, '阿克苏市', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442755, 652922, '温宿县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442756, 652923, '库车县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442757, 652924, '沙雅县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442758, 652925, '新和县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442759, 652926, '拜城县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442760, 652927, '乌什县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442761, 652928, '阿瓦提县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442762, 652929, '柯坪县', 65, 6529, 3);
INSERT INTO `sys_citys` VALUES (973480327517442763, 653001, '阿图什市', 65, 6530, 3);
INSERT INTO `sys_citys` VALUES (973480327517442764, 653022, '阿克陶县', 65, 6530, 3);
INSERT INTO `sys_citys` VALUES (973480327517442765, 653023, '阿合奇县', 65, 6530, 3);
INSERT INTO `sys_citys` VALUES (973480327517442766, 653024, '乌恰县', 65, 6530, 3);
INSERT INTO `sys_citys` VALUES (973480327517442767, 653101, '喀什市', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442768, 653121, '疏附县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442769, 653122, '疏勒县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442770, 653123, '英吉沙县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442771, 653124, '泽普县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442772, 653125, '莎车县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442773, 653126, '叶城县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442774, 653127, '麦盖提县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442775, 653128, '岳普湖县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442776, 653129, '伽师县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442777, 653130, '巴楚县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442778, 653131, '塔什库尔干塔吉克自治县', 65, 6531, 3);
INSERT INTO `sys_citys` VALUES (973480327517442779, 653201, '和田市', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442780, 653221, '和田县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442781, 653222, '墨玉县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442782, 653223, '皮山县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442783, 653224, '洛浦县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442784, 653225, '策勒县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442785, 653226, '于田县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442786, 653227, '民丰县', 65, 6532, 3);
INSERT INTO `sys_citys` VALUES (973480327517442787, 654002, '伊宁市', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442788, 654003, '奎屯市', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442789, 654004, '霍尔果斯市', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442790, 654021, '伊宁县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442791, 654022, '察布查尔锡伯自治县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442792, 654023, '霍城县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442793, 654024, '巩留县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442794, 654025, '新源县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442795, 654026, '昭苏县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442796, 654027, '特克斯县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442797, 654028, '尼勒克县', 65, 6540, 3);
INSERT INTO `sys_citys` VALUES (973480327517442798, 654201, '塔城市', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442799, 654202, '乌苏市', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442800, 654221, '额敏县', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442801, 654223, '沙湾县', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442802, 654224, '托里县', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442803, 654225, '裕民县', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442804, 654226, '和布克赛尔蒙古自治县', 65, 6542, 3);
INSERT INTO `sys_citys` VALUES (973480327517442805, 654301, '阿勒泰市', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442806, 654321, '布尔津县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442807, 654322, '富蕴县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442808, 654323, '福海县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442809, 654324, '哈巴河县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442810, 654325, '青河县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442811, 654326, '吉木乃县', 65, 6543, 3);
INSERT INTO `sys_citys` VALUES (973480327517442812, 659001, '石河子市', 65, 6590, 3);
INSERT INTO `sys_citys` VALUES (973480327517442813, 659002, '阿拉尔市', 65, 6590, 3);
INSERT INTO `sys_citys` VALUES (973480327517442814, 659003, '图木舒克市', 65, 6590, 3);
INSERT INTO `sys_citys` VALUES (973480327517442815, 659004, '五家渠市', 65, 6590, 3);
INSERT INTO `sys_citys` VALUES (973480327517442816, 659006, '铁门关市', 65, 6590, 3);
INSERT INTO `sys_citys` VALUES (973480327517442817, 441900, '东莞市', 44, 4419, 3);
INSERT INTO `sys_citys` VALUES (973480327517442818, 442000, '中山市', 44, 4420, 3);
INSERT INTO `sys_citys` VALUES (973480327517442819, 460400, '儋州市', 46, 4604, 3);
INSERT INTO `sys_citys` VALUES (973480327517442820, 350527, '金门县', 35, 3505, 3);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父部门id',
  `dept_type` int(1) NOT NULL COMMENT '部门类型（0公司，1部门）',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `leader_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '负责人ID',
  `leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `dept_status` int(1) NOT NULL DEFAULT 0 COMMENT '部门状态（0正常 1停用）',
  `del_flag` int(1) NOT NULL DEFAULT 0 COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (3, 104, 1, '', '硬件研发部', 1, 1365226597967335424, '曲奇伟', '15888888888', 'fofia@fofia.com', 0, 0, 'admin', '2021-02-25 13:56:27', 'admin', '2021-03-15 17:39:33', '');
INSERT INTO `sys_dept` VALUES (104, 110, 0, '', '无锡源致科技', 2, 1259416358429528064, '陈总', '', '', 0, 0, 'admin', '2021-02-26 15:08:54', 'admin', '2021-03-15 17:37:03', '');
INSERT INTO `sys_dept` VALUES (105, 110, 0, '', '江苏真源科技', 1, 1365226715747586048, '毛总', '', '', 0, 0, 'admin', '2021-02-26 15:09:37', 'admin', '2021-03-15 17:36:12', '');
INSERT INTO `sys_dept` VALUES (106, 111, 1, '', '销售部', 1, 1214101543947735040, '浦总', '', '', 0, 0, 'admin', '2021-02-26 15:10:16', 'admin', '2021-03-15 17:37:53', '');
INSERT INTO `sys_dept` VALUES (107, 111, 1, '', '技术部', 1, 1365226215618777088, '于硕', '', '', 0, 0, 'admin', '2021-02-26 15:10:41', 'admin', '2021-03-15 17:38:01', '');
INSERT INTO `sys_dept` VALUES (110, 0, 0, '', '无锡富华科技有限公司', 1, 1356081913244291072, '罗总', '', '', 0, 0, 'admin', '2021-03-15 17:35:53', 'admin', '2021-03-15 17:35:53', '备注');
INSERT INTO `sys_dept` VALUES (111, 110, 0, '', '江苏真源网络', 1, 1365223127751200768, '潘总', '', '', 0, 0, 'admin', '2021-03-15 17:37:45', 'admin', '2021-03-15 17:37:45', '');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `id` bigint(20) NOT NULL,
  `dic_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `dic_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典值',
  `parent_id` bigint(20) NOT NULL COMMENT '字典项',
  `dic_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典编码',
  `sort_num` int(11) NOT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (138030650765381, '性别', '性别', 0, 'gender', 1, NULL, 'admin', '2021-04-15 10:55:56.131');
INSERT INTO `sys_dictionary` VALUES (138030650765382, '品种', '品种', 0, 'variety', 2, NULL, 'admin', '2021-04-15 10:57:57.835');
INSERT INTO `sys_dictionary` VALUES (138030650765383, '男', '男', 1382528084493864960, 'gender', 1, NULL, 'admin', '2021-04-15 11:11:18.580');
INSERT INTO `sys_dictionary` VALUES (138030650765384, '女', '女', 1382528084493864960, 'gender', 1, NULL, 'admin', '2021-04-15 11:13:12.747');
INSERT INTO `sys_dictionary` VALUES (138030650765385, '阿拉斯加', '阿拉斯加', 1382528594957438976, 'variety', 1, NULL, 'admin', '2021-04-15 11:13:53.811');
INSERT INTO `sys_dictionary` VALUES (138030650765386, '金毛犬', '金毛犬', 1382528594957438976, 'variety', 1, NULL, 'admin', '2021-04-15 11:14:05.218');
INSERT INTO `sys_dictionary` VALUES (173047831998533, '男', 'male', 138030650765381, 'gender', 1, NULL, 'admin', '2021-06-23 09:53:27.879');
INSERT INTO `sys_dictionary` VALUES (173047942385733, '女', 'female', 138030650765381, 'gender', 2, NULL, 'admin', '2021-06-23 09:53:54.829');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单链接',
  `role_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#' COMMENT '权限标识',
  `menu_sort` int(11) NOT NULL COMMENT '排序',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(3) NOT NULL,
  `iframe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否在iframe打开现在都是',
  `menu_level` tinyint(4) NOT NULL COMMENT '菜单层级',
  `menu_type` tinyint(4) NOT NULL COMMENT '类型：0-目录，1-菜单',
  `menu_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单icon',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (138030650765081, '系统用户', '/admin/SysUser/Index', 'system:user:view', 1, 138030650765088, '1', 'admin', '2017-08-30 10:36:57.803', 0, 2, 1, 'fa fa-users');
INSERT INTO `sys_menu` VALUES (138030650765082, '系统角色', '/admin/SysRole/Index', 'system:role:view', 2, 138030650765088, '1', 'admin', '2017-08-31 15:57:41.670', 0, 2, 1, 'fa fa-user-secret');
INSERT INTO `sys_menu` VALUES (138030650765083, '菜单管理', '/admin/SysMenu/Index', 'system:menu:view', 3, 138030650765088, '', 'admin', '0001-01-01 00:00:00.000', 0, 2, 1, 'fa fa-navicon');
INSERT INTO `sys_menu` VALUES (138030650765084, '字典管理', '/admin/sysdic/index', 'system:dic:view', 5, 138030650765088, '', 'admin', '2018-05-28 16:17:43.125', 0, 2, 1, 'fa fa-mortar-board');
INSERT INTO `sys_menu` VALUES (138030650765085, '职位信息', '/admin/position/index', 'system:post:view', 2, 138030650765089, NULL, 'yushuo', '2021-02-25 14:29:03.846', 0, 2, 1, 'fa fa-graduation-cap');
INSERT INTO `sys_menu` VALUES (138030650765086, '部门管理', '/admin/SysDepartment/index', 'system:dept:view', 1, 138030650765089, NULL, 'admin', '2020-05-12 09:10:29.816', 0, 2, 1, 'fa fa-sitemap');
INSERT INTO `sys_menu` VALUES (138030650765088, '系统管理', '#', '#', 100, 0, '1', 'admin', '2017-08-30 10:36:57.803', 0, 1, 0, 'fa fa-cogs');
INSERT INTO `sys_menu` VALUES (138030650765089, '单位组织', '#', '#', 99, 0, '', 'admin', '2018-08-13 14:02:39.201', 0, 1, 0, 'fa fa-sitemap');
INSERT INTO `sys_menu` VALUES (138030650765092, '定时任务', '/admin/hangfirejob/index', 'system:hangfirejob:view', 9, 138030650765088, NULL, 'admin', '2019-04-18 17:23:59.429', 0, 2, 1, 'fa fa-tag');
INSERT INTO `sys_menu` VALUES (138030650765093, '异常日志', '/admin/easylog/index', 'system:log:view', 2, 150768673534021, NULL, 'admin', '2020-04-11 12:22:46.047', 0, 3, 1, 'fa fa-tag');
INSERT INTO `sys_menu` VALUES (142971618836549, '生产管理', '#', '#', 1, 0, NULL, 'admin', '2021-03-30 10:13:02.400', 0, 1, 0, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (142971913965637, '员工管理', '/fuhua/staff/index', 'fh:staff:view', 5, 142971618836549, NULL, 'admin', '2021-03-30 10:14:14.454', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (142984211783749, '产品工序', '/fuhua/product/index', 'fh:product:view', 4, 142971618836549, NULL, 'admin', '2021-03-30 11:04:16.851', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (143026935611461, '工时管理', '/fuhua/timebill/index', 'fh:timebill:view', 3, 142971618836549, NULL, 'admin', '2021-03-30 13:58:07.473', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (143326710992965, '每月工时统计', '/fuhua/WorkTimeReport/index', 'fh:worktimereport:view', 1, 142971618836549, NULL, 'admin', '2021-03-31 10:17:54.822', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (148970094415941, 'Hangfire监控', '/easytask', '#', 10, 138030650765088, NULL, 'admin', '2021-04-16 09:00:53.978', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (149035334889541, '内容管理', '#', '#', 1, 0, NULL, 'admin', '2021-04-16 13:26:21.828', 0, 1, 0, 'fa fa-book');
INSERT INTO `sys_menu` VALUES (149035570483269, '站点管理', '#', '#', 2, 0, NULL, 'admin', '2021-04-16 13:27:19.346', 0, 1, 0, 'fa fa-internet-explorer');
INSERT INTO `sys_menu` VALUES (149035865407557, '站点设置', '/SiteSet/site/index', 'site:set:view', 1, 149035570483269, NULL, 'admin', '2021-04-16 13:28:31.349', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (149055813701701, '上传设置', '/SiteSet/UploadSet/index', 'site:uploadset:view', 2, 149035570483269, NULL, 'admin', '2021-04-16 14:49:41.538', 0, 2, 1, 'fa fa-cloud-upload');
INSERT INTO `sys_menu` VALUES (150030841880645, '广告管理', '/SiteSet/ad/index', 'site:ad:view', 3, 149035570483269, NULL, 'admin', '2021-04-19 08:57:05.526', 0, 2, 1, 'fa fa-twitter');
INSERT INTO `sys_menu` VALUES (150094470795333, '访问IP限制', '/SiteSet/IpManager/index', 'site:ip:view', 4, 149035570483269, NULL, 'admin', '2021-04-19 13:15:59.930', 0, 2, 1, 'fa fa-unlock');
INSERT INTO `sys_menu` VALUES (150129483354181, '栏目管理', '/cms/channel/index', 'cms:channel:view', 2, 149035334889541, NULL, 'admin', '2021-04-19 15:38:27.918', 0, 2, 1, 'fa fa-map');
INSERT INTO `sys_menu` VALUES (150393122443333, '文章管理', '/cms/content/index', 'cms:content:view', 1, 149035334889541, NULL, 'admin', '2021-04-20 09:31:12.930', 0, 2, 1, 'fa fa-edit');
INSERT INTO `sys_menu` VALUES (150463360806981, '模板管理', '/Cms/TemplateCode/Index', 'cms:template:view', 3, 149035334889541, NULL, 'admin', '2021-04-20 14:17:00.968', 0, 2, 1, 'fa fa-newspaper-o');
INSERT INTO `sys_menu` VALUES (150485981093957, '模板匹配', '/cms/TemplateMatch/Index', 'cms:templatematch:view', 4, 149035334889541, NULL, 'admin', '2021-04-20 15:49:03.499', 0, 2, 1, 'fa fa-exchange');
INSERT INTO `sys_menu` VALUES (150768673534021, '日志管理', '#', '#', 8, 138030650765088, NULL, 'admin', '2021-04-21 10:59:20.208', 0, 2, 0, 'fa fa-pencil-square-o');
INSERT INTO `sys_menu` VALUES (150769392050245, '登录日志', '/admin/loginlog/index', 'system:loginlog:view', 1, 150768673534021, NULL, 'admin', '2021-04-21 11:02:15.627', 0, 3, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (152219595145285, '代码生成', '/admin/codegen/index', 'system:codegen:view', 11, 138030650765088, NULL, 'admin', '2021-04-25 13:23:09.116', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (153320562102341, '每日工序统计', '/fuhua/ProcessReport/index', 'fh:processreport:view', 2, 142971618836549, NULL, 'admin', '2021-04-28 16:02:59.878', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (153933377921093, 'Sql执行日志', '/admin/syssqllog/index', 'admin:sqllog:view', 3, 150768673534021, '请开启配置项\r\n#freesql的配置\r\nFreeSqlConfig:  \r\n  LogSql: false  #是否记录sql,true记录，false不记录\r\n', 'admin', '2021-04-30 09:36:33.115', 0, 3, 1, 'fa fa-bookmark');

-- ----------------------------
-- Table structure for sys_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate`;
CREATE TABLE `sys_operate`  (
  `id` bigint(20) NOT NULL,
  `func_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮名称',
  `role_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识',
  `func_sort` int(5) NOT NULL COMMENT '排序',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按钮操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operate
-- ----------------------------
INSERT INTO `sys_operate` VALUES (138030650765481, '新增', 'system:user:add', 1, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765482, '修改', 'system:user:edit', 2, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765483, '删除', 'system:user:delete', 3, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765484, '停止站点', 'system:user:stop', 5, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765485, '新增', 'system:role:add', 1, 138030650765082);
INSERT INTO `sys_operate` VALUES (138030650765486, '修改', 'system:role:edit', 2, 138030650765082);
INSERT INTO `sys_operate` VALUES (138030650765487, '删除', 'system:role:delete', 2, 138030650765082);
INSERT INTO `sys_operate` VALUES (138030650765488, '新增', 'system:menu:add', 1, 138030650765083);
INSERT INTO `sys_operate` VALUES (138030650765489, '修改', 'system:menu:edit', 2, 138030650765083);
INSERT INTO `sys_operate` VALUES (138030650765490, '删除', 'system:menu:delete', 3, 138030650765083);
INSERT INTO `sys_operate` VALUES (138030650765491, '授权', 'system:role:permission', 4, 138030650765082);
INSERT INTO `sys_operate` VALUES (138030650765492, '新增', 'system:dic:add', 1, 138030650765084);
INSERT INTO `sys_operate` VALUES (138030650765493, '修改', 'system:dic:edit', 2, 138030650765084);
INSERT INTO `sys_operate` VALUES (138030650765494, '删除', 'system:dic:delete', 3, 138030650765084);
INSERT INTO `sys_operate` VALUES (138030650765495, '字典子项', 'system:dic:son', 4, 138030650765084);
INSERT INTO `sys_operate` VALUES (138030650765496, '新增', 'system:post:add', 1, 138030650765085);
INSERT INTO `sys_operate` VALUES (138030650765497, '修改', 'system:post:edit', 2, 138030650765085);
INSERT INTO `sys_operate` VALUES (138030650765498, '删除', 'system:post:delete', 3, 138030650765085);
INSERT INTO `sys_operate` VALUES (138030650765499, '新增', 'system:dept:add', 1, 138030650765086);
INSERT INTO `sys_operate` VALUES (138030650765500, '修改', 'system:dept:edit', 2, 138030650765086);
INSERT INTO `sys_operate` VALUES (138030650765501, '删除', 'system:dept:delete', 3, 138030650765086);
INSERT INTO `sys_operate` VALUES (138030650765502, '重置密码', 'system:user:password', 4, 138030650765081);
INSERT INTO `sys_operate` VALUES (142971914113093, '新增', 'fh:staff:add', 1, 142971913965637);
INSERT INTO `sys_operate` VALUES (142971914113094, '修改', 'fh:staff:edit', 2, 142971913965637);
INSERT INTO `sys_operate` VALUES (142971914113095, '删除', 'fh:staff:delete', 3, 142971913965637);
INSERT INTO `sys_operate` VALUES (142984211955781, '新增', 'fh:product:add', 1, 142984211783749);
INSERT INTO `sys_operate` VALUES (142984211959877, '修改', 'fh:product:edit', 2, 142984211783749);
INSERT INTO `sys_operate` VALUES (142984211959878, '删除', 'fh:product:delete', 3, 142984211783749);
INSERT INTO `sys_operate` VALUES (142984211959879, '查看工序', 'fh:product:process', 4, 142984211783749);
INSERT INTO `sys_operate` VALUES (143026935791685, '新增', 'fh:timebill:add', 1, 143026935611461);
INSERT INTO `sys_operate` VALUES (143026935791686, '修改', 'fh:timebill:edit', 2, 143026935611461);
INSERT INTO `sys_operate` VALUES (143026935791687, '删除', 'fh:timebill:delete', 3, 143026935611461);
INSERT INTO `sys_operate` VALUES (143321190735941, '查看工序', 'fh:timebill:process', 4, 143026935611461);
INSERT INTO `sys_operate` VALUES (148653715939397, '添加', 'system:hangfirejob:add', 1, 138030650765092);
INSERT INTO `sys_operate` VALUES (148653715943493, '修改', 'system:hangfirejob:edit', 2, 138030650765092);
INSERT INTO `sys_operate` VALUES (148653715943494, '删除', 'system:hangfirejob:delete', 3, 138030650765092);
INSERT INTO `sys_operate` VALUES (148653715943495, '暂停', 'system:hangfire:pause', 4, 138030650765092);
INSERT INTO `sys_operate` VALUES (148653715943496, '继续', 'system:hangfire:resume', 5, 138030650765092);
INSERT INTO `sys_operate` VALUES (148653715943497, '执行', 'system:hangfire:excute', 6, 138030650765092);
INSERT INTO `sys_operate` VALUES (150030842380357, '新增', 'site:ad:view', 1, 150030841880645);
INSERT INTO `sys_operate` VALUES (150030842380358, '修改', 'site:ad:edit', 2, 150030841880645);
INSERT INTO `sys_operate` VALUES (150030842380359, '删除', 'site:ad:delete', 3, 150030841880645);
INSERT INTO `sys_operate` VALUES (150094471213125, '新增', 'site:ip:add', 1, 150094470795333);
INSERT INTO `sys_operate` VALUES (150094471213126, '修改', 'site:ip:edit', 2, 150094470795333);
INSERT INTO `sys_operate` VALUES (150094471213127, '删除', 'site:ip:delete', 3, 150094470795333);
INSERT INTO `sys_operate` VALUES (150100212969541, '停用', 'site:ip:ban', 4, 150094470795333);
INSERT INTO `sys_operate` VALUES (150129483739205, '新增', 'cms:channel:add', 1, 150129483354181);
INSERT INTO `sys_operate` VALUES (150129483739206, '修改', 'cms:channel:edit', 2, 150129483354181);
INSERT INTO `sys_operate` VALUES (150129483739207, '删除', 'cms:channel:delete', 3, 150129483354181);
INSERT INTO `sys_operate` VALUES (150393122959429, '新增', 'cms:content:add', 1, 150393122443333);
INSERT INTO `sys_operate` VALUES (150393122959430, '修改', 'cms:content:edit', 2, 150393122443333);
INSERT INTO `sys_operate` VALUES (150393122959431, '删除', 'cms:content:delete', 3, 150393122443333);
INSERT INTO `sys_operate` VALUES (150393122959432, '置顶', 'cms:content:top', 4, 150393122443333);
INSERT INTO `sys_operate` VALUES (150393122959433, '推荐', 'cms:content:recommend', 5, 150393122443333);
INSERT INTO `sys_operate` VALUES (150463361183813, '新增', 'cms:template:add', 1, 150463360806981);
INSERT INTO `sys_operate` VALUES (150463361187909, '修改', 'cms:template:edit', 2, 150463360806981);
INSERT INTO `sys_operate` VALUES (150463361187910, '删除', 'cms:template:delete', 3, 150463360806981);
INSERT INTO `sys_operate` VALUES (150463361187911, '复制模板', 'cms:template:copy', 4, 150463360806981);
INSERT INTO `sys_operate` VALUES (150463361187912, '同步本地文件', 'cms:template:sync', 5, 150463360806981);
INSERT INTO `sys_operate` VALUES (150485981282373, '匹配模板', 'cms:templatematch:match', 1, 150485981093957);
INSERT INTO `sys_operate` VALUES (150769039695941, '删除', 'system:log:delete', 1, 138030650765093);
INSERT INTO `sys_operate` VALUES (150769039695942, '清空', 'system:log:clear', 2, 138030650765093);
INSERT INTO `sys_operate` VALUES (150769392238661, '删除', 'system:loginlog:delete', 1, 150769392050245);
INSERT INTO `sys_operate` VALUES (152219595280453, '全量同步', 'system:codegen:syncall', 1, 152219595145285);
INSERT INTO `sys_operate` VALUES (152939127238725, '字段', 'system:codegen:column', 2, 152219595145285);
INSERT INTO `sys_operate` VALUES (152939127242821, '预览', 'system:codegen:gentable', 3, 152219595145285);
INSERT INTO `sys_operate` VALUES (153933378093125, '删除', 'admin:sqllog:delete', 1, 153933377921093);
INSERT INTO `sys_operate` VALUES (153933378093126, '移除', 'admin:sqllog:clear', 2, 153933377921093);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `post_status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES (5, 'boos', '董事长', 1, 0, 'admin', '2021-02-25 15:11:26', 'admin', '2021-02-25 15:23:24', '董事长');
INSERT INTO `sys_position` VALUES (7, 'cto', '技术总监', 2, 0, 'admin', '2021-02-25 15:23:43', 'admin', '2021-02-25 15:23:43', 'cto');
INSERT INTO `sys_position` VALUES (8, 'java', 'JAVA开发工程师', 3, 0, 'admin', '2021-02-25 15:24:01', 'admin', '2021-02-25 15:24:01', 'java');
INSERT INTO `sys_position` VALUES (9, 'web', '前端开发工程师', 4, 0, 'admin', '2021-02-25 15:24:22', 'admin', '2021-02-25 15:24:22', 'web');
INSERT INTO `sys_position` VALUES (10, 'accountant', '财务', 5, 0, 'admin', '2021-02-25 15:25:11', 'admin', '2021-02-25 15:25:11', 'accountant');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色编码',
  `role_sort` int(11) NOT NULL COMMENT '排序',
  `role_super` int(1) NOT NULL DEFAULT 0 COMMENT '超管(1:是，0:不是)',
  `role_status` int(1) NOT NULL DEFAULT 0 COMMENT '角色状态(0:正常，1:禁用)',
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (138027723972674, '管理员', 'admin', 1, 0, 1, 'admin', '2018-05-28 14:22:38.169', 'ddsa');
INSERT INTO `sys_role` VALUES (138027723972677, '组长', 'group_leader', 1, 0, 1, 'admin', '2021-03-16 10:56:16.818', NULL);

-- ----------------------------
-- Table structure for sys_role_authorize
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_authorize`;
CREATE TABLE `sys_role_authorize`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单或者操作id',
  `menu_pid` bigint(20) NOT NULL COMMENT '上级id',
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_roleid`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_authorize
-- ----------------------------
INSERT INTO `sys_role_authorize` VALUES (144022310834245, 138027723972677, 142971618836549, 0, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838341, 138027723972677, 143326710992965, 142971618836549, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838342, 138027723972677, 143026935611461, 142971618836549, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838343, 138027723972677, 143026935791685, 143026935611461, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838344, 138027723972677, 143026935791686, 143026935611461, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838345, 138027723972677, 143026935791687, 143026935611461, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838346, 138027723972677, 143321190735941, 143026935611461, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838347, 138027723972677, 142984211783749, 142971618836549, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838348, 138027723972677, 142984211955781, 142984211783749, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838349, 138027723972677, 142984211959877, 142984211783749, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838350, 138027723972677, 142984211959879, 142984211783749, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838351, 138027723972677, 142971913965637, 142971618836549, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838352, 138027723972677, 142971914113093, 142971913965637, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838353, 138027723972677, 142971914113094, 142971913965637, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (144022310838354, 138027723972677, 142971914113095, 142971913965637, 'admin', '2021-04-02 09:28:18.496');
INSERT INTO `sys_role_authorize` VALUES (151466757636165, 138027723972674, 149035334889541, 0, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640261, 138027723972674, 150393122443333, 149035334889541, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640262, 138027723972674, 150393122959429, 150393122443333, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640263, 138027723972674, 150393122959430, 150393122443333, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640264, 138027723972674, 150393122959431, 150393122443333, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640265, 138027723972674, 150393122959432, 150393122443333, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640266, 138027723972674, 150129483354181, 149035334889541, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640267, 138027723972674, 150129483739205, 150129483354181, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640268, 138027723972674, 150129483739206, 150129483354181, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640269, 138027723972674, 150129483739207, 150129483354181, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640270, 138027723972674, 150463360806981, 149035334889541, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640271, 138027723972674, 150463361183813, 150463360806981, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640272, 138027723972674, 150463361187909, 150463360806981, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640273, 138027723972674, 150463361187910, 150463360806981, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640274, 138027723972674, 150463361187912, 150463360806981, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640275, 138027723972674, 150485981093957, 149035334889541, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640276, 138027723972674, 150485981282373, 150485981093957, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640277, 138027723972674, 149035570483269, 0, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640278, 138027723972674, 149035865407557, 149035570483269, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640279, 138027723972674, 149055813701701, 149035570483269, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640280, 138027723972674, 150030841880645, 149035570483269, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640281, 138027723972674, 150030842380357, 150030841880645, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640282, 138027723972674, 150030842380359, 150030841880645, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640283, 138027723972674, 150094470795333, 149035570483269, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640284, 138027723972674, 150094471213125, 150094470795333, 'admin', '2021-04-23 10:19:50.391');
INSERT INTO `sys_role_authorize` VALUES (151466757640285, 138027723972674, 150094471213126, 150094470795333, 'admin', '2021-04-23 10:19:50.391');

-- ----------------------------
-- Table structure for sys_sql_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sql_log`;
CREATE TABLE `sys_sql_log`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '数据Id',
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `sql_string` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '执行sql字符串',
  `elapsed_time` bigint(20) NOT NULL COMMENT '耗时毫秒',
  `excute_time` datetime(0) NOT NULL COMMENT '执行时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 470 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'sql执行日志\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sql_log
-- ----------------------------
INSERT INTO `sys_sql_log` VALUES (1, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 4, '2021-05-17 15:06:40');
INSERT INTO `sys_sql_log` VALUES (2, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:06:40');
INSERT INTO `sys_sql_log` VALUES (3, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 1, '2021-05-17 15:06:51');
INSERT INTO `sys_sql_log` VALUES (4, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:06:51');
INSERT INTO `sys_sql_log` VALUES (5, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (6, 'code_table', 'UPDATE `code_table` SET `db_name` = @p_0, `remark` = @p_1, `sync_time` = @p_2, `table_name` = @p_3, `entity_name` = @p_4, `table_type` = @p_5, `update_time` = @p_6 \r\nWHERE (`id` = 91)', 62, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (7, 'code_column', 'DELETE FROM `code_column` WHERE (`table_name` = \'fh_staff\')', 99, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (8, 'code_column', 'INSERT INTO `code_column`(`can_null`, `column_name`, `comment`, `cstype`, `dbtype`, `max_length`, `is_identity`, `is_primary`, `sort_num`, `sync_time`, `table_name`, `type_text`, `type_text_full`, `update_time`) VALUES(@can_null_0, @column_name_0, @comment_0, @cstype_0, @dbtype_0, @max_length_0, @is_identity_0, @is_primary_0, @sort_num_0, @sync_time_0, @table_name_0, @type_text_0, @type_text_full_0, @update_time_0), (@can_null_1, @column_name_1, @comment_1, @cstype_1, @dbtype_1, @max_length_1, @is_identity_1, @is_primary_1, @sort_num_1, @sync_time_1, @table_name_1, @type_text_1, @type_text_full_1, @update_time_1), (@can_null_2, @column_name_2, @comment_2, @cstype_2, @dbtype_2, @max_length_2, @is_identity_2, @is_primary_2, @sort_num_2, @sync_time_2, @table_name_2, @type_text_2, @type_text_full_2, @update_time_2), (@can_null_3, @column_name_3, @comment_3, @cstype_3, @dbtype_3, @max_length_3, @is_identity_3, @is_primary_3, @sort_num_3, @sync_time_3, @table_name_3, @type_text_3, @type_text_full_3, @update_time_3), (@can_null_4, @column_name_4, @comment_4, @cstype_4, @dbtype_4, @max_length_4, @is_identity_4, @is_primary_4, @sort_num_4, @sync_time_4, @table_name_4, @type_text_4, @type_text_full_4, @update_time_4), (@can_null_5, @column_name_5, @comment_5, @cstype_5, @dbtype_5, @max_length_5, @is_identity_5, @is_primary_5, @sort_num_5, @sync_time_5, @table_name_5, @type_text_5, @type_text_full_5, @update_time_5)', 74, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (9, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 0, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (10, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:07:09');
INSERT INTO `sys_sql_log` VALUES (11, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-05-17 15:07:16');
INSERT INTO `sys_sql_log` VALUES (12, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 1, '2021-05-17 15:07:16');
INSERT INTO `sys_sql_log` VALUES (13, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:10:37');
INSERT INTO `sys_sql_log` VALUES (14, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:10:38');
INSERT INTO `sys_sql_log` VALUES (15, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 13, '2021-05-17 15:10:39');
INSERT INTO `sys_sql_log` VALUES (16, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-05-17 15:10:39');
INSERT INTO `sys_sql_log` VALUES (17, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-05-17 15:10:42');
INSERT INTO `sys_sql_log` VALUES (18, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 2, '2021-05-17 15:10:42');
INSERT INTO `sys_sql_log` VALUES (19, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 15, '2021-05-17 15:11:46');
INSERT INTO `sys_sql_log` VALUES (20, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 2, '2021-05-17 15:11:47');
INSERT INTO `sys_sql_log` VALUES (21, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 1, '2021-05-17 15:11:47');
INSERT INTO `sys_sql_log` VALUES (22, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:11:47');
INSERT INTO `sys_sql_log` VALUES (23, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-05-17 15:11:50');
INSERT INTO `sys_sql_log` VALUES (24, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 1, '2021-05-17 15:11:50');
INSERT INTO `sys_sql_log` VALUES (25, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 5, '2021-05-17 15:18:15');
INSERT INTO `sys_sql_log` VALUES (26, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 2, '2021-05-17 15:18:16');
INSERT INTO `sys_sql_log` VALUES (27, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 1, '2021-05-17 15:18:16');
INSERT INTO `sys_sql_log` VALUES (28, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:18:16');
INSERT INTO `sys_sql_log` VALUES (29, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:23:38');
INSERT INTO `sys_sql_log` VALUES (30, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:23:39');
INSERT INTO `sys_sql_log` VALUES (31, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 12, '2021-05-17 15:23:39');
INSERT INTO `sys_sql_log` VALUES (32, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-05-17 15:23:39');
INSERT INTO `sys_sql_log` VALUES (33, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 9, '2021-05-17 15:24:28');
INSERT INTO `sys_sql_log` VALUES (34, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:24:29');
INSERT INTO `sys_sql_log` VALUES (35, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 1, '2021-05-17 15:24:29');
INSERT INTO `sys_sql_log` VALUES (36, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:24:29');
INSERT INTO `sys_sql_log` VALUES (37, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-05-17 15:25:43');
INSERT INTO `sys_sql_log` VALUES (38, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:25:43');
INSERT INTO `sys_sql_log` VALUES (39, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 9, '2021-05-17 15:25:44');
INSERT INTO `sys_sql_log` VALUES (40, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-05-17 15:25:44');
INSERT INTO `sys_sql_log` VALUES (41, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-05-17 15:26:05');
INSERT INTO `sys_sql_log` VALUES (42, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 2, '2021-05-17 15:26:05');
INSERT INTO `sys_sql_log` VALUES (43, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 1, '2021-05-17 15:26:05');
INSERT INTO `sys_sql_log` VALUES (44, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 9, '2021-05-17 15:29:12');
INSERT INTO `sys_sql_log` VALUES (45, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:29:13');
INSERT INTO `sys_sql_log` VALUES (46, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-05-17 15:29:16');
INSERT INTO `sys_sql_log` VALUES (47, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:29:16');
INSERT INTO `sys_sql_log` VALUES (48, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 1, '2021-05-17 15:29:16');
INSERT INTO `sys_sql_log` VALUES (49, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:29:28');
INSERT INTO `sys_sql_log` VALUES (50, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:29:29');
INSERT INTO `sys_sql_log` VALUES (51, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-05-17 15:29:30');
INSERT INTO `sys_sql_log` VALUES (52, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:29:30');
INSERT INTO `sys_sql_log` VALUES (53, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-05-17 15:29:30');
INSERT INTO `sys_sql_log` VALUES (54, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 4, '2021-05-17 15:29:59');
INSERT INTO `sys_sql_log` VALUES (55, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:30:00');
INSERT INTO `sys_sql_log` VALUES (56, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-05-17 15:30:01');
INSERT INTO `sys_sql_log` VALUES (57, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-05-17 15:30:01');
INSERT INTO `sys_sql_log` VALUES (58, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-05-17 15:30:01');
INSERT INTO `sys_sql_log` VALUES (59, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-05-17 15:30:29');
INSERT INTO `sys_sql_log` VALUES (60, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 16, '2021-05-17 15:30:33');
INSERT INTO `sys_sql_log` VALUES (61, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nWHERE (a.`id` = 138030650765081) \r\nlimit 0,1', 0, '2021-05-17 15:30:33');
INSERT INTO `sys_sql_log` VALUES (62, 'sys_operate', 'SELECT a.`id` as1, a.`func_title` as2, a.`role_tag` as3, a.`func_sort` as4 \r\nFROM `sys_operate` a \r\nWHERE (a.`menu_id` = 138030650765081) \r\nORDER BY a.`func_sort`', 38, '2021-05-17 15:30:33');
INSERT INTO `sys_sql_log` VALUES (63, 'sys_menu', 'SELECT a.`menu_level` as1 \r\nFROM `sys_menu` a \r\nWHERE (a.`id` = 138030650765088) \r\nlimit 0,1', 0, '2021-05-17 15:30:52');
INSERT INTO `sys_sql_log` VALUES (64, 'sys_menu', 'UPDATE `sys_menu` SET `iframe` = @p_0, `menu_icon` = @p_1, `menu_level` = @p_2, `menu_name` = @p_3, `menu_sort` = @p_4, `menu_type` = @p_5, `menu_url` = @p_6, `parent_id` = @p_7, `remark` = @p_8, `role_tag` = @p_9 \r\nWHERE (`id` = 138030650765081) AND (`id` = 138030650765081)', 38, '2021-05-17 15:30:52');
INSERT INTO `sys_sql_log` VALUES (65, 'sys_operate', 'DELETE FROM `sys_operate` WHERE (`menu_id` = 138030650765081)', 19, '2021-05-17 15:30:52');
INSERT INTO `sys_sql_log` VALUES (66, 'sys_operate', 'INSERT INTO `sys_operate`(`id`, `func_sort`, `func_title`, `menu_id`, `role_tag`) VALUES(@id_0, @func_sort_0, @func_title_0, @menu_id_0, @role_tag_0), (@id_1, @func_sort_1, @func_title_1, @menu_id_1, @role_tag_1), (@id_2, @func_sort_2, @func_title_2, @menu_id_2, @role_tag_2), (@id_3, @func_sort_3, @func_title_3, @menu_id_3, @role_tag_3), (@id_4, @func_sort_4, @func_title_4, @menu_id_4, @role_tag_4)', 38, '2021-05-17 15:30:52');
INSERT INTO `sys_sql_log` VALUES (67, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:30:52');
INSERT INTO `sys_sql_log` VALUES (68, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:30:56');
INSERT INTO `sys_sql_log` VALUES (69, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:30:57');
INSERT INTO `sys_sql_log` VALUES (70, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:30:57');
INSERT INTO `sys_sql_log` VALUES (71, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 4, '2021-05-17 15:43:05');
INSERT INTO `sys_sql_log` VALUES (72, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:43:05');
INSERT INTO `sys_sql_log` VALUES (73, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:43:05');
INSERT INTO `sys_sql_log` VALUES (74, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:43:06');
INSERT INTO `sys_sql_log` VALUES (75, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:43:40');
INSERT INTO `sys_sql_log` VALUES (76, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:43:40');
INSERT INTO `sys_sql_log` VALUES (77, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:43:41');
INSERT INTO `sys_sql_log` VALUES (78, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:43:42');
INSERT INTO `sys_sql_log` VALUES (79, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-05-17 15:44:51');
INSERT INTO `sys_sql_log` VALUES (80, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:44:51');
INSERT INTO `sys_sql_log` VALUES (81, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:44:52');
INSERT INTO `sys_sql_log` VALUES (82, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:44:53');
INSERT INTO `sys_sql_log` VALUES (83, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 5, '2021-05-17 15:49:05');
INSERT INTO `sys_sql_log` VALUES (84, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:49:05');
INSERT INTO `sys_sql_log` VALUES (85, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 1, '2021-05-17 15:49:06');
INSERT INTO `sys_sql_log` VALUES (86, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:49:08');
INSERT INTO `sys_sql_log` VALUES (87, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:49:38');
INSERT INTO `sys_sql_log` VALUES (88, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:49:38');
INSERT INTO `sys_sql_log` VALUES (89, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:49:39');
INSERT INTO `sys_sql_log` VALUES (90, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:49:40');
INSERT INTO `sys_sql_log` VALUES (91, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:52:33');
INSERT INTO `sys_sql_log` VALUES (92, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-05-17 15:52:33');
INSERT INTO `sys_sql_log` VALUES (93, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:52:34');
INSERT INTO `sys_sql_log` VALUES (94, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:52:35');
INSERT INTO `sys_sql_log` VALUES (95, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 5, '2021-05-17 15:54:24');
INSERT INTO `sys_sql_log` VALUES (96, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:54:28');
INSERT INTO `sys_sql_log` VALUES (97, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nWHERE (a.`id` = 143326710992965) \r\nlimit 0,1', 0, '2021-05-17 15:54:29');
INSERT INTO `sys_sql_log` VALUES (98, 'sys_operate', 'SELECT a.`id` as1, a.`func_title` as2, a.`role_tag` as3, a.`func_sort` as4 \r\nFROM `sys_operate` a \r\nWHERE (a.`menu_id` = 143326710992965) \r\nORDER BY a.`func_sort`', 1, '2021-05-17 15:54:29');
INSERT INTO `sys_sql_log` VALUES (99, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-05-17 15:55:16');
INSERT INTO `sys_sql_log` VALUES (100, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:55:17');
INSERT INTO `sys_sql_log` VALUES (101, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:55:17');
INSERT INTO `sys_sql_log` VALUES (102, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:55:21');
INSERT INTO `sys_sql_log` VALUES (103, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nWHERE (a.`id` = 150129483354181) \r\nlimit 0,1', 0, '2021-05-17 15:55:22');
INSERT INTO `sys_sql_log` VALUES (104, 'sys_operate', 'SELECT a.`id` as1, a.`func_title` as2, a.`role_tag` as3, a.`func_sort` as4 \r\nFROM `sys_operate` a \r\nWHERE (a.`menu_id` = 150129483354181) \r\nORDER BY a.`func_sort`', 1, '2021-05-17 15:55:22');
INSERT INTO `sys_sql_log` VALUES (105, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:55:29');
INSERT INTO `sys_sql_log` VALUES (106, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-05-17 15:59:29');
INSERT INTO `sys_sql_log` VALUES (107, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:59:30');
INSERT INTO `sys_sql_log` VALUES (108, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:59:30');
INSERT INTO `sys_sql_log` VALUES (109, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:59:35');
INSERT INTO `sys_sql_log` VALUES (110, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 15:59:35');
INSERT INTO `sys_sql_log` VALUES (111, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:59:36');
INSERT INTO `sys_sql_log` VALUES (112, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 15:59:39');
INSERT INTO `sys_sql_log` VALUES (113, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 1, '2021-05-17 17:06:04');
INSERT INTO `sys_sql_log` VALUES (114, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0)', 35, '2021-05-17 17:06:04');
INSERT INTO `sys_sql_log` VALUES (115, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 0, '2021-05-17 17:06:04');
INSERT INTO `sys_sql_log` VALUES (116, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-05-17 17:06:08');
INSERT INTO `sys_sql_log` VALUES (117, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-05-17 17:06:08');
INSERT INTO `sys_sql_log` VALUES (118, 'sys_menu', 'SELECT a.`id` as1, a.`menu_name` as2, a.`menu_level` as3, a.`parent_id` as4 \r\nFROM `sys_menu` a \r\nWHERE (a.`menu_type` = 0) \r\nORDER BY a.`menu_sort`', 6, '2021-05-17 17:06:10');
INSERT INTO `sys_sql_log` VALUES (119, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nWHERE (a.`id` = 143326710992965) \r\nlimit 0,1', 0, '2021-05-17 17:06:11');
INSERT INTO `sys_sql_log` VALUES (120, 'sys_operate', 'SELECT a.`id` as1, a.`func_title` as2, a.`role_tag` as3, a.`func_sort` as4 \r\nFROM `sys_operate` a \r\nWHERE (a.`menu_id` = 143326710992965) \r\nORDER BY a.`func_sort`', 1, '2021-05-17 17:06:11');
INSERT INTO `sys_sql_log` VALUES (121, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = \'admin\' AND a.`pass_word` = \'admin@123\') \r\nlimit 0,1', 42, '2021-06-03 08:50:30');
INSERT INTO `sys_sql_log` VALUES (122, 'login_info', 'INSERT INTO `login_info`(`browser`, `device_info`, `login_message`, `login_name`, `login_status`, `osinfo`, `real_address`, `request_ip`, `request_time`) VALUES(@browser_0, @device_info_0, @login_message_0, @login_name_0, @login_status_0, @osinfo_0, @real_address_0, @request_ip_0, @request_time_0)', 69, '2021-06-03 08:50:30');
INSERT INTO `sys_sql_log` VALUES (123, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 53, '2021-06-03 08:50:30');
INSERT INTO `sys_sql_log` VALUES (124, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 97, '2021-06-03 08:50:40');
INSERT INTO `sys_sql_log` VALUES (125, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 3, '2021-06-03 08:50:47');
INSERT INTO `sys_sql_log` VALUES (126, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 9, '2021-06-03 08:50:47');
INSERT INTO `sys_sql_log` VALUES (127, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 30, '2021-06-03 08:50:47');
INSERT INTO `sys_sql_log` VALUES (128, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-06-03 08:50:58');
INSERT INTO `sys_sql_log` VALUES (129, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-03 08:50:59');
INSERT INTO `sys_sql_log` VALUES (130, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 0, '2021-06-03 08:50:59');
INSERT INTO `sys_sql_log` VALUES (131, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 0, '2021-06-03 08:50:59');
INSERT INTO `sys_sql_log` VALUES (132, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 08:50:59');
INSERT INTO `sys_sql_log` VALUES (133, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 25, '2021-06-03 08:55:26');
INSERT INTO `sys_sql_log` VALUES (134, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 08:55:27');
INSERT INTO `sys_sql_log` VALUES (135, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 08:58:17');
INSERT INTO `sys_sql_log` VALUES (136, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 08:58:18');
INSERT INTO `sys_sql_log` VALUES (137, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 4, '2021-06-03 08:59:11');
INSERT INTO `sys_sql_log` VALUES (138, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 08:59:11');
INSERT INTO `sys_sql_log` VALUES (139, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 09:01:00');
INSERT INTO `sys_sql_log` VALUES (140, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 3, '2021-06-03 09:01:00');
INSERT INTO `sys_sql_log` VALUES (141, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 1, '2021-06-03 09:01:01');
INSERT INTO `sys_sql_log` VALUES (142, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 1, '2021-06-03 09:01:01');
INSERT INTO `sys_sql_log` VALUES (143, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 09:01:01');
INSERT INTO `sys_sql_log` VALUES (144, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-06-03 09:01:23');
INSERT INTO `sys_sql_log` VALUES (145, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-03 09:01:23');
INSERT INTO `sys_sql_log` VALUES (146, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 0, '2021-06-03 09:01:24');
INSERT INTO `sys_sql_log` VALUES (147, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 0, '2021-06-03 09:01:24');
INSERT INTO `sys_sql_log` VALUES (148, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 09:01:24');
INSERT INTO `sys_sql_log` VALUES (149, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 5, '2021-06-03 09:01:55');
INSERT INTO `sys_sql_log` VALUES (150, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:01:55');
INSERT INTO `sys_sql_log` VALUES (151, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 1, '2021-06-03 09:01:56');
INSERT INTO `sys_sql_log` VALUES (152, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 1, '2021-06-03 09:01:56');
INSERT INTO `sys_sql_log` VALUES (153, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 09:01:56');
INSERT INTO `sys_sql_log` VALUES (154, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-06-03 09:02:17');
INSERT INTO `sys_sql_log` VALUES (155, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-03 09:02:17');
INSERT INTO `sys_sql_log` VALUES (156, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 0, '2021-06-03 09:02:18');
INSERT INTO `sys_sql_log` VALUES (157, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 0, '2021-06-03 09:02:18');
INSERT INTO `sys_sql_log` VALUES (158, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 09:02:18');
INSERT INTO `sys_sql_log` VALUES (159, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 09:05:30');
INSERT INTO `sys_sql_log` VALUES (160, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:05:30');
INSERT INTO `sys_sql_log` VALUES (161, 'cms_channel', 'SELECT a.`id` as1, a.`channel_name` as2, a.`parent_id` as3 \r\nFROM `cms_channel` a \r\nORDER BY a.`sort_num`', 1, '2021-06-03 09:05:31');
INSERT INTO `sys_sql_log` VALUES (162, 'cms_content', 'SELECT count(1) as1 \r\nFROM `cms_content` a', 1, '2021-06-03 09:05:31');
INSERT INTO `sys_sql_log` VALUES (163, 'cms_content', 'SELECT a.`id`, a.`title`, a.`sub_title`, a.`content`, a.`summary`, a.`cover_image`, a.`author`, a.`source`, a.`channel_id`, a.`dept_id`, a.`ip_limit`, a.`content_status`, a.`is_top`, a.`tags`, a.`content_href`, a.`hit_count`, a.`is_recommend`, a.`publish_time`, a.`create_by`, a.`create_time`, a.`update_by`, a.`update_time` \r\nFROM `cms_content` a \r\nORDER BY a.`is_top` DESC, a.`id` DESC \r\nlimit 0,10', 0, '2021-06-03 09:05:31');
INSERT INTO `sys_sql_log` VALUES (164, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-06-03 09:05:39');
INSERT INTO `sys_sql_log` VALUES (165, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:05:39');
INSERT INTO `sys_sql_log` VALUES (166, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 50, '2021-06-03 09:05:39');
INSERT INTO `sys_sql_log` VALUES (167, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 3, '2021-06-03 09:05:44');
INSERT INTO `sys_sql_log` VALUES (168, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 3, '2021-06-03 09:05:44');
INSERT INTO `sys_sql_log` VALUES (169, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765371) \r\nlimit 0,1', 0, '2021-06-03 09:05:45');
INSERT INTO `sys_sql_log` VALUES (170, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765371)', 37, '2021-06-03 09:05:45');
INSERT INTO `sys_sql_log` VALUES (171, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 28, '2021-06-03 09:05:45');
INSERT INTO `sys_sql_log` VALUES (172, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:05:45');
INSERT INTO `sys_sql_log` VALUES (173, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 09:07:01');
INSERT INTO `sys_sql_log` VALUES (174, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:07:01');
INSERT INTO `sys_sql_log` VALUES (175, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-06-03 09:07:02');
INSERT INTO `sys_sql_log` VALUES (176, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:07:02');
INSERT INTO `sys_sql_log` VALUES (177, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 1, '2021-06-03 09:07:02');
INSERT INTO `sys_sql_log` VALUES (178, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 0, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (179, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 1, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (180, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765371) \r\nlimit 0,1', 0, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (181, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765371)', 1, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (182, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (183, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:07:04');
INSERT INTO `sys_sql_log` VALUES (184, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-06-03 09:12:44');
INSERT INTO `sys_sql_log` VALUES (185, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:12:44');
INSERT INTO `sys_sql_log` VALUES (186, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 13, '2021-06-03 09:12:45');
INSERT INTO `sys_sql_log` VALUES (187, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 1, '2021-06-03 09:12:45');
INSERT INTO `sys_sql_log` VALUES (188, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 2, '2021-06-03 09:12:45');
INSERT INTO `sys_sql_log` VALUES (189, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 3, '2021-06-03 09:12:46');
INSERT INTO `sys_sql_log` VALUES (190, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 0, '2021-06-03 09:12:46');
INSERT INTO `sys_sql_log` VALUES (191, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-03 09:12:47');
INSERT INTO `sys_sql_log` VALUES (192, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765381)', 1, '2021-06-03 09:12:47');
INSERT INTO `sys_sql_log` VALUES (193, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 2, '2021-06-03 09:12:47');
INSERT INTO `sys_sql_log` VALUES (194, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:12:47');
INSERT INTO `sys_sql_log` VALUES (195, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = trim(\'ceshi\')) \r\nlimit 0,1', 0, '2021-06-03 09:12:51');
INSERT INTO `sys_sql_log` VALUES (196, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (197, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (198, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765371) \r\nlimit 0,1', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (199, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765371)', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (200, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (201, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:13:03');
INSERT INTO `sys_sql_log` VALUES (202, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = trim(\'admin1\')) \r\nlimit 0,1', 0, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (203, 'sys_user', 'UPDATE `sys_user` SET `dept_id` = @p_0, `dept_name` = @p_1, `email` = @p_2, `gender` = @p_3, `is_super` = @p_4, `login_name` = @p_5, `mobile_phone` = @p_6, `pass_word` = @p_7, `remark` = @p_8, `role_id` = @p_9, `update_by` = @p_10, `update_time` = @p_11, `user_avatar` = @p_12, `user_status` = @p_13 \r\nWHERE (`id` = 138030650765371)', 37, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (204, 'sys_user_position', 'DELETE FROM `sys_user_position` WHERE (`user_id` = 138030650765371)', 0, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (205, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (206, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (207, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:13:06');
INSERT INTO `sys_sql_log` VALUES (208, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (209, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (210, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765371) \r\nlimit 0,1', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (211, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765371)', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (212, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (213, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:13:09');
INSERT INTO `sys_sql_log` VALUES (214, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = trim(\'admin\')) \r\nlimit 0,1', 0, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (215, 'sys_user', 'UPDATE `sys_user` SET `dept_id` = @p_0, `dept_name` = @p_1, `email` = @p_2, `gender` = @p_3, `is_super` = @p_4, `login_name` = @p_5, `mobile_phone` = @p_6, `pass_word` = @p_7, `remark` = @p_8, `role_id` = @p_9, `update_by` = @p_10, `update_time` = @p_11, `user_avatar` = @p_12, `user_status` = @p_13 \r\nWHERE (`id` = 138030650765371)', 31, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (216, 'sys_user_position', 'DELETE FROM `sys_user_position` WHERE (`user_id` = 138030650765371)', 0, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (217, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (218, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (219, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:13:11');
INSERT INTO `sys_sql_log` VALUES (220, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:13:13');
INSERT INTO `sys_sql_log` VALUES (221, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:13:13');
INSERT INTO `sys_sql_log` VALUES (222, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:13:13');
INSERT INTO `sys_sql_log` VALUES (223, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 1, '2021-06-03 09:14:15');
INSERT INTO `sys_sql_log` VALUES (224, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-03 09:14:16');
INSERT INTO `sys_sql_log` VALUES (225, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 7, '2021-06-03 09:14:16');
INSERT INTO `sys_sql_log` VALUES (226, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 2, '2021-06-03 09:14:16');
INSERT INTO `sys_sql_log` VALUES (227, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 2, '2021-06-03 09:14:16');
INSERT INTO `sys_sql_log` VALUES (228, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 3, '2021-06-03 09:14:20');
INSERT INTO `sys_sql_log` VALUES (229, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 0, '2021-06-03 09:14:20');
INSERT INTO `sys_sql_log` VALUES (230, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-03 09:14:21');
INSERT INTO `sys_sql_log` VALUES (231, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765381)', 1, '2021-06-03 09:14:21');
INSERT INTO `sys_sql_log` VALUES (232, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 1, '2021-06-03 09:14:21');
INSERT INTO `sys_sql_log` VALUES (233, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:14:21');
INSERT INTO `sys_sql_log` VALUES (234, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = trim(\'ceshi\')) \r\nlimit 0,1', 0, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (235, 'sys_user', 'UPDATE `sys_user` SET `dept_id` = @p_0, `dept_name` = @p_1, `email` = @p_2, `gender` = @p_3, `is_super` = @p_4, `login_name` = @p_5, `mobile_phone` = @p_6, `pass_word` = @p_7, `remark` = @p_8, `role_id` = @p_9, `update_by` = @p_10, `update_time` = @p_11, `user_avatar` = @p_12, `user_status` = @p_13 \r\nWHERE (`id` = 138030650765381)', 31, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (236, 'sys_user_position', 'DELETE FROM `sys_user_position` WHERE (`user_id` = 138030650765381)', 0, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (237, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (238, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (239, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:14:24');
INSERT INTO `sys_sql_log` VALUES (240, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (241, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (242, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (243, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765381)', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (244, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (245, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:14:29');
INSERT INTO `sys_sql_log` VALUES (246, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = trim(\'qqw\')) \r\nlimit 0,1', 0, '2021-06-03 09:14:36');
INSERT INTO `sys_sql_log` VALUES (247, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:14:41');
INSERT INTO `sys_sql_log` VALUES (248, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:14:41');
INSERT INTO `sys_sql_log` VALUES (249, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:14:41');
INSERT INTO `sys_sql_log` VALUES (250, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 10, '2021-06-03 09:16:06');
INSERT INTO `sys_sql_log` VALUES (251, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:16:06');
INSERT INTO `sys_sql_log` VALUES (252, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-06-03 09:16:07');
INSERT INTO `sys_sql_log` VALUES (253, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:16:07');
INSERT INTO `sys_sql_log` VALUES (254, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 1, '2021-06-03 09:16:07');
INSERT INTO `sys_sql_log` VALUES (255, 'sys_role', 'SELECT a.`id` as1, a.`role_name` as2 \r\nFROM `sys_role` a \r\nWHERE (a.`role_status` = 1) \r\nORDER BY a.`role_sort`', 0, '2021-06-03 09:16:09');
INSERT INTO `sys_sql_log` VALUES (256, 'sys_position', 'SELECT a.`id` as1, a.`post_name` as2 \r\nFROM `sys_position` a \r\nORDER BY a.`post_sort`', 1, '2021-06-03 09:16:09');
INSERT INTO `sys_sql_log` VALUES (257, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`id` = 138030650765378) \r\nlimit 0,1', 0, '2021-06-03 09:16:10');
INSERT INTO `sys_sql_log` VALUES (258, 'sys_user_position', 'SELECT a.`position_id` as1 \r\nFROM `sys_user_position` a \r\nWHERE (a.`user_id` = 138030650765378)', 1, '2021-06-03 09:16:10');
INSERT INTO `sys_sql_log` VALUES (259, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 1, '2021-06-03 09:16:10');
INSERT INTO `sys_sql_log` VALUES (260, 'sys_dept', 'SELECT a.`id` as1, a.`parent_id` as2, a.`dept_name` as3 \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 0, '2021-06-03 09:16:10');
INSERT INTO `sys_sql_log` VALUES (261, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:16:12');
INSERT INTO `sys_sql_log` VALUES (262, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:16:12');
INSERT INTO `sys_sql_log` VALUES (263, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:16:12');
INSERT INTO `sys_sql_log` VALUES (264, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 0, '2021-06-03 09:16:27');
INSERT INTO `sys_sql_log` VALUES (265, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:16:27');
INSERT INTO `sys_sql_log` VALUES (266, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-03 09:16:27');
INSERT INTO `sys_sql_log` VALUES (267, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 55, '2021-06-03 09:22:39');
INSERT INTO `sys_sql_log` VALUES (268, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-06-03 09:22:39');
INSERT INTO `sys_sql_log` VALUES (269, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 1, '2021-06-03 09:22:42');
INSERT INTO `sys_sql_log` VALUES (270, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 49, '2021-06-03 09:22:42');
INSERT INTO `sys_sql_log` VALUES (271, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 09:27:28');
INSERT INTO `sys_sql_log` VALUES (272, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 09:27:29');
INSERT INTO `sys_sql_log` VALUES (273, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 0, '2021-06-03 09:27:30');
INSERT INTO `sys_sql_log` VALUES (274, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 0, '2021-06-03 09:27:30');
INSERT INTO `sys_sql_log` VALUES (275, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-06-03 09:27:32');
INSERT INTO `sys_sql_log` VALUES (276, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 2, '2021-06-03 09:27:32');
INSERT INTO `sys_sql_log` VALUES (277, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'cms_ad\') \r\nlimit 0,1', 1, '2021-06-03 09:27:40');
INSERT INTO `sys_sql_log` VALUES (278, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'cms_ad\') \r\nORDER BY a.`sort_num`', 14, '2021-06-03 09:27:40');
INSERT INTO `sys_sql_log` VALUES (279, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-03 13:54:06');
INSERT INTO `sys_sql_log` VALUES (280, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-03 13:54:06');
INSERT INTO `sys_sql_log` VALUES (281, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 6, '2021-06-03 13:54:07');
INSERT INTO `sys_sql_log` VALUES (282, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-06-03 13:54:07');
INSERT INTO `sys_sql_log` VALUES (283, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 49, '2021-06-15 16:50:52');
INSERT INTO `sys_sql_log` VALUES (284, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = \'admin\' AND a.`pass_word` = \'admin@123\') \r\nlimit 0,1', 16, '2021-06-23 09:23:12');
INSERT INTO `sys_sql_log` VALUES (285, 'login_info', 'INSERT INTO `login_info`(`browser`, `device_info`, `login_message`, `login_name`, `login_status`, `osinfo`, `real_address`, `request_ip`, `request_time`) VALUES(@browser_0, @device_info_0, @login_message_0, @login_name_0, @login_status_0, @osinfo_0, @real_address_0, @request_ip_0, @request_time_0)', 40, '2021-06-23 09:23:12');
INSERT INTO `sys_sql_log` VALUES (286, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 38, '2021-06-23 09:23:12');
INSERT INTO `sys_sql_log` VALUES (287, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 21, '2021-06-23 09:23:13');
INSERT INTO `sys_sql_log` VALUES (288, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 26, '2021-06-23 09:23:16');
INSERT INTO `sys_sql_log` VALUES (289, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-23 09:23:16');
INSERT INTO `sys_sql_log` VALUES (290, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-06-23 09:41:04');
INSERT INTO `sys_sql_log` VALUES (291, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-23 09:41:04');
INSERT INTO `sys_sql_log` VALUES (292, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 8, '2021-06-23 09:41:16');
INSERT INTO `sys_sql_log` VALUES (293, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-23 09:41:16');
INSERT INTO `sys_sql_log` VALUES (294, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-06-23 00:00:00.000\')', 1, '2021-06-23 09:41:21');
INSERT INTO `sys_sql_log` VALUES (295, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-06-23 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 1, '2021-06-23 09:41:21');
INSERT INTO `sys_sql_log` VALUES (296, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0)', 27, '2021-06-23 09:41:21');
INSERT INTO `sys_sql_log` VALUES (297, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 1, '2021-06-23 09:41:21');
INSERT INTO `sys_sql_log` VALUES (298, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 19, '2021-06-23 09:41:27');
INSERT INTO `sys_sql_log` VALUES (299, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 2, '2021-06-23 09:41:27');
INSERT INTO `sys_sql_log` VALUES (300, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nlimit 0,1', 0, '2021-06-23 09:41:31');
INSERT INTO `sys_sql_log` VALUES (301, 'code_column', 'SELECT a.`id`, a.`can_null`, a.`column_name`, a.`comment`, a.`cstype`, a.`dbtype`, a.`max_length`, a.`is_identity`, a.`is_primary`, a.`sort_num`, a.`sync_time`, a.`table_name`, a.`type_text`, a.`type_text_full`, a.`update_time` \r\nFROM `code_column` a \r\nWHERE (a.`table_name` = \'fh_staff\') \r\nORDER BY a.`sort_num`', 15, '2021-06-23 09:41:31');
INSERT INTO `sys_sql_log` VALUES (302, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-06-23 09:41:46');
INSERT INTO `sys_sql_log` VALUES (303, 'sys_role', 'SELECT count(1) as1 \r\nFROM `sys_role` a', 17, '2021-06-23 09:41:48');
INSERT INTO `sys_sql_log` VALUES (304, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nORDER BY a.`role_sort` \r\nlimit 0,10', 2, '2021-06-23 09:41:48');
INSERT INTO `sys_sql_log` VALUES (305, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 1, '2021-06-23 09:41:49');
INSERT INTO `sys_sql_log` VALUES (306, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 3, '2021-06-23 09:41:49');
INSERT INTO `sys_sql_log` VALUES (307, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 0, '2021-06-23 09:41:49');
INSERT INTO `sys_sql_log` VALUES (308, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-23 09:44:03');
INSERT INTO `sys_sql_log` VALUES (309, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-23 09:44:03');
INSERT INTO `sys_sql_log` VALUES (310, 'sys_user', 'SELECT count(1) as1 \r\nFROM `sys_user` a', 8, '2021-06-23 09:44:04');
INSERT INTO `sys_sql_log` VALUES (311, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nORDER BY a.`is_super` DESC, a.`create_time` DESC \r\nlimit 0,10', 2, '2021-06-23 09:44:04');
INSERT INTO `sys_sql_log` VALUES (312, 'sys_role', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`remark`, a.`role_code`, a.`role_name`, a.`role_sort`, a.`role_status`, a.`role_super` \r\nFROM `sys_role` a \r\nWHERE (((a.`id`) in (138027723972677,1000985679938850816,1000985679938850816,138027723972674,1000985679938850816,1000985679938850816,1000985679938850816,1000985679938850816)))', 1, '2021-06-23 09:44:04');
INSERT INTO `sys_sql_log` VALUES (313, 'code_table', 'SELECT count(1) as1 \r\nFROM `code_table` a', 1, '2021-06-23 09:44:13');
INSERT INTO `sys_sql_log` VALUES (314, 'code_table', 'SELECT a.`id`, a.`db_name`, a.`remark`, a.`sync_time`, a.`table_name`, a.`entity_name`, a.`table_type`, a.`update_time` \r\nFROM `code_table` a \r\nORDER BY a.`update_time` DESC \r\nlimit 0,10', 1, '2021-06-23 09:44:13');
INSERT INTO `sys_sql_log` VALUES (315, 'sys_dept', 'SELECT a.`id`, a.`ancestors`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_name`, a.`dept_status`, a.`dept_type`, a.`email`, a.`leader`, a.`leader_id`, a.`order_num`, a.`parent_id`, a.`phone`, a.`update_by`, a.`update_time`, a.`remark` \r\nFROM `sys_dept` a \r\nORDER BY a.`order_num`', 2, '2021-06-23 09:44:17');
INSERT INTO `sys_sql_log` VALUES (316, 'sys_position', 'SELECT count(1) as1 \r\nFROM `sys_position` a', 1, '2021-06-23 09:44:18');
INSERT INTO `sys_sql_log` VALUES (317, 'sys_position', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`post_code`, a.`post_name`, a.`post_sort`, a.`post_status`, a.`remark`, a.`update_by`, a.`update_time` \r\nFROM `sys_position` a \r\nORDER BY a.`id` \r\nlimit 0,10', 1, '2021-06-23 09:44:18');
INSERT INTO `sys_sql_log` VALUES (318, 'cms_site', 'SELECT a.`id`, a.`site_name`, a.`site_logo`, a.`site_favicon`, a.`site_url`, a.`site_title`, a.`site_keyword`, a.`site_description`, a.`site_copyright`, a.`site_icp` \r\nFROM `cms_site` a \r\nORDER BY a.`id` \r\nlimit 0,1', 1, '2021-06-23 09:44:19');
INSERT INTO `sys_sql_log` VALUES (319, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0)', 16, '2021-06-23 09:53:10');
INSERT INTO `sys_sql_log` VALUES (320, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 1, '2021-06-23 09:53:10');
INSERT INTO `sys_sql_log` VALUES (321, 'sys_dictionary', 'SELECT a.`id` as1, a.`dic_name` as2 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 0) \r\nORDER BY a.`sort_num`', 4, '2021-06-23 09:53:11');
INSERT INTO `sys_sql_log` VALUES (322, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381)', 0, '2021-06-23 09:53:12');
INSERT INTO `sys_sql_log` VALUES (323, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 0, '2021-06-23 09:53:12');
INSERT INTO `sys_sql_log` VALUES (324, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:13');
INSERT INTO `sys_sql_log` VALUES (325, 'sys_dictionary', 'SELECT a.`dic_code` as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:28');
INSERT INTO `sys_sql_log` VALUES (326, 'sys_dictionary', 'INSERT INTO `sys_dictionary`(`create_person`, `create_time`, `dic_code`, `dic_name`, `dic_value`, `id`, `parent_id`, `remark`, `sort_num`) VALUES(@create_person_0, @create_time_0, @dic_code_0, @dic_name_0, @dic_value_0, @id_0, @parent_id_0, @remark_0, @sort_num_0)', 37, '2021-06-23 09:53:28');
INSERT INTO `sys_sql_log` VALUES (327, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381)', 0, '2021-06-23 09:53:28');
INSERT INTO `sys_sql_log` VALUES (328, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 0, '2021-06-23 09:53:28');
INSERT INTO `sys_sql_log` VALUES (329, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:39');
INSERT INTO `sys_sql_log` VALUES (330, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 173047831998533) \r\nlimit 0,1', 0, '2021-06-23 09:53:39');
INSERT INTO `sys_sql_log` VALUES (331, 'sys_dictionary', 'SELECT a.`dic_code` as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:43');
INSERT INTO `sys_sql_log` VALUES (332, 'sys_dictionary', 'UPDATE `sys_dictionary` SET `dic_code` = @p_0, `dic_name` = @p_1, `dic_value` = @p_2, `parent_id` = @p_3, `remark` = @p_4, `sort_num` = @p_5 \r\nWHERE (`id` = 173047831998533)', 38, '2021-06-23 09:53:43');
INSERT INTO `sys_sql_log` VALUES (333, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381)', 0, '2021-06-23 09:53:44');
INSERT INTO `sys_sql_log` VALUES (334, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 0, '2021-06-23 09:53:44');
INSERT INTO `sys_sql_log` VALUES (335, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:46');
INSERT INTO `sys_sql_log` VALUES (336, 'sys_dictionary', 'SELECT a.`dic_code` as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`id` = 138030650765381) \r\nlimit 0,1', 0, '2021-06-23 09:53:55');
INSERT INTO `sys_sql_log` VALUES (337, 'sys_dictionary', 'INSERT INTO `sys_dictionary`(`create_person`, `create_time`, `dic_code`, `dic_name`, `dic_value`, `id`, `parent_id`, `remark`, `sort_num`) VALUES(@create_person_0, @create_time_0, @dic_code_0, @dic_name_0, @dic_value_0, @id_0, @parent_id_0, @remark_0, @sort_num_0)', 47, '2021-06-23 09:53:55');
INSERT INTO `sys_sql_log` VALUES (338, 'sys_dictionary', 'SELECT count(1) as1 \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381)', 0, '2021-06-23 09:53:55');
INSERT INTO `sys_sql_log` VALUES (339, 'sys_dictionary', 'SELECT a.`create_person`, a.`create_time`, a.`dic_code`, a.`dic_name`, a.`dic_value`, a.`id`, a.`parent_id`, a.`remark`, a.`sort_num` \r\nFROM `sys_dictionary` a \r\nWHERE (a.`parent_id` = 138030650765381) \r\nORDER BY a.`sort_num` \r\nlimit 0,10', 0, '2021-06-23 09:53:55');
INSERT INTO `sys_sql_log` VALUES (340, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = \'admin\' AND a.`pass_word` = \'admin@123\') \r\nlimit 0,1', 37, '2021-06-24 09:19:26');
INSERT INTO `sys_sql_log` VALUES (341, 'login_info', 'INSERT INTO `login_info`(`browser`, `device_info`, `login_message`, `login_name`, `login_status`, `osinfo`, `real_address`, `request_ip`, `request_time`) VALUES(@browser_0, @device_info_0, @login_message_0, @login_name_0, @login_status_0, @osinfo_0, @real_address_0, @request_ip_0, @request_time_0)', 49, '2021-06-24 09:19:26');
INSERT INTO `sys_sql_log` VALUES (342, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 28, '2021-06-24 09:19:26');
INSERT INTO `sys_sql_log` VALUES (343, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 27, '2021-06-24 09:19:27');
INSERT INTO `sys_sql_log` VALUES (344, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-06-24 09:23:18');
INSERT INTO `sys_sql_log` VALUES (345, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-24 09:23:18');
INSERT INTO `sys_sql_log` VALUES (346, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 9, '2021-06-24 09:23:23');
INSERT INTO `sys_sql_log` VALUES (347, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 1, '2021-06-24 09:23:23');
INSERT INTO `sys_sql_log` VALUES (348, 'login_info', 'DELETE FROM `login_info` WHERE (((`id`) in (41)))', 57, '2021-06-24 09:23:37');
INSERT INTO `sys_sql_log` VALUES (349, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 0, '2021-06-24 09:23:37');
INSERT INTO `sys_sql_log` VALUES (350, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:23:37');
INSERT INTO `sys_sql_log` VALUES (351, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 0, '2021-06-24 09:23:40');
INSERT INTO `sys_sql_log` VALUES (352, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:23:40');
INSERT INTO `sys_sql_log` VALUES (353, 'sys_user', 'SELECT a.`id`, a.`create_by`, a.`create_time`, a.`del_flag`, a.`dept_id`, a.`dept_name`, a.`email`, a.`gender`, a.`is_super`, a.`login_name`, a.`mobile_phone`, a.`pass_word`, a.`remark`, a.`role_id`, a.`update_by`, a.`update_time`, a.`user_avatar`, a.`user_name`, a.`user_status` \r\nFROM `sys_user` a \r\nWHERE (a.`login_name` = \'admin\' AND a.`pass_word` = \'admin@123\') \r\nlimit 0,1', 2, '2021-06-24 09:23:50');
INSERT INTO `sys_sql_log` VALUES (354, 'login_info', 'INSERT INTO `login_info`(`browser`, `device_info`, `login_message`, `login_name`, `login_status`, `osinfo`, `real_address`, `request_ip`, `request_time`) VALUES(@browser_0, @device_info_0, @login_message_0, @login_name_0, @login_status_0, @osinfo_0, @real_address_0, @request_ip_0, @request_time_0)', 37, '2021-06-24 09:23:50');
INSERT INTO `sys_sql_log` VALUES (355, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 0, '2021-06-24 09:23:50');
INSERT INTO `sys_sql_log` VALUES (356, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-24 09:23:50');
INSERT INTO `sys_sql_log` VALUES (357, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 0, '2021-06-24 09:23:56');
INSERT INTO `sys_sql_log` VALUES (358, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:23:56');
INSERT INTO `sys_sql_log` VALUES (359, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 15, '2021-06-24 09:24:07');
INSERT INTO `sys_sql_log` VALUES (360, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-24 09:24:07');
INSERT INTO `sys_sql_log` VALUES (361, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 2, '2021-06-24 09:24:14');
INSERT INTO `sys_sql_log` VALUES (362, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:14');
INSERT INTO `sys_sql_log` VALUES (363, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nWHERE (a.`id` = \'5eaabde6c1a509138ce04e80\') \r\nlimit 0,1', 0, '2021-06-24 09:24:22');
INSERT INTO `sys_sql_log` VALUES (364, 'hangfire_task', 'UPDATE `hangfire_task` SET `excute_status` = @p_0 \r\nWHERE (`id` = \'5eaabde6c1a509138ce04e80\')', 118, '2021-06-24 09:24:22');
INSERT INTO `sys_sql_log` VALUES (365, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 09:24:22');
INSERT INTO `sys_sql_log` VALUES (366, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:22');
INSERT INTO `sys_sql_log` VALUES (367, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 1, '2021-06-24 09:24:24');
INSERT INTO `sys_sql_log` VALUES (368, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:24');
INSERT INTO `sys_sql_log` VALUES (369, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 1, '2021-06-24 09:24:29');
INSERT INTO `sys_sql_log` VALUES (370, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:29');
INSERT INTO `sys_sql_log` VALUES (371, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:31');
INSERT INTO `sys_sql_log` VALUES (372, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:31');
INSERT INTO `sys_sql_log` VALUES (373, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:33');
INSERT INTO `sys_sql_log` VALUES (374, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:33');
INSERT INTO `sys_sql_log` VALUES (375, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:34');
INSERT INTO `sys_sql_log` VALUES (376, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:34');
INSERT INTO `sys_sql_log` VALUES (377, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:34');
INSERT INTO `sys_sql_log` VALUES (378, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:34');
INSERT INTO `sys_sql_log` VALUES (379, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:35');
INSERT INTO `sys_sql_log` VALUES (380, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:35');
INSERT INTO `sys_sql_log` VALUES (381, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:36');
INSERT INTO `sys_sql_log` VALUES (382, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:36');
INSERT INTO `sys_sql_log` VALUES (383, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:37');
INSERT INTO `sys_sql_log` VALUES (384, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:37');
INSERT INTO `sys_sql_log` VALUES (385, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 09:24:37');
INSERT INTO `sys_sql_log` VALUES (386, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:24:37');
INSERT INTO `sys_sql_log` VALUES (387, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 31, '2021-06-24 09:24:37');
INSERT INTO `sys_sql_log` VALUES (388, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 1, '2021-06-24 09:25:55');
INSERT INTO `sys_sql_log` VALUES (389, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 09:25:55');
INSERT INTO `sys_sql_log` VALUES (390, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-06-24 10:02:18');
INSERT INTO `sys_sql_log` VALUES (391, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-24 10:02:19');
INSERT INTO `sys_sql_log` VALUES (392, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 25, '2021-06-24 10:02:22');
INSERT INTO `sys_sql_log` VALUES (393, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-24 10:02:22');
INSERT INTO `sys_sql_log` VALUES (394, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 1, '2021-06-24 10:02:26');
INSERT INTO `sys_sql_log` VALUES (395, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 1, '2021-06-24 10:02:26');
INSERT INTO `sys_sql_log` VALUES (396, 'crontab_history', 'DELETE FROM `crontab_history` WHERE (`job_id` = \'5eaabde6c1a509138ce04e80\')', 27, '2021-06-24 10:02:29');
INSERT INTO `sys_sql_log` VALUES (397, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:02:29');
INSERT INTO `sys_sql_log` VALUES (398, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:02:29');
INSERT INTO `sys_sql_log` VALUES (399, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 36, '2021-06-24 10:02:37');
INSERT INTO `sys_sql_log` VALUES (400, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 10:02:47');
INSERT INTO `sys_sql_log` VALUES (401, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:02:47');
INSERT INTO `sys_sql_log` VALUES (402, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 25, '2021-06-24 10:02:52');
INSERT INTO `sys_sql_log` VALUES (403, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 2, '2021-06-24 10:02:53');
INSERT INTO `sys_sql_log` VALUES (404, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:02:53');
INSERT INTO `sys_sql_log` VALUES (405, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:02:59');
INSERT INTO `sys_sql_log` VALUES (406, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:02:59');
INSERT INTO `sys_sql_log` VALUES (407, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:01');
INSERT INTO `sys_sql_log` VALUES (408, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:01');
INSERT INTO `sys_sql_log` VALUES (409, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (410, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (411, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (412, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (413, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (414, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:02');
INSERT INTO `sys_sql_log` VALUES (415, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 24, '2021-06-24 10:03:07');
INSERT INTO `sys_sql_log` VALUES (416, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (417, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (418, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (419, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (420, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (421, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:12');
INSERT INTO `sys_sql_log` VALUES (422, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:13');
INSERT INTO `sys_sql_log` VALUES (423, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:13');
INSERT INTO `sys_sql_log` VALUES (424, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:17');
INSERT INTO `sys_sql_log` VALUES (425, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:17');
INSERT INTO `sys_sql_log` VALUES (426, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:21');
INSERT INTO `sys_sql_log` VALUES (427, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:21');
INSERT INTO `sys_sql_log` VALUES (428, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 44, '2021-06-24 10:03:37');
INSERT INTO `sys_sql_log` VALUES (429, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:03:47');
INSERT INTO `sys_sql_log` VALUES (430, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:03:47');
INSERT INTO `sys_sql_log` VALUES (431, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 35, '2021-06-24 10:04:07');
INSERT INTO `sys_sql_log` VALUES (432, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 35, '2021-06-24 10:04:22');
INSERT INTO `sys_sql_log` VALUES (433, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0), (@job_id_1, @excute_time_1, @excute_result_1, @elapsed_time_1, @error_message_1)', 39, '2021-06-24 10:05:07');
INSERT INTO `sys_sql_log` VALUES (434, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 2, '2021-06-24 10:06:17');
INSERT INTO `sys_sql_log` VALUES (435, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:06:17');
INSERT INTO `sys_sql_log` VALUES (436, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 38, '2021-06-24 10:09:54');
INSERT INTO `sys_sql_log` VALUES (437, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 41, '2021-06-24 10:10:39');
INSERT INTO `sys_sql_log` VALUES (438, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-24 10:13:52');
INSERT INTO `sys_sql_log` VALUES (439, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-24 10:13:53');
INSERT INTO `sys_sql_log` VALUES (440, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 10, '2021-06-24 10:14:21');
INSERT INTO `sys_sql_log` VALUES (441, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-24 10:14:21');
INSERT INTO `sys_sql_log` VALUES (442, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 10:14:26');
INSERT INTO `sys_sql_log` VALUES (443, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:14:26');
INSERT INTO `sys_sql_log` VALUES (444, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 261, '2021-06-24 10:15:50');
INSERT INTO `sys_sql_log` VALUES (445, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 20, '2021-06-24 10:20:36');
INSERT INTO `sys_sql_log` VALUES (446, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-24 10:20:37');
INSERT INTO `sys_sql_log` VALUES (447, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 11, '2021-06-24 10:20:37');
INSERT INTO `sys_sql_log` VALUES (448, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 1, '2021-06-24 10:20:37');
INSERT INTO `sys_sql_log` VALUES (449, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 79, '2021-06-24 10:20:39');
INSERT INTO `sys_sql_log` VALUES (450, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:20:39');
INSERT INTO `sys_sql_log` VALUES (451, 'login_info', 'SELECT count(1) as1 \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\')', 2, '2021-06-24 10:20:44');
INSERT INTO `sys_sql_log` VALUES (452, 'login_info', 'SELECT a.`id`, a.`browser`, a.`device_info`, a.`login_message`, a.`login_name`, a.`login_status`, a.`osinfo`, a.`real_address`, a.`request_ip`, a.`request_time` \r\nFROM `login_info` a \r\nWHERE (a.`request_time` > \'2021-05-24 00:00:00.000\' AND a.`request_time` < \'2021-06-25 00:00:00.000\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:20:44');
INSERT INTO `sys_sql_log` VALUES (453, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 10:20:57');
INSERT INTO `sys_sql_log` VALUES (454, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:20:57');
INSERT INTO `sys_sql_log` VALUES (455, 'crontab_history', 'INSERT INTO `crontab_history`(`job_id`, `excute_time`, `excute_result`, `elapsed_time`, `error_message`) VALUES(@job_id_0, @excute_time_0, @excute_result_0, @elapsed_time_0, @error_message_0)', 25, '2021-06-24 10:21:10');
INSERT INTO `sys_sql_log` VALUES (456, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 0, '2021-06-24 10:21:25');
INSERT INTO `sys_sql_log` VALUES (457, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:21:25');
INSERT INTO `sys_sql_log` VALUES (458, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 3, '2021-06-24 10:25:12');
INSERT INTO `sys_sql_log` VALUES (459, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 1, '2021-06-24 10:25:13');
INSERT INTO `sys_sql_log` VALUES (460, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 10:25:19');
INSERT INTO `sys_sql_log` VALUES (461, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:25:19');
INSERT INTO `sys_sql_log` VALUES (462, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 1, '2021-06-24 10:25:24');
INSERT INTO `sys_sql_log` VALUES (463, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:25:24');
INSERT INTO `sys_sql_log` VALUES (464, 'sys_menu', 'SELECT a.`id`, a.`create_person`, a.`create_time`, a.`iframe`, a.`menu_icon`, a.`menu_level`, a.`menu_name`, a.`menu_sort`, a.`menu_type`, a.`menu_url`, a.`parent_id`, a.`remark`, a.`role_tag` \r\nFROM `sys_menu` a \r\nORDER BY a.`menu_sort`', 2, '2021-06-24 10:26:50');
INSERT INTO `sys_sql_log` VALUES (465, 'sys_menu', 'SELECT a.`id` as1, a.`create_person` as2, a.`create_time` as3, a.`iframe` as4, a.`menu_icon` as5, a.`menu_level` as6, a.`menu_name` as7, a.`menu_sort` as8, a.`menu_type` as9, a.`menu_url` as10, a.`parent_id` as11, a.`remark` as12, a.`role_tag` as13 \r\nFROM `sys_menu` a \r\nINNER JOIN `sys_role_authorize` b ON a.`id` = b.`menu_id` \r\nWHERE (b.`role_id` = 0 AND a.`role_tag` <> \'#\')', 0, '2021-06-24 10:26:50');
INSERT INTO `sys_sql_log` VALUES (466, 'hangfire_task', 'SELECT count(1) as1 \r\nFROM `hangfire_task` a', 0, '2021-06-24 10:26:51');
INSERT INTO `sys_sql_log` VALUES (467, 'hangfire_task', 'SELECT a.`id`, a.`task_name`, a.`assembly_namespace`, a.`class_name`, a.`cron_express`, a.`excute_time`, a.`remark`, a.`excute_status` \r\nFROM `hangfire_task` a \r\nORDER BY a.`excute_status` DESC, a.`excute_time` DESC \r\nlimit 0,10', 0, '2021-06-24 10:26:51');
INSERT INTO `sys_sql_log` VALUES (468, 'crontab_history', 'SELECT count(1) as1 \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\')', 1, '2021-06-24 10:26:52');
INSERT INTO `sys_sql_log` VALUES (469, 'crontab_history', 'SELECT a.`id`, a.`job_id`, a.`excute_time`, a.`excute_result`, a.`elapsed_time`, a.`error_message` \r\nFROM `crontab_history` a \r\nWHERE (a.`job_id` = \'5eaabde6c1a509138ce04e80\') \r\nORDER BY a.`id` DESC \r\nlimit 0,10', 0, '2021-06-24 10:26:52');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录账号',
  `pass_word` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `gender` int(1) NOT NULL COMMENT '用户性别（1男 0女 2未知）',
  `is_super` int(1) NOT NULL COMMENT '是否是超管(0-不是，1-是)',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `dept_id` int(11) NOT NULL DEFAULT 0 COMMENT '部门',
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_status` int(1) NOT NULL DEFAULT 0 COMMENT '账号状态(0-正常，1-禁用)',
  `del_flag` int(1) NOT NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime(3) NOT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (138030650765371, 'admin', 'admin@123', '管理员122', '15961820351', 'admin2@fofia.com', 1, 1, 0, 0, '', '', NULL, 1, 0, 'admin', '2017-08-30 10:36:57.803', 'admin', '2021-06-03 09:13:11');
INSERT INTO `sys_user` VALUES (138030650765372, 'pxw', '123123', '浦总', '18012388691', 'pxw@fofia.com', 1, 0, 1000985679938850816, 101, '江苏真源网络服务有限公司', '/ui/images/profile.jpg', '', 1, 0, 'admin', '2020-01-06 16:28:59.650', 'admin', '2021-02-27 15:22:05');
INSERT INTO `sys_user` VALUES (138030650765373, 'cxq', '123123', '陈总', '', 'cxq@fofia.com', 1, 0, 1000985679938850816, 104, '无锡源致科技', '/ui/images/profile.jpg', '备注', 1, 0, 'admin', '2020-05-10 17:33:53.332', 'admin', '2021-02-27 15:21:58');
INSERT INTO `sys_user` VALUES (138030650765374, 'lyy', '123456', '罗总', '15961820351', 'lyy@fofia.com', 1, 0, 1000985679938850816, 100, '无锡市富华科技', '/ui/images/profile.jpg', '备注事实上111', 1, 0, 'yushuo', '2021-02-01 11:28:17.561', 'admin', '2021-03-12 13:50:27');
INSERT INTO `sys_user` VALUES (138030650765375, 'phh', '123123', '潘总', '13861451731', 'pdd@fofia.com', 1, 0, 1000985679938850816, 101, '江苏真源网络服务有限公司', '/ui/images/profile.jpg', '备注', 1, 0, 'admin', '2021-02-26 16:52:12.934', 'admin', '2021-02-27 15:21:28');
INSERT INTO `sys_user` VALUES (138030650765376, 'yushuo', '123123', '于硕', '15961820351', '461733078@qq.com', 1, 0, 138027723972674, 107, '技术部', '/ui/images/profile.jpg', '于硕', 1, 0, 'admin', '2021-02-26 17:04:29.137', 'admin', '2021-04-23 10:19:11');
INSERT INTO `sys_user` VALUES (138030650765377, 'qqw', '123456', '曲奇伟', '', 'qqw@fofia.com', 1, 0, 1000985679938850816, 3, '硬件研发部', '/ui/images/profile.jpg', '曲奇伟', 1, 0, 'admin', '2021-02-26 17:06:00.296', 'admin', '2021-02-27 15:21:36');
INSERT INTO `sys_user` VALUES (138030650765378, 'mdf', '123123', '毛总', '', 'mdf@fofia.com', 1, 0, 1000985679938850816, 105, '江苏真源科技', '/ui/images/profile.jpg', '毛东方', 1, 0, 'admin', '2021-02-26 17:06:28.377', 'admin', '2021-03-02 13:57:34');
INSERT INTO `sys_user` VALUES (138030650765381, 'ceshi', '123456', '于硕', '15961820351', '', 1, 0, 138027723972677, 0, '', '', NULL, 1, 0, 'admin', '2021-03-16 11:08:11.368', 'admin', '2021-06-03 09:14:24');

-- ----------------------------
-- Table structure for sys_user_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_position`;
CREATE TABLE `sys_user_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `position_id` bigint(20) NOT NULL COMMENT '职位id',
  `create_time` datetime(0) NOT NULL,
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`user_id`, `position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_validate_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_validate_code`;
CREATE TABLE `sys_validate_code`  (
  `id` bigint(20) NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validate_type` int(11) NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_validate_code
-- ----------------------------

-- ----------------------------
-- Table structure for work_address_book
-- ----------------------------
DROP TABLE IF EXISTS `work_address_book`;
CREATE TABLE `work_address_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dept_id` int(11) NOT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `work_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `work_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inner_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_num` int(10) NOT NULL,
  `insert_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_address_book
-- ----------------------------
INSERT INTO `work_address_book` VALUES (1, '于硕', 2, '后桥派出所', '', '技术经理', '461733078@qq.com', '15961820351', '无锡市新吴区天安智慧城', '江苏真源网络服务有限公司', 10, '2020-06-10 16:03:54');

-- ----------------------------
-- Table structure for work_notice
-- ----------------------------
DROP TABLE IF EXISTS `work_notice`;
CREATE TABLE `work_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `n_time` datetime(0) NOT NULL,
  `n_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `insert_time` datetime(0) NOT NULL,
  `insert_id` bigint(20) NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_depts` int(10) NOT NULL,
  `received_count` int(255) NOT NULL,
  `dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_notice
-- ----------------------------
INSERT INTO `work_notice` VALUES (2, '新的回忆', '2020-06-10 10:52:51', '<p>这是回忆内容 你们看好了啊</p>', '2020-06-10 10:53:04', 11297175912976384, NULL, 3, 0, '1,2,3');

-- ----------------------------
-- Table structure for work_notice_reply
-- ----------------------------
DROP TABLE IF EXISTS `work_notice_reply`;
CREATE TABLE `work_notice_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_time` datetime(0) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_notice_reply
-- ----------------------------
INSERT INTO `work_notice_reply` VALUES (7, 2, 0, '', '1753-01-01 00:00:00', 1, '锡山区公安分局', 0);
INSERT INTO `work_notice_reply` VALUES (8, 2, 0, '', '1753-01-01 00:00:00', 2, '后桥派出所', 0);
INSERT INTO `work_notice_reply` VALUES (9, 2, 0, '', '1753-01-01 00:00:00', 3, '云林派出所', 0);

SET FOREIGN_KEY_CHECKS = 1;
