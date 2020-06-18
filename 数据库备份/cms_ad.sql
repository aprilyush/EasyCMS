/*
 Navicat Premium Data Transfer

 Source Server         : mysql57-123123
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3307
 Source Schema         : easy_cms

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/06/2020 19:39:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ad_href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ad_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ad_status` tinyint(1) NOT NULL,
  `image_width` int(11) NOT NULL,
  `image_height` int(11) NOT NULL,
  `insert_time` datetime(0) NOT NULL,
  `insert_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES (1, '国庆周年', 'www.badu.com', '/upfiles/images/20200618/5eeb525dc4cd292320311058.jpg', 1, 100, 150, '2020-06-18 19:39:13', 11297175912976384);

SET FOREIGN_KEY_CHECKS = 1;
