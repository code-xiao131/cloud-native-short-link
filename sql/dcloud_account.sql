/*
 Navicat Premium Data Transfer

 Source Server         : 短链_大课
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 120.79.150.146:3306
 Source Schema         : dcloud_account

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 25/04/2022 16:49:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_no` bigint DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `pwd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '盐，用于个人敏感信息处理',
  `mail` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `auth` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '认证级别，DEFAULT，REALNAME，ENTERPRISE，访问次数不一样',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_phone` (`phone`) USING BTREE,
  UNIQUE KEY `uk_account` (`account_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (11, 693100647796441088, 'https://dcloud-link.oss-cn-guangzhou.aliyuncs.com/user/2021/11/18/4e5bcb2327ea4a94b607b6272cb1b8dd.png', '13113777337', '$1$Ix2b9oNG$QVLe0ws5xJwopKisubajJ0', '$1$Ix2b9oNG', NULL, '小滴v1', 'DEFAULT', '2022-01-26 14:14:35', '2022-01-26 14:14:35');
INSERT INTO `account` VALUES (12, 1643354298455, '', '15529052608', '$1$0cymioeh$CoYp5.mb3I0d0iyb/emr//', '$1$0cymioeh', '', 'duanmouren', NULL, '2022-01-28 15:18:19', '2022-01-28 15:18:19');
INSERT INTO `account` VALUES (13, 697547303568801792, '', '15529052603', '$1$FnHFsFIZ$8Tv/ScqQM8YRUdJBoY/HY/', '$1$FnHFsFIZ', '', 'duanmouren', NULL, '2022-02-07 20:43:56', '2022-02-07 20:43:56');
INSERT INTO `account` VALUES (14, 697548723361677312, '', '15529052604', '$1$AeHbZK9F$2dYR3.OPuF6HL6uhHS7tk.', '$1$AeHbZK9F', '', 'duanmouren', NULL, '2022-02-07 20:49:34', '2022-02-25 13:59:46');
COMMIT;

-- ----------------------------
-- Table structure for traffic_0
-- ----------------------------
DROP TABLE IF EXISTS `traffic_0`;
CREATE TABLE `traffic_0` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day_limit` int DEFAULT NULL COMMENT '每天限制多少条，短链',
  `day_used` int DEFAULT NULL COMMENT '当天用了多少条，短链',
  `total_limit` int DEFAULT NULL COMMENT '总次数，活码才用',
  `account_no` bigint DEFAULT NULL COMMENT '账号',
  `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单号',
  `level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品层级：FIRST青铜、SECOND黄金、THIRD钻石',
  `expired_date` date DEFAULT NULL COMMENT '过期日期',
  `plugin_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '插件类型',
  `product_id` bigint DEFAULT NULL COMMENT '商品主键',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_trade_no` (`out_trade_no`,`account_no`) USING BTREE,
  KEY `idx_account_no` (`account_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1507594451815100443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of traffic_0
-- ----------------------------
BEGIN;
INSERT INTO `traffic_0` VALUES (1486221880318595073, 5, 2, NULL, 693100647796441088, 'zxABhkLEGrGvmSeSbx23COfU71yj7nwN', 'SECOND', '2022-04-25', 'SHORT_LINK', 2, '2022-01-26 14:18:06', '2022-04-24 18:57:24');
INSERT INTO `traffic_0` VALUES (1486221880318595076, 2, 0, NULL, 693100647796441088, 'free_init', 'FIRST', '2022-01-11', 'SHORT_LINK', 1, '2022-02-14 11:31:02', '2022-02-19 17:15:23');
INSERT INTO `traffic_0` VALUES (1486221880318595079, 2, 0, NULL, 693100647796441082, 'free_init', 'FIRST', '2022-01-11', 'SHORT_LINK', 1, '2022-02-14 11:31:02', '2022-02-14 11:31:50');
INSERT INTO `traffic_0` VALUES (1507594449516621825, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:02', '2022-03-26 13:45:02');
INSERT INTO `traffic_0` VALUES (1507594450670055425, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_0` VALUES (1507594450955268098, NULL, NULL, NULL, 94, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_0` VALUES (1507594451248869377, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_0` VALUES (1507594451538276353, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_0` VALUES (1507594451815100418, NULL, NULL, NULL, 70, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_0` VALUES (1507594451815100419, NULL, NULL, NULL, 372, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:59:16', '2022-03-27 14:59:16');
INSERT INTO `traffic_0` VALUES (1507594451815100420, NULL, NULL, NULL, 250, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:59:16', '2022-03-27 14:59:16');
INSERT INTO `traffic_0` VALUES (1507594451815100421, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_0` VALUES (1507594451815100422, NULL, NULL, NULL, 72, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_0` VALUES (1507594451815100423, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:45', '2022-04-05 15:29:45');
INSERT INTO `traffic_0` VALUES (1507594451815100424, NULL, NULL, NULL, 98, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:45', '2022-04-05 15:29:45');
INSERT INTO `traffic_0` VALUES (1507594451815100425, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:45', '2022-04-05 15:29:45');
INSERT INTO `traffic_0` VALUES (1507594451815100426, NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:45', '2022-04-05 15:29:45');
INSERT INTO `traffic_0` VALUES (1507594451815100427, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_0` VALUES (1507594451815100428, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_0` VALUES (1507594451815100429, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_0` VALUES (1507594451815100430, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_0` VALUES (1507594451815100431, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:58', '2022-04-05 15:31:58');
INSERT INTO `traffic_0` VALUES (1507594451815100432, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:39:51', '2022-04-22 10:39:51');
INSERT INTO `traffic_0` VALUES (1507594451815100433, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:40', '2022-04-22 10:48:40');
INSERT INTO `traffic_0` VALUES (1507594451815100434, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:40', '2022-04-22 10:48:40');
INSERT INTO `traffic_0` VALUES (1507594451815100435, NULL, NULL, NULL, 82, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:40', '2022-04-22 10:48:40');
INSERT INTO `traffic_0` VALUES (1507594451815100436, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:40', '2022-04-22 10:48:40');
INSERT INTO `traffic_0` VALUES (1507594451815100437, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:41', '2022-04-22 10:48:41');
INSERT INTO `traffic_0` VALUES (1507594451815100438, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:41', '2022-04-22 10:48:41');
INSERT INTO `traffic_0` VALUES (1507594451815100439, NULL, NULL, NULL, 94, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:25', '2022-04-22 10:49:25');
INSERT INTO `traffic_0` VALUES (1507594451815100440, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_0` VALUES (1507594451815100441, NULL, NULL, NULL, 90, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_0` VALUES (1507594451815100442, NULL, NULL, NULL, 82, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:27', '2022-04-22 10:49:27');
COMMIT;

-- ----------------------------
-- Table structure for traffic_1
-- ----------------------------
DROP TABLE IF EXISTS `traffic_1`;
CREATE TABLE `traffic_1` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day_limit` int DEFAULT NULL COMMENT '每天限制多少条，短链',
  `day_used` int DEFAULT NULL COMMENT '当天用了多少条，短链',
  `total_limit` int DEFAULT NULL COMMENT '总次数，活码才用',
  `account_no` bigint DEFAULT NULL COMMENT '账号',
  `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '订单号',
  `level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品层级：FIRST青铜、SECOND黄金、THIRD钻石',
  `expired_date` date DEFAULT NULL COMMENT '过期日期',
  `plugin_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '插件类型',
  `product_id` bigint DEFAULT NULL COMMENT '商品主键',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_trade_no` (`out_trade_no`,`account_no`) USING BTREE,
  KEY `idx_account_no` (`account_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1507594450405814294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of traffic_1
-- ----------------------------
BEGIN;
INSERT INTO `traffic_1` VALUES (1507594446966484994, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:02', '2022-03-26 13:45:02');
INSERT INTO `traffic_1` VALUES (1507594449814417409, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_1` VALUES (1507594450099630081, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_1` VALUES (1507594450405814273, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, '2022-03-26 13:45:03', '2022-03-26 13:45:03');
INSERT INTO `traffic_1` VALUES (1507594450405814274, NULL, NULL, NULL, 139, NULL, NULL, NULL, NULL, NULL, '2022-03-27 14:59:16', '2022-03-27 14:59:16');
INSERT INTO `traffic_1` VALUES (1507594450405814275, NULL, NULL, NULL, 83, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_1` VALUES (1507594450405814276, NULL, NULL, NULL, 87, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_1` VALUES (1507594450405814277, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_1` VALUES (1507594450405814278, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:29:44', '2022-04-05 15:29:44');
INSERT INTO `traffic_1` VALUES (1507594450405814279, NULL, NULL, NULL, 89, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:56', '2022-04-05 15:31:56');
INSERT INTO `traffic_1` VALUES (1507594450405814280, NULL, NULL, NULL, 97, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_1` VALUES (1507594450405814281, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_1` VALUES (1507594450405814282, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:57', '2022-04-05 15:31:57');
INSERT INTO `traffic_1` VALUES (1507594450405814283, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, '2022-04-05 15:31:58', '2022-04-05 15:31:58');
INSERT INTO `traffic_1` VALUES (1507594450405814284, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:40', '2022-04-22 10:48:40');
INSERT INTO `traffic_1` VALUES (1507594450405814285, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:41', '2022-04-22 10:48:41');
INSERT INTO `traffic_1` VALUES (1507594450405814286, NULL, NULL, NULL, 69, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:41', '2022-04-22 10:48:41');
INSERT INTO `traffic_1` VALUES (1507594450405814287, NULL, NULL, NULL, 85, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:48:41', '2022-04-22 10:48:41');
INSERT INTO `traffic_1` VALUES (1507594450405814288, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:25', '2022-04-22 10:49:25');
INSERT INTO `traffic_1` VALUES (1507594450405814289, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_1` VALUES (1507594450405814290, NULL, NULL, NULL, 73, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_1` VALUES (1507594450405814291, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_1` VALUES (1507594450405814292, NULL, NULL, NULL, 89, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
INSERT INTO `traffic_1` VALUES (1507594450405814293, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2022-04-22 10:49:26', '2022-04-22 10:49:26');
COMMIT;

-- ----------------------------
-- Table structure for traffic_task
-- ----------------------------
DROP TABLE IF EXISTS `traffic_task`;
CREATE TABLE `traffic_task` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_no` bigint DEFAULT NULL,
  `traffic_id` bigint DEFAULT NULL,
  `use_times` int DEFAULT NULL,
  `lock_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '锁定状态锁定LOCK  完成FINISH-取消CANCEL',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '唯一标识',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_biz_id` (`biz_id`) USING BTREE,
  KEY `idx_release` (`account_no`,`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of traffic_task
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;