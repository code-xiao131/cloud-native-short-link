/*
 Navicat Premium Data Transfer

 Source Server         : 短链_大课
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 120.79.150.146:3306
 Source Schema         : dcloud_link_a

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 25/04/2022 16:50:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for short_link_0
-- ----------------------------
DROP TABLE IF EXISTS `short_link_0`;
CREATE TABLE `short_link_0` (
  `id` bigint unsigned NOT NULL,
  `group_id` bigint DEFAULT NULL COMMENT '组',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '短链标题',
  `original_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原始url地址',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '短链域名',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '短链压缩码',
  `sign` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '长链的md5码，方便查找',
  `expired` datetime DEFAULT NULL COMMENT '过期时间，长久就是-1',
  `account_no` bigint DEFAULT NULL COMMENT '账号唯一编号',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del` int unsigned NOT NULL COMMENT '0是默认，1是删除',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态，lock是锁定不可用，active是可用',
  `link_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接产品层级：FIRST 免费青铜、SECOND黄金、THIRD钻石',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of short_link_0
-- ----------------------------
BEGIN;
INSERT INTO `short_link_0` VALUES (1469558440845115394, NULL, NULL, NULL, NULL, 'a4vBfuS0', 'E17DC8ACB57C574EE7C68271FD66A803', NULL, 48621039, '2021-12-11 14:43:27', '2021-12-11 14:43:27', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1469558441121939458, NULL, NULL, NULL, NULL, 'a2ZaGUN0', '6CAF6B9E58FFB39C101A4D83340C4F9A', NULL, 87827473, '2021-12-11 14:43:27', '2021-12-11 14:43:27', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1472860508641148929, 1468878230818746370, '测试标题122244442', '679739996084633600&xdclass.net?asdf=a21', 'g1.fit', 'a40g91S0', 'B7F86627F116C773BFC6432B1C99D763', '1970-01-01 07:59:59', 1637241966000, '2021-12-20 17:24:44', '2021-12-20 17:24:44', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1485954092671995906, NULL, NULL, NULL, NULL, 'a4wlDAF0', '6D4D96464EA0BE65C537AD2A2ED30AFF', NULL, 64305857, '2022-01-25 20:33:58', '2022-01-25 20:33:58', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1493487592665059329, 1493486484278284289, '流量包1', '700367239974486017&https://xdclass.net?asdf=a21', 'g1.fit', 'aFB03O0', 'D364449C650916EC96881A5641FE990D', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 15:29:24', '2022-02-15 15:29:24', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493496955517591553, 1493486484278284289, '流量包1', '700376610829762560&https://xdclass.net?asdf=a21', 'g1.fit', 'a3yfEZm0', 'BB1C5F06202B12B09E0705987F2ABFE1', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 16:06:40', '2022-02-15 16:06:40', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493496973502767106, 1493486484278284289, '流量包1', '700376628835909633&https://xdclass.net?asdf=a21', 'g1.fit', 'aWpvmh0', 'A8E25EAB8F7F9C9D34274FDAB5741ACF', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 16:06:41', '2022-02-15 16:06:41', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493498789539930114, 1493486484278284289, '流量包1', '700378213284577280&https://xdclass.net?asdf=a21', 'g1.fit', 'a1WcCm50', 'CD83546CF0EB9196258B8602D7229C86', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 16:13:53', '2022-02-15 16:13:53', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493822289400037377, 1493486484278284289, '流量包1', '700701944276058112&https://xdclass.net?asdf=a21', 'g1.fit', 'aHb80R0', '6CA6854E7F464C2C3FDAE247DBCDE920', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 13:39:26', '2022-02-16 13:39:26', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493857700222603266, 1493486484278284289, '流量包1', '700737355740348417&https://xdclass.net?asdf=a21', 'g1.fit', 'a3O9HDq0', '8D3B74E2F7A2525C5864F1FE2181E1CC', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 16:00:09', '2022-02-16 16:00:09', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493857713816342529, 1493486484278284289, '流量包1', '700737369443139584&https://xdclass.net?asdf=a21', 'g1.fit', 'a1rv2do0', 'ED67399B4A1EC13F93502BD05E31CBD4', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 16:00:12', '2022-02-16 16:00:12', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1493858567122325506, 1493486484278284289, '流量包1', '700738222744928257&https://xdclass.net?asdf=a21', 'g1.fit', 'a4r4jC70', '3392CF1B860C725BD631185180B6E9E9', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 16:03:35', '2022-02-16 16:03:35', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1494956372906577922, 1493486484278284289, '流量包33', '701836027391639552&https://xdclass.net?asdf=a21', 'g1.fit', 'a2UxAtR0', 'BA5BC3B3AB269C41DB8EC678D7277E89', '1970-01-01 07:59:59', 693100647796441088, '2022-02-19 16:45:48', '2022-02-19 16:45:48', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_0` VALUES (1499313602123812866, NULL, NULL, NULL, NULL, 'adh72q0', 'CAEFC15ED6C913C031838DFCA09F7D02', NULL, 58605012, '2022-03-03 17:19:54', '2022-03-03 17:19:54', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1499314178278584321, NULL, NULL, NULL, NULL, 'amwASP0', '332BD652FA4EF90987495A449BD74FF4', NULL, 9523355, '2022-03-03 17:22:10', '2022-03-03 17:22:10', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1499314180224741378, NULL, NULL, NULL, NULL, 'a1WQswy0', '967BD0998B8C69970604F14A27EEBBCF', NULL, 53039542, '2022-03-03 17:22:11', '2022-03-03 17:22:11', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1499314181936017410, NULL, NULL, NULL, NULL, 'a3vsY9J0', 'F5F22C463D01AA04601E2DBC337B91A0', NULL, 38672127, '2022-03-03 17:22:11', '2022-03-03 17:22:11', 0, NULL, NULL);
INSERT INTO `short_link_0` VALUES (1517912126763601921, NULL, NULL, NULL, NULL, 'adYRc90', '0210410A0F915E188A0FB3865842817C', NULL, 11740303, '2022-04-24 01:03:51', '2022-04-24 01:03:51', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for short_link_a
-- ----------------------------
DROP TABLE IF EXISTS `short_link_a`;
CREATE TABLE `short_link_a` (
  `id` bigint unsigned NOT NULL,
  `group_id` bigint DEFAULT NULL COMMENT '组',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '短链标题',
  `original_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原始url地址',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '短链域名',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '短链压缩码',
  `sign` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '长链的md5码，方便查找',
  `expired` datetime DEFAULT NULL COMMENT '过期时间，长久就是-1',
  `account_no` bigint DEFAULT NULL COMMENT '账号唯一编号',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del` int unsigned NOT NULL COMMENT '0是默认，1是删除',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态，lock是锁定不可用，active是可用',
  `link_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '链接产品层级：FIRST 免费青铜、SECOND黄金、THIRD钻石',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of short_link_a
-- ----------------------------
BEGIN;
INSERT INTO `short_link_a` VALUES (1469558436688560129, NULL, NULL, NULL, NULL, 'a1uNJXka', '47491F0075C9E8C8D7F13E7C830D7C4F', NULL, 25897582, '2021-12-11 14:43:27', '2021-12-11 14:43:27', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1469558440668954626, NULL, NULL, NULL, NULL, 'a24N0tWa', 'A46AFC7A5F9D385A956DFF46DB6F933D', NULL, 44461517, '2021-12-11 14:43:27', '2021-12-11 14:43:27', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1472859455665324034, 1468878230818746370, '测试标题122244442', '679739107844292608&xdclass.net?asdf=a21', 'g1.fit', 'a3VYVFUa', '71BE3F45D87DA45FE3DF04A552A54BCD', '1970-01-01 07:59:59', 1637241966000, '2021-12-20 17:20:33', '2021-12-20 17:20:33', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1472873477647200257, 1468878230818746370, '测试标题122244442', '679753118262493184&xdclass.net?asdf=a21', 'g1.fit', 'a3j4c2Ca', '98575C602ED21A238D8833BE837B9007', '1970-01-01 07:59:59', 1637241966000, '2021-12-20 18:16:16', '2021-12-20 18:16:16', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1472882636878782466, 1468878230818746370, '全链路测试标题', '679761921565523968&https://xdclass.net?asdf=a21', 'g1.fit', 'a4sVhv4a', '3FD227C34814B8BBCB1D0E7CB25C2D91', '1970-01-01 07:59:59', 1637241966000, '2021-12-20 18:52:40', '2021-12-20 18:52:40', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1473867435319865346, 1468878230818746370, 'VA11更新标题', '680747087276539904&https://xdclass.net?asdf=a21', 'g1.fit', 'aOZo8wa', 'B504D5C268B23C34ABAD76D16CA84040', '1970-01-01 07:59:59', 1637241966000, '2021-12-23 12:05:51', '2021-12-23 12:23:54', 1, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1485954089543045121, NULL, NULL, NULL, NULL, 'a1zto6Wa', '88D71A9B8E25B0F1F7985B1B1ABC707F', NULL, 46297283, '2022-01-25 20:33:57', '2022-01-25 20:33:57', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1492877072335716353, NULL, NULL, NULL, NULL, 'a3eKDgKa', '83F340B13598B747ADAA400173788101', NULL, 41154247, '2022-02-13 23:03:26', '2022-02-13 23:03:26', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1492877084411117569, NULL, NULL, NULL, NULL, 'aH4HHqa', 'B019C14E630B1114E0BA68001AA32F7C', NULL, 97140549, '2022-02-13 23:03:28', '2022-02-13 23:03:28', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1493487475845304321, 1493486484278284289, '流量包1', '700367094075621376&https://xdclass.net?asdf=a21', 'g1.fit', 'a2n1NVja', '95A04FC8B6C79EE432FCE9B7D6A26518', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 15:28:56', '2022-02-15 15:28:56', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493487789356945410, 1493486484278284289, '流量包1', '700367435663933441&https://xdclass.net?asdf=a21', 'g1.fit', 'at2OCka', '37CB32E98F49D03CB2B9AA255CAE417B', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 15:30:11', '2022-02-15 15:30:11', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493503879512371201, 1493486484278284289, '流量包1', '700383534413512705&https://xdclass.net?asdf=a21', 'g1.fit', 'a2i11EIa', '6F6989D0DAC4AC8A0049D446147862C3', '1970-01-01 07:59:59', 693100647796441088, '2022-02-15 16:34:07', '2022-02-15 16:34:07', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493786623001804801, 1493486484278284289, '流量包1', '700666268071493632&https://xdclass.net?asdf=a21', 'g1.fit', 'a1Ia9K8a', 'E0632A0673335B64617F2BAEDFCAA266', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 11:17:42', '2022-02-16 11:17:42', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493786767638183937, 1493486484278284289, '流量包1', '700666422824534016&https://xdclass.net?asdf=a21', 'g1.fit', 'a2B5lXZa', '78243B164F2C0C49595F52CB16160FCA', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 11:18:17', '2022-02-16 11:18:17', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493786773367603201, 1493486484278284289, '流量包1', '700666428038053889&https://xdclass.net?asdf=a21', 'g1.fit', 'a3QOzZDa', 'E124E704F0C12E0B004273EF5C079981', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 11:18:18', '2022-02-16 11:18:18', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493857696690999297, 1493486484278284289, '流量包1', '700737351978057728&https://xdclass.net?asdf=a21', 'g1.fit', 'a54VCqa', '858E7994D61CED1808F61CEC4BFEFE14', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 16:00:08', '2022-02-16 16:00:08', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1493857704261718018, 1493486484278284289, '流量包1', '700737359800434688&https://xdclass.net?asdf=a21', 'g1.fit', 'a2eMItha', 'C64D59DF0B259B12540E1F255B360156', '1970-01-01 07:59:59', 693100647796441088, '2022-02-16 16:00:10', '2022-02-16 16:00:10', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1494956377641947138, 1493486484278284289, '流量包33', '701836033288830976&https://xdclass.net?asdf=a21', 'g1.fit', 'aAuMRxa', 'F44EE691D82D56026A4886A5E362C799', '1970-01-01 07:59:59', 693100647796441088, '2022-02-19 16:45:50', '2022-02-19 16:45:50', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1494973047831044098, 1493486484278284289, '流量包事务链路测试V1', '701852693827682304&https://xdclass.net?asdf=a21', 'g1.fit', 'aTCnkua', 'D8C7B0183649E1375A5F27A15FD1430B', '1970-01-01 07:59:59', 693100647796441088, '2022-02-19 17:52:04', '2022-02-19 17:52:04', 0, 'ACTIVE', NULL);
INSERT INTO `short_link_a` VALUES (1499292337266769921, NULL, NULL, NULL, NULL, 'a1BUNgPa', 'B71494CE614B59FD1777BC71C92EBCAF', NULL, 27164103, '2022-03-03 16:10:58', '2022-03-03 16:10:58', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1499313614195019778, NULL, NULL, NULL, NULL, 'a2ODMEXa', 'B1EF382E70BD1796764F6C6DCFC412F1', NULL, 67458006, '2022-03-03 17:19:56', '2022-03-03 17:19:56', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1499313619509202946, NULL, NULL, NULL, NULL, 'a3ZKtDQa', '6E2F51BFCB4FA9EC6CFDA966B02DF197', NULL, 53527798, '2022-03-03 17:19:58', '2022-03-03 17:19:58', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1499314176680554498, NULL, NULL, NULL, NULL, 'a1wnB4ca', '241186AACD983E638C18ED6CF138B49E', NULL, 78351953, '2022-03-03 17:22:10', '2022-03-03 17:22:10', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1499314180933578753, NULL, NULL, NULL, NULL, 'a2AYbXWa', 'D06F078CE0170CBACC52B90CDA542D1A', NULL, 95195366, '2022-03-03 17:22:11', '2022-03-03 17:22:11', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1499314182640660481, NULL, NULL, NULL, NULL, 'a3bbrgia', 'DF07A867FD3813DDE392BB43BC487DE3', NULL, 43896463, '2022-03-03 17:22:12', '2022-03-03 17:22:12', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1517912131247312897, NULL, NULL, NULL, NULL, 'a2cTT5Ia', '341F5D6C6C4722AED22FBE6A65C67B72', NULL, 98027477, '2022-04-24 01:03:52', '2022-04-24 01:03:52', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1517912131918401538, NULL, NULL, NULL, NULL, 'a3ITDsfa', '34A77D3F2C4D635B5945E4D7BC773898', NULL, 14370352, '2022-04-24 01:03:52', '2022-04-24 01:03:52', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1517912132463661058, NULL, NULL, NULL, NULL, 'a4skIAsa', '272D8EE6A97EB5324CE73AB05F806F49', NULL, 74355693, '2022-04-24 01:03:52', '2022-04-24 01:03:52', 0, NULL, NULL);
INSERT INTO `short_link_a` VALUES (1517912132753068034, NULL, NULL, NULL, NULL, 'a4tld6Ua', 'FC382534CFF82C6A612DB858CFFD617C', NULL, 30607671, '2022-04-24 01:03:52', '2022-04-24 01:03:52', 0, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
