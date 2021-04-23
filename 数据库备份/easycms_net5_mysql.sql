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

 Date: 23/04/2021 16:00:03
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
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
-- Table structure for cms_template_match
-- ----------------------------
DROP TABLE IF EXISTS `cms_template_match`;
CREATE TABLE `cms_template_match`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `channel_template_id` int(11) NOT NULL,
  `content_template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_template_match
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easy_log
-- ----------------------------
INSERT INTO `easy_log` VALUES (1, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 15:18:20');
INSERT INTO `easy_log` VALUES (2, '日志信息', '渲染内容页耗时：152 ms', 1, '2021-04-22 15:18:20');
INSERT INTO `easy_log` VALUES (3, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Web.ApiControllers.UploadController.SaveChunkFile() in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Web\\ApiControllers\\UploadController.cs:line 219\r\n   at lambda_method782(Closure , Object , Object[] )\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextExceptionFilterAsync>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)', 4, '2021-04-22 15:33:04');
INSERT INTO `easy_log` VALUES (4, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 15:41:27');
INSERT INTO `easy_log` VALUES (5, '日志信息', '渲染内容页耗时：223 ms', 1, '2021-04-22 15:41:27');
INSERT INTO `easy_log` VALUES (6, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 15:52:49');
INSERT INTO `easy_log` VALUES (7, '日志信息', '渲染内容页耗时：165 ms', 1, '2021-04-22 15:52:49');
INSERT INTO `easy_log` VALUES (8, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 15:56:21');
INSERT INTO `easy_log` VALUES (9, '日志信息', '渲染内容页耗时：143 ms', 1, '2021-04-22 15:56:21');
INSERT INTO `easy_log` VALUES (10, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 16:09:47');
INSERT INTO `easy_log` VALUES (11, '日志信息', '渲染内容页耗时：138 ms', 1, '2021-04-22 16:09:47');
INSERT INTO `easy_log` VALUES (12, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-22 16:22:40');
INSERT INTO `easy_log` VALUES (13, '日志信息', '渲染内容页耗时：12 ms', 1, '2021-04-22 16:22:40');
INSERT INTO `easy_log` VALUES (14, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:00:15');
INSERT INTO `easy_log` VALUES (15, '日志信息', '渲染内容页耗时：148 ms', 1, '2021-04-23 09:00:15');
INSERT INTO `easy_log` VALUES (16, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:00:37');
INSERT INTO `easy_log` VALUES (17, '日志信息', '渲染内容页耗时：2 ms', 1, '2021-04-23 09:00:37');
INSERT INTO `easy_log` VALUES (18, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:00:40');
INSERT INTO `easy_log` VALUES (19, '日志信息', '渲染内容页耗时：1 ms', 1, '2021-04-23 09:00:40');
INSERT INTO `easy_log` VALUES (20, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:00:46');
INSERT INTO `easy_log` VALUES (21, '日志信息', '渲染内容页耗时：1 ms', 1, '2021-04-23 09:00:46');
INSERT INTO `easy_log` VALUES (22, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:00:52');
INSERT INTO `easy_log` VALUES (23, '日志信息', '渲染内容页耗时：1 ms', 1, '2021-04-23 09:00:52');
INSERT INTO `easy_log` VALUES (24, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:10:50');
INSERT INTO `easy_log` VALUES (25, '日志信息', '渲染内容页耗时：5 ms', 1, '2021-04-23 09:10:50');
INSERT INTO `easy_log` VALUES (26, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:12:53');
INSERT INTO `easy_log` VALUES (27, '日志信息', '渲染内容页耗时：6 ms', 1, '2021-04-23 09:12:53');
INSERT INTO `easy_log` VALUES (28, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 09:23:36');
INSERT INTO `easy_log` VALUES (29, '日志信息', '渲染内容页耗时：5 ms', 1, '2021-04-23 09:23:36');
INSERT INTO `easy_log` VALUES (30, '日志信息', '渲染内容页耗时：9 ms', 1, '2021-04-23 09:28:31');
INSERT INTO `easy_log` VALUES (31, '日志信息', '渲染内容页耗时：128 ms', 1, '2021-04-23 09:30:37');
INSERT INTO `easy_log` VALUES (32, '日志信息', '渲染内容页耗时：2 ms', 1, '2021-04-23 09:30:57');
INSERT INTO `easy_log` VALUES (33, '日志信息', '渲染内容页耗时：127 ms', 1, '2021-04-23 09:34:34');
INSERT INTO `easy_log` VALUES (34, '日志信息', '渲染内容页耗时：128 ms', 1, '2021-04-23 09:37:15');
INSERT INTO `easy_log` VALUES (35, '日志信息', '渲染内容页耗时：133 ms', 1, '2021-04-23 09:38:14');
INSERT INTO `easy_log` VALUES (36, '日志信息', '渲染内容页耗时：5 ms', 1, '2021-04-23 09:47:35');
INSERT INTO `easy_log` VALUES (37, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 10:17:58');
INSERT INTO `easy_log` VALUES (38, '日志信息', '渲染内容页耗时：41 ms', 1, '2021-04-23 10:17:58');
INSERT INTO `easy_log` VALUES (39, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 10:17:59');
INSERT INTO `easy_log` VALUES (40, '日志信息', '渲染内容页耗时：1 ms', 1, '2021-04-23 10:17:59');
INSERT INTO `easy_log` VALUES (41, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 10:18:48');
INSERT INTO `easy_log` VALUES (42, '日志信息', '渲染内容页耗时：1 ms', 1, '2021-04-23 10:18:48');
INSERT INTO `easy_log` VALUES (43, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 10:18:49');
INSERT INTO `easy_log` VALUES (44, '日志信息', '渲染内容页耗时：3 ms', 1, '2021-04-23 10:18:49');
INSERT INTO `easy_log` VALUES (45, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.GenerateService.GenerateHtml(Int32 contentId, Int32 channelId, Int32 channelPage) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\GenerateService.cs:line 72', 4, '2021-04-23 14:50:39');
INSERT INTO `easy_log` VALUES (46, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 14:53:12');
INSERT INTO `easy_log` VALUES (47, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 14:57:02');
INSERT INTO `easy_log` VALUES (48, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 14:57:03');
INSERT INTO `easy_log` VALUES (49, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:05:16');
INSERT INTO `easy_log` VALUES (50, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:05:17');
INSERT INTO `easy_log` VALUES (51, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:15:26');
INSERT INTO `easy_log` VALUES (52, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:15:30');
INSERT INTO `easy_log` VALUES (53, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:15:31');
INSERT INTO `easy_log` VALUES (54, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:17:39');
INSERT INTO `easy_log` VALUES (55, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:21:20');
INSERT INTO `easy_log` VALUES (56, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:42:02');
INSERT INTO `easy_log` VALUES (57, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:42:56');
INSERT INTO `easy_log` VALUES (58, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:43:05');
INSERT INTO `easy_log` VALUES (59, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 22', 4, '2021-04-23 15:43:10');
INSERT INTO `easy_log` VALUES (60, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:47:02');
INSERT INTO `easy_log` VALUES (61, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:47:41');
INSERT INTO `easy_log` VALUES (62, 'Object reference not set to an instance of an object.', 'System.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Atlass.Framework.Generate.HtmlPlayerHandler.CreateVideo(String html) in E:\\开源\\Atlass开发框架\\EasyCMS\\Atlass.Framework.Generate\\Common\\HtmlPlayerHandler.cs:line 19', 4, '2021-04-23 15:51:45');

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_product
-- ----------------------------
INSERT INTO `fh_product` VALUES (1, 'PT289', 1, '2021-03-30 11:25:54', 'admin', 0, '备注');
INSERT INTO `fh_product` VALUES (2, '调配工时', 2, '2021-03-30 11:40:06', 'admin', 1, '独立计算');

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
INSERT INTO `fh_product_process` VALUES (142989528420421, 1, '镭刻', 1, 3000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (142989528424517, 1, '打胶', 2, 5000, 0, 0.0);
INSERT INTO `fh_product_process` VALUES (142993017999429, 2, '调配工时', 1, 0, 1, 1.5);

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
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_staff`(`staff_id`, `work_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fh_time_bill
-- ----------------------------
INSERT INTO `fh_time_bill` VALUES (143323429118021, 3, '于硕', 1, 100.0, '2021-03-31 00:00:00', 1, 'admin', '2021-03-31 10:04:34', 'admin', '2021-03-31 10:04:34', '嘿嘿');
INSERT INTO `fh_time_bill` VALUES (143323952558149, 2, '蒲华磊', 1553, 0.0, '2021-03-31 00:00:00', 0, 'admin', '2021-03-31 10:06:41', 'admin', '2021-03-31 10:06:41', NULL);
INSERT INTO `fh_time_bill` VALUES (143324256452677, 1, '蒲晓渝', 2765, 0.0, '2021-03-31 00:00:00', 0, 'admin', '2021-03-31 10:07:56', 'admin', '2021-03-31 10:07:56', '哈哈');
INSERT INTO `fh_time_bill` VALUES (143341757521989, 3, '于硕', 10000, 0.0, '2021-03-30 00:00:00', 0, 'admin', '2021-03-31 11:19:08', 'admin', '2021-03-31 11:19:08', '哈哈');

-- ----------------------------
-- Table structure for fh_time_process
-- ----------------------------
DROP TABLE IF EXISTS `fh_time_process`;
CREATE TABLE `fh_time_process`  (
  `id` bigint(20) NOT NULL,
  `bill_id` bigint(11) NOT NULL COMMENT '工时表Id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `process_id` bigint(20) NOT NULL COMMENT '工序id',
  `process_type` int(255) NOT NULL COMMENT '0-产品，1-调配工时',
  `work_num` int(11) NOT NULL COMMENT '实际配额数量',
  `deploy_hour` decimal(5, 1) NOT NULL COMMENT '调配工时',
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
INSERT INTO `fh_time_process` VALUES (143316198641733, 143316198576197, 1, 142989528420421, 0, 3000, 0.0, 1, '2021-03-31 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (143316198654021, 143316198576197, 2, 142993017999429, 1, 0, 1.5, 1, '2021-03-31 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (143316198654022, 143316198576197, 1, 142989528424517, 0, 2000, 0.0, 1, '2021-03-31 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (143323429179461, 143323429118021, 2, 142993017999429, 1, 0, 100.0, 3, '2021-03-31 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (143323429191749, 143323429118021, 1, 142989528420421, 0, 1, 0.0, 3, '2021-03-31 00:00:00', 1);
INSERT INTO `fh_time_process` VALUES (143323952562245, 143323952558149, 1, 142989528420421, 0, 1553, 0.0, 2, '2021-03-31 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (143324256456773, 143324256452677, 1, 142989528420421, 0, 1333, 0.0, 1, '2021-03-31 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (143324256456774, 143324256452677, 1, 142989528424517, 0, 1432, 0.0, 1, '2021-03-31 00:00:00', 0);
INSERT INTO `fh_time_process` VALUES (143341757567045, 143341757521989, 1, 142989528420421, 0, 10000, 0.0, 3, '2021-03-30 00:00:00', 0);

-- ----------------------------
-- Table structure for gateway_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_info`;
CREATE TABLE `gateway_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collector_mac` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_info
-- ----------------------------
INSERT INTO `gateway_info` VALUES (1, '95DE5F0B', '哈尔滨商业大学', NULL, '2020-12-04 10:13:29');
INSERT INTO `gateway_info` VALUES (2, 'AE29F600', '哈尔滨商业大学', NULL, '2020-12-04 10:13:53');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hangfire_task
-- ----------------------------
INSERT INTO `hangfire_task` VALUES ('5eaabde6c1a509138ce04e80', '测试任务', '测试写日志，1小时写一次', '2021-04-16 08:58:44', 'Atlass.Framework.Jobs', 'TestJob', '0 */1 * * *', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_info
-- ----------------------------
INSERT INTO `login_info` VALUES (5, 'admin', 'Other', 'Chrome.86.0', 'Windows.10.', '192.168.1.210', '本地局域网', '2021-04-21 10:18:30', 1, '登录成功');
INSERT INTO `login_info` VALUES (6, 'admin', 'Other', 'Chrome.86.0', 'Windows.10.', '192.168.1.210', '江苏-无锡', '2021-04-21 10:19:42', 1, '登录成功');
INSERT INTO `login_info` VALUES (7, 'admin', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-22 10:20:38', 1, '登录成功');
INSERT INTO `login_info` VALUES (8, 'admin', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-23 08:56:17', 1, '登录成功');
INSERT INTO `login_info` VALUES (9, 'yushuo', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-23 10:20:07', 1, '登录成功');
INSERT INTO `login_info` VALUES (10, 'yushuo', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-23 10:27:18', 1, '登录成功');
INSERT INTO `login_info` VALUES (11, 'admin', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-23 10:40:40', 1, '登录成功');
INSERT INTO `login_info` VALUES (12, 'admin', 'Other', 'Chrome 86', 'Windows 10', '192.168.1.210', '本地局域网', '2021-04-23 15:59:50', 1, '登录成功');

-- ----------------------------
-- Table structure for pay_history
-- ----------------------------
DROP TABLE IF EXISTS `pay_history`;
CREATE TABLE `pay_history`  (
  `out_trade_no` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_info` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openid` char(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_end` bigint(20) NOT NULL,
  `total_fee` int(11) NOT NULL,
  `expert_id` char(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expert_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_time` datetime(0) NOT NULL,
  `expert_did` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '000000000000000000000000',
  PRIMARY KEY (`out_trade_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_history
-- ----------------------------
INSERT INTO `pay_history` VALUES ('5ccadcca3ad0d010704a307d', '5cc94f863ad0d00738983f07', 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '4200000305201905022381610388', 20190502200433, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', 'HPV（尖锐湿疣）检测及疫苗咨询', '2019-05-02 20:04:33', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ccb95f93ad0d011b4e53068', '5ccb8e083ad0d011b4e53067', 'oAVzdjgMrRCRbfTxOAX0nS-UlvqY', '4200000299201905036945911191', 20190503091442, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-03 09:14:42', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ccd48293ad0d00e3079ea7b', '5ccd47c03ad0d00f44c4d873', 'oAVzdjgMrRCRbfTxOAX0nS-UlvqY', '4200000305201905041423193060', 20190504160712, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-04 16:07:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ccfec1f3ad0d00c08d88677', '5ccfea613ad0d00c6cde5838', 'oAVzdjsgt5V88pl48Yqni1DNwgFk', '4200000299201905063592891437', 20190506161118, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-05-06 16:11:18', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cd674163ad0d010c8415306', '5ccef76f3ad0d013503e1559', 'oAVzdjtHj--5n3EWniWr-vNFcjkA', '4200000292201905115241851442', 20190511150459, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-05-11 15:04:59', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cd8ee323ad0d00fec23b09b', '5cd8eb903ad0d0043cb7ab20', 'oAVzdjvl9ikVkkr8Zo1u23Cvxaoc', '4200000292201905134561514130', 20190513121031, 200, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-05-13 12:10:31', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cd954b03ad0d0071c8c28eb', '5cd948eb3ad0d0043cb7ab3f', 'oAVzdjhp7Idm0amnTH53xwVLV4Sw', '4200000293201905138108996174', 20190513192749, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-13 19:27:49', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cda71853ad0d00714324a21', '5cda6f973ad0d00714324a1e', 'oAVzdjg57R8OE1iIhFfCfeNE1l-w', '4200000290201905147248957940', 20190514154312, 200, 'oAVzdjpmVyCHg6ZnDnWE5u5MXfbA', '张嘉', '2019-05-14 15:43:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cdaf0703ad0d00e3cc2a357', '5cdaef193ad0d004fc548692', 'oAVzdjvXxU9JTnl5UugHeBV3y0G8', '4200000305201905152276568861', 20190515004436, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', 'HPV（尖锐湿疣）检测及疫苗咨询', '2019-05-15 00:44:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cdc1e0b3ad0d01454970e7a', '5cdb5df23ad0d0055c8f8e72', 'oAVzdjvXxU9JTnl5UugHeBV3y0G8', '4200000299201905155696320158', 20190515221127, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-15 22:11:27', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cdc263c3ad0d01454970e7c', '5cdc25173ad0d012f09c669d', 'oAVzdjqQ2zY6o9obSlgIwQ9aewgY', '4200000306201905159020860016', 20190515224624, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-15 22:46:24', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cde83d13ad0d000ecb0edd2', '5cde76633ad0d000ecb0edcb', 'oAVzdjn3JCZj_MQVZEB4Ju47RqFY', '4200000299201905179668243088', 20190517175015, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-05-17 17:50:15', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cdf7b033ad0d00970a1011a', '5cdf77743ad0d017841e0ec7', 'oAVzdjlaQHrb8Q8cr692llZ5_7Rs', '4200000305201905182765274542', 20190518112455, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-18 11:24:55', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cdfe27f3ad0d015a090ee45', '5cdfde4a3ad0d015a090ee42', 'oAVzdjhp7Idm0amnTH53xwVLV4Sw', '4200000298201905189544298421', 20190518184628, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-18 18:46:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce3f2133ad0d00f1011632a', '5ce3f01f3ad0d00f10116324', 'oAVzdjrDMKiuomIeEqDtYY6G2qWY', '4200000295201905219097270123', 20190521204159, 200, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-05-21 20:41:59', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce49b973ad0d00e1087d74e', '5ce416fb3ad0d00e1087d70c', 'oAVzdjjByK6TnuE5cuTAB-ienpCY', '4200000305201905220520636133', 20190522084519, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-22 08:45:19', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce4d65e3ad0d00e1087d767', '5ce4c6583ad0d0174492e372', 'oAVzdjmAVIvC4XV6XBY3Q_Hqe_AI', '4200000298201905221083701535', 20190522125606, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-22 12:56:06', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce529043ad0d00e1087d7a5', '5ce524d93ad0d00e1087d7a0', 'oAVzdjnmuutRADStH1tEkDruhdAI', '4200000302201905224284770629', 20190522184841, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-22 18:48:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce738203ad0d009b0704da4', '5ce736763ad0d00d1c73c3db', 'oAVzdjnmuutRADStH1tEkDruhdAI', '4200000300201905247536571503', 20190524081743, 200, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-05-24 08:17:43', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce7a8ef3ad0d009b0704de1', '5ce798af3ad0d00d1c73c401', 'oAVzdjp6AwaO-4n39ikJ7-0pkfSU', '4200000303201905245581813191', 20190524161902, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-05-24 16:19:02', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce8d3e13ad0d00b646458dd', '5ce8d2ed3ad0d012f876b026', 'oAVzdjuyRTMicEsSCBTiInLzRGnU', '4200000297201905259708856660', 20190525133431, 1000, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-05-25 13:34:31', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce949ec3ad0d0134cbfbce0', '5ce93cce3ad0d00280336c80', 'oAVzdjifRvCQJm3wWTWcwxEGLxDc', '4200000307201905255525490844', 20190525215811, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-25 21:58:11', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ce94f243ad0d00b6464591b', '5ce94ac53ad0d00280336c85', 'oAVzdjt_Pyp7DpUob9wznUA11bkE', '4200000294201905254852758134', 20190525222025, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-25 22:20:25', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ceb79833ad0d00b5c1e80e6', '5ceb66d83ad0d00b5c1e80df', 'oAVzdjoekxCb2hfn4LXb6pFWDhYY', '4200000293201905279818458660', 20190527134544, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-27 13:45:44', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cebe7b63ad0d00b5c1e8103', '5cebd38e3ad0d014f4ebbf3c', 'oAVzdjit3iOc_j00ylRNWGcQPzu4', '4200000303201905277424019924', 20190527213556, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-27 21:35:56', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ced12c83ad0d017a8b6e4be', '5ced09183ad0d017a8b6e4b8', 'oAVzdjrDMKiuomIeEqDtYY6G2qWY', '4200000304201905288257921643', 20190528185156, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-28 18:51:56', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cedea3b3ad0d00db86662ac', '5cede8953ad0d00db86662a8', 'oAVzdjjuiaKY9XQKCw4FfHS04iGQ', '4200000293201905295625671915', 20190529101113, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-29 10:11:13', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cef35883ad0d015802a7756', '5cef32c73ad0d0161ca808c8', 'oAVzdjoiPhveHoA1cvhoe6HmYN0k', '4200000306201905301784725490', 20190530094446, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', 'HPV（尖锐湿疣）检测及疫苗咨询', '2019-05-30 09:44:46', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cef506d3ad0d00dd8a2952c', '5cef4f363ad0d015802a776b', 'oAVzdjjuiaKY9XQKCw4FfHS04iGQ', '4200000295201905302183350119', 20190530113930, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-05-30 11:39:30', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf1c8c73ad0d01708237944', '5cf1c6f73ad0d0125cc07d7e', 'oAVzdjgqD0FvWkNAToXWczzSnSWU', '4200000303201906010887399946', 20190601083732, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-01 08:37:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf25fef3ad0d00094614f27', '5cf25d143ad0d00094614f23', 'oAVzdjrDMKiuomIeEqDtYY6G2qWY', '4200000306201906013193216056', 20190601192228, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-06-01 19:22:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf261ef3ad0d00094614f29', '5cf260b43ad0d01708237962', 'oAVzdjrDMKiuomIeEqDtYY6G2qWY', '4200000294201906010153162647', 20190601193059, 200, 'oAVzdjl5I583iNjaDnsbr2qCwV1g', '小宗', '2019-06-01 19:30:59', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf3026e3ad0d016fc8f5628', '5cf2fbec3ad0d016fc8f5627', 'oAVzdjjk1VXVQ7iLfFixmvtTvOSE', '4200000297201906029691265185', 20190602065550, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-02 06:55:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf3bcac3ad0d015fc0f40e0', '5cf3bb563ad0d009b0952132', 'oAVzdjoiPhveHoA1cvhoe6HmYN0k', '4200000290201906024508424243', 20190602201027, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-06-02 20:10:27', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf5e0053ad0d00efc3806fb', '5cf5df0f3ad0d01098ee782a', 'oAVzdjt_Pyp7DpUob9wznUA11bkE', '4200000289201906040091660872', 20190604110546, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-06-04 11:05:46', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf89dac3ad0d0005059beed', '5cf89cb13ad0d0005059beec', 'oAVzdjtjI_iaBs-eew_o6Ipa5Tsc', '4200000289201906064729059038', 20190606125929, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-06 12:59:29', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cf9f42b3ad0d00b600edee5', '5cf9ec0f3ad0d00b600edee4', 'oAVzdjuznB7qjuqdnGjF9UrUBSYw', '4200000294201906072214384240', 20190607132052, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-07 13:20:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cfa4c7f3ad0d00b600edf11', '5cfa4c013ad0d011806d430f', 'oAVzdjq5rb-JVOs14RR_BcmfvYi8', '4200000306201906075995802619', 20190607193740, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', 'HPV（尖锐湿疣）检测及疫苗咨询', '2019-06-07 19:37:40', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cfb31743ad0d00b600edf6f', '5cf5fd833ad0d010e07ad8e0', 'oAVzdjrDMKiuomIeEqDtYY6G2qWY', '4200000295201906082645597003', 20190608115432, 200, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-06-08 11:54:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cfbd20c3ad0d004d8a7e734', '5cfbd1d33ad0d016280c3f00', 'oAVzdjthriJpEjGEeOXE_6FfcbYk', '4200000302201906082743747715', 20190608231945, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-08 23:19:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5cfc93493ad0d010c4c20f6e', '5cfc92ef3ad0d010c4c20f6d', 'oAVzdjvZ08MTUFyH6qVmwQc9yrjg', '4200000296201906091990362792', 20190609130415, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-09 13:04:15', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d01c4ca3ad0d01588d6d7c0', '5d01c4b03ad0d01588d6d7bf', 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '4200000300201906132409979719', 20190613113647, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '广东零元版自检活动（2019）', '2019-06-13 11:36:47', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d05d4493ad0d01284493756', '5d01e0bd3ad0d01588d6d7e5', 'oAVzdjnwwSS_x6cdUxY0jFXQkmvI', '4200000291201906163273786728', 20190616133200, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-16 13:32:00', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d08744f3ad0d00d1cc314ab', '5d08400c3ad0d00438c6ab8a', 'oAVzdjseyAEcEnPe5dNAyAZ1dLVc', '4200000291201906184012583502', 20190618131916, 5000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-06-18 13:19:16', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d09db413ad0d0104c93a2aa', '5d09d90d3ad0d0104c93a2a7', 'oAVzdjv2BlGSrbi5qcJhV6iZptXk', '4200000299201906192359261739', 20190619145046, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', 'HPV（尖锐湿疣）检测及疫苗咨询', '2019-06-19 14:50:46', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d0cc4ca3ad0d0176c31fc79', '5d0cbf803ad0d002ac0f7769', 'oAVzdjpcVVADae_whp6siOJZgDps', '4200000298201906213052530312', 20190621195144, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-21 19:51:44', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d0f61773ad0d017782ca927', '5d0f586e3ad0d006dc685a6a', 'oAVzdjkA-EGin6wH7WMYLzoDlAPg', '4200000293201906232159437057', 20190623192445, 1000, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-06-23 19:24:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d0f6cbf3ad0d017782ca92a', '5d0f69063ad0d00c6cf67518', 'oAVzdjkA-EGin6wH7WMYLzoDlAPg', '4200000298201906235345184308', 20190623201252, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-23 20:12:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d157d8c3ad0d015fc4c941c', '5d156c573ad0d015fc4c9417', 'oAVzdjte7em98cNAepAPaPpVFgDc', '4200000296201906283671745646', 20190628103810, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-06-28 10:38:10', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d158b463ad0d015fc4c9424', '5d15676d3ad0d0172085f074', 'oAVzdjte7em98cNAepAPaPpVFgDc', '4200000297201906286293831361', 20190628113648, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-28 11:36:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d1638673ad0d00c08c93893', '5d16362a3ad0d00c08c93892', 'oAVzdjjuiHfXXM6Avoc_HMm2f4lY', '4200000289201906286780906784', 20190628235524, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-28 23:55:24', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d1751293ad0d00b00d1c5e8', '5d174fc53ad0d00be819a4e0', 'oAVzdjseyAEcEnPe5dNAyAZ1dLVc', '4200000294201906298300565861', 20190629195320, 5000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-06-29 19:53:20', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d18abd33ad0d00eb086bf5b', '5d18a6473ad0d013fc522818', 'oAVzdjkA-EGin6wH7WMYLzoDlAPg', '4200000308201906302921872347', 20190630203225, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-06-30 20:32:25', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d18c3373ad0d00a408673c5', '5d18c0513ad0d00eb086bf6b', 'oAVzdjqxWI2eKVLl6ee5a0OdeAOg', '4200000293201906309016351823', 20190630221212, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-06-30 22:12:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d1d45d73ad0d011ac8c05bd', '5d1cc8f53ad0d0170c5a1abb', 'oAVzdjlyXFBPOFucRxQJaxQARpOs', '4200000304201907042177737177', 20190704081839, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-07-04 08:18:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d1ea82f3ad0d004a8dd35f3', '5d1e9d173ad0d00bbcd01a62', 'oAVzdjlvVyYRbXZ6s8hbwtS8_Y2Q', '4200000290201907055853311743', 20190705093028, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-05 09:30:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d1ef1e53ad0d00bbcd01a7c', '5d1ebdb33ad0d00c18c3311e', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000301201907057747841708', 20190705144457, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-05 14:44:57', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d22f9d03ad0d014f8dd831f', '5d22f8933ad0d0162c4dc106', 'oAVzdjrDa7KVY84xoB52QYrNV7VQ', '4200000349201907080416364252', 20190708160750, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-08 16:07:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d27367d3ad0d01704be543f', '5d2736123ad0d001287161c0', 'oAVzdjij8ace9yvYvcX3NLFKl9Lg', '4200000343201907110230767961', 20190711211547, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-07-11 21:15:47', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d31d82c3ad0d010fc5f4687', '5d31caf73ad0d015ec32f10e', 'oAVzdjij8ace9yvYvcX3NLFKl9Lg', '4200000355201907197249247502', 20190719224819, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-07-19 22:48:19', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3284343ad0d01328a463f8', '5d3282b13ad0d010fc5f46a8', 'oAVzdjkRXjf8yNJWbY8BPYHtmcOs', '4200000350201907209555723341', 20190720110221, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-20 11:02:21', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d345b8c3ad0d00f48817885', '5d345a633ad0d00f48817883', 'oAVzdjhGh0-y1T3d_IdlR8QOqJIo', '4200000355201907219062809237', 20190721203321, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-21 20:33:21', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d35b2cc3ad0d0121ce5b6a5', '5d35a9ee3ad0d0121ce5b6a0', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000348201907224636415779', 20190722205752, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-07-22 20:57:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3834623ad0d0019c3cbb43', '5d3831c43ad0d010ecfe1aad', 'oAVzdjoiPhveHoA1cvhoe6HmYN0k', '4200000356201907245241096650', 20190724183519, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-24 18:35:19', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d39f5573ad0d00dcc19e68f', '5d39c2c53ad0d007a474d84b', 'oAVzdjifz6C4jdOPB8P8YSzuN1aI', '4200000341201907261247866675', 20190726023101, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-26 02:31:01', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3bd75f3ad0d004ccea1340', '5d3bd6fb3ad0d004ccea133f', 'oAVzdjnzZIlB_Et1XjKWs6dSn6EU', '4200000352201907278656564735', 20190727124733, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-27 12:47:33', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3bff0b3ad0d004ccea135b', '5d3bfba93ad0d017908867a8', 'oAVzdjgwsNWBuu0uAE8ylZ2pEM8M', '4200000346201907277870826985', 20190727153650, 2000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2019-07-27 15:36:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d0fa53ad0d00c2cf88831', '5d3d0d3f3ad0d01044008170', 'oAVzdjgEtxSVmJ7ODWi35eIcm_ZM', '4200000350201907283383956546', 20190728105956, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 10:59:56', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d122a3ad0d01044008173', '5d3d10893ad0d00854327749', 'oAVzdjvALIEMCyapDCblRTANswNs', '4200000347201907287922772094', 20190728111040, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 11:10:40', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d684a3ad0d00c2cf88849', '5d3d50ca3ad0d0085432775e', 'oAVzdjqRMcLifKfk7ZfHC_MYAHE8', '4200000353201907280974645535', 20190728171813, 100, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-07-28 17:18:13', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d6a383ad0d010b451c363', '5d3d4e133ad0d0104400818b', 'oAVzdjqRMcLifKfk7ZfHC_MYAHE8', '4200000351201907284035376516', 20190728172627, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 17:26:27', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d6b373ad0d0085432776c', '5d3d6aa13ad0d010b451c364', 'oAVzdjqRMcLifKfk7ZfHC_MYAHE8', '4200000346201907281344620214', 20190728173039, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 17:30:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3d76053ad0d00c2cf88851', '5d3d73543ad0d0085432776f', 'oAVzdjqRMcLifKfk7ZfHC_MYAHE8', '4200000340201907281709767634', 20190728181658, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 18:16:58', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d3da1e83ad0d0085432777f', '5d3d96193ad0d010b451c376', 'oAVzdjjBB6I9a9OSvYxbm8TpBjoU', '4200000352201907281530892420', 20190728212357, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-07-28 21:23:57', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d4382d23ad0d01348edcd62', '5d4382933ad0d00accc92a5a', 'oAVzdjgc21ECSZma5ZI-BUweVCik', '4200000341201908024710699785', 20190802082456, 1000, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-02 08:24:56', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d43bca53ad0d01348edcd82', '5d43bc6b3ad0d01470832f19', 'oAVzdjjDB6ZCHwULUysXsx4MhD0c', '4200000349201908023021228809', 20190802123139, 500, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-02 12:31:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d43fd623ad0d01470832f3a', '5d43fce53ad0d01470832f39', 'oAVzdjpNyf5pDl5aIautoMRhhS34', '4200000351201908026431570332', 20190802170754, 5000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-02 17:07:54', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d4419353ad0d00accc92a95', '5d4414743ad0d00620aa57f2', 'oAVzdjkoo227O3oM3p0IQtihpcEg', '4200000351201908023713531853', 20190802190634, 100, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-02 19:06:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d4478833ad0d00620aa581c', '5d4476153ad0d01470832f6d', 'oAVzdjpNyf5pDl5aIautoMRhhS34', '4200000356201908033493454656', 20190803015315, 5000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-08-03 01:53:15', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d4d03d33ad0d010447786a5', '5d4d03863ad0d011ace33780', 'oAVzdjv2BlGSrbi5qcJhV6iZptXk', '4200000357201908097506544200', 20190809132545, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-09 13:25:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d4d22643ad0d011ace3378c', '5d4d0bd93ad0d010447786af', 'oAVzdjkY-VgcejF1nG97LS-lIT70', '4200000353201908098344597277', 20190809153609, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-09 15:36:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d52a3cb3ad0d014f4a4ef02', '5d52a2c73ad0d0050cc75426', 'oAVzdjtPZ1J1rGyXwbc9hE4DpB9Q', '4200000351201908130527553007', 20190813194937, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-13 19:49:37', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d536ce73ad0d009087c1625', '5d536cc43ad0d00accb98f00', 'oAVzdjlkewVtlF0FWspEiw--Lpis', '4200000358201908142126520456', 20190814100741, 500, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-14 10:07:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d536ed03ad0d00accb98f02', '5d536d5c3ad0d00ee43d05ee', 'oAVzdjlkewVtlF0FWspEiw--Lpis', '4200000348201908144773195787', 20190814101550, 100, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-14 10:15:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d5370663ad0d00accb98f07', '5d5370273ad0d00accb98f06', 'oAVzdjlkewVtlF0FWspEiw--Lpis', '4200000350201908140124526723', 20190814102236, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-14 10:22:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d53e71b3ad0d011c4b2ad50', '5d53e3f13ad0d0168874f1a0', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000343201908147194131384', 20190814184903, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-14 18:49:03', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d56035a3ad0d00324c254ea', '5d55e93b3ad0d00324c254e7', 'oAVzdjkY-VgcejF1nG97LS-lIT70', '4200000357201908162557703689', 20190816091409, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-08-16 09:14:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d56042e3ad0d016a4bcf84a', '5d5601e63ad0d011c4d1812f', 'oAVzdjkY-VgcejF1nG97LS-lIT70', '4200000358201908165620108883', 20190816091740, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-08-16 09:17:40', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d57af8c3ad0d00e40d21757', '5d57af163ad0d014cca12d00', 'oAVzdjgrPDsbw2aIxSXB1Tq7bR0w', '4200000343201908173199327483', 20190817154107, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-17 15:41:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d57b24a3ad0d00e40d2175c', '5d57b1a43ad0d00e3016b646', 'oAVzdjgrPDsbw2aIxSXB1Tq7bR0w', '4200000356201908170345676141', 20190817155248, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-08-17 15:52:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d57d8173ad0d00e3016b65c', '5d57d1523ad0d00e3016b65a', 'oAVzdjn4nkWEys8WMLk8ms5-_YW4', '4200000352201908171412577323', 20190817183404, 5000, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2019-08-17 18:34:04', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d58b6ec3ad0d0148c21d946', '5d58b00c3ad0d0148c21d942', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000349201908188125287321', 20190818102448, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-18 10:24:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d58fd693ad0d0148c21d95a', '5d58fcb63ad0d0148c21d959', 'oAVzdjo1BsTaRpkWab7HZ5IySmkw', '4200000343201908183422738181', 20190818152533, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-18 15:25:33', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d59ff3c3ad0d013a02253ec', '5d594f733ad0d00d5c0bc67a', 'oAVzdjlg1572L5SJt4nBfepf7jyY', '4200000352201908196737342901', 20190819094538, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-19 09:45:38', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d5a3ef33ad0d00cb0e2a633', '5d5a3cd13ad0d00de492c44c', 'oAVzdjqUz5OqqyQC6tDYhCgCC6Ns', '4200000345201908193020893094', 20190819141728, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-19 14:17:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d5b6bb63ad0d01578ce1eff', '5d5b68693ad0d017a479deb3', 'oAVzdjjDxUuCykLK1y3NGl9DtXBk', '4200000345201908203456767813', 20190820114107, 100, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-20 11:41:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d5eb3e53ad0d01784eceae2', '5d5eb3723ad0d0024843c916', 'oAVzdjlMgd1Oj4aizdamGiuiL5e4', '4200000351201908221440801097', 20190822232532, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-22 23:25:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d5f525e3ad0d0020434dc93', '5d5f4fa33ad0d010e84ced30', 'oAVzdjg4lLzXXZ723g6bBDXT0v2k', '4200000346201908235923862998', 20190823104139, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-23 10:41:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d612a903ad0d0128084c393', '5d611e253ad0d01194191f12', 'oAVzdjkWZDcWtnxFAgD8fPYAM8PQ', '4200000355201908240393956667', 20190824201628, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-24 20:16:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6146293ad0d0128084c39b', '5d6143f33ad0d0128084c398', 'oAVzdjjL_gdiA8RswRFKiRcdy9oU', '4200000354201908241239967481', 20190824221409, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-08-24 22:14:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d61584c3ad0d01194191f28', '5d6156d83ad0d0128084c3a4', 'oAVzdjjDxUuCykLK1y3NGl9DtXBk', '4200000344201908245303482354', 20190824233137, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-24 23:31:37', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d62a33b3ad0d002304bac82', '5d613cb63ad0d001f4459214', 'oAVzdjlg1572L5SJt4nBfepf7jyY', '4200000346201908251407931211', 20190825230332, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-08-25 23:03:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d62a50f3ad0d01558c20d98', '5d6142f53ad0d001f445921b', 'oAVzdjjL_gdiA8RswRFKiRcdy9oU', '4200000348201908259468245785', 20190825231120, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-08-25 23:11:20', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6341dd3ad0d00cc09fdcf3', '5d633ffc3ad0d00cc09fdcf2', 'oAVzdjkWZDcWtnxFAgD8fPYAM8PQ', '4200000354201908268786692987', 20190826102024, 1000, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2019-08-26 10:20:24', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d64d1d63ad0d00d3cc09467', '5d64b9d23ad0d000a4b7cc23', 'oAVzdji21ZB_JnvPtHXSvNQ-9xNQ', '4200000354201908276137931937', 20190827144652, 500, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-08-27 14:46:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d64f3c03ad0d00c883bb371', '5d64947f3ad0d00cc09fdd74', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000342201908274259306981', 20190827171134, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-27 17:11:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6644243ad0d003b890c4bd', '5d6643d93ad0d003b890c4bc', 'oAVzdjpvU-T4ekrKuMCs1E7mjfoQ', '4200000346201908285791276995', 20190828170649, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-08-28 17:06:49', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6680bb3ad0d0114cdee9f7', '5d66808d3ad0d003b890c4d0', 'oAVzdjg4lLzXXZ723g6bBDXT0v2k', '4200000339201908285637949031', 20190828212521, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-28 21:25:21', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d67339c3ad0d01340c0a75a', '5d6731f33ad0d016d8643311', 'oAVzdjlvLelaXdGQmJex4Sua3Wt0', '4200000344201908294313862691', 20190829100843, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-29 10:08:43', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d67a5c93ad0d016d8643334', '5d678c243ad0d006e00e2618', 'oAVzdjiC09t2O0TEwLv2dXQY8tj0', '4200000347201908291778878449', 20190829181542, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-08-29 18:15:42', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6b6a213ad0d0168082f90a', '5d6b68bc3ad0d014109c3fb6', 'oAVzdju24VCqzocMFujIY22o8Xwo', '4200000344201909012878575063', 20190901145016, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-01 14:50:16', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6ccff23ad0d017346c620d', '5d6ccf2f3ad0d009601b13b7', 'oAVzdjqaBfDHR7UvTE25tXVHTvPo', '4200000355201909028108669070', 20190902161656, 100, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-09-02 16:16:56', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d6fafc83ad0d012a8701973', '5d6faefe3ad0d012a8701972', 'oAVzdjgEtxSVmJ7ODWi35eIcm_ZM', '4200000403201909047052074986', 20190904203631, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-04 20:36:31', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d722d8f3ad0d017e06fb40d', '5d720c443ad0d017e06fb3f7', 'oAVzdjnd86LzaY-vH0IQAGc3BTu8', '4200000415201909064239154459', 20190906175740, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-06 17:57:40', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d722ff23ad0d010741c8c00', '5d722dee3ad0d01558a449ff', 'oAVzdjnd86LzaY-vH0IQAGc3BTu8', '4200000403201909061616692728', 20190906180750, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-06 18:07:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d75092e3ad0d0149c3738ff', '5d7507b43ad0d0149c3738fc', 'oAVzdjitTl1eSVQ3lEihXhI3Oin0', '4200000407201909082726630705', 20190908215916, 500, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '广东零元版自检活动（2019）', '2019-09-08 21:59:16', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d750b313ad0d00f3c921151', '5d7509233ad0d0149c3738fd', 'oAVzdjitTl1eSVQ3lEihXhI3Oin0', '4200000402201909084116304738', 20190908220750, 1000, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '广东零元版自检活动（2019）', '2019-09-08 22:07:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7529c63ad0d0149c373915', '5d7528ff3ad0d0149c373913', 'oAVzdjitTl1eSVQ3lEihXhI3Oin0', '4200000402201909097075583609', 20190909001820, 1000, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-09-09 00:18:20', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7888803ad0d015f04e0786', '5d78885d3ad0d003b4da7ae9', 'oAVzdjqyViP9_u6cNF2tx023Cxdw', '4200000404201909117441355285', 20190911133918, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-11 13:39:18', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d78e8213ad0d015f04e079c', '5d78e73c3ad0d011748d8e12', 'oAVzdjqeXZ57kjvjvKN3AwOy47gM', '4200000415201909118202449335', 20190911202721, 1000, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2019-09-11 20:27:21', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d79b5d13ad0d00c10de0f62', '5d79b4123ad0d00c10de0f61', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000413201909127178276962', 20190912110453, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-12 11:04:53', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7a3f8f3ad0d004cc05ec7b', '5d7a3bc03ad0d0095cb3f1b2', 'oAVzdjlSH07kPQ2CysZiYMy66EyM', '4200000402201909123348487357', 20190912205240, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-12 20:52:40', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7b2e5d3ad0d011e8cec639', '5d7b21cd3ad0d0166035f5fa', 'oAVzdjpk3p3h_dW8H9W8OADdBOIM', '4200000404201909139150166854', 20190913135131, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-13 13:51:31', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7b5d143ad0d010ec4c9b10', '5d7b59ab3ad0d011e8cec640', 'oAVzdjlmw9R-cdzAM5hYqL1LKv64', '4200000407201909134890595917', 20190913171050, 500, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-09-13 17:10:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7c902c3ad0d003d46ff3ed', '5d7c8ec63ad0d003d46ff3ec', 'oAVzdjpk3p3h_dW8H9W8OADdBOIM', '4200000404201909149626001307', 20190914150109, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-14 15:01:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7dc6683ad0d013f80c734d', '5d7dc4e33ad0d013f80c734b', 'oAVzdjvhwNTFnxL5Qou38uIxBxLM', '4200000405201909156147851400', 20190915130448, 2000, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-09-15 13:04:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7f15e13ad0d01290e312c3', '5d7e57db3ad0d00f28d75a18', 'oAVzdjvXxU9JTnl5UugHeBV3y0G8', '4200000411201909163812168642', 20190916125607, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-16 12:56:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d7fbe803ad0d01290e312e9', '5d7fbdc43ad0d00b50ddc314', 'oAVzdjtqC7MsHfDokkgEdZePMAtA', '4200000409201909178506577508', 20190917005532, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-09-17 00:55:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d855be83ad0d0126cae2754', '5d85581a3ad0d01448d81d76', 'oAVzdjjrs64uOdek2mv73O6www8o', '4200000409201909216157431705', 20190921070842, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-09-21 07:08:42', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d85cfb03ad0d011042125f2', '5d85cd203ad0d01448d81d8b', 'oAVzdjjH0p_qGP7F9hzXpiwlSeJA', '4200000415201909211735586504', 20190921152228, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-21 15:22:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d8643a23ad0d0161880c2f7', '5d8635a03ad0d0161880c2f6', 'oAVzdjqeXZ57kjvjvKN3AwOy47gM', '4200000408201909212620342041', 20190921233711, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-09-21 23:37:11', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d8846a83ad0d0015c964ff5', '5d8832843ad0d016608b3194', 'oAVzdjlfkcAKkjFYS-xvEN0Q-d5s', '4200000421201909234469476335', 20190923121439, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-23 12:14:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d8cebc43ad0d00f102fb517', '5d8ceab13ad0d006bcc0b226', 'oAVzdjlyfhM02CeU4RYlcdf-r6Zg', '4200000405201909270346077698', 20190927004811, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2019-09-27 00:48:11', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d8f24c53ad0d00dac38a603', '5d8f229e3ad0d00df4ed1a6d', 'oAVzdjkZntc89flxnnmYl5t7QiG8', '4200000404201909286039505014', 20190928171554, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-28 17:15:54', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d8f5dba3ad0d01148ea5794', '5d8f592c3ad0d00dac38a60b', 'oAVzdjgSHOqBs77BB9u7u8ZqSFlA', '4200000421201909283166871360', 20190928211855, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-28 21:18:55', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9090d43ad0d00aa0b97517', '5d9090653ad0d00e2ce90dc1', 'oAVzdjgSHOqBs77BB9u7u8ZqSFlA', '4200000412201909296491538335', 20190929190912, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-09-29 19:09:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9204713ad0d0105c9ba7e3', '5d9204083ad0d0105c9ba7e2', 'oAVzdjuQfhGGbTfYHwpbzKweWKFU', '4200000418201909300135204844', 20190930213452, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-09-30 21:34:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d920be53ad0d00a9c925d0d', '5d920b573ad0d00e384611f0', 'oAVzdjuQfhGGbTfYHwpbzKweWKFU', '4200000409201909300100286747', 20190930220636, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-09-30 22:06:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9321ea3ad0d00f38812180', '5d8effc33ad0d01148ea5784', 'oAVzdjk1t59N2t0bYxOs0Egyzzq4', '4200000411201910019003160376', 20191001175248, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2019-10-01 17:52:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9332be3ad0d011109fa1db', '5d93329e3ad0d011109fa1da', 'oAVzdjuIien6wniuwtwi9PHUVxHE', '4200000407201910019654546296', 20191001190436, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-01 19:04:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9814cc3ad0d008b48a4176', '5d9813093ad0d010d463c49a', 'oAVzdjgofulTwUL3_VE-F18CFxt4', '4200000405201910054960738722', 20191005115812, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-05 11:58:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9942e83ad0d016e460d691', '5d9942823ad0d0073492510f', 'oAVzdjpnjpA0m42Z4WTeOgcyJQm4', '4200000411201910062412574018', 20191006092710, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-06 09:27:10', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9a00fb3ad0d00ea863dbad', '5d99fc383ad0d00ea863dbac', 'oAVzdjiC1CuuqerF8i8z9RUI5P4I', '4200000418201910060891105206', 20191006225807, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-06 22:58:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9abb103ad0d00da40c9d2b', '5d9aba533ad0d00c28bd3c3a', 'oAVzdjr-8Z61B6CPuKIrBjMVRG8A', '4200000410201910070616970225', 20191007121204, 200, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2019-10-07 12:12:04', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5d9d8e033ad0d00940e1934b', '5d9d8a6b3ad0d00940e1934a', 'oAVzdjsIdHWSQavhFyoSTSE2xq4I', '4200000417201910096145951821', 20191009153641, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-10-09 15:36:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5da9b04f3ad0d013a0c4ee8a', '5da9a8493ad0d017f8a9c2ee', 'oAVzdjqPMojmUfGIH5gj0sXX9ZIg', '4200000417201910180333331171', 20191018203013, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-18 20:30:13', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5daadbe53ad0d00ee86275d8', '5daad9f23ad0d0020016bd93', 'oAVzdjg-BfZAE-G-9MAORCliQMxg', '4200000413201910199468993426', 20191019174828, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-10-19 17:48:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5daadd0f3ad0d008f06eada6', '5daadc443ad0d0020016bd94', 'oAVzdjg-BfZAE-G-9MAORCliQMxg', '4200000405201910191007847472', 20191019175325, 500, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-10-19 17:53:25', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dac73fa3ad0d0179828fd2d', '5dac66b13ad0d0179828fd24', 'oAVzdjo4U1KQ2lWYTlkcgoNIpQfs', '4200000416201910209880899371', 20191020224936, 2000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-20 22:49:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dad229b3ad0d00f9c342c75', '5dac2baa3ad0d00bb096a4c9', 'oAVzdjlg1572L5SJt4nBfepf7jyY', '4200000420201910210762431496', 20191021111442, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-21 11:14:42', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dae3f283ad0d00f34dee8fd', '5dae143d3ad0d013dc82b7b1', 'oAVzdjiQgdaL_tSF_8HatMu7x_RE', '4200000417201910225981822864', 20191022072847, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-22 07:28:47', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5daeff653ad0d011505dee2c', '5daeff1b3ad0d011505dee2b', 'oAVzdjoOLZam8up5_ENirGQQdkn8', '4200000406201910223446879608', 20191022210858, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-22 21:08:58', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db2dc5b3ad0d0114ca4353e', '5db2d3353ad0d00d58f55d32', 'oAVzdjqPMojmUfGIH5gj0sXX9ZIg', '4200000405201910254724774575', 20191025192832, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-25 19:28:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db2efcf3ad0d00d58f55d40', '5db2c32e3ad0d0114ca43538', 'oAVzdjqPMojmUfGIH5gj0sXX9ZIg', '4200000406201910251182538256', 20191025205134, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-25 20:51:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db2f7743ad0d0114ca4354c', '5db2f3b33ad0d010ac731cb0', 'oAVzdjoQi9BRkH92Oqjb5iUrp6Jo', '4200000420201910255969948813', 20191025212411, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-10-25 21:24:11', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db318f33ad0d0114ca4355f', '5db314943ad0d0114ca4355c', 'oAVzdjqUz5OqqyQC6tDYhCgCC6Ns', '4200000407201910254600688731', 20191025234703, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-25 23:47:03', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db3c7103ad0d008245bb719', '5db3bba13ad0d00a44767d4f', 'oAVzdjqPMojmUfGIH5gj0sXX9ZIg', '4200000419201910263183236212', 20191026120958, 500, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-10-26 12:09:58', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5db856f63ad0d01268700b37', '5db853fd3ad0d00d4879a474', 'oAVzdjobw6hDqv_9gt5wZJXYb8PI', '4200000413201910293598658860', 20191029231300, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-10-29 23:13:00', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbb80d23ad0d0027c5f1c20', '5dbb7cfc3ad0d0027c5f1c1e', 'oAVzdjoj5QAc4IK-W-8ywerWqX3Q', '4200000404201911013547370881', 20191101084823, 1000, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-11-01 08:48:23', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbceb8d3ad0d010b833a509', '5dbce03c3ad0d006c00e095b', 'oAVzdjlmw9R-cdzAM5hYqL1LKv64', '4200000410201911028899449213', 20191102103603, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-11-02 10:36:03', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbcf9403ad0d00ec0b29320', '5dbceccf3ad0d00ec0b2931e', 'oAVzdjlmw9R-cdzAM5hYqL1LKv64', '4200000416201911029424607515', 20191102113430, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-02 11:34:30', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbd74e03ad0d010b833a522', '5dbd6adc3ad0d00ec0b29344', 'oAVzdjlVlfhVrFSGFlmm26LzTEKg', '4200000415201911023640941675', 20191102202211, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-02 20:22:11', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbe6e283ad0d00aac719f52', '5dbcfe963ad0d006c00e0961', 'oAVzdjlg1572L5SJt4nBfepf7jyY', '4200000419201911035543636154', 20191103140533, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-03 14:05:33', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbe932b3ad0d00ea0816cff', '5dbe92a43ad0d00aac719f5e', 'oAVzdjgMrRCRbfTxOAX0nS-UlvqY', '4200000408201911038685810416', 20191103164335, 1000, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-11-03 16:43:35', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dbe94333ad0d00aac719f60', '5dbe8c8e3ad0d004887f740c', 'oAVzdjvprlEHIhAPrbm7yxPKq7dU', '4200000412201911030416510128', 20191103164753, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-03 16:47:53', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dc038133ad0d00ba03432a9', '5dc030a43ad0d010f8b81ef4', 'oAVzdjpmcA027347f-e33wN_hBTw', '4200000461201911049448533176', 20191104223919, 1000, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2019-11-04 22:39:19', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dc039993ad0d00ec4820df3', '5dc033513ad0d00ec4820df2', 'oAVzdjvE9jyClpIWbgKrw5VSEkCY', '4200000456201911048828334478', 20191104224554, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-11-04 22:45:54', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dc0e69f3ad0d017a8141a10', '5dc0e3b13ad0d001d4cc93bc', 'oAVzdjsDMIT8fJcwghd7LdmZ8DOg', '4200000469201911056300951960', 20191105110402, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '广东零元版自检活动（2019）', '2019-11-05 11:04:02', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dcd39a23ad0d00fc4a44581', '5dcd37d53ad0d009b47026f3', 'oAVzdjg7aYq2qjtmxcdwDKgjoN5k', '4200000466201911148808478785', 20191114192534, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-14 19:25:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dceb24d3ad0d00dec5cb529', '5dceb1b73ad0d00f94ec43ad', 'oAVzdjiSRplMsNGFWHh5aAAXPkDs', '4200000466201911154487305385', 20191115221234, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-15 22:12:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd0a2de3ad0d01390e685d2', '5dd09dc93ad0d01390e685d1', 'oAVzdjvgZOzXseE-hJyO67e2PQn8', '4200000452201911175851570966', 20191117093117, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-17 09:31:17', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd148c73ad0d016c474a48e', '5dd141463ad0d01390e6860e', 'oAVzdjmKilTJCvs2Aj4jZWNrGkKo', '4200000471201911177746791658', 20191117211909, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-17 21:19:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd15c523ad0d016c474a495', '5dd15c0a3ad0d01390e68619', 'oAVzdjqJ0x9bWV3AvtgA9dGAfEBg', '4200000466201911176354614904', 20191117224234, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-11-17 22:42:34', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd3b0183ad0d01750aa168c', '5dd24ce13ad0d014105b2caa', 'oAVzdjmZE3lStnPefdFrFxKgRsZQ', '4200000452201911196343398348', 20191119170429, 100, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '广东零元版自检活动（2019）', '2019-11-19 17:04:29', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd62d5c3ad0d017ecb35f4d', '5dd61bd03ad0d017ecb35f4b', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000452201911215076855168', 20191121142329, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-21 14:23:29', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dd944393ad0d00d143eb3fb', '5dd9429f3ad0d00438aff8c6', 'oAVzdjlyXFBPOFucRxQJaxQARpOs', '4200000452201911239186822019', 20191123223750, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-11-23 22:37:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dda7c1a3ad0d0027cae26dd', '5dda7b9e3ad0d00e94b617a7', 'oAVzdjm6Xh1Np_LI0Snd-2602fsE', '4200000466201911242952758980', 20191124204831, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-24 20:48:31', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5ddd0bee3ad0d00bf0fe487a', '5ddd07c23ad0d0102ce3088a', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000469201911269368635804', 20191126192644, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-26 19:26:44', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de125bd3ad0d00adc352aba', '5de125223ad0d00adc352ab8', 'oAVzdjiOKt9SVDjSKmRs3jj43h1s', '4200000458201911290153198267', 20191129220553, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-29 22:05:53', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de1e1a23ad0d003b8a33a07', '5de1cd963ad0d01704710ab9', 'oAVzdjhOfspHMprXv8I3t-dG35fg', '4200000465201911307636990960', 20191130112736, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-30 11:27:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de1fcbc3ad0d003b8a33a12', '5de1fb493ad0d01704710ac5', 'oAVzdjuxizXoIR5tqUh2lpAko4Ko', '4200000464201911304424482583', 20191130132313, 500, 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '周折', '2019-11-30 13:23:13', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de1fd383ad0d01704710ac7', '5de1fa743ad0d003b8a33a11', 'oAVzdjuxizXoIR5tqUh2lpAko4Ko', '4200000465201911300814303559', 20191130132517, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-11-30 13:25:17', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de5bd693ad0d00ec40ebf85', '5de5bbd73ad0d00ec40ebf84', 'oAVzdjtqfgzLAzHSiX7HNspgEdcs', '4200000467201912034905264946', 20191203094206, 200, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-12-03 09:42:06', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de5e1173ad0d00c5c379b59', '5de541553ad0d00808aa5cab', 'oAVzdjiH4vaGcmSi0c1cdJFtCH7Y', '4200000460201912030156922898', 20191203121420, 100, 'oAVzdjml_WibiFybO9YhHi9yA6Wg', '杨阳', '2019-12-03 12:14:20', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de642aa3ad0d00ec40ebfc0', '5de641d83ad0d00d0859a4d7', 'oAVzdjgzCeLzpenXNTfhB6HFuErk', '4200000469201912039154015058', 20191203191039, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-03 19:10:39', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de6690e3ad0d00c5c379b88', '5de64c683ad0d00d0859a4dc', 'oAVzdjn-qwreh6voxXbVTnzpkx9s', '4200000463201912039435868359', 20191203215435, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-12-03 21:54:35', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de67f723ad0d00ec40ebfe3', '5de67f333ad0d00c5c379b99', 'oAVzdji5VsHx-QpdC_UeEUX0dqSI', '4200000461201912038238791971', 20191203232959, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-03 23:29:59', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5de887523ad0d00e1808c240', '5de8630d3ad0d00e1808c23b', 'oAVzdji5VsHx-QpdC_UeEUX0dqSI', '4200000465201912053092913987', 20191205122807, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-05 12:28:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dee55b43ad0d015000cde9e', '5dee54e33ad0d015000cde9d', 'oAVzdjnVOOPh7iAGhbKs8mZdQIE0', '4200000452201912098313631924', 20191209221001, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-09 22:10:01', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dee763d3ad0d015000cdeb3', '5dee6d5d3ad0d015000cdeb1', 'oAVzdjkCQ0L0DRcPOSpYoL5aFfUY', '4200000457201912108341129711', 20191210002855, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-10 00:28:55', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5def49393ad0d00d70f321bf', '5def48e53ad0d015885d8f0a', 'oAVzdjnVOOPh7iAGhbKs8mZdQIE0', '4200000468201912103133494300', 20191210152901, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2019-12-10 15:29:01', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5def6a5e3ad0d004a8c9bac1', '5def696a3ad0d015885d8f15', 'oAVzdjnVOOPh7iAGhbKs8mZdQIE0', '4200000459201912101740550447', 20191210175027, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-10 17:50:27', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5df08e013ad0d0043c955adb', '5df0842a3ad0d0043c955ada', 'oAVzdjgHZgWY1a_dL73uMUraGeGE', '4200000462201912110148277002', 20191211143445, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-11 14:34:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5df0f9633ad0d00438ca044d', '5df0eeb13ad0d00710a240d8', 'oAVzdjkqkttVZWnrlzRQcgHMgzWw', '4200000460201912112548067505', 20191211221257, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-11 22:12:57', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5df1b6143ad0d016c4595b28', '5df1303d3ad0d01084b182ca', 'oAVzdjvqmZQdq35mN512i_2bmW7U', '4200000459201912121004349588', 20191212113803, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-12 11:38:03', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5df70e153ad0d016748ff789', '5df6f7833ad0d00e48321c61', 'oAVzdjlg1572L5SJt4nBfepf7jyY', '4200000468201912161470035324', 20191216125450, 1000, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2019-12-16 12:54:50', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5dff27d73ad0d0167c1e6a36', '5dff26dd3ad0d0167c1e6a35', 'oAVzdjpFlZK0nwPdRvlHTWWYIspo', '4200000459201912221809639007', 20191222162253, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2019-12-22 16:22:53', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0039bf3ad0d0043c0f9d19', '5e00389e3ad0d000ecc9e2b1', 'oAVzdjgMrRCRbfTxOAX0nS-UlvqY', '4200000453201912232485571869', 20191223115136, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-23 11:51:36', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0470a03ad0d0178c1cba8f', '5e046d7f3ad0d01018bb30b4', 'oAVzdjjDsHDFf5zFua6zziewCx7U', '4200000461201912267910255928', 20191226163445, 200, 'oAVzdjv01R7TULKhkFa6a2JcWa_Y', '黄子锋', '2019-12-26 16:34:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0482163ad0d013705a59cf', '5e0372ee3ad0d00fdc50d699', 'oAVzdjnrrLXtDHFVBeZdPRo0ZLKg', '4200000455201912267816851359', 20191226174915, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-26 17:49:15', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e07441e3ad0d0024caaafde', '5e05d6de3ad0d0129c291498', 'oAVzdjpgAMNPHBqbxgHiQ5jh37ug', '4200000453201912281481393355', 20191228200141, 500, 'oAVzdjgpoZEau_9hxdiDtIWctK54', '余涛', '2019-12-28 20:01:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e09c8e63ad0d01568cf128b', '5e09c65e3ad0d00e184b808c', 'oAVzdjvhXnupo4rWiJYJZ2PjarcE', '4200000470201912309426749331', 20191230175243, 2000, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2019-12-30 17:52:43', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0ae0823ad0d00c14634f94', '5e0ad94e3ad0d014043278d1', 'oAVzdjgMrRCRbfTxOAX0nS-UlvqY', '4200000471201912312372049628', 20191231134546, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2019-12-31 13:45:46', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0c98fe3ad0d01608f82900', '5e0c92bb3ad0d00a0cb92f01', 'oAVzdjpm2n4Di03dgEq0762HExuE', '4200000455202001011799321700', 20200101210507, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-01 21:05:07', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e0d685f3ad0d016804e6d6a', '5e0d64d63ad0d017c8e17f4a', 'oAVzdjklIv8sFwLlMaH8FSDROAwo', '4200000452202001021050618731', 20200102114957, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-01-02 11:49:57', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e11fcef3ad0d00e84ca5ac7', '5e11e2233ad0d0175825a910', 'oAVzdjucSEs0LGnPmA4NNeD8tocE', '4200000458202001053849683235', 20200105231251, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-05 23:12:51', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e131b1c3ad0d00ba493ae9a', '5e12c43c3ad0d00ba493ae83', 'oAVzdjuNjB7pigzVKy3bwScDLVKI', '4200000470202001063046011349', 20200106193352, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-06 19:33:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e134eeb3ad0d00ba493aea7', '5e134ebb3ad0d00d3c354248', 'oAVzdjjdBwRGsLpWHDJLKia1cIgA', '4200000503202001062221664703', 20200106231458, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-06 23:14:58', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e1ff2213ad0d00700ddbbab', '5e1ff12c3ad0d013c881ec04', 'oAVzdjvgZOzXseE-hJyO67e2PQn8', '4200000514202001164743691902', 20200116131832, 500, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2020-01-16 13:18:32', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e2695df3ad0d016308c2777', '5e2691133ad0d0167c6f0a20', 'oAVzdjt82cI9dAtnAFYbt1Dg8B9M', '4200000514202001216107291895', 20200121141048, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-21 14:10:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e2697fa3ad0d016308c277a', '5e2691133ad0d0167c6f0a20', 'oAVzdjt82cI9dAtnAFYbt1Dg8B9M', '4200000515202001213520301470', 20200121141945, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-21 14:19:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e26e3513ad0d016308c278d', '5e2696553ad0d016308c2778', 'oAVzdjt82cI9dAtnAFYbt1Dg8B9M', '4200000515202001212692168493', 20200121194112, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-21 19:41:12', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e27321e3ad0d014f8d86742', '5e26804e3ad0d0167c6f0a1b', 'oAVzdjmSUTYstSoX8-s_1Qs8S6JU', '4200000504202001224552432086', 20200122011728, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-01-22 01:17:28', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e35279e3ad0d01198dc3efa', '5e351e483ad0d013b0a4b67c', 'oAVzdjirgM5foaFShfQaNIurD4dg', '4200000521202002011943216696', 20200201152419, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-02-01 15:24:19', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e3f81423ad0d00bec4d3c7f', '5e3f807d3ad0d00bec4d3c7d', 'oAVzdjvhXnupo4rWiJYJZ2PjarcE', '4200000504202002094069243228', 20200209114926, 500, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2020-02-09 11:49:26', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e4b811a3ad0d007c08772a7', '5e4b7bc53ad0d007c08772a6', 'oAVzdjucSEs0LGnPmA4NNeD8tocE', '4200000513202002189613590924', 20200218141601, 2000, 'oAVzdjqiMwTqEJOPiFv1sziPF3v0', '阿勇', '2020-02-18 14:16:01', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e4bf8703ad0d007c08772c3', '5e4bd56f3ad0d007c08772bf', 'oAVzdjucSEs0LGnPmA4NNeD8tocE', '4200000505202002188851103181', 20200218224508, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-02-18 22:45:08', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e4e1f1d3ad0d00fe0fe284b', '5e4e16153ad0d013545ac9d6', 'oAVzdjgFXvikdvAbiGoG3rPGorDE', '4200000505202002202844258793', 20200220135446, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-02-20 13:54:46', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e4ead4b3ad0d001ec3ba5cd', '5e4e8cf73ad0d001ec3ba5b8', 'oAVzdjlVIxb4nHz52So6q4jUSBSo', '4200000506202002219830988663', 20200221000122, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-02-21 00:01:22', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e53d0153ad0d002c4375740', '5e53cf913ad0d002c437573f', 'oAVzdjrFJpALwWm2r--vS8bo9KWY', '4200000518202002245511510635', 20200224213106, 500, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-02-24 21:31:06', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e53e8703ad0d009ecd843a3', '5e53e4f33ad0d009247b187a', 'oAVzdjpNTq8zbnLkuy0nSgKVn750', '4200000510202002241056724802', 20200224231509, 200, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-02-24 23:15:09', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e5914543ad0d00e0c36129c', '5e5913e13ad0d00e0c36129b', 'oAVzdjuNSthBjeiZHPE5H2QHG5Xw', '4200000514202002286124529202', 20200228212351, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-02-28 21:23:51', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e5ba3e03ad0d00c688ecab2', '5e5a29563ad0d00d6443feb3', 'oAVzdjuPpAIEy4NfDYwEeNIAvsx4', '4200000517202003017131507509', 20200301200041, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-01 20:00:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e5f9c873ad0d00c286534e6', '5e5f9c1c3ad0d006a4370f86', 'oAVzdjqF8L971lNtZxLAQVNjHq4g', '4200000502202003047428321135', 20200304201821, 500, 'oAVzdju5E_NaSOLWfjlUYoTzSdzE', '阿嘉', '2020-03-04 20:18:21', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e5fb8293ad0d00c30a9a2d9', '5e5de1253ad0d01138635ee4', 'oAVzdjvdHYEQhP4cSbpK20EfR2eU', '4200000515202003047714822273', 20200304221618, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-04 22:16:18', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e6f74383ad0d01020d6ca44', '5e6f6a903ad0d00ca0b4d25c', 'oAVzdjlFl5ObaoQo5fi75nm-rbKg', '4200000504202003169904834527', 20200316204241, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-16 20:42:41', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e6f77833ad0d013e07fca91', '5e6f745e3ad0d01020d6ca45', 'oAVzdjlFl5ObaoQo5fi75nm-rbKg', '4200000507202003165738368541', 20200316205645, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-16 20:56:45', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e72f9893ad0d0109c0f2f14', '5e72f6c93ad0d0109c0f2f13', 'oAVzdjnI4MUVzq3dXAbFF0HVl7_Y', '4200000513202003196396940816', 20200319124816, 200, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-19 12:48:16', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e745dec3ad0d0108c057d1f', '5e72b6293ad0d008c44523cc', 'oAVzdjv01eVSrjbW0b3_fYJHna9w', '4200000502202003202671859287', 20200320140852, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-20 14:08:52', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e783da23ad0d000949be10e', '5e7816963ad0d006bcedadd3', 'oAVzdjmBZQUiS0ACaMR7FzWAgIYs', '4200000513202003230513707590', 20200323124006, 2000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-23 12:40:06', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e7a25f93ad0d00d14fd7772', '5e7a06503ad0d00d14fd776b', 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '4200000519202003241433209796', 20200324232344, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-03-24 23:23:44', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e7aee183ad0d006c0ed78c7', '5e7aede93ad0d00988c38c02', 'oAVzdjgpb16bDnrLp43yZgcDF2hs', '4200000520202003250548640619', 20200325133733, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-03-25 13:37:33', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e7d7c6a3ad0d0099c35200e', '5e7d79023ad0d0099c35200d', 'oAVzdjkzewwx1_rPKMy41Kw-zroI', '4200000569202003273616740427', 20200327120920, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '阿捷', '2020-03-27 12:09:20', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e7f49203ad0d0088469885f', '5e7df0903ad0d00638855aa0', 'oAVzdjvdHYEQhP4cSbpK20EfR2eU', '4200000567202003286866364682', 20200328205502, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-28 20:55:02', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e80ab363ad0d008a04fdf4b', '5e80a5773ad0d00d545c4a90', 'oAVzdjmSUTYstSoX8-s_1Qs8S6JU', '4200000556202003294077913097', 20200329220548, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-29 22:05:48', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e81737b3ad0d013b80fcffc', '5e81695e3ad0d012cca55eb1', 'oAVzdjmZE3lStnPefdFrFxKgRsZQ', '4200000563202003301902230420', 20200330122017, 100, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-30 12:20:17', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e83409c3ad0d00788a9d54d', '5e833fc23ad0d01250b084b8', 'oAVzdjpdETSE6OCwQU8qTUSSCqPc', '4200000552202003312153304074', 20200331210747, 500, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-03-31 21:07:47', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e8c2a553ad0d00ef0948ef7', '5e8c28ab3ad0d012c84afed1', 'oAVzdjhjA7h2bJZp8N1w_coIE6_s', '4200000571202004077051636821', 20200407152306, 100, 'oAVzdjiLnwLNsR_sGiNagvJqih_s', '性病检测服务', '2020-04-07 15:23:06', '000000000000000000000000');
INSERT INTO `pay_history` VALUES ('5e8d6f3a3ad0d010943ccbd8', '5e8c8a883ad0d006c01734a8', 'oAVzdjl8gwJfnf-6_6c2-ryE3A6c', '4200000557202004082368287659', 20200408142917, 1000, 'oAVzdjs9LH9fp6QZfWIXwT5pRzZs', '古羽舟', '2020-04-08 14:29:17', '000000000000000000000000');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for sys_diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `sys_diagnosis`;
CREATE TABLE `sys_diagnosis`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` bigint(20) NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_num` smallint(255) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_diagnosis
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (138030650765381, '性别', '性别', 0, 'gender', 1, NULL, 'admin', '2021-04-15 10:55:56.131');
INSERT INTO `sys_dictionary` VALUES (138030650765382, '品种', '品种', 0, 'variety', 2, NULL, 'admin', '2021-04-15 10:57:57.835');
INSERT INTO `sys_dictionary` VALUES (138030650765383, '男', '男', 1382528084493864960, 'gender', 1, NULL, 'admin', '2021-04-15 11:11:18.580');
INSERT INTO `sys_dictionary` VALUES (138030650765384, '女', '女', 1382528084493864960, 'gender', 1, NULL, 'admin', '2021-04-15 11:13:12.747');
INSERT INTO `sys_dictionary` VALUES (138030650765385, '阿拉斯加', '阿拉斯加', 1382528594957438976, 'variety', 1, NULL, 'admin', '2021-04-15 11:13:53.811');
INSERT INTO `sys_dictionary` VALUES (138030650765386, '金毛犬', '金毛犬', 1382528594957438976, 'variety', 1, NULL, 'admin', '2021-04-15 11:14:05.218');

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
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(3) NOT NULL,
  `iframe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否在iframe打开现在都是',
  `menu_level` tinyint(4) NOT NULL COMMENT '菜单层级',
  `menu_type` tinyint(4) NOT NULL COMMENT '类型：0-目录，1-菜单',
  `menu_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单icon',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (138030650765092, '定时任务', '/admin/hangfirejob/index', 'system:hangfirejob:view', 10, 138030650765088, NULL, 'admin', '2019-04-18 17:23:59.429', 0, 2, 1, 'fa fa-tag');
INSERT INTO `sys_menu` VALUES (138030650765093, '异常日志', '/admin/easylog/index', 'system:log:view', 2, 150768673534021, NULL, 'admin', '2020-04-11 12:22:46.047', 0, 3, 1, 'fa fa-tag');
INSERT INTO `sys_menu` VALUES (142971618836549, '生产管理', '#', '#', 1, 0, NULL, 'admin', '2021-03-30 10:13:02.400', 0, 1, 0, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (142971913965637, '员工管理', '/fuhua/staff/index', 'fh:staff:view', 5, 142971618836549, NULL, 'admin', '2021-03-30 10:14:14.454', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (142984211783749, '产品工序', '/fuhua/product/index', 'fh:product:view', 4, 142971618836549, NULL, 'admin', '2021-03-30 11:04:16.851', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (143026935611461, '工时管理', '/fuhua/timebill/index', 'fh:timebill:view', 3, 142971618836549, NULL, 'admin', '2021-03-30 13:58:07.473', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (143326710992965, '工时统计', '/fuhua/WorkTimeReport/index', 'fh:worktimereport:view', 1, 142971618836549, NULL, 'admin', '2021-03-31 10:17:54.822', 0, 2, 1, 'fa fa-bookmark');
INSERT INTO `sys_menu` VALUES (148970094415941, 'Hangfire监控', '/hangfire', '#', 10, 138030650765088, NULL, 'admin', '2021-04-16 09:00:53.978', 0, 2, 1, 'fa fa-bookmark');
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operate
-- ----------------------------
INSERT INTO `sys_operate` VALUES (138030650765481, '新增', 'system:user:add', 1, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765482, '修改', 'system:user:edit', 2, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765483, '删除', 'system:user:delete', 3, 138030650765081);
INSERT INTO `sys_operate` VALUES (138030650765484, '导出', 'system:user:export', 5, 138030650765081);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `menu_pid` bigint(20) NOT NULL,
  `create_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_roleid`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for sys_tables
-- ----------------------------
DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE `sys_tables`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `table_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '表描述',
  `entity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '实体类名称，用于生成控制器和Service',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tables
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (138030650765371, 'admin', 'admin@123', '管理员122', '15961820351', 'admin2@fofia.com', 0, 1, 0, 0, '无锡市富华科技', '/ui/img/profile.jpg', '', 1, 0, 'admin', '2017-08-30 10:36:57.803', 'admin', '2021-02-27 16:40:44');
INSERT INTO `sys_user` VALUES (138030650765372, 'pxw', '123123', '浦总', '18012388691', 'pxw@fofia.com', 1, 0, 1000985679938850816, 101, '江苏真源网络服务有限公司', '/ui/img/profile.jpg', '', 1, 0, 'admin', '2020-01-06 16:28:59.650', 'admin', '2021-02-27 15:22:05');
INSERT INTO `sys_user` VALUES (138030650765373, 'cxq', '123123', '陈总', '', 'cxq@fofia.com', 1, 0, 1000985679938850816, 104, '无锡源致科技', '/ui/img/profile.jpg', '备注', 1, 0, 'admin', '2020-05-10 17:33:53.332', 'admin', '2021-02-27 15:21:58');
INSERT INTO `sys_user` VALUES (138030650765374, 'lyy', '123456', '罗总', '15961820351', 'lyy@fofia.com', 1, 0, 1000985679938850816, 100, '无锡市富华科技', '/ui/img/profile.jpg', '备注事实上111', 1, 0, 'yushuo', '2021-02-01 11:28:17.561', 'admin', '2021-03-12 13:50:27');
INSERT INTO `sys_user` VALUES (138030650765375, 'phh', '123123', '潘总', '13861451731', 'pdd@fofia.com', 1, 0, 1000985679938850816, 101, '江苏真源网络服务有限公司', '/ui/img/profile.jpg', '备注', 1, 0, 'admin', '2021-02-26 16:52:12.934', 'admin', '2021-02-27 15:21:28');
INSERT INTO `sys_user` VALUES (138030650765376, 'yushuo', '123123', '于硕', '15961820351', '461733078@qq.com', 1, 0, 138027723972674, 107, '技术部', '/ui/img/profile.jpg', '于硕', 1, 0, 'admin', '2021-02-26 17:04:29.137', 'admin', '2021-04-23 10:19:11');
INSERT INTO `sys_user` VALUES (138030650765377, 'qqw', '123456', '曲奇伟', '', 'qqw@fofia.com', 1, 0, 1000985679938850816, 3, '硬件研发部', '/ui/img/profile.jpg', '曲奇伟', 1, 0, 'admin', '2021-02-26 17:06:00.296', 'admin', '2021-02-27 15:21:36');
INSERT INTO `sys_user` VALUES (138030650765378, 'mdf', '123123', '毛总', '', 'mdf@fofia.com', 1, 0, 1000985679938850816, 105, '江苏真源科技', '/ui/img/profile.jpg', '毛东方', 1, 0, 'admin', '2021-02-26 17:06:28.377', 'admin', '2021-03-02 13:57:34');
INSERT INTO `sys_user` VALUES (138030650765381, 'ceshi', '123456', '于硕', '15961820351', '', 1, 0, 138027723972677, 0, '', '/ui/img/profile.jpg', NULL, 1, 0, 'admin', '2021-03-16 11:08:11.368', 'admin', '2021-04-02 09:27:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
-- Table structure for water_number
-- ----------------------------
DROP TABLE IF EXISTS `water_number`;
CREATE TABLE `water_number`  (
  `id` int(11) NOT NULL,
  `serial_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_number
-- ----------------------------
INSERT INTO `water_number` VALUES (20190408, 21);
INSERT INTO `water_number` VALUES (20190409, 1);
INSERT INTO `water_number` VALUES (20190418, 1);
INSERT INTO `water_number` VALUES (20190419, 4);
INSERT INTO `water_number` VALUES (20190420, 4);
INSERT INTO `water_number` VALUES (20190422, 20);
INSERT INTO `water_number` VALUES (20190424, 4);
INSERT INTO `water_number` VALUES (20190429, 7);
INSERT INTO `water_number` VALUES (20190430, 11);
INSERT INTO `water_number` VALUES (20190501, 29);
INSERT INTO `water_number` VALUES (20190502, 13);
INSERT INTO `water_number` VALUES (20190503, 29);
INSERT INTO `water_number` VALUES (20190504, 15);
INSERT INTO `water_number` VALUES (20190505, 14);
INSERT INTO `water_number` VALUES (20190506, 11);
INSERT INTO `water_number` VALUES (20190507, 23);
INSERT INTO `water_number` VALUES (20190508, 13);
INSERT INTO `water_number` VALUES (20190509, 14);
INSERT INTO `water_number` VALUES (20190510, 19);
INSERT INTO `water_number` VALUES (20190511, 10);
INSERT INTO `water_number` VALUES (20190512, 9);
INSERT INTO `water_number` VALUES (20190513, 20);
INSERT INTO `water_number` VALUES (20190514, 8);
INSERT INTO `water_number` VALUES (20190515, 17);
INSERT INTO `water_number` VALUES (20190516, 9);
INSERT INTO `water_number` VALUES (20190517, 7);
INSERT INTO `water_number` VALUES (20190518, 13);
INSERT INTO `water_number` VALUES (20190519, 21);
INSERT INTO `water_number` VALUES (20190520, 19);
INSERT INTO `water_number` VALUES (20190521, 30);
INSERT INTO `water_number` VALUES (20190522, 44);
INSERT INTO `water_number` VALUES (20190523, 27);
INSERT INTO `water_number` VALUES (20190524, 21);
INSERT INTO `water_number` VALUES (20190525, 24);
INSERT INTO `water_number` VALUES (20190526, 21);
INSERT INTO `water_number` VALUES (20190527, 10);
INSERT INTO `water_number` VALUES (20190528, 12);
INSERT INTO `water_number` VALUES (20190529, 18);
INSERT INTO `water_number` VALUES (20190530, 24);
INSERT INTO `water_number` VALUES (20190531, 9);
INSERT INTO `water_number` VALUES (20190601, 11);
INSERT INTO `water_number` VALUES (20190602, 24);
INSERT INTO `water_number` VALUES (20190603, 18);
INSERT INTO `water_number` VALUES (20190604, 24);
INSERT INTO `water_number` VALUES (20190605, 7);
INSERT INTO `water_number` VALUES (20190606, 16);
INSERT INTO `water_number` VALUES (20190607, 47);
INSERT INTO `water_number` VALUES (20190608, 32);
INSERT INTO `water_number` VALUES (20190609, 19);
INSERT INTO `water_number` VALUES (20190610, 14);
INSERT INTO `water_number` VALUES (20190611, 38);
INSERT INTO `water_number` VALUES (20190612, 26);
INSERT INTO `water_number` VALUES (20190613, 35);
INSERT INTO `water_number` VALUES (20190614, 9);
INSERT INTO `water_number` VALUES (20190615, 14);
INSERT INTO `water_number` VALUES (20190616, 10);
INSERT INTO `water_number` VALUES (20190617, 9);
INSERT INTO `water_number` VALUES (20190618, 14);
INSERT INTO `water_number` VALUES (20190619, 8);
INSERT INTO `water_number` VALUES (20190620, 3);
INSERT INTO `water_number` VALUES (20190621, 12);
INSERT INTO `water_number` VALUES (20190622, 14);
INSERT INTO `water_number` VALUES (20190623, 22);
INSERT INTO `water_number` VALUES (20190624, 17);
INSERT INTO `water_number` VALUES (20190625, 15);
INSERT INTO `water_number` VALUES (20190626, 13);
INSERT INTO `water_number` VALUES (20190627, 10);
INSERT INTO `water_number` VALUES (20190628, 16);
INSERT INTO `water_number` VALUES (20190629, 11);
INSERT INTO `water_number` VALUES (20190630, 21);
INSERT INTO `water_number` VALUES (20190701, 21);
INSERT INTO `water_number` VALUES (20190702, 14);
INSERT INTO `water_number` VALUES (20190703, 22);
INSERT INTO `water_number` VALUES (20190704, 12);
INSERT INTO `water_number` VALUES (20190705, 10);
INSERT INTO `water_number` VALUES (20190706, 10);
INSERT INTO `water_number` VALUES (20190707, 11);
INSERT INTO `water_number` VALUES (20190708, 12);
INSERT INTO `water_number` VALUES (20190709, 6);
INSERT INTO `water_number` VALUES (20190710, 12);
INSERT INTO `water_number` VALUES (20190711, 19);
INSERT INTO `water_number` VALUES (20190712, 19);
INSERT INTO `water_number` VALUES (20190713, 19);
INSERT INTO `water_number` VALUES (20190714, 20);
INSERT INTO `water_number` VALUES (20190715, 10);
INSERT INTO `water_number` VALUES (20190716, 12);
INSERT INTO `water_number` VALUES (20190717, 23);
INSERT INTO `water_number` VALUES (20190718, 34);
INSERT INTO `water_number` VALUES (20190719, 19);
INSERT INTO `water_number` VALUES (20190720, 9);
INSERT INTO `water_number` VALUES (20190721, 9);
INSERT INTO `water_number` VALUES (20190722, 22);
INSERT INTO `water_number` VALUES (20190723, 21);
INSERT INTO `water_number` VALUES (20190724, 4);
INSERT INTO `water_number` VALUES (20190725, 10);
INSERT INTO `water_number` VALUES (20190726, 19);
INSERT INTO `water_number` VALUES (20190727, 20);
INSERT INTO `water_number` VALUES (20190728, 14);
INSERT INTO `water_number` VALUES (20190729, 26);
INSERT INTO `water_number` VALUES (20190730, 17);
INSERT INTO `water_number` VALUES (20190731, 14);
INSERT INTO `water_number` VALUES (20190801, 13);
INSERT INTO `water_number` VALUES (20190802, 21);
INSERT INTO `water_number` VALUES (20190803, 21);
INSERT INTO `water_number` VALUES (20190804, 15);
INSERT INTO `water_number` VALUES (20190805, 23);
INSERT INTO `water_number` VALUES (20190806, 12);
INSERT INTO `water_number` VALUES (20190807, 19);
INSERT INTO `water_number` VALUES (20190808, 19);
INSERT INTO `water_number` VALUES (20190809, 16);
INSERT INTO `water_number` VALUES (20190810, 13);
INSERT INTO `water_number` VALUES (20190811, 11);
INSERT INTO `water_number` VALUES (20190812, 10);
INSERT INTO `water_number` VALUES (20190813, 8);
INSERT INTO `water_number` VALUES (20190814, 7);
INSERT INTO `water_number` VALUES (20190815, 12);
INSERT INTO `water_number` VALUES (20190816, 12);
INSERT INTO `water_number` VALUES (20190817, 16);
INSERT INTO `water_number` VALUES (20190818, 13);
INSERT INTO `water_number` VALUES (20190819, 8);
INSERT INTO `water_number` VALUES (20190820, 14);
INSERT INTO `water_number` VALUES (20190821, 4);
INSERT INTO `water_number` VALUES (20190822, 14);
INSERT INTO `water_number` VALUES (20190823, 5);
INSERT INTO `water_number` VALUES (20190824, 13);
INSERT INTO `water_number` VALUES (20190825, 9);
INSERT INTO `water_number` VALUES (20190826, 11);
INSERT INTO `water_number` VALUES (20190827, 12);
INSERT INTO `water_number` VALUES (20190828, 15);
INSERT INTO `water_number` VALUES (20190829, 29);
INSERT INTO `water_number` VALUES (20190830, 15);
INSERT INTO `water_number` VALUES (20190831, 4);
INSERT INTO `water_number` VALUES (20190901, 12);
INSERT INTO `water_number` VALUES (20190902, 17);
INSERT INTO `water_number` VALUES (20190903, 5);
INSERT INTO `water_number` VALUES (20190904, 10);
INSERT INTO `water_number` VALUES (20190905, 13);
INSERT INTO `water_number` VALUES (20190906, 12);
INSERT INTO `water_number` VALUES (20190907, 19);
INSERT INTO `water_number` VALUES (20190908, 8);
INSERT INTO `water_number` VALUES (20190909, 17);
INSERT INTO `water_number` VALUES (20190910, 12);
INSERT INTO `water_number` VALUES (20190911, 7);
INSERT INTO `water_number` VALUES (20190912, 7);
INSERT INTO `water_number` VALUES (20190913, 6);
INSERT INTO `water_number` VALUES (20190914, 13);
INSERT INTO `water_number` VALUES (20190915, 13);
INSERT INTO `water_number` VALUES (20190916, 11);
INSERT INTO `water_number` VALUES (20190917, 7);
INSERT INTO `water_number` VALUES (20190918, 8);
INSERT INTO `water_number` VALUES (20190919, 6);
INSERT INTO `water_number` VALUES (20190920, 14);
INSERT INTO `water_number` VALUES (20190921, 17);
INSERT INTO `water_number` VALUES (20190922, 7);
INSERT INTO `water_number` VALUES (20190923, 7);
INSERT INTO `water_number` VALUES (20190924, 13);
INSERT INTO `water_number` VALUES (20190925, 18);
INSERT INTO `water_number` VALUES (20190926, 13);
INSERT INTO `water_number` VALUES (20190927, 35);
INSERT INTO `water_number` VALUES (20190928, 14);
INSERT INTO `water_number` VALUES (20190929, 13);
INSERT INTO `water_number` VALUES (20190930, 8);
INSERT INTO `water_number` VALUES (20191001, 18);
INSERT INTO `water_number` VALUES (20191002, 10);
INSERT INTO `water_number` VALUES (20191003, 10);
INSERT INTO `water_number` VALUES (20191004, 11);
INSERT INTO `water_number` VALUES (20191005, 14);
INSERT INTO `water_number` VALUES (20191006, 17);
INSERT INTO `water_number` VALUES (20191007, 18);
INSERT INTO `water_number` VALUES (20191008, 14);
INSERT INTO `water_number` VALUES (20191009, 13);
INSERT INTO `water_number` VALUES (20191010, 26);
INSERT INTO `water_number` VALUES (20191011, 14);
INSERT INTO `water_number` VALUES (20191012, 10);
INSERT INTO `water_number` VALUES (20191013, 11);
INSERT INTO `water_number` VALUES (20191014, 6);
INSERT INTO `water_number` VALUES (20191015, 8);
INSERT INTO `water_number` VALUES (20191016, 10);
INSERT INTO `water_number` VALUES (20191017, 10);
INSERT INTO `water_number` VALUES (20191018, 2);
INSERT INTO `water_number` VALUES (20191019, 11);
INSERT INTO `water_number` VALUES (20191020, 15);
INSERT INTO `water_number` VALUES (20191021, 13);
INSERT INTO `water_number` VALUES (20191022, 9);
INSERT INTO `water_number` VALUES (20191023, 7);
INSERT INTO `water_number` VALUES (20191024, 14);
INSERT INTO `water_number` VALUES (20191025, 18);
INSERT INTO `water_number` VALUES (20191026, 15);
INSERT INTO `water_number` VALUES (20191027, 7);
INSERT INTO `water_number` VALUES (20191028, 20);
INSERT INTO `water_number` VALUES (20191029, 10);
INSERT INTO `water_number` VALUES (20191030, 12);
INSERT INTO `water_number` VALUES (20191031, 5);
INSERT INTO `water_number` VALUES (20191101, 11);
INSERT INTO `water_number` VALUES (20191102, 16);
INSERT INTO `water_number` VALUES (20191103, 12);
INSERT INTO `water_number` VALUES (20191104, 17);
INSERT INTO `water_number` VALUES (20191105, 13);
INSERT INTO `water_number` VALUES (20191106, 9);
INSERT INTO `water_number` VALUES (20191107, 5);
INSERT INTO `water_number` VALUES (20191108, 9);
INSERT INTO `water_number` VALUES (20191109, 11);
INSERT INTO `water_number` VALUES (20191110, 6);
INSERT INTO `water_number` VALUES (20191111, 9);
INSERT INTO `water_number` VALUES (20191112, 7);
INSERT INTO `water_number` VALUES (20191113, 2);
INSERT INTO `water_number` VALUES (20191114, 7);
INSERT INTO `water_number` VALUES (20191115, 17);
INSERT INTO `water_number` VALUES (20191116, 19);
INSERT INTO `water_number` VALUES (20191117, 17);
INSERT INTO `water_number` VALUES (20191118, 17);
INSERT INTO `water_number` VALUES (20191119, 8);
INSERT INTO `water_number` VALUES (20191120, 11);
INSERT INTO `water_number` VALUES (20191121, 11);
INSERT INTO `water_number` VALUES (20191122, 7);
INSERT INTO `water_number` VALUES (20191123, 19);
INSERT INTO `water_number` VALUES (20191124, 9);
INSERT INTO `water_number` VALUES (20191125, 7);
INSERT INTO `water_number` VALUES (20191126, 4);
INSERT INTO `water_number` VALUES (20191127, 7);
INSERT INTO `water_number` VALUES (20191128, 11);
INSERT INTO `water_number` VALUES (20191129, 26);
INSERT INTO `water_number` VALUES (20191130, 27);
INSERT INTO `water_number` VALUES (20191201, 47);
INSERT INTO `water_number` VALUES (20191202, 26);
INSERT INTO `water_number` VALUES (20191203, 14);
INSERT INTO `water_number` VALUES (20191204, 25);
INSERT INTO `water_number` VALUES (20191205, 7);
INSERT INTO `water_number` VALUES (20191206, 9);
INSERT INTO `water_number` VALUES (20191207, 11);
INSERT INTO `water_number` VALUES (20191208, 13);
INSERT INTO `water_number` VALUES (20191209, 19);
INSERT INTO `water_number` VALUES (20191210, 15);
INSERT INTO `water_number` VALUES (20191211, 10);
INSERT INTO `water_number` VALUES (20191212, 5);
INSERT INTO `water_number` VALUES (20191213, 5);
INSERT INTO `water_number` VALUES (20191214, 11);
INSERT INTO `water_number` VALUES (20191215, 5);
INSERT INTO `water_number` VALUES (20191216, 14);
INSERT INTO `water_number` VALUES (20191217, 11);
INSERT INTO `water_number` VALUES (20191218, 18);
INSERT INTO `water_number` VALUES (20191219, 13);
INSERT INTO `water_number` VALUES (20191220, 12);
INSERT INTO `water_number` VALUES (20191221, 6);
INSERT INTO `water_number` VALUES (20191222, 8);
INSERT INTO `water_number` VALUES (20191223, 16);
INSERT INTO `water_number` VALUES (20191224, 4);
INSERT INTO `water_number` VALUES (20191225, 22);
INSERT INTO `water_number` VALUES (20191226, 21);
INSERT INTO `water_number` VALUES (20191227, 8);
INSERT INTO `water_number` VALUES (20191228, 24);
INSERT INTO `water_number` VALUES (20191229, 19);
INSERT INTO `water_number` VALUES (20191230, 17);
INSERT INTO `water_number` VALUES (20191231, 8);
INSERT INTO `water_number` VALUES (20200101, 8);
INSERT INTO `water_number` VALUES (20200102, 18);
INSERT INTO `water_number` VALUES (20200103, 11);
INSERT INTO `water_number` VALUES (20200104, 14);
INSERT INTO `water_number` VALUES (20200105, 10);
INSERT INTO `water_number` VALUES (20200106, 9);
INSERT INTO `water_number` VALUES (20200107, 9);
INSERT INTO `water_number` VALUES (20200108, 4);
INSERT INTO `water_number` VALUES (20200109, 10);
INSERT INTO `water_number` VALUES (20200110, 18);
INSERT INTO `water_number` VALUES (20200111, 6);
INSERT INTO `water_number` VALUES (20200112, 4);
INSERT INTO `water_number` VALUES (20200113, 14);
INSERT INTO `water_number` VALUES (20200114, 14);
INSERT INTO `water_number` VALUES (20200115, 9);
INSERT INTO `water_number` VALUES (20200116, 13);
INSERT INTO `water_number` VALUES (20200117, 25);
INSERT INTO `water_number` VALUES (20200118, 8);
INSERT INTO `water_number` VALUES (20200119, 4);
INSERT INTO `water_number` VALUES (20200120, 1);
INSERT INTO `water_number` VALUES (20200121, 14);
INSERT INTO `water_number` VALUES (20200123, 7);
INSERT INTO `water_number` VALUES (20200124, 3);
INSERT INTO `water_number` VALUES (20200125, 1);
INSERT INTO `water_number` VALUES (20200127, 3);
INSERT INTO `water_number` VALUES (20200128, 4);
INSERT INTO `water_number` VALUES (20200129, 6);
INSERT INTO `water_number` VALUES (20200131, 7);
INSERT INTO `water_number` VALUES (20200201, 4);
INSERT INTO `water_number` VALUES (20200202, 4);
INSERT INTO `water_number` VALUES (20200203, 3);
INSERT INTO `water_number` VALUES (20200204, 2);
INSERT INTO `water_number` VALUES (20200205, 1);
INSERT INTO `water_number` VALUES (20200206, 4);
INSERT INTO `water_number` VALUES (20200207, 5);
INSERT INTO `water_number` VALUES (20200208, 4);
INSERT INTO `water_number` VALUES (20200209, 7);
INSERT INTO `water_number` VALUES (20200211, 4);
INSERT INTO `water_number` VALUES (20200212, 7);
INSERT INTO `water_number` VALUES (20200213, 6);
INSERT INTO `water_number` VALUES (20200214, 5);
INSERT INTO `water_number` VALUES (20200215, 1);
INSERT INTO `water_number` VALUES (20200216, 13);
INSERT INTO `water_number` VALUES (20200217, 8);
INSERT INTO `water_number` VALUES (20200218, 8);
INSERT INTO `water_number` VALUES (20200219, 2);
INSERT INTO `water_number` VALUES (20200220, 3);
INSERT INTO `water_number` VALUES (20200221, 4);
INSERT INTO `water_number` VALUES (20200222, 2);
INSERT INTO `water_number` VALUES (20200224, 7);
INSERT INTO `water_number` VALUES (20200225, 9);
INSERT INTO `water_number` VALUES (20200226, 1);
INSERT INTO `water_number` VALUES (20200227, 10);
INSERT INTO `water_number` VALUES (20200228, 5);
INSERT INTO `water_number` VALUES (20200229, 8);
INSERT INTO `water_number` VALUES (20200301, 3);
INSERT INTO `water_number` VALUES (20200302, 2);
INSERT INTO `water_number` VALUES (20200303, 5);
INSERT INTO `water_number` VALUES (20200304, 3);
INSERT INTO `water_number` VALUES (20200305, 2);
INSERT INTO `water_number` VALUES (20200306, 12);
INSERT INTO `water_number` VALUES (20200307, 7);
INSERT INTO `water_number` VALUES (20200308, 9);
INSERT INTO `water_number` VALUES (20200309, 4);
INSERT INTO `water_number` VALUES (20200310, 8);
INSERT INTO `water_number` VALUES (20200311, 6);
INSERT INTO `water_number` VALUES (20200312, 5);
INSERT INTO `water_number` VALUES (20200313, 3);
INSERT INTO `water_number` VALUES (20200314, 8);
INSERT INTO `water_number` VALUES (20200315, 4);
INSERT INTO `water_number` VALUES (20200316, 7);
INSERT INTO `water_number` VALUES (20200317, 3);
INSERT INTO `water_number` VALUES (20200318, 6);
INSERT INTO `water_number` VALUES (20200319, 6);
INSERT INTO `water_number` VALUES (20200320, 11);
INSERT INTO `water_number` VALUES (20200321, 6);
INSERT INTO `water_number` VALUES (20200322, 6);
INSERT INTO `water_number` VALUES (20200323, 8);
INSERT INTO `water_number` VALUES (20200324, 13);
INSERT INTO `water_number` VALUES (20200325, 6);
INSERT INTO `water_number` VALUES (20200326, 4);
INSERT INTO `water_number` VALUES (20200327, 7);
INSERT INTO `water_number` VALUES (20200328, 4);
INSERT INTO `water_number` VALUES (20200329, 7);
INSERT INTO `water_number` VALUES (20200330, 12);
INSERT INTO `water_number` VALUES (20200331, 14);
INSERT INTO `water_number` VALUES (20200401, 12);
INSERT INTO `water_number` VALUES (20200402, 6);
INSERT INTO `water_number` VALUES (20200403, 4);
INSERT INTO `water_number` VALUES (20200404, 8);
INSERT INTO `water_number` VALUES (20200405, 7);
INSERT INTO `water_number` VALUES (20200406, 5);
INSERT INTO `water_number` VALUES (20200407, 9);
INSERT INTO `water_number` VALUES (20200408, 2);
INSERT INTO `water_number` VALUES (20200409, 1);

-- ----------------------------
-- Table structure for weixin_set
-- ----------------------------
DROP TABLE IF EXISTS `weixin_set`;
CREATE TABLE `weixin_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `consulting_success` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `feed_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pay_notice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_set
-- ----------------------------
INSERT INTO `weixin_set` VALUES (4, 'http://182.43.178.216:9006', 'KN_168ZYI3in5bmbDPJyaS-1uSPoeMB4y9RcQ4A-PgA', 'WsHUzIsqiS_mj8T_zVM0AyeYeUvwGRmZPiOslDroffo', 'kjBH3e5ILVXG1JF6yHKal2mBDpg04M0xNT0cHL9N6qI', 'kjBH3e5ILVXG1JF6yHKal2mBDpg04M0xNT0cHL9N6qI', 'w3sXNn3f_XQs2SxLMsxrlsIsZv-GUIyqJcavMFxkO9M');
INSERT INTO `weixin_set` VALUES (5, 'http://182.43.178.216:9006', 'KN_168ZYI3in5bmbDPJyaS-1uSPoeMB4y9RcQ4A-PgA', 'WsHUzIsqiS_mj8T_zVM0AyeYeUvwGRmZPiOslDroffo', 'kjBH3e5ILVXG1JF6yHKal2mBDpg04M0xNT0cHL9N6qI', 'kjBH3e5ILVXG1JF6yHKal2mBDpg04M0xNT0cHL9N6qI', 'w3sXNn3f_XQs2SxLMsxrlsIsZv-GUIyqJcavMFxkO9M');

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

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `open_id` char(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `national` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marriage_status` tinyint(2) NOT NULL,
  `educational_level` tinyint(2) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gender` tinyint(2) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('5ea6910dc1a5090d38c55bd9', 'oSwFD1MDHXUb-FwNvyQMl84fJbTg', '泉哥', '自由', '汉', 2, 5, '2020-04-27 16:00:13', 1, 2019, '', '北京', '北京市');
INSERT INTO `wx_user` VALUES ('5eaba1cfc1a5091ad8b192a1', 'oSwFD1CiLggugMME0w0ATuwABPdg', '让人', '', '', 0, 0, '2020-05-01 12:13:04', 1, 2004, '', '山西省', '太原市');
INSERT INTO `wx_user` VALUES ('5eabd23ac1a5091ad8b192a5', 'o3m4Rs7DVszSC4xUdvRefZb5zHRE', '于硕', '', '', 0, 0, '2020-05-01 15:39:38', 1, 2006, '', '江苏省', '无锡市');
INSERT INTO `wx_user` VALUES ('5eb36bc7c1a50916309d6dd5', 'o3m4Rs9xns-njcbbPSPNY5BAFLLU', '匿名', '', '', 0, 0, '2020-05-07 10:00:40', 1, 2020, '', '北京', '北京市');
INSERT INTO `wx_user` VALUES ('5eb79d01c1a5090d64702a5d', 'o3m4Rs-yG-QV8Tw2hcKRcU0vCRwo', '暴君爱草丛', '', '', 0, 0, '2020-05-10 14:19:46', 1, 2016, '', '广东省', '广州市');
INSERT INTO `wx_user` VALUES ('5eb79d55c1a5090d64702a60', 'o3m4RszBOBnyZL8-2gqLSTCJ8qhA', 't', '', '', 0, 0, '2020-05-10 14:21:09', 1, 2020, '', '山西省', '太原市');

SET FOREIGN_KEY_CHECKS = 1;
