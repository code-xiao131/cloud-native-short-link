/*
 Navicat Premium Data Transfer

 Source Server         : rancher-midware
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 112.74.107.230:3306
 Source Schema         : xxl_job

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 25/04/2022 17:11:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_group` VALUES (3, 'traffic-app-executor', '流量包执行器', 0, 'http://10.42.1.20:9999/');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB AUTO_INCREMENT=89580 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_log_report` VALUES (1, '2021-10-14 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (2, '2021-10-13 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (3, '2021-10-12 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (4, '2021-10-15 00:00:00', 0, 0, 2427);
INSERT INTO `xxl_job_log_report` VALUES (5, '2021-10-16 00:00:00', 0, 0, 11348);
INSERT INTO `xxl_job_log_report` VALUES (6, '2021-10-17 00:00:00', 0, 0, 21517);
INSERT INTO `xxl_job_log_report` VALUES (7, '2021-10-18 00:00:00', 2, 0, 15558);
INSERT INTO `xxl_job_log_report` VALUES (8, '2021-10-19 00:00:00', 1, 0, 7057);
INSERT INTO `xxl_job_log_report` VALUES (9, '2021-10-20 00:00:00', 0, 0, 2005);
INSERT INTO `xxl_job_log_report` VALUES (10, '2021-10-24 00:00:00', 1, 0, 1827);
INSERT INTO `xxl_job_log_report` VALUES (11, '2021-10-23 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (12, '2021-10-22 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (13, '2022-02-10 00:00:00', 0, 21, 0);
INSERT INTO `xxl_job_log_report` VALUES (14, '2022-02-09 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (15, '2022-02-08 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (16, '2022-02-11 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (17, '2022-02-12 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (18, '2022-02-13 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (19, '2022-02-14 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (20, '2022-02-15 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (21, '2022-02-16 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (22, '2022-02-17 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (23, '2022-02-18 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (24, '2022-02-19 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (25, '2022-02-20 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (26, '2022-02-21 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (27, '2022-02-22 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (28, '2022-02-23 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (29, '2022-02-24 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (30, '2022-03-04 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (31, '2022-03-03 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (32, '2022-03-02 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (33, '2022-03-07 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (34, '2022-03-06 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (35, '2022-03-05 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (36, '2022-03-08 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (37, '2022-03-09 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (38, '2022-03-13 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (39, '2022-03-12 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (40, '2022-03-11 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (41, '2022-03-30 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (42, '2022-03-29 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (43, '2022-03-28 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (44, '2022-03-31 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (45, '2022-04-05 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (46, '2022-04-04 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (47, '2022-04-03 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (48, '2022-04-06 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (49, '2022-04-07 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (50, '2022-04-08 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (51, '2022-04-09 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (52, '2022-04-10 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (53, '2022-04-24 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (54, '2022-04-23 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (55, '2022-04-22 00:00:00', 0, 0, 0);
INSERT INTO `xxl_job_log_report` VALUES (56, '2022-04-25 00:00:00', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_registry` VALUES (165, 'EXECUTOR', 'traffic-app-executor', 'http://10.42.1.20:9999/', '2022-04-25 17:11:42');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
