/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : musicpro

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 23/06/2025 16:01:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123');
INSERT INTO `admin` VALUES (2, 'admin1', '1');
INSERT INTO `admin` VALUES (3, '1', '1');
INSERT INTO `admin` VALUES (4, '李维辰', '123456');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '收藏类型（0歌曲1歌单）',
  `song_id` int NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int NULL DEFAULT NULL COMMENT '歌单id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (3, 94, 0, 22, NULL, '2019-01-07 16:38:23');
INSERT INTO `collect` VALUES (4, 94, 0, 23, NULL, '2019-01-07 16:41:44');
INSERT INTO `collect` VALUES (6, 94, 0, 21, NULL, '2019-01-07 16:43:45');
INSERT INTO `collect` VALUES (10, 94, 0, 3, NULL, '2019-01-07 16:58:59');
INSERT INTO `collect` VALUES (16, 94, 0, 24, NULL, '2019-01-07 17:34:07');
INSERT INTO `collect` VALUES (21, 5, 0, 24, NULL, '2019-01-08 15:18:33');
INSERT INTO `collect` VALUES (24, 5, 0, 8, NULL, '2019-01-08 16:07:57');
INSERT INTO `collect` VALUES (43, 5, 0, 7, NULL, '2019-04-26 01:06:20');
INSERT INTO `collect` VALUES (45, 26, 0, 44, NULL, '2020-03-21 22:26:37');
INSERT INTO `collect` VALUES (46, 26, 0, 36, NULL, '2020-03-21 22:28:24');
INSERT INTO `collect` VALUES (47, 26, 0, 69, NULL, '2020-03-22 01:56:54');
INSERT INTO `collect` VALUES (48, 26, 0, 45, NULL, '2020-03-22 02:08:36');
INSERT INTO `collect` VALUES (49, 26, 0, 21, NULL, '2020-03-22 02:08:41');
INSERT INTO `collect` VALUES (50, 26, 0, 100, NULL, '2020-03-22 03:41:14');
INSERT INTO `collect` VALUES (52, 12, 0, 99, NULL, '2020-04-05 21:19:06');
INSERT INTO `collect` VALUES (54, 1, 0, 7, NULL, '2020-08-15 19:52:29');
INSERT INTO `collect` VALUES (55, 1, 0, 4, NULL, '2020-08-16 21:18:07');
INSERT INTO `collect` VALUES (56, 1, 0, 23, NULL, '2020-09-27 07:36:55');
INSERT INTO `collect` VALUES (63, 29, 0, 39, NULL, '2024-01-10 10:27:36');
INSERT INTO `collect` VALUES (64, 29, 0, 83, NULL, '2024-01-10 10:27:38');
INSERT INTO `collect` VALUES (66, 29, 0, 84, NULL, '2024-01-10 10:27:42');
INSERT INTO `collect` VALUES (76, 29, 0, 5, NULL, '2024-01-12 08:59:08');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '评论类型（0歌曲1歌单）',
  `song_id` int NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int NULL DEFAULT NULL COMMENT '歌单id',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  `up` int NULL DEFAULT 0 COMMENT '评论点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (11, 1, 0, 21, NULL, '当听这首歌曲的时候，看看天上的月亮。美爆了！', '2019-01-06 19:45:51', 3);
INSERT INTO `comment` VALUES (12, 1, 0, 23, NULL, '太尼马好听了！堂堂正正的林歌手！！', '2019-01-06 19:48:25', 0);
INSERT INTO `comment` VALUES (13, 1, 0, 23, NULL, '林允儿啊，真的唱的很标准，很动人，我的同学都没想到是林允儿唱的，呜呜呜，爱死你了林允儿', '2019-01-06 19:54:01', 0);
INSERT INTO `comment` VALUES (35, 1, 1, NULL, 38, 'hao', '2019-03-24 01:39:06', 0);
INSERT INTO `comment` VALUES (42, 1, 1, NULL, 80, 'nice', '2019-03-24 01:57:02', 0);
INSERT INTO `comment` VALUES (43, 1, 1, NULL, 82, 'success', '2019-03-24 01:57:40', 0);
INSERT INTO `comment` VALUES (45, 1, 1, NULL, 1, '啦啦啦(*≧∀≦)ﾉ', '2019-04-25 21:24:43', 0);
INSERT INTO `comment` VALUES (46, 1, 0, 21, NULL, '111', '2019-04-26 00:51:18', 0);
INSERT INTO `comment` VALUES (47, 1, 1, NULL, 1, '222', '2019-04-26 01:01:27', 0);
INSERT INTO `comment` VALUES (49, 1, 1, NULL, 0, '', '2019-05-23 21:35:47', 0);
INSERT INTO `comment` VALUES (51, 1, 1, NULL, 5, '好听', '2019-05-23 21:39:55', 0);
INSERT INTO `comment` VALUES (52, 1, 1, NULL, 5, '好听', '2019-05-23 21:40:25', 0);
INSERT INTO `comment` VALUES (53, 1, 0, 107, NULL, 'I love you！！！', '2019-06-03 02:16:23', 0);
INSERT INTO `comment` VALUES (54, 1, 0, 95, NULL, '好听', '2020-03-14 16:14:53', 0);
INSERT INTO `comment` VALUES (55, 1, 0, 28, NULL, '?', '2020-03-14 16:19:11', 0);
INSERT INTO `comment` VALUES (56, 26, 0, 69, NULL, 'good!', '2020-03-22 02:19:03', 0);
INSERT INTO `comment` VALUES (57, 26, 0, 10, NULL, 'good', '2020-03-22 03:40:10', 3);
INSERT INTO `comment` VALUES (58, 1, 1, NULL, 12, '好', '2020-08-15 20:01:57', 0);
INSERT INTO `comment` VALUES (59, 1, 1, NULL, 3, '好', '2020-08-15 20:06:13', 4);
INSERT INTO `comment` VALUES (60, 29, 1, NULL, 4, 'sdgag', '2024-01-08 15:08:14', 21);
INSERT INTO `comment` VALUES (61, 29, 1, NULL, 3, 'asfjk', '2024-01-12 10:18:41', 0);
INSERT INTO `comment` VALUES (62, 29, 1, NULL, 1, 'safa', '2024-01-12 10:58:20', 0);
INSERT INTO `comment` VALUES (63, 29, 1, NULL, 2, 'asfdasf', '2024-01-12 11:03:03', 0);
INSERT INTO `comment` VALUES (64, 29, 1, NULL, 2, 'nihao', '2024-01-12 11:03:08', 0);
INSERT INTO `comment` VALUES (65, 29, 1, NULL, 2, 'jakfsjnajklsf', '2024-01-12 11:03:44', 0);

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别（1男0女）',
  `phone_num` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birth` datetime NULL DEFAULT NULL COMMENT '生日',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '签名',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地区',
  `avator` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '前端用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (8, 'tawuhe', '123', 0, '', '192673541@qq.com', '2019-04-25 18:58:39', '你好', '北京', '/img/user.jpg', '2019-04-25 00:28:58', '2019-04-25 18:58:39');
INSERT INTO `consumer` VALUES (16, '1234321', '123', 1, '13754803257', '123@qq.com', '2020-03-08 17:25:45', '', '', '/img/user.jpg', '2020-03-08 17:25:45', '2020-03-08 17:25:45');
INSERT INTO `consumer` VALUES (20, '234321', '123', 0, '15754801257', '12987@qq.com', '2020-03-08 23:41:22', '', '', '/img/user.jpg', '2020-03-08 23:41:22', '2020-03-08 23:41:22');
INSERT INTO `consumer` VALUES (21, 'yoonaA', '123', 1, NULL, NULL, '2020-03-25 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:18:33', '2020-03-21 22:18:33');
INSERT INTO `consumer` VALUES (24, 'yoonaAA', '123', 1, NULL, NULL, '2020-03-04 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:20:27', '2020-03-21 22:20:27');
INSERT INTO `consumer` VALUES (25, 'yoonaAB', '123', 1, NULL, NULL, '2020-03-02 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:21:50', '2020-03-21 22:21:50');
INSERT INTO `consumer` VALUES (26, 'yoonaAC', '123', 1, 'null', 'null', '2020-03-11 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:23:43', '2020-04-05 03:30:34');
INSERT INTO `consumer` VALUES (27, 'yoonaAD', '123', 1, NULL, NULL, '2020-03-11 00:00:00', '', '', '/img/user.jpg', '2020-03-21 22:24:47', '2020-03-21 22:24:47');
INSERT INTO `consumer` VALUES (28, 'yoona90', '123', 0, NULL, NULL, '2020-04-28 00:00:00', '', '', '/img/user.jpg', '2020-04-02 22:10:34', '2020-04-02 22:10:34');
INSERT INTO `consumer` VALUES (29, 'mo', '123', 1, '13243245353', '1553940147@qq.com', '2024-01-11 00:00:00', 'asfdsdg', '山西', '/img/user.jpg', '2024-01-04 14:45:20', '2024-01-04 14:45:20');

-- ----------------------------
-- Table structure for fenlei
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fenleiname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES (1, '抖音排行榜');
INSERT INTO `fenlei` VALUES (2, '飙升榜');
INSERT INTO `fenlei` VALUES (3, '快手榜');

-- ----------------------------
-- Table structure for flguanlian
-- ----------------------------
DROP TABLE IF EXISTS `flguanlian`;
CREATE TABLE `flguanlian`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `lbId` int NOT NULL,
  `songid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flguanlian
-- ----------------------------
INSERT INTO `flguanlian` VALUES (1, 1, 66);
INSERT INTO `flguanlian` VALUES (2, 1, 77);
INSERT INTO `flguanlian` VALUES (3, 1, 88);
INSERT INTO `flguanlian` VALUES (4, 1, 15);
INSERT INTO `flguanlian` VALUES (5, 1, 22);
INSERT INTO `flguanlian` VALUES (6, 1, 23);
INSERT INTO `flguanlian` VALUES (7, 1, 24);
INSERT INTO `flguanlian` VALUES (8, 1, 25);
INSERT INTO `flguanlian` VALUES (9, 1, 26);
INSERT INTO `flguanlian` VALUES (10, 1, 27);
INSERT INTO `flguanlian` VALUES (11, 1, 28);
INSERT INTO `flguanlian` VALUES (12, 1, 29);
INSERT INTO `flguanlian` VALUES (13, 1, 30);
INSERT INTO `flguanlian` VALUES (14, 1, 31);
INSERT INTO `flguanlian` VALUES (15, 1, 32);
INSERT INTO `flguanlian` VALUES (16, 1, 33);
INSERT INTO `flguanlian` VALUES (17, 1, 34);
INSERT INTO `flguanlian` VALUES (18, 1, 35);
INSERT INTO `flguanlian` VALUES (19, 1, 36);
INSERT INTO `flguanlian` VALUES (20, 1, 37);
INSERT INTO `flguanlian` VALUES (21, 2, 71);
INSERT INTO `flguanlian` VALUES (22, 2, 72);
INSERT INTO `flguanlian` VALUES (23, 2, 73);
INSERT INTO `flguanlian` VALUES (24, 2, 74);
INSERT INTO `flguanlian` VALUES (25, 2, 75);
INSERT INTO `flguanlian` VALUES (26, 2, 76);
INSERT INTO `flguanlian` VALUES (27, 2, 78);
INSERT INTO `flguanlian` VALUES (28, 2, 79);
INSERT INTO `flguanlian` VALUES (29, 2, 80);
INSERT INTO `flguanlian` VALUES (30, 2, 81);
INSERT INTO `flguanlian` VALUES (31, 2, 82);
INSERT INTO `flguanlian` VALUES (32, 2, 83);
INSERT INTO `flguanlian` VALUES (33, 2, 84);
INSERT INTO `flguanlian` VALUES (34, 2, 85);
INSERT INTO `flguanlian` VALUES (35, 2, 86);
INSERT INTO `flguanlian` VALUES (36, 2, 87);
INSERT INTO `flguanlian` VALUES (37, 2, 89);
INSERT INTO `flguanlian` VALUES (38, 2, 90);
INSERT INTO `flguanlian` VALUES (39, 2, 91);
INSERT INTO `flguanlian` VALUES (40, 2, 92);
INSERT INTO `flguanlian` VALUES (41, 3, 40);
INSERT INTO `flguanlian` VALUES (42, 3, 41);
INSERT INTO `flguanlian` VALUES (43, 3, 42);
INSERT INTO `flguanlian` VALUES (44, 3, 43);
INSERT INTO `flguanlian` VALUES (45, 3, 44);
INSERT INTO `flguanlian` VALUES (46, 3, 45);
INSERT INTO `flguanlian` VALUES (47, 3, 46);
INSERT INTO `flguanlian` VALUES (48, 3, 47);
INSERT INTO `flguanlian` VALUES (49, 3, 48);
INSERT INTO `flguanlian` VALUES (50, 3, 49);
INSERT INTO `flguanlian` VALUES (51, 3, 50);
INSERT INTO `flguanlian` VALUES (52, 3, 51);
INSERT INTO `flguanlian` VALUES (53, 3, 52);
INSERT INTO `flguanlian` VALUES (54, 3, 53);
INSERT INTO `flguanlian` VALUES (55, 3, 54);
INSERT INTO `flguanlian` VALUES (56, 3, 56);
INSERT INTO `flguanlian` VALUES (57, 3, 57);
INSERT INTO `flguanlian` VALUES (58, 3, 58);
INSERT INTO `flguanlian` VALUES (59, 3, 59);
INSERT INTO `flguanlian` VALUES (60, 3, 60);

-- ----------------------------
-- Table structure for list_song
-- ----------------------------
DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_id` int NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int NULL DEFAULT NULL COMMENT '歌单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2142646276 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '歌单包含歌曲列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_song
-- ----------------------------
INSERT INTO `list_song` VALUES (-1233768447, 21, 84);
INSERT INTO `list_song` VALUES (-1233768446, 2, 84);
INSERT INTO `list_song` VALUES (3, 5, 2);
INSERT INTO `list_song` VALUES (4, 7, 2);
INSERT INTO `list_song` VALUES (5, 11, 2);
INSERT INTO `list_song` VALUES (6, 38, 6);
INSERT INTO `list_song` VALUES (7, 39, 6);
INSERT INTO `list_song` VALUES (9, 22, 2);
INSERT INTO `list_song` VALUES (10, 22, 12);
INSERT INTO `list_song` VALUES (11, 38, 5);
INSERT INTO `list_song` VALUES (12, 39, 5);
INSERT INTO `list_song` VALUES (13, 38, 5);
INSERT INTO `list_song` VALUES (14, 39, 5);
INSERT INTO `list_song` VALUES (15, 45, 4);
INSERT INTO `list_song` VALUES (16, 45, 12);
INSERT INTO `list_song` VALUES (17, 10, 13);
INSERT INTO `list_song` VALUES (18, 10, 2);
INSERT INTO `list_song` VALUES (20, 10, 3);
INSERT INTO `list_song` VALUES (21, 30, 10);
INSERT INTO `list_song` VALUES (22, 31, 10);
INSERT INTO `list_song` VALUES (23, 82, 6);
INSERT INTO `list_song` VALUES (24, 83, 6);
INSERT INTO `list_song` VALUES (25, 84, 6);
INSERT INTO `list_song` VALUES (26, 85, 6);
INSERT INTO `list_song` VALUES (27, 99, 7);
INSERT INTO `list_song` VALUES (28, 100, 8);
INSERT INTO `list_song` VALUES (29, 78, 9);
INSERT INTO `list_song` VALUES (30, 79, 9);
INSERT INTO `list_song` VALUES (31, 80, 9);
INSERT INTO `list_song` VALUES (32, 86, 7);
INSERT INTO `list_song` VALUES (33, 87, 7);
INSERT INTO `list_song` VALUES (34, 88, 8);
INSERT INTO `list_song` VALUES (35, 100, 7);
INSERT INTO `list_song` VALUES (36, 82, 11);
INSERT INTO `list_song` VALUES (37, 65, 11);
INSERT INTO `list_song` VALUES (38, 50, 11);
INSERT INTO `list_song` VALUES (39, 67, 14);
INSERT INTO `list_song` VALUES (40, 78, 14);
INSERT INTO `list_song` VALUES (41, 26, 14);
INSERT INTO `list_song` VALUES (42, 4, 15);
INSERT INTO `list_song` VALUES (43, 7, 15);
INSERT INTO `list_song` VALUES (44, 21, 15);
INSERT INTO `list_song` VALUES (45, 24, 16);
INSERT INTO `list_song` VALUES (46, 40, 16);
INSERT INTO `list_song` VALUES (47, 50, 16);
INSERT INTO `list_song` VALUES (48, 70, 16);
INSERT INTO `list_song` VALUES (49, 72, 17);
INSERT INTO `list_song` VALUES (50, 73, 17);
INSERT INTO `list_song` VALUES (51, 51, 18);
INSERT INTO `list_song` VALUES (52, 52, 18);
INSERT INTO `list_song` VALUES (53, 65, 18);
INSERT INTO `list_song` VALUES (54, 67, 18);
INSERT INTO `list_song` VALUES (55, 2, 19);
INSERT INTO `list_song` VALUES (56, 7, 19);
INSERT INTO `list_song` VALUES (57, 55, 19);
INSERT INTO `list_song` VALUES (58, 53, 19);
INSERT INTO `list_song` VALUES (59, 54, 19);
INSERT INTO `list_song` VALUES (60, 4, 20);
INSERT INTO `list_song` VALUES (61, 7, 20);
INSERT INTO `list_song` VALUES (62, 11, 20);
INSERT INTO `list_song` VALUES (63, 26, 20);
INSERT INTO `list_song` VALUES (64, 99, 21);
INSERT INTO `list_song` VALUES (65, 100, 21);
INSERT INTO `list_song` VALUES (66, 86, 21);
INSERT INTO `list_song` VALUES (67, 91, 22);
INSERT INTO `list_song` VALUES (68, 94, 22);
INSERT INTO `list_song` VALUES (69, 77, 22);
INSERT INTO `list_song` VALUES (70, 68, 22);
INSERT INTO `list_song` VALUES (71, 50, 22);
INSERT INTO `list_song` VALUES (72, 76, 17);
INSERT INTO `list_song` VALUES (73, 93, 15);
INSERT INTO `list_song` VALUES (74, 92, 15);
INSERT INTO `list_song` VALUES (75, 78, 72);
INSERT INTO `list_song` VALUES (76, 79, 72);
INSERT INTO `list_song` VALUES (77, 80, 72);
INSERT INTO `list_song` VALUES (78, 64, 71);
INSERT INTO `list_song` VALUES (79, 65, 71);
INSERT INTO `list_song` VALUES (80, 50, 71);
INSERT INTO `list_song` VALUES (81, 51, 71);
INSERT INTO `list_song` VALUES (82, 51, 70);
INSERT INTO `list_song` VALUES (83, 50, 70);
INSERT INTO `list_song` VALUES (84, 64, 62);
INSERT INTO `list_song` VALUES (85, 65, 62);
INSERT INTO `list_song` VALUES (86, 66, 62);
INSERT INTO `list_song` VALUES (87, 67, 62);
INSERT INTO `list_song` VALUES (88, 25, 63);
INSERT INTO `list_song` VALUES (89, 26, 63);
INSERT INTO `list_song` VALUES (90, 79, 63);
INSERT INTO `list_song` VALUES (91, 65, 64);
INSERT INTO `list_song` VALUES (92, 64, 64);
INSERT INTO `list_song` VALUES (93, 80, 64);
INSERT INTO `list_song` VALUES (94, 25, 65);
INSERT INTO `list_song` VALUES (95, 64, 65);
INSERT INTO `list_song` VALUES (96, 67, 67);
INSERT INTO `list_song` VALUES (97, 64, 67);
INSERT INTO `list_song` VALUES (98, 25, 67);
INSERT INTO `list_song` VALUES (99, 25, 69);
INSERT INTO `list_song` VALUES (100, 24, 69);
INSERT INTO `list_song` VALUES (101, 25, 69);
INSERT INTO `list_song` VALUES (102, 26, 69);
INSERT INTO `list_song` VALUES (103, 48, 69);
INSERT INTO `list_song` VALUES (104, 80, 68);
INSERT INTO `list_song` VALUES (105, 64, 68);
INSERT INTO `list_song` VALUES (106, 25, 68);
INSERT INTO `list_song` VALUES (107, 67, 66);
INSERT INTO `list_song` VALUES (108, 64, 66);
INSERT INTO `list_song` VALUES (109, 80, 66);
INSERT INTO `list_song` VALUES (110, 102, 23);
INSERT INTO `list_song` VALUES (112, 101, 25);
INSERT INTO `list_song` VALUES (113, 102, 30);
INSERT INTO `list_song` VALUES (114, 102, 32);
INSERT INTO `list_song` VALUES (115, 101, 34);
INSERT INTO `list_song` VALUES (116, 42, 36);
INSERT INTO `list_song` VALUES (117, 43, 36);
INSERT INTO `list_song` VALUES (118, 41, 36);
INSERT INTO `list_song` VALUES (120, 37, 38);
INSERT INTO `list_song` VALUES (121, 101, 38);
INSERT INTO `list_song` VALUES (122, 101, 37);
INSERT INTO `list_song` VALUES (123, 102, 39);
INSERT INTO `list_song` VALUES (124, 37, 40);
INSERT INTO `list_song` VALUES (125, 108, 40);
INSERT INTO `list_song` VALUES (126, 102, 40);
INSERT INTO `list_song` VALUES (127, 112, 41);
INSERT INTO `list_song` VALUES (128, 102, 41);
INSERT INTO `list_song` VALUES (129, 102, 42);
INSERT INTO `list_song` VALUES (130, 41, 24);
INSERT INTO `list_song` VALUES (131, 100, 23);
INSERT INTO `list_song` VALUES (132, 98, 47);
INSERT INTO `list_song` VALUES (133, 61, 47);
INSERT INTO `list_song` VALUES (134, 62, 47);
INSERT INTO `list_song` VALUES (135, 33, 49);
INSERT INTO `list_song` VALUES (136, 68, 49);
INSERT INTO `list_song` VALUES (137, 33, 49);
INSERT INTO `list_song` VALUES (138, 23, 49);
INSERT INTO `list_song` VALUES (139, 33, 50);
INSERT INTO `list_song` VALUES (140, 21, 50);
INSERT INTO `list_song` VALUES (141, 61, 52);
INSERT INTO `list_song` VALUES (142, 62, 52);
INSERT INTO `list_song` VALUES (143, 21, 60);
INSERT INTO `list_song` VALUES (144, 22, 60);
INSERT INTO `list_song` VALUES (145, 23, 60);
INSERT INTO `list_song` VALUES (146, 63, 58);
INSERT INTO `list_song` VALUES (147, 98, 58);
INSERT INTO `list_song` VALUES (148, 63, 53);
INSERT INTO `list_song` VALUES (149, 30, 54);
INSERT INTO `list_song` VALUES (150, 61, 56);
INSERT INTO `list_song` VALUES (151, 63, 56);
INSERT INTO `list_song` VALUES (152, 98, 57);
INSERT INTO `list_song` VALUES (153, 32, 54);
INSERT INTO `list_song` VALUES (154, 22, 57);
INSERT INTO `list_song` VALUES (155, 98, 59);
INSERT INTO `list_song` VALUES (156, 63, 59);
INSERT INTO `list_song` VALUES (157, 62, 61);
INSERT INTO `list_song` VALUES (158, 22, 61);
INSERT INTO `list_song` VALUES (159, 68, 51);
INSERT INTO `list_song` VALUES (160, 35, 51);
INSERT INTO `list_song` VALUES (161, 32, 51);
INSERT INTO `list_song` VALUES (162, 33, 61);
INSERT INTO `list_song` VALUES (163, 86, 43);
INSERT INTO `list_song` VALUES (164, 100, 44);
INSERT INTO `list_song` VALUES (165, 87, 45);
INSERT INTO `list_song` VALUES (166, 86, 45);
INSERT INTO `list_song` VALUES (167, 100, 44);
INSERT INTO `list_song` VALUES (168, 88, 46);
INSERT INTO `list_song` VALUES (169, 99, 73);
INSERT INTO `list_song` VALUES (170, 88, 74);
INSERT INTO `list_song` VALUES (171, 99, 74);
INSERT INTO `list_song` VALUES (172, 88, 73);
INSERT INTO `list_song` VALUES (173, 103, 78);
INSERT INTO `list_song` VALUES (175, 103, 75);
INSERT INTO `list_song` VALUES (176, 103, 76);
INSERT INTO `list_song` VALUES (177, 103, 77);
INSERT INTO `list_song` VALUES (178, 103, 79);
INSERT INTO `list_song` VALUES (179, 88, 80);
INSERT INTO `list_song` VALUES (180, 99, 80);
INSERT INTO `list_song` VALUES (181, 103, 80);
INSERT INTO `list_song` VALUES (182, 104, 80);
INSERT INTO `list_song` VALUES (183, 104, 81);
INSERT INTO `list_song` VALUES (184, 88, 82);
INSERT INTO `list_song` VALUES (185, 99, 82);
INSERT INTO `list_song` VALUES (186, 105, 83);
INSERT INTO `list_song` VALUES (187, 99, 48);
INSERT INTO `list_song` VALUES (188, 95, 26);
INSERT INTO `list_song` VALUES (189, 96, 27);
INSERT INTO `list_song` VALUES (190, 97, 26);
INSERT INTO `list_song` VALUES (191, 95, 28);
INSERT INTO `list_song` VALUES (192, 98, 29);
INSERT INTO `list_song` VALUES (193, 62, 29);
INSERT INTO `list_song` VALUES (194, 87, 31);
INSERT INTO `list_song` VALUES (195, 61, 31);
INSERT INTO `list_song` VALUES (196, 63, 31);
INSERT INTO `list_song` VALUES (197, 87, 55);
INSERT INTO `list_song` VALUES (198, 96, 55);
INSERT INTO `list_song` VALUES (199, 98, 33);
INSERT INTO `list_song` VALUES (200, 63, 33);
INSERT INTO `list_song` VALUES (201, 105, 83);
INSERT INTO `list_song` VALUES (202, 106, 83);
INSERT INTO `list_song` VALUES (203, 107, 53);
INSERT INTO `list_song` VALUES (204, 107, 60);
INSERT INTO `list_song` VALUES (205, 108, 8);
INSERT INTO `list_song` VALUES (206, 112, 24);
INSERT INTO `list_song` VALUES (207, 113, 40);
INSERT INTO `list_song` VALUES (208, 109, 8);
INSERT INTO `list_song` VALUES (209, 107, 23);
INSERT INTO `list_song` VALUES (2142646273, 26, 84);
INSERT INTO `list_song` VALUES (2142646274, 27, 84);
INSERT INTO `list_song` VALUES (2142646275, 28, 84);

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_list_id` int NOT NULL COMMENT '歌单id',
  `consumer_id` int NOT NULL COMMENT '用户id',
  `score` int NULL DEFAULT NULL COMMENT '评分',
  `type_id` int NOT NULL DEFAULT 1 COMMENT '榜单类型ID',
  `period` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'current' COMMENT '榜单期数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `consumer_id`(`song_list_id` ASC, `consumer_id` ASC) USING BTREE,
  INDEX `fk_rank_type`(`type_id` ASC) USING BTREE,
  CONSTRAINT `fk_rank_type` FOREIGN KEY (`type_id`) REFERENCES `rank_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES (1, 2, 1, 7, 1, 'current');
INSERT INTO `rank` VALUES (2, 2, 2, 3, 1, 'current');
INSERT INTO `rank` VALUES (3, 1, 1, 4, 1, 'current');
INSERT INTO `rank` VALUES (7, 13, 1, 5, 1, 'current');
INSERT INTO `rank` VALUES (19, 21, 1, 5, 1, 'current');
INSERT INTO `rank` VALUES (20, 31, 1, 5, 1, 'current');
INSERT INTO `rank` VALUES (21, 5, 1, 0, 1, 'current');
INSERT INTO `rank` VALUES (24, 11, 1, 4, 1, 'current');
INSERT INTO `rank` VALUES (25, 10, 1, 10, 1, 'current');
INSERT INTO `rank` VALUES (27, 6, 1, 6, 1, 'current');
INSERT INTO `rank` VALUES (28, 7, 1, 10, 1, 'current');
INSERT INTO `rank` VALUES (29, 1, 26, 4, 1, 'current');
INSERT INTO `rank` VALUES (30, 7, 26, 2, 1, 'current');
INSERT INTO `rank` VALUES (32, 3, 26, 5, 1, 'current');
INSERT INTO `rank` VALUES (33, 14, 26, 9, 1, 'current');
INSERT INTO `rank` VALUES (34, 49, 1, 5, 1, 'current');
INSERT INTO `rank` VALUES (36, 3, 1, 10, 1, 'current');
INSERT INTO `rank` VALUES (37, 2, 29, 10, 1, 'current');

-- ----------------------------
-- Table structure for rank_type
-- ----------------------------
DROP TABLE IF EXISTS `rank_type`;
CREATE TABLE `rank_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '榜单类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rank_type
-- ----------------------------
INSERT INTO `rank_type` VALUES (1, '飙升榜', '近期热度上升最快的歌曲');
INSERT INTO `rank_type` VALUES (2, '新歌榜', '最新发布的热门歌曲');
INSERT INTO `rank_type` VALUES (3, '原创榜', '原创歌曲热榜');
INSERT INTO `rank_type` VALUES (4, '地区榜', '按地区划分的热榜');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, '全部');
INSERT INTO `region` VALUES (2, '内地');
INSERT INTO `region` VALUES (3, '港台');
INSERT INTO `region` VALUES (4, '欧美');
INSERT INTO `region` VALUES (5, '韩国');
INSERT INTO `region` VALUES (6, '日本');

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别（0女1男2组合3不明）',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birth` datetime NULL DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地区',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '歌手' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (5, 'G.E.M.邓紫棋', 0, '/img/singerPic/dengziqi.jpg', '1974-07-27 00:00:00', '中国上海', '成长于一个音乐世家，其母亲为上海音乐学院声乐系毕业生，外婆教唱歌，舅父拉小提琴，外公在乐团吹色士风。在家人的熏陶下，自小便热爱音乐，喜爱唱歌，与音乐结下不解之缘。G.E.M.在5岁的时候已经开始尝试作曲及填词，13岁完成了8级钢琴。G.E.M.在小学时期就读位于太子道西的中华基督教会协和小学上午校，为2003年的毕业生，同时亦为校内诗歌班成员。其英文名G.E.M.是Get Everybody Moving的缩写，象徵著她希望透过音乐让大家动起来的梦想。');
INSERT INTO `singer` VALUES (7, '艺声', 1, '/img/singerPic/yisheng.jpg', '1984-08-24 00:00:00', '韩国', '韩国著名男子团体Super Junior成员之一。2001年参加Starlight Casting System Casting，获得SM BEST选拔大赛歌唱赛第一名。经过长达5年的练习生训练，于2005年11月6日以Super Junior的身份正式出道。有着“艺术般声音”的他，被冠以“艺声”这个名号，是队中公认唱功最好的成员之一，因深沉、富有磁性且感情丰富的嗓音而在队里担当主唱。曾表演音乐剧、为多部电视剧演唱OST。值得一提的是，他也是朱一丹女士的疯狂追求者之一。');
INSERT INTO `singer` VALUES (8, 'Ennio Morricone', 1, '/img/singerPic/Morricone.jpg', '1928-11-10 00:00:00', '意大利', '埃尼欧·莫里科内，意大利作曲家，生于罗马，曾为超过500部的电影电视写过配乐。2007年他获得奥斯卡终身成就奖，成为第二位获此殊荣的作曲家。他获得两次格莱美奖，两次金球奖，五次英国电影和电视艺术学院奖等多项音乐奖项。');
INSERT INTO `singer` VALUES (9, '林俊杰', 1, '/img/singerPic/linjunjie.jpg', '1981-03-27 00:00:00', '新加坡', '著名男歌手，作曲人、作词人、音乐制作人，偶像与实力兼具。林俊杰出生于新加坡的一个音乐世家。在父母的引导下，4岁就开始学习古典钢琴，不善言辞的他由此发现了另一种与人沟通的语言。小时候的林俊杰把哥哥林俊峰当作偶像，跟随哥哥的步伐做任何事，直到接触流行音乐后，便爱上创作这一条路。2003年以专辑《乐行者》出道，2004年一曲《江南》红遍两岸三地，凭借其健康的形象，迷人的声线，出众的唱功，卓越的才华，迅速成为华语流行乐坛的领军人物之一，迄今为止共创作数百首音乐作品，唱片销量在全亚洲逾1000万张。');
INSERT INTO `singer` VALUES (10, '王力宏', 1, '/img/singerPic/wanglihong.jpg', '1976-05-17 14:00:30', '美国', '中国著名流行歌手、词曲创作音乐人；亚洲华语流行乐坛最具代表性的创作、偶像、实力派音乐偶像巨星。1995年发行首张专辑《情敌贝多芬》在台湾出道，亦是金曲奖中最年轻的封王者，其唱片总销量在全亚洲已超过2500万张。从改编歌曲《龙的传人》融合西方电子节奏和东方旋律的华人中式嘻哈风，再到为华语流行乐注入新元素，进一步将其推向全世界。超高唱片销量便可以证明力宏的影响力毋庸置疑的强。况且身为金曲奖常客，3次接受CNN电视台访问。首创Chinked-out曲风，将中国风推向世界。');
INSERT INTO `singer` VALUES (11, 'Eminem', 1, '/img/singerPic/Eminem.jpg', '1972-10-17 15:35:23', '美国', '埃米纳姆（Eminem）是美国的一名说唱歌手。其风格类型为：Hardcore Rap（硬核说唱）。埃米纳姆最大的突破就是证明白人也能介入到黑人一统天下的说唱（RAP）界中，而且获得巨大的成功。同时他的叛逆不仅长期以来深受美国青少年喜爱，也让他在舆论中始终遭到抨击。Eminem获得的奖杯总数窜至历史第三位，居麦当娜和皮特-加布里埃尔之后。');
INSERT INTO `singer` VALUES (12, '李荣浩', 1, '/img/singerPic/lironghao.jpg', '1985-07-11 21:52:23', '中国安徽', '李荣浩，1985年7月11日生于蚌埠，中国流行音乐制作人、歌手、吉他手。曾为众多艺人创作歌曲以及担任制作人，也曾为多部电影与多款电子游戏制作音乐。2013年9月17日发行个人首张原创专辑《模特》，凭借这张专辑入围第25届金曲奖最佳国语男歌手奖、最佳新人奖、最佳专辑制作人、最佳国语专辑、最佳作词奖等五项大奖提名，成为最大黑马，实现了从制作人到歌手的华丽转身。');
INSERT INTO `singer` VALUES (13, '田馥甄', 0, '/img/singerPic/tianfuzhen.jpg', '1983-03-30 21:55:44', '中国台湾', '艺名Hebe，台湾知名女艺人，女子演唱团体S.H.E组合成员，出生于台湾新竹县新丰乡，于2000年参加“宇宙2000实力美少女争霸战”选秀活动，并于同年与宇宙唱片（华研唱片前身）签约培训，接着在隔年与Selina、Ella组成S.H.E，并于2001年9月11日发行S.H.E首张专辑《女生宿舍》正式出道。2010年下半年，S.H.E正式迈向“单飞不解散”阶段，接着同年9月3日，使用本名“田馥甄”推出首张个人专辑《To Hebe》');
INSERT INTO `singer` VALUES (14, '许嵩', 1, '/img/singerPic/xusong.jpg', '1986-05-14 21:58:45', '中国安徽', '著名作词人、作曲人、唱片制作人、歌手。内地独立音乐之标杆人物，有音乐鬼才之称。2009年独立出版首张词曲全创作专辑《自定义》，2010年独立出版第二张词曲全创作专辑《寻雾启示》，两度掀起讨论热潮，一跃成为内地互联网讨论度最高的独立音乐人。2011年加盟海蝶音乐，推出第三张词曲全创作专辑《苏格拉没有底》，发行首月即在大陆地区摘下唱片销量榜冠军，轰动全国媒体，并拉开全国巡回签售及歌迷见面会。');
INSERT INTO `singer` VALUES (15, '张国荣', 1, '/img/singerPic/zhangguorong.jpg', '1956-09-12 22:02:38', '中国香港', '张国荣是一位在全球华人社会和亚洲地区具有影响力的著名歌手、演员和音乐人；大中华区乐坛和影坛巨星；演艺圈多栖发展最成功的代表之一。张国荣是香港乐坛的殿堂级歌手之一，曾获得香港乐坛最高荣誉金针奖；他是第一位享誉韩国乐坛的华人歌手，亦是华语唱片在韩国销量纪录保持者。他通晓词曲创作，曾担任过MTV导演、唱片监制、电影编剧、电影监制。他于1991年当选香港电影金像奖影帝。。。');
INSERT INTO `singer` VALUES (16, '杨宗纬', 1, '/img/singerPic/yangzongwei.jpg', '1978-04-04 22:04:47', '中国台湾', '大学时期参加台湾歌唱选秀节目《超级星光大道》获选为第一届“人气王”。比赛的时候，杨宗纬歌声阳刚而细腻，富含感情，辨识度高，感染力强，以演唱抒情歌曲见长，选曲跨越性别界线，无论是男女歌手的抒情歌曲，经过他重新诠释之后，常常都可以得到不输原唱或甚至超越原唱的评价。出道后屡创多项记录，包括发行首张专辑，便以新人之姿登上台北小巨蛋举办个人演唱会。。。');
INSERT INTO `singer` VALUES (17, '朴树', 1, '/img/singerPic/pushu.jpg', '1973-11-08 22:07:08', '中国江苏', '中国大陆歌手，音乐人。1996年10月正式成为“麦田音乐”签约歌手，为简略笔划而定艺名朴树。首支单曲《火车开往冬天》，96年底推出后成绩斐然。99年1月，推出首张个人专辑《我去两千年》。99年12月与华纳唱片正式签订唱片合约，成为其亚太区旗下的第一位内地歌手，其首张专辑《我去两千年》将由华纳重新混录和拍摄最新单曲录影带后，于2000年上半年在海外隆重上市。代表作品：《那些花儿》，《白桦林》，《生如夏花》。主要成就：中歌榜最佳新人奖，最受欢迎男歌手，年度最佳制作人奖。');
INSERT INTO `singer` VALUES (18, '李克勤', 1, '/img/singerPic/likeqin.jpg', '1967-12-06 22:10:04', '中国香港', '中国香港很有影响力的粤语流行曲歌手与演员。1985年凭《雾之恋》夺得“十九区业余歌唱大赛”冠军而晋身乐坛。曾于2002、2003和2005年度《十大劲歌金曲颁奖典礼》中三度夺得「最受欢迎男歌手」，于2003年度《叱吒乐坛流行榜颁奖典礼》上获得「叱吒乐坛我最喜爱的男歌手」，并于《第二十七届十大中文金曲颁奖典礼》(2004年度)上夺得「最优秀流行男歌手大奖」，2010年度音乐先锋榜颁奖礼 ── 20家电台联颁亚太歌手奖。');
INSERT INTO `singer` VALUES (19, '张碧晨', 0, '/img/singerPic/zhangbichen.jpg', '1989-09-10 22:15:16', '中国天津', '1989年9月10日出生于中国天津，中国女歌手。 2013年，张碧晨以韩国女子组合“Sunny days ”出道，并获得“K-POP ”世界庆典“最优秀奖”。2014年7月，张碧晨参加第三季《中国好声音》，以一首《她说》进入那英组，并于10月7日以一首《时间去哪儿了》荣获第三季《中国好声音》全国总冠军，成为《中国好声音》首位女冠军。');
INSERT INTO `singer` VALUES (20, 'IU', 0, '/img/singerPic/IU.jpg', '1993-05-16 22:22:00', '韩国', '李知恩 (IU)，1993年5月16日出生于韩国首尔特别市，韩国女歌手、演员、主持人。2008年以一首《迷儿》正式出道，历经一年的练习生生涯。2011年以一首《好日子》在韩国走红，随后于2011年末推出正规二辑《Last Fantasy》 PK记录74次，AK约90次。2013年IU发行正规三辑《MODERN TIMES》再次获得关注。2012年~2015年分别位列韩国福布斯名人榜第三、第八、第十和第十四位。2015年，发行迷你专辑《CHAT-SHIRE》');
INSERT INTO `singer` VALUES (21, '金泰妍', 0, '/img/singerPic/taiyan.jpg', '1989-03-09 00:33:15', '韩国', '金泰妍(김태연/ Kim Tae-yeon/金泰耎)，艺名太妍(태연/TaeYeon)，1989年3月9日出生于韩国全罗北道全州市，韩国女歌手、主持人，女子演唱团体少女时代成员之一。2004年在第八届SM青少年选拔大赛歌王中夺得第一名，进入韩国SM娱乐有限公司开始练习生生涯。2007年8月以演唱团体少女时代成员身份正式出道。2008年为韩国KBS电视台电视剧《快刀洪吉童》演唱主题曲《如果》；同年12月凭借歌曲《听得见吗》获得第23届韩国金唱片大奖人气奖 。');
INSERT INTO `singer` VALUES (23, '毛不易', 1, '/img/singerPic/maobuyi.jpg', '1994-10-01 18:59:43', '中国黑龙江', '原名王维家，1994年10月1日出生于黑龙江省齐齐哈尔市泰来县，中国内地流行乐男歌手，毕业于杭州师范大学护理专业。');
INSERT INTO `singer` VALUES (24, '胡歌', 1, '/img/singerPic/huge.jpg', '1982-09-02 17:52:02', '中国上海', '中国著名男演员、歌手，有“古装王子”的美称。2005年毕业于上海戏剧学院01级表演系本科，在电视连续剧《仙剑奇侠传》中成功塑造了豪爽深情的“李逍遥”而成名，他还为此剧唱插曲《六月的雨》《逍遥叹》等。胡歌主演过多部广为人知的影视剧，多部电视剧打破电视台收视记录。其人擅长摄影，文采飞扬，志做导演，频唱影视剧歌曲。2013年，主演的话剧《如梦之梦》和《永远的尹雪艳》登上舞台。');
INSERT INTO `singer` VALUES (25, '陈势安', 1, '/img/singerPic/chengshian.jpg', '1984-06-04 17:57:54', '马来西亚', '陈势安（1984年6月4日－）为马来西亚籍的西马男歌手，出生于槟城州威省大山脚，出道前是个化妆师。2011年发行个人第三张专辑《再爱一遍，天后陈势安》。');
INSERT INTO `singer` VALUES (26, '王菲', 0, '/img/singerPic/wangfei.jpg', '1969-08-08 17:58:31', '中国北京', '中国著名女歌手、演员。是继邓丽君后大中华地区成就最高、影响力最大的华语女歌手。以其极具辨识度的天籁空灵般嗓音，在华语歌坛创造了属于她自己的时代。她是首位登上美国《时代周刊》封面并接受CNN专访的华语歌手。她是身价最高，演唱会上座率最高，演唱会票房累计最高的华语女歌手。王菲北京出生。1987年放弃厦门大学生物系的录取跟随父母移居香港，并拜师戴思聪学习声乐，1989年签约新艺宝唱片公司并发行了第一张个人专辑，从此正式步入乐坛，曾使用艺名王靖雯。');
INSERT INTO `singer` VALUES (27, 'Álvaro Soler', 1, '/img/singerPic/soler.jpg', '1991-01-01 23:43:19', '西班牙', '全名是Álvaro Tauchert Soler，是一位新晋西班牙歌手，流行音乐作曲家。出生于1991年，西班牙巴塞罗纳。');
INSERT INTO `singer` VALUES (28, 'Celine Dion', 0, '/img/singerPic/1586075898639Celine Dion.png', '1968-03-30 00:00:00', '加拿大', '1980年，12岁的席琳·迪翁步入歌坛，15岁时推出首支法文单曲，1990年，推出首张英文专辑《UNISON》。1996年为美国亚特兰大奥运会演唱了主题曲《The Power of The Dream》。1997年为电影《泰坦尼克号》献唱片尾曲《My Heart Will Go On》，并获得第70届奥斯卡最佳电影歌曲奖。');
INSERT INTO `singer` VALUES (29, '胡伟立', 1, '/img/singerPic/1586076393834胡伟立.png', '1937-01-01 00:00:00', '中国江苏', '中国音乐家协会会员、中国电影家协会会员、中国电影音乐学会特约理事、香港作曲家作词家协会（CASH）会员、香港弦乐教师协会理事、香港艺术家联盟会员、香港电影戏剧总会会员。主要作品有《神州行组曲》、《北国风云》、《C大调中胡协奏曲》等大型合奏曲。');
INSERT INTO `singer` VALUES (30, '五月天', 2, '/img/singerPic/1586076633782五月天.jpg', '1997-03-29 00:00:00', '中国台湾', '五月天（Mayday），中国台湾摇滚乐团，由温尚翊（怪兽）、陈信宏（阿信）、石锦航（石头）、蔡升晏（玛莎）、刘谚明（冠佑）五位成员组成。\n乐团前身为“So Band”乐团，在1997年3月29日更名为“五月天”。');
INSERT INTO `singer` VALUES (31, 'Beyond', 2, '/img/singerPic/1586078551461Beyond.jpg', '1983-01-01 00:00:00', '中国香港', '中国香港摇滚乐队，由黄家驹、黄贯中、黄家强、叶世荣组成。');
INSERT INTO `singer` VALUES (32, 'Ramin Djawadi', 1, '/img/singerPic/1586078732611Ramin Djawadi.jpg', '1974-06-05 00:00:00', '德国', '德籍伊朗作曲家，为电影和电视剧担任管弦配乐作曲家，因曾获得格莱美奖提名而逐渐为人所熟知。');
INSERT INTO `singer` VALUES (33, '小林未郁', 0, '/img/singerPic/1586078973463小林未郁.jpeg', '1978-01-01 00:00:00', '日本', '日本女钢琴家、歌手。');
INSERT INTO `singer` VALUES (34, 'Various Artists', 3, '/img/singerPic/1586079436284Various Artists.jpg', '2020-04-05 00:00:00', '', '暂无介绍');
INSERT INTO `singer` VALUES (35, '少女时代', 2, '/img/singerPic/1586090215632少女时代.jpg', '2007-08-05 00:00:00', '韩国', '少女时代（Girls\' Generation）是韩国SM娱乐有限公司于2007年推出的女子流行演唱团体，由金泰妍、郑秀妍、李顺圭、黄美英、金孝渊、权俞利、崔秀英、林允儿和徐珠贤9人组成，现以5人形式进行演艺活动。');
INSERT INTO `singer` VALUES (36, 'The Piano Guys', 2, '/img/singerPic/1586089570101the piano guys.jpg', '2012-07-01 00:00:00', '美国', 'The Piano Guys直译为“钢琴男孩儿”，台湾翻译成“酷音乐团”。apple music在中国区上架后，有译“钢琴达人”。作为Neo-classical目前的代表性乐团之一，初衷是创造出能够激励人们的音乐和视频，想将自己的音乐带给这个世界。The Piano Guys改编的古典音乐融合自然、过渡流畅，MV拍摄优美大气、富于想象力。');
INSERT INTO `singer` VALUES (37, 'Peter Broderick', 1, '/img/singerPic/1586081310686Peter Broderick.jpeg', '1987-01-20 00:00:00', '美国', '是美国音乐家和作曲家，来自俄勒冈州的卡尔顿。他以自己的名义发布的独奏材料，成为了Efterklang的成员之一，并与多个乐团合作创作，作为一个自由音乐家演奏。');
INSERT INTO `singer` VALUES (38, 'Shayne Ward', 1, '/img/singerPic/1586090400493Shayne Ward.jpg', '1984-10-16 00:00:00', '英国', '2005年，肖恩·沃德因获得英国歌唱选秀节目《The X Factor》年度总冠军而成名 [1]  。赛后，签约索尼旗下公司Syco Music，并发行单曲《That\'s my goal》，以超过31.3万张的销售成绩创下英国唱片单曲首日畅销纪录第三名和英国单日付费下载次数最多的单曲吉尼斯纪录。');
INSERT INTO `singer` VALUES (39, 'Yiruma', 1, '/img/singerPic/1586090648269Yiruma.jpg', '1978-02-15 00:00:00', '韩国', '李闰珉出生于韩国首尔，在英国长大，曾就学于英国伦敦\'The Purcell School\' 特别音乐学校，后来毕业于 \'King\'s College London\' ，主修作曲。');
INSERT INTO `singer` VALUES (40, 'Josh Ritter', 1, '/img/singerPic/1586090939016Josh Ritter.jpg', '1976-11-21 00:00:00', '美国', 'Josh Ritter (born October 21, 1976) is an American singer-songwriter, guitarist and author who performs and records with The Royal City Band.');
INSERT INTO `singer` VALUES (41, 'Tone Damli Aaberge', 0, '/img/singerPic/1586091104616Tone Damli Aaberge.jpg', '1988-04-12 00:00:00', '挪威', 'Tone Damli Aaberge/Tone Damli，是位来自挪威的年轻女歌手。当她才17岁的时候，曾参加了2005年那届挪威偶像。可惜她在比赛中获得亚军，屈居于Jorun Stiansen之后。她是2009年欧洲电视网歌唱大赛里的总决赛选手，她演唱了一首\"Butterflies\"，可惜最后也只得到亚军，屈居于Alexander Rybak之后');
INSERT INTO `singer` VALUES (42, 'Sanna Nielsen', 0, '/img/singerPic/1586091210109Sanna Nielsen.jpg', '1984-11-27 00:00:00', '瑞典', 'Sanna Nielsen（仙娜·尼利森）出生于1984年11月27日，瑞典音乐才女，早在她12岁时就发行了其个人的第一张专辑，并且取得了相当不错的成绩，之前她一直是发行瑞典语的专辑和单曲，《Stronger》是她08年的新专，也是她第一张英文专辑，整张专的旋律给人很美很大气的感觉。');
INSERT INTO `singer` VALUES (43, 'Jessica', 0, '/img/singerPic/1586091653843郑秀妍.jpg', '1989-04-18 00:00:00', '韩国', '郑秀妍（Jessica Jung），1989年4月18日出生于美国加利福尼亚州旧金山市，歌手、演员、设计师。2000年，郑秀妍回国探亲时被韩国SM娱乐有限公司发掘，成为其旗下练习生。2007年8月，以演唱团体少女时代成员身份正式出道，是组合里训练时间最长的成员。2009年，首次在音乐剧《金发尤物》中担任主角“艾莉·伍兹”。2012年，首次以演员身份参演《暴力罗曼史》。');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `singer_id` int NULL DEFAULT NULL COMMENT '歌手id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '革命',
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '歌曲图片',
  `lyric` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '歌词',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '歌曲地址',
  `like_count` int NULL DEFAULT 0 COMMENT '点赞数',
  `play_count` int NULL DEFAULT 0 COMMENT '播放次数',
  `today_likes` int NULL DEFAULT 0 COMMENT '今日点赞数',
  `total_likes` int NULL DEFAULT 0 COMMENT '总点赞数',
  `region_id` int NULL DEFAULT NULL COMMENT '地区ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_song_today_likes`(`today_likes` DESC) USING BTREE,
  INDEX `idx_song_total_likes`(`total_likes` DESC) USING BTREE,
  INDEX `fk_song_region`(`region_id` ASC) USING BTREE,
  CONSTRAINT `fk_song_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '歌曲' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (1, 1, '张杰-仰望星空', '明天过后', '2018-12-26 08:40:14', '2025-06-23 14:58:16', '/img/songPic/haikuotiankong.jpg', '[ti:仰望星空]\n[ar:张杰]\n[00:00.266]\n[00:00.570]作曲：曾明维（Taiwan）\n[00:00.670]作词 : 邹振东\n[00:00.770]这一天我开始仰望星空发现\n[00:07.238]星并不远梦并不远只要你踮起脚尖\n[00:17.11]我相信有一双手把我轻轻牵到你的跟前\n[00:29.233]我相信有一根线将梦想与现实相连\n[00:45.389]我相信有一种缘会把所有的偶然都实现\n[00:57.346]我相信就是这一天命运开始改变\n[01:08.85]这一天我开始仰望星空发现\n[01:14.559]星并不远梦并不远只要你踮起脚尖\n[01:22.154]我从此不再彷徨也不再腼腆\n[01:28.621]张开双臂和你一起飞的更高看的更远\n[01:41.286]Music\n[01:52.845]我相信有一种缘会把所有的偶然都实现\n[02:04.543]我相信就是这一天命运开始改变\n[02:15.135]这一天我开始仰望星空发现\n[02:21.668]星并不远梦并不远只要你踮起脚尖\n[02:29.235]我从此不再彷徨也不再腼腆\n[02:35.717]张开双臂和你一起飞的更高看的更远\n[02:48.45]开始仰望星空感觉爱的时间空间\n[02:55.353]寻找生命中最灿烂的亮点\n[03:01.278]这一天我开始仰望星空发现\n[03:07.439]星并不远梦并不远只要你踮起脚尖\n[03:14.888]我从此不再彷徨也不再腼腆\n[03:21.630]张开双臂和你一起飞的更高看的更远\n[03:29.404]这一天我开始仰望星空发现\n[03:35.634]星并不远梦并不远只要你踮起脚尖\n[03:43.477]我从此不再彷徨也不再腼腆\n[03:49.834]张开双臂和你一起飞的更高看的更远\n[04:02.854]', '/song/张杰-仰望星空.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (2, 1, '张杰-他不懂', '爱，不解释', '2018-12-26 11:24:13', '2019-05-24 00:15:25', '/img/songPic/tabudong1.jpg', '[00:00.00] 作曲 : 周振霆/代岳东\n[00:01.00] 作词 : 唐湘智\n[00:19.410]他留给你是背影\n[00:25.060]关于爱情只字不提\n[00:29.850]害你哭红了眼睛\n[00:34.780]他把谎言说的竟然那么动听\n[00:40.750]他不止一次骗了你\n[00:44.710]不值得你再为他伤心\n[00:48.380]他不懂你的心假装冷静\n[00:53.180]他不懂爱情把它当游戏\n[00:56.170]他不懂表明相爱这件事\n[01:00.060]除了对不起就只剩叹息\n[01:04.060]他不懂你的心为何哭泣\n[01:08.950]窒息到快要不能呼吸\n[01:16.700]喔喔\n[01:18.880]他不懂你的心\n[01:23.230]\n[01:36.550]他把回忆留给你\n[01:43.640]连同忧伤强加给你\n[01:48.300]对你说来不公平\n[01:54.610]他的谎言句句说的那么动听\n[01:58.750]他不止一次骗了你\n[02:03.640]不值得你再为他伤心\n[02:07.980]他不懂你的心假装冷静\n[02:11.880]他不懂爱情把它当游戏\n[02:15.720]他不懂表明相爱这件事\n[02:19.630]除了对不起就只剩叹息\n[02:23.960]他不懂你的心为何哭泣\n[02:27.970]窒息到快要不能呼吸\n[02:36.070]喔喔\n[02:38.630]他不懂你的心\n[02:42.630]\n[02:56.250]他不懂你的心假装冷静\n[02:59.990]他不懂爱情把它当游戏\n[03:03.860]他不懂表明相爱这件事\n[03:07.720]除了对不起就只剩叹息\n[03:11.570]他不懂你的心为何哭泣\n[03:15.640]窒息到快要不能呼吸\n[03:23.800]喔喔\n[03:26.320]他不懂你的心\n[03:49.834]张开双臂和你一起飞的更高看的更远\n[04:02.854]', '/song/张杰-他不懂.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (3, 1, '张杰-天下', '明天过后', '2018-12-26 11:34:31', '2018-12-26 11:34:31', '/img/songPic/haikuotiankong.jpg', '[00:00.00] 作曲 : 刘吉宁\n[00:01.00] 作词 : 周毅\n[00:26.800]烽烟起寻爱似浪淘沙\n[00:33.700]遇见她如春水映梨花\n[00:40.400]挥剑断天涯相思轻放下\n[00:46.900]梦中我痴痴牵挂\n[00:53.900]顾不顾将相王侯\n[00:55.800]管不管万世千秋\n[00:57.800]求只求爱化解\n[00:58.900]这万丈红尘纷乱永无休\n[01:01.400]爱更爱天长地久\n[01:02.800]要更要似水温柔\n[01:04.800]谁在乎谁主春秋\n[01:06.900]一生有爱何惧风飞沙\n[01:10.100]悲白发留不住芳华\n[01:13.900]抛去江山如画换她笑面如花\n[01:17.100]抵过这一生空牵挂\n[01:20.100]心若无怨爱恨也随他\n[01:23.300]天地大情路永无涯\n[01:27.100]只为她袖手天下\n[01:32.900]\n[02:00.900]顾不顾将相王侯\n[02:02.700]管不管万世千秋\n[02:03.900]求只求爱化解\n[02:05.800]这万丈红尘纷乱永无休\n[02:07.900]爱更爱天长地久\n[02:09.900]要更要似水温柔\n[02:11.800]谁在乎谁主春秋\n[02:13.400]一生有爱何惧风飞沙\n[02:16.700]悲白发留不住芳华\n[02:20.900]抛去江山如画换她笑面如花\n[02:24.600]抵过这一生空牵挂\n[02:26.900]心若无怨爱恨也随他\n[02:30.700]天地大情路永无涯\n[02:33.900]只为她袖手天下\n[02:39.900]\n[02:40.300]一生有爱何惧风飞沙\n[02:43.700]悲白发留不住芳华\n[02:47.400]抛去江山如画换她笑面如花\n[02:50.900]抵过这一生空牵挂\n[02:53.900]心若无怨爱恨也随他\n[02:56.900]天地大情路永无涯\n[02:59.900]只为她袖手天下\n[03:05.900]\n[03:06.900]烽烟起寻爱似浪淘沙\n[03:13.300]遇见她如春水映梨花\n[03:20.100]挥剑断天涯相思轻放下\n[03:26.900]梦中我痴痴牵挂\n[03:32.900]', '/song/张杰-天下.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (4, 1, '张杰-如果爱', '再爱我一回', '2018-12-26 11:47:15', '2019-04-24 21:13:52', '/img/songPic/haikuotiankong.jpg', '[00:00.00] 作曲 : 黎沸辉\n [00:01.00] 作词 : 黎沸辉\n[00:04.16]如果爱\n[00:16.77]ah~~~ah~~\n[00:34.50]我的心从没有搬到另一个地址\n[00:40.57]还是和你用同样一室的钥匙\n[00:48.19]你的眼泪一滴一滴将回忆淋湿\n[00:54.64]你的拥抱却让呼吸变得真实\n[01:02.40]相爱的人 我能如何选择\n[01:09.29]伤痛和快乐全都是重复的规则\n[01:16.22]如果爱只是拉拉扯扯\n[01:19.65]两个人都动弹不得\n[01:23.10]如果爱已经少了快乐\n[01:26.68]为何心痛不能割舍\n[01:30.25]如果爱已经慢慢褪色\n[01:33.83]两颗心都失去颜色\n[01:37.25]如果爱已是非爱不可\n[01:40.79]又何必问他是否值得\n[01:44.54]可爱情在猜疑下渐渐冰冷\n[02:01.08]我的心从没有搬到另一个地址\n[02:12.48]还是和你用同样一室的钥匙\n[02:20.14]你的眼泪一滴一滴将回忆淋湿\n[02:26.32]你的拥抱却让呼吸变得真实\n[02:34.11]相爱的人 我能如何选择\n[02:41.14]伤痛和快乐全都是重复的规则\n[02:45.35]如果爱只是拉拉扯扯\n[02:51.65]两个人都动弹不得\n[02:54.99]如果爱已经少了快乐\n[02:58.80]为何心痛不能割舍\n[03:02.11]如果爱已经慢慢褪色\n[03:05.67]两颗心都失去颜色\n[03:09.14]如果爱已是非爱不可\n[03:12.70]又何必问他是否值得\n[03:16.50]看爱情在猜疑下～\n[03:20.04]如果爱只是拉拉扯扯\n[03:23.02]两个人都动弹不得\n[03:25.41]如果爱已经少了快乐\n[03:30.42]为何心痛不能割舍\n[03:33.76]如果爱已经慢慢褪色\n[03:37.30]两颗心都失去颜色\n[03:40.74]如果爱已是非爱不可\n[03:44.17]又何必问他是否值得\n[03:48.39]看爱情在猜疑下渐渐冰冷\n[03:52.17]又何必问他是否值得\n[03:55.76]如果爱已是非爱 非爱不可～\n[03:59.28]两颗心都失去了颜色\n[04:03.00]看爱情在猜疑下渐渐冰冷\n[04:06.58]又何必问他是否值得\n[04:09.79]如果爱已是非爱 非爱不可～\n[04:13.49]两颗心都失去了颜色', '/song/张杰-如果爱.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (5, 1, '张杰-逆战', '中国新声代第二季 第十三期', '2018-12-26 11:57:04', '2019-04-24 23:09:55', '/img/songPic/nizhan.jpg', '[ti:逆战]\n[ar:张杰]\n[00:00.00] 作曲 : 曲世聪\n[00:00.141] 作词 : 裴育\n[00:00.424]\n[00:06.649]\n[00:16.473]在这个风起云涌的战场上\n[00:20.402]暴风少年登场\n[00:24.506]在战胜烈火重重的咆哮声\n[00:28.459]喧闹整个世界\n[00:32.464]硝烟狂飞的讯号\n[00:34.475]机甲时代正来到\n[00:36.579]热血逆流而上\n[00:40.531]战车在发烫\n[00:41.935]勇士也势不可挡\n[00:46.756]Come On!逆战逆战来也\n[00:49.458]王牌要狂野\n[00:51.470]闯荡宇宙摆平世界\n[00:54.924]Oooh!逆战逆战狂野\n[00:57.431]王牌要发泄\n[00:59.432]战斗是我们倔强起点\n[01:03.737]我要操控我的权势\n[01:06.43]张扬我的声势\n[01:08.253]看这场龙战在野\n[01:10.908]这战场千百热血战士\n[01:14.61]一路向前飞驰\n[01:16.266]捍卫世界的勇士\n[01:18.772]Fighting!再一决\n[01:24.227]\n[01:28.489]在这个风起云涌的战场上\n[01:32.498]暴风少年登场\n[01:36.463]在战胜烈火重重的咆哮声\n[01:40.520]喧闹整个世界\n[01:44.527]硝烟狂飞的讯号\n[01:46.529]机甲时代正来到\n[01:48.531]热血逆流而上\n[01:52.447]战车在发烫\n[01:54.11]勇士也势不可挡\n[01:58.718]Come On!逆战逆战来也\n[02:01.428]王牌要狂野\n[02:03.491]闯荡宇宙摆平世界\n[02:06.945]Oooh!逆战逆战狂野\n[02:09.498]王牌要发泄\n[02:11.707]战斗是我们倔强起点\n[02:15.723]我要操控我的权势\n[02:18.90]张扬我的声势\n[02:20.292]看这场龙战在野\n[02:22.962]这战场千百热血战士\n[02:26.165]一路向前飞驰\n[02:28.220]捍卫世界的勇士\n[02:30.878]Fighting!再一决\n[02:35.832]\n[02:40.754]兄弟一场\n[02:42.56]未来继续顽强\n[02:44.558]看着战火飘摇\n[02:48.369]瓦解对手力量\n[02:52.239]熊熊气势再出发\n[02:55.245]逆战逆战来也\n[02:57.446]王牌要狂野\n[02:59.498]闯荡宇宙摆平世界\n[03:02.973]Oooh!逆战逆战狂野\n[03:05.478]王牌要发泄\n[03:07.436]战斗是我们倔强起点\n[03:11.692]我要操控我的权势\n[03:14.49]张扬我的声势\n[03:16.251]看这场龙战在野\n[03:19.03]这战场千百热血战士\n[03:22.58]一路向前飞驰\n[03:24.309]捍卫世界的勇士\n[03:26.814]Fighting!再一决\n[03:33.578]', '/song/张杰-逆战.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (6, 1, '张杰-逆态度', '中国新声代第二季 第十三期', '2018-12-26 12:02:57', '2018-12-26 12:02:57', '/img/songPic/nizhan.jpg', '[00:00.00] 作曲 : 唐湘智\n[00:01.00] 作词 : 李焯雄\n[00:23.100]要战出我的逆态度\n[00:26.330]谁说人是习惯动物\n[00:29.160]不敢颠覆这世俗又算什么人物yeah\n[00:35.290]沉默会被错误解读\n[00:38.170]进攻是最好的防护\n[00:40.940]不被污染这质朴戴上谁的脸谱yeah\n[00:46.750]成功不只一种配方\n[00:49.360]谁要一模一样\n[00:51.990]足够梦想足够疯狂\n[00:55.060]也许情况就不一样\n[00:57.730]自我燃烧不是狂妄\n[01:00.820]谁要一模一样\n[01:03.460]突破平凡突破框框\n[01:06.590]也许有我就不一样\n[01:09.390]光逆风飞翔的凤凰\n[01:12.140]光逆境之中逆生长\n[01:14.710]光逆态度的自信光芒\n[01:20.770]光逆风飞翔的凤凰\n[01:23.710]光逆境之中逆生长\n[01:26.560]光逆战一切自信光芒\n[01:30.500]敢于和天再较量\n[01:32.760]勇敢说不的逆态度\n[01:35.700]谁说人是习惯动物\n[01:38.550]不敢颠覆这世俗又算什么人物yeah\n[01:45.320]沉默会被错误解读\n[01:48.750]进攻是最好的防护\n[01:51.130]不被污染这质朴戴上谁的脸谱yeah\n[01:56.850]成功不只一种配方\n[01:59.650]谁要一模一样\n[02:02.320]足够梦想足够疯狂\n[02:05.360]也许情况就不一样\n[02:08.130]自我燃烧不是狂妄\n[02:11.210]谁要一模一样\n[02:13.890]突破平凡突破框框\n[02:17.200]也许有我就不一样\n[02:19.820]光逆风飞翔的凤凰\n[02:22.630]光逆境之中逆生长\n[02:25.620]光逆态度的自信光芒\n[02:31.670]光逆风飞翔的凤凰\n[02:34.610]光逆境之中逆生长\n[02:37.370]光逆战一切自信光芒\n[02:41.500]敢于和天再较量\n[02:43.510]\n[02:55.160]自我否定就等于投降\n[02:57.650]就算被指指点点不卑不亢\n[03:00.270]全部自己扛当仁不让\n[03:03.330]逆转形势要再打一仗\n[03:06.170]没有理由要轻易投降\n[03:09.230]就算被指指点点不卑不亢\n[03:12.290]坚持自己证明是谁在说谎\n[03:15.090]逆转这形势拒绝被谁驯养\n[03:18.270]光逆向飞翔的凤凰\n[03:21.100]光逆境之中逆生长\n[03:24.230]光逆态度的自信光芒\n[03:29.790]光逆向飞翔的凤凰\n[03:32.700]光逆境之中逆生长\n[03:35.880]光逆战一切自信光芒\n[03:39.530]敢于和天再较量\n[03:42.850]', '/song/张杰-逆态度.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (7, 1, '张杰-何必在一起', '穿越三部曲', '2018-12-27 07:49:53', '2018-12-27 07:49:53', '/img/songPic/hebiyaozaiyiqi.jpg', '[00:00.00] 作曲 : 梁晓雪　\n [00:01.00] 作词 : 梁晓雪/赵阳\n[00:33.728]夜夜的那么美丽\n[00:39.127]有人欢笑有人却在哭泣\n[00:46.180]尘封的记忆残留着邂逅的美丽\n[00:52.198]辗转反侧的我失眠在夜里\n[01:00.989]你你带走的呼吸\n[01:06.137]吻不到你那感觉多委屈\n[01:12.687]分岔的爱情让眼泪隔出银河的距离\n[01:20.980]轻轻关上门\n[01:22.980]让眼泪不逃避\n[01:29.928]何必要在一起\n[01:35.190]让我爱上你\n[01:37.598]至少自己过得不必太压抑\n[01:43.617]何必要在一起\n[01:47.937]逃出生命里\n[01:51.187]才让这个夜显得那么空虚\n[01:57.988]何必要在一起\n[02:01.587]让我爱上你\n[02:05.970]感觉你的呼吸是那么清晰\n[02:11.790]何必要在一起\n[02:15.399]让我没勇气\n[02:19.600]让我独自在这寒冷的夜里\n[02:24.799]何必要在一起\n[02:55.959]\n[02:59.519]何必要在一起\n[03:04.619]让我爱上你\n[03:08.140]至少自己过得不必太压抑\n[03:14.140]何必要在一起\n[03:18.799]逃出生命里\n[03:21.820]才让这个夜显得那么空虚\n[03:27.820]何必要在一起\n[03:32.790]让我爱上你\n[03:35.579]感觉你的呼吸是那么清晰\n[03:41.500]何必要在一起\n[03:45.880]让我没勇气\n[03:49.899]让我独自在着寒冷的夜里\n[03:54.820]何必要在一起\n[04:01.980]何必要在一起\n[04:07.440]让我爱上你\n[04:17.470]', '/song/张杰-何必在一起.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (8, 1, '张杰-剑心', '拾', '2018-12-27 08:04:42', '2018-12-27 08:04:42', '/img/songPic/jianxin.jpg', '[00:00.00] 作曲 : 谭旋\n[00:01.00] 作词 : 段思思\n[00:20.120]编曲：王文颖\n[00:22.120]录混：马涛（上海谭旋音乐工作室）\n[00:26.120]尘封在星蕴重明的魂魄\n[00:32.130]叫醒了恍惚梦魇的无措\n[00:38.320]揭开这宿命的脉络\n[00:42.410]\n[00:44.220]逃不开 这一世的寂寞\n[00:50.000]往后是阴霾\n[00:51.300]往前是山隘\n[00:52.870]想逃也逃不开\n[00:55.890]命运再主宰\n[00:57.380]执着的心也不会更改\n[01:01.650]哪管桑田\n[01:04.340]哪管沧海\n[01:11.370]听琴声潇潇\n[01:14.290]该忘的忘不掉\n[01:17.380]红尘 困住我年少\n[01:23.500]原谅我藏在心里燎燎的狂傲\n[01:29.610]去战 面对天地荡浩\n[01:35.820]人生也潇潇 魂牵梦绕\n[01:39.070]像烈焰燃烧\n[01:41.840]前尘 看浮沉走一遭\n[01:48.020]用冷的锋刃琴的寂寥\n[01:51.270]写往事今朝\n[01:54.430]孤剑 指尖 谈笑\n[02:13.640]人心间有没有一种解药\n[02:19.670]能覆盖是非恩仇的喧嚣\n[02:25.830]屠俘了焚寂的剑鞘\n[02:31.870]斩不断 这一生的桀骜\n[02:38.140]往后是阴霾\n[02:39.720]往前是山隘\n[02:42.070]想逃也逃不开\n[02:44.780]命运再主宰\n[02:46.350]执着的心也不会更改\n[02:50.950]哪管桑田\n[02:53.250]哪管沧海\n[03:00.230]听琴声潇潇\n[03:03.200]该忘的忘不掉\n[03:06.390]红尘 困住我年少\n[03:12.390]原谅我藏在心里燎燎的狂傲\n[03:18.490]去战 面对天地荡浩\n[03:24.710]人生也潇潇 魂牵梦绕\n[03:28.090]像烈焰燃烧\n[03:30.890]前尘 看浮沉走一遭\n[03:36.930]用冷的锋刃琴的寂寥\n[03:40.580]写往事今朝\n[03:44.590]孤剑 指尖 谈笑\n[03:48.150]', '/song/张杰-剑心.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (9, 2, '周杰伦-稻香', '魔杰座', '2018-12-27 08:17:12', '2018-12-27 08:17:12', '/img/songPic/daoxiang.jpg', '[by:橘子大宝宝]\n[ti:稻香]\n[ar:周杰伦]\n[00:31.00]对这个世界如果你有太多的抱怨\n[00:34.05]跌倒了就不敢继续往前走\n[00:37.02]为什麽人要这麽的脆弱 堕落\n[00:41.55]请你打开电视看看\n[00:43.14]多少人为生命在努力勇敢的走下去\n[00:46.89]我们是不是该知足\n[00:49.43]珍惜一切 就算没有拥有\n[00:54.24]还记得你说家是唯一的城堡\n[00:57.49]随着稻香河流继续奔跑\n[01:00.42]微微笑 小时候的梦我知道\n[01:05.51]不要哭让萤火虫带着你逃跑\n[01:09.21]乡间的歌谣永远的依靠\n[01:12.12]回家吧 回到最初的美好\n[01:41.14]不要这麽容易就想放弃 就像我说的\n[01:44.59]追不到的梦想 换个梦不就得了\n[01:47.55]为自己的人生鲜艳上色 先把爱涂上喜欢的颜色\n[01:51.80]笑一个吧 功成名就不是目的\n[01:55.62]让自己快乐快乐这才叫做意义\n[01:58.51]童年的纸飞机 现在终於飞回我手里\n[02:04.41]所谓的那快乐 赤脚在田里追蜻蜓追到累了\n[02:08.62]偷摘水果被蜜蜂给叮到怕了 谁在偷笑呢\n[02:13.16]我靠着稻草人吹着风唱着歌睡着了\n[02:16.72]哦 哦 午后吉它在虫鸣中更清脆\n[02:19.58]哦 哦 阳光洒在路上就不怕心碎\n[02:22.53]珍惜一切 就算没有拥有\n[02:27.36]还记得你说家是唯一的城堡\n[02:31.24]随着稻香河流继续奔跑\n[02:34.18]微微笑 小时候的梦我知道\n[02:39.35]不要哭让萤火虫带着你逃跑\n[02:42.94]乡间的歌谣永远的依靠\n[02:45.91]回家吧 回到最初的美好\n[02:51.03]还记得你说家是唯一的城堡\n[02:54.55]随着稻香河流继续奔跑\n[02:57.62]微微笑 小时候的梦我知道\n[03:02.67]不要哭让萤火虫带着你逃跑\n[03:06.35]乡间的歌谣永远的依靠\n[03:09.23]回家吧 回到最初的美好', '/song/周杰伦-稻香.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (10, 2, '周杰伦&潘儿-夜的第七章', '依然范特西', '2018-12-27 08:26:27', '2018-12-27 08:26:27', '/img/songPic/yedediqizhang.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 黄俊郎\n[00:31.55]编曲：钟兴民，林迈可\n[00:42.99]1983年小巷12月晴朗\n[00:45.69]夜的第7章\n[00:46.84]打字机继续推向接近事实的那下一行\n[00:49.59]石楠烟斗的雾\n[00:51.00]飘向枯萎的树沉默的对我哭诉\n[00:54.18]贝克街旁的的圆形广场\n[00:56.43]盔甲战士臂上\n[00:57.87]鸢尾花的徽章微亮\n[01:00.15]无人马车声响深夜的拜访\n[01:02.39]邪恶在维多利亚的月光下血色的开场\n[01:05.45]消失的手枪焦黑的手杖\n[01:07.48]融化的蜡像谁不在场\n[01:09.26]珠宝箱上符号的假象\n[01:11.04]矛盾通往他堆砌的死巷\n[01:12.76]证据被完美埋葬\n[01:14.22]那嘲弄苏格兰警场的嘴角上扬\n[01:16.28]如果邪恶是华丽残酷的乐章（那么正义 是深沉无奈的惆怅）\n[01:21.95]他的终场我会亲手写上（那我就点亮 在灰烬中的微光）\n[01:27.45]晨曦的光风干最后一行忧伤（那么雨滴 会洗净黑暗的高墙）\n[01:33.03]黑色的墨染上安祥（散场灯关上 红色的布幕下降）\n[01:42.87]\n[02:04.82]事实只能穿向没有脚印的土壤\n[02:07.47]突兀的细微花香刻意显眼的服装\n[02:10.26]每个人为不同的理由戴着面具说谎\n[02:13.15]动机也只有一种名字那叫做欲望\n[02:16.00]far  farther  farther  far  far\n[02:17.37]the  father  father  far  far\n[02:18.80]越过人性的沼泽谁真的可以不被弄脏\n[02:21.57]我们可以遗忘原谅但必须\n[02:23.75]知道真相被移动\n[02:24.98]过的铁床那最后一块图终于拼上\n[02:27.28]我听见脚步声预料的软皮鞋跟\n[02:30.04]他推开门晚风晃了煤油灯一阵\n[02:32.77]打字机停在凶手的名称我转身\n[02:36.08]西敏寺的夜空开始沸腾\n[02:39.02]在胸口绽放艳丽的死亡\n[02:41.41]我品尝这最后一口甜美的真相\n[02:44.13]微笑回想正义只是安静的伸张\n[02:47.46]提琴在泰晤士\n[02:49.23]如果邪恶（我听见脚步声 预料的软皮鞋跟）\n[02:51.51]是华丽残酷的乐章（他推开门晚风晃了煤油灯一阵）\n[02:55.15]他的终场我会亲手写上（打字机停在凶手的名称我转身）\n[02:58.99]（西敏寺的夜空开始沸腾）\n[03:06.25]黑色的墨染上安祥\n[03:12.04]如果邪恶是华丽残酷的乐章\n[03:17.50]他的终场我会亲手写上\n[03:23.10]晨曦的光风干最后一行忧伤\n[03:28.68]黑色的墨染上安祥', '/song/周杰伦&潘儿-夜的第七章.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (11, 2, '周杰伦-告白气球', '床边故事', '2018-12-27 08:45:24', '2018-12-27 08:45:24', '/img/songPic/gaobaiqiqui.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 方文山\n[00:32.840] 塞纳河畔 左岸的咖啡\n[00:35.438] 我手一杯 品尝你的美\n[00:38.655] 留下唇印的嘴\n[00:43.273] 花店玫瑰 名字写错谁\n[00:46.159] 告白气球 风吹到对街\n[00:49.225] 微笑在天上飞\n[00:53.503] 你说你有点难追 想让我知难而退\n[00:58.374] 礼物不需挑最贵 只要香榭的落叶\n[01:04.141] 喔 营造浪漫的约会 不害怕搞砸一切\n[01:09.205] 拥有你就拥有 全世界\n[01:14.289] 亲爱的 爱上你 从那天起\n[01:20.520] 甜蜜的很轻易\n[01:25.040] 亲爱的 别任性 你的眼睛\n[01:31.189] 在说我愿意\n[01:57.772] 塞纳河畔 左岸的咖啡\n[02:00.373] 我手一杯 品尝你的美\n[02:03.323] 留下唇印的嘴\n[02:08.304] 花店玫瑰 名字写错谁\n[02:10.954] 告白气球 风吹到对街\n[02:14.125] 微笑在天上飞\n[02:18.302] 你说你有点难追 想让我知难而退\n[02:23.187] 礼物不需挑最贵 只要香榭的落叶\n[02:28.500] 喔 营造浪漫的约会 不害怕搞砸一切\n[02:33.745] 拥有你就拥有 全世界\n[02:39.115] 亲爱的 爱上你 从那天起\n[02:45.012] 甜蜜的很轻易\n[02:49.827] 亲爱的 别任性 你的眼睛\n[02:55.829] 在说我愿意\n[03:00.627] 亲爱的 爱上你 恋爱日记\n[03:06.656] 飘香水的回忆\n[03:11.150] 一整瓶 的梦境 全都有你\n[03:17.249] 搅拌在一起\n[03:21.813] 亲爱的别任性 你的眼睛\n[03:31.562] 在说我愿意', '/song/周杰伦-告白气球.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (12, 2, '周杰伦-夜曲', '床边故事', '2018-12-30 02:11:23', '2018-12-30 02:11:23', '/img/songPic/gaobaiqiqui.jpg', '[00:23.310]一群嗜血的蚂蚁 被腐肉所吸引\n[00:27.490]我面无表情 看孤独的风景\n[00:30.540]失去你 爱恨开始分明\n[00:33.030]失去你 还有什N事好关心\n[00:35.770]当鸽子不再象徵和平\n[00:37.550]我终于被提醒\n[00:38.910]广场上喂食的是秃鹰\n[00:41.580]我用漂亮的押韵\n[00:43.030]形容被掠夺一空的爱情\n[00:46.720]啊 乌云开始遮蔽 夜色不干净\n[00:49.520]公园里 葬礼的回音 在漫天飞行\n[00:52.380]送你的 白色玫瑰\n[00:53.820]在纯黑的环境凋零\n[00:55.520]乌鸦在树枝上诡异的很安静\n[00:57.880]静静听 我黑色的大衣\n[00:59.870]想温暖你 日渐冰冷的回忆\n[01:02.220]走过的 走过的 生命\n[01:03.650]啊 四周弥漫雾气\n[01:05.070]我在空旷的墓地\n[01:06.340]老去后还爱你\n[01:07.430]为你弹奏萧邦的夜曲\n[01:11.550]纪念我死去的爱情\n[01:14.300]跟夜风一样的声音\n[01:17.030]心碎的很好听\n[01:19.830]手在键盘敲很轻\n[01:22.570]我给的思念很小心\n[01:25.300]你埋葬的地方叫幽冥\n[01:29.990]为你弹奏萧邦的夜曲\n[01:33.570]纪念我死去的爱情\n[01:36.340]而我为你隐姓埋名\n[01:39.150]在月光下弹琴\n[01:41.900]对你心跳的感应\n[01:44.670]还是如此温热亲近\n[01:47.410]怀念你那鲜红的唇印\n[01:53.270]\n[02:14.540]那些断翅的蜻蜓 散落在这森林\n[02:17.600]而我的眼睛 没有丝毫同情\n[02:20.450]失去你 泪水混浊不清\n[02:22.950]失去你 我连笑容都有阴影\n[02:25.680]风在长满青苔的屋顶\n[02:27.310]嘲笑我的伤心\n[02:29.170]像一口没有水的枯井\n[02:31.510]我用凄美的字型\n[02:33.030]描绘后悔莫及的那爱情\n[02:36.590]为你弹奏萧邦的夜曲\n[02:39.380]纪念我死去的爱情\n[02:42.100]跟夜风一样的声音\n[02:44.890]心碎的很好听\n[02:47.640]手在键盘敲很轻\n[02:50.370]我给的思念很小心\n[02:53.150]你埋葬的地方叫幽冥\n[02:57.700]为你弹奏萧邦的夜曲\n[03:01.360]纪念我死去的爱情\n[03:04.220]而我为你隐姓埋名 在月光下弹琴\n[03:09.620]对你心跳的感应 还是如此温热亲近\n[03:15.170]怀念你那鲜红的唇印\n[03:20.810]一群嗜血的蚂蚁 被腐肉所吸引\n[03:23.630]我面无表情 看孤独的风景\n[03:26.660]失去你 爱恨开始分明\n[03:29.070]失去你 还有什N事好关心\n[03:31.860]当鸽子不再象徵和平\n[03:33.560]我终于被提醒\n[03:35.320]广场上喂食的是秃鹰\n[03:37.670]我用漂亮的押韵\n[03:38.970]形容被掠夺一空的爱情', '/song/周杰伦-夜曲.mp3', 0, 0, 17, 17, NULL);
INSERT INTO `song` VALUES (13, 2, '周杰伦-红尘客栈', '十二新作', '2018-12-30 02:23:53', '2018-12-30 02:23:53', '/img/songPic/hongchengkezhan.jpg', '[by:青蒿素]\n[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 方文山\n[00:04.803] 编曲：黄雨勋\n[00:07.032]\n[00:22.628] 天涯的尽头是风沙\n[00:28.000] 红尘的故事叫牵挂\n[00:33.282] 封刀隐没在寻常人家 东篱下\n[00:38.902] 闲云野鹤古刹\n[00:44.099] 快马在江湖里厮杀\n[00:49.339] 无非是名跟利放不下\n[00:54.603] 心中有江山的人岂能快意潇洒\n[01:00.090] 我只求与你共华发\n[01:07.466] 剑出鞘恩怨了 谁笑\n[01:12.296] 我只求今朝拥你入怀抱\n[01:17.706] 红尘客栈风似刀\n[01:21.615] 骤雨落宿命敲\n[01:26.716] 任武林谁领风骚\n[01:29.107] 我却只为你折腰\n[01:33.619] 过荒村野桥寻世外古道\n[01:38.999] 远离人间尘嚣\n[01:41.553] 柳絮飘 执子之手逍遥\n[01:51.203]\n[02:06.759] 檐下窗棂斜映枝桠\n[02:11.979] 与你席地对座饮茶\n[02:17.305] 我以工笔画将你牢牢地记下\n[02:23.039] 提笔不为风雅\n[02:27.989] 灯下叹红颜近晚霞\n[02:32.946] 我说缘份一如参禅不说话\n[02:38.756] 你泪如梨花洒满了纸上的天下\n[02:44.245] 爱恨如写意山水画\n[02:51.637] 剑出鞘恩怨了 谁笑\n[02:56.249] 我只求今朝拥你入怀抱\n[03:01.516] 红尘客栈风似刀\n[03:05.653] 骤雨落宿命敲\n[03:10.799] 任武林谁领风骚\n[03:13.186] 我却只为你折腰\n[03:17.523] 过荒村野桥寻世外古道\n[03:22.758] 远离人间尘嚣\n[03:25.467] 柳絮飘 执子之手逍遥\n[03:30.838]\n[03:48.576] 任武林谁领风骚\n[03:50.734] 我却只为你折腰\n[03:54.926] 你回眸多娇我泪中带笑\n[04:00.316] 酒招旗风中萧萧\n[04:04.376] 剑出鞘恩怨了', '/song/周杰伦-红尘客栈.mp3', 0, 0, 2, 2, NULL);
INSERT INTO `song` VALUES (14, 2, '周杰伦-开不了口', '范特西', '2018-12-30 02:36:08', '2018-12-30 02:36:08', '/img/songPic/kaibulkou.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 徐若瑄\n[00:27.330]才离开没多久就开始  担心今天的你过得好不好\n[00:34.140]整个画面是你  想你想的睡不着\n[00:39.040]\n[00:40.920]嘴嘟嘟那可爱的模样  还有在你身上香香的味道\n[00:47.600]我的快乐是你  想你想的都会笑\n[00:53.790]\n[00:56.820]没有你在我有多难熬（没有你在我有多难熬多烦恼）\n[01:04.260]没有你烦我有多烦恼（没有你烦我有多烦恼多难熬）\n[01:07.850]\n[01:08.580]穿过云层  我试着努力向你奔跑\n[01:14.580]爱才送到  你却已在别人怀抱\n[01:20.190]\n[01:21.640]就是开不了口  让她知道\n[01:26.780]我一定会呵护着你  也逗你笑\n[01:34.180]你对我有多重要  我后悔没  让你知道\n[01:41.140]安静的听你撒娇  看你睡着  一直到老\n[01:47.270]\n[01:48.600]就是开不了口  让她知道\n[01:54.360]就是那么简单几句  我办不到\n[02:01.640]整颗心悬在半空  我只能够  远远看着\n[02:08.580]这些我都做得到  但那个人已经不是我\n[02:15.910]\n[02:44.140]没有你在我有多难熬（没有你在我有多难熬多烦恼）\n[02:50.940]没有你烦我有多烦恼（没有你烦我有多烦恼多难熬）\n[02:57.350]\n[02:57.930]穿过云层  我试着努力向你奔跑\n[03:04.270]爱才送到  你却已在别人怀抱\n[03:10.060]\n[03:11.460]就是开不了口  让她知道\n[03:16.800]我一定会呵护着你  也逗你笑\n[03:23.910]你对我有多重要  我后悔没  让你知道\n[03:30.980]安静的听你撒娇  看你睡着  一直到老\n[03:37.480]\n[03:39.700]就是开不了口  让她知道\n[03:44.380]就是那么简单几句  我办不到\n[03:51.450]整颗心悬在半空  我只能够  远远看着\n[03:58.410]这些我都做得到  但那个人已经不是我\n[04:20.750]\n[04:21.340]我总是开不了口 我总是开不了口\n[04:27.390]我只能够远远地看着你 开不了口', '/song/周杰伦-开不了口.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (15, 2, '周杰伦-菊花台', '依然范特西', '2018-12-30 02:42:47', '2018-12-30 02:42:47', '/img/songPic/juhuatai.jpg', '[by:立酱]\n[00:00.00] 作曲 : 周杰伦\n[00:00.200] 作词 : 方文山\n[00:00.600]编曲：钟兴民\n[00:01.600]制作人：周杰伦\n[00:02.600]吉他：蔡科俊Again\n[00:03.600]弦乐编写：钟兴民\n[00:04.600]Programmer：魏百谦\n[00:05.600]弦乐团：中国爱乐\n[00:06.600]录音工程：杨瑞代\n[00:07.600]录音室：ALFA STUDIO\n[00:08.600]混音工程：杨大纬\n[00:09.600]混音录音室：杨大纬录音工作室\n[00:10.600]弦乐录音师：李岳松(北京)/魏百谦(台北)\n[00:11.600]弦乐录音室：计划生育录音室(北京)/Room19 Studio (台北)\n[00:35.900]你的泪光\n[00:39.400]柔弱中带伤\n[00:42.850]惨白的月弯弯\n[00:46.350]勾住过往\n[00:49.860]夜 太漫长\n[00:53.360]凝结成了霜\n[00:56.720]是谁在阁楼上冰冷地绝望\n[01:03.820]雨 轻轻弹\n[01:07.370]朱红色的窗\n[01:10.780]我一生在纸上被风吹乱\n[01:17.730]梦 在远方\n[01:21.290]化成一缕香\n[01:24.690]随风飘散\n[01:27.250]你的模样\n[01:34.510]菊花残 满地伤\n[01:37.770]你的笑容已泛黄\n[01:42.190]花落人断肠\n[01:44.640]我心事静静淌\n[01:48.200]北风乱 夜未央\n[01:51.550]你的影子剪不断\n[01:56.000]徒留我孤单在湖面成双\n[02:30.900]花 已向晚\n[02:34.360]飘落了灿烂\n[02:37.810]凋谢的世道上\n[02:41.270]命运不堪\n[02:44.820]愁 莫渡江\n[02:48.440]秋心拆两半\n[02:51.640]怕你上不了岸\n[02:55.000]一辈子摇晃\n[02:58.850]谁 的江山\n[03:02.310]马蹄声狂乱\n[03:05.760]我一身的戎装\n[03:09.220]呼啸沧桑\n[03:12.720]天 微微亮\n[03:16.170]你轻声地叹\n[03:19.730]一夜惆怅 如此委婉\n[03:29.430]菊花残 满地伤\n[03:32.640]你的笑容已泛黄\n[03:37.160]花落人断肠\n[03:39.610]我心事静静淌\n[03:43.110]北风乱 夜未央\n[03:46.520]你的影子剪不断\n[03:50.970]徒留我孤单在湖面成双\n[04:00.700]菊花残 满地伤\n[04:03.950]你的笑容已泛黄\n[04:08.400]花落人断肠\n[04:10.900]我心事静静淌\n[04:14.410]北风乱 夜未央\n[04:17.910]你的影子剪不断\n[04:25.100]徒留我孤单在湖面成双', '/song/周杰伦-菊花台.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (16, 2, '周杰伦-牛仔很忙', '我很忙', '2018-12-30 02:48:47', '2018-12-30 02:48:47', '/img/songPic/nuizaihenmang.jpg', '[by:立酱]\n[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 黄俊郎\n[00:03.00]编曲：钟兴民\n[00:04.00]制作人：周杰伦\n[00:05.00]吉他：蔡科俊Again\n[00:06.00]弦乐编写：周杰伦\n[00:07.00]小提琴：王宜桢\n[00:08.00]合声编写：周杰伦\n[00:09.00]合声：周杰伦\n[00:10.00]录音师：杨瑞代\n[00:11.00]录音室：JVR STUDIO\n[00:12.00]混音师：杨大纬\n[00:13.00]混音录音室：杨大纬录音工作室\n[00:16.35]呜啦啦啦火车笛\n[00:18.16]随着奔腾的马蹄\n[00:20.26]小妹妹吹着口琴\n[00:22.20]夕阳下美了剪影\n[00:24.05]我用子弹写日记\n[00:25.95]介绍完了风景\n[00:27.75]接下来换介绍我自己\n[00:31.91]我虽然是个牛仔\n[00:33.71]在酒吧只点牛奶\n[00:35.72]为什么不喝啤酒\n[00:37.57]因为啤酒伤身体\n[00:39.52]很多人不长眼睛\n[00:41.47]嚣张都靠武器\n[00:43.42]赤手空拳就缩成蚂蚁\n[00:47.60]不用麻烦了 不用麻烦了\n[00:48.95]不用麻烦 不用麻烦了\n[00:50.35]不用麻烦了\n[00:51.45]你们一起上 我在赶时间\n[00:52.80]每天决斗 观众都累了\n[00:53.96]英雄也累了\n[00:55.10]不用麻烦了 不用麻烦了\n[00:56.66]副歌不长 你们有几个\n[00:57.96]一起上好了\n[00:59.11]正义呼唤我 美女需要我\n[01:00.52]牛仔很忙的\n[01:26.24]我啦啦啦骑毛驴\n[01:27.94]因为马跨不上去\n[01:29.86]洗澡都洗泡泡浴\n[01:31.72]因为可以玩玩具\n[01:33.62]我有颗善良的心\n[01:35.53]都只穿假牛皮\n[01:37.68]喔跌倒时尽量不压草皮\n[01:41.64]枪口它没长眼睛\n[01:43.39]我曾经答应上帝\n[01:45.34]除非是万不得已\n[01:47.19]我尽量射橡皮筋\n[01:49.29]老板先来杯奶昔\n[01:50.99]要逃命前请你\n[01:53.15]顺便喂喂我那只小毛驴\n[01:57.41]不用麻烦了 不用麻烦了\n[01:58.73]不用麻烦 不用麻烦了\n[01:59.98]不用麻烦了\n[02:00.68]你们一起上 我在赶时间\n[02:02.53]每天决斗 观众都累了\n[02:03.93]英雄也累了\n[02:04.63]不用麻烦了 不用麻烦了\n[02:06.14]副歌不长 你们有几个\n[02:07.44]一起上好了\n[02:08.67]正义呼唤我 美女需要我\n[02:10.28]牛仔很忙的\n[02:28.18]不用麻烦了 不用麻烦了\n[02:29.58]不用麻烦 不用麻烦了\n[02:30.78]不用麻烦了\n[02:32.07]你们一起上 我在赶时间\n[02:33.62]每天决斗 观众都累了\n[02:34.88]英雄也累了\n[02:35.58]不用麻烦了 不用麻烦了\n[02:37.18]副歌不长 你们有几个\n[02:38.43]一起上好了\n[02:39.87]正义呼唤我 美女需要我\n[02:41.37]牛仔很忙的', '/song/周杰伦-牛仔很忙.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (17, 2, '周杰伦-烟花易冷', '跨时代', '2018-12-30 02:57:23', '2018-12-30 02:57:23', '/img/songPic/yanhuayileng.jpg', '[by:立酱]\n[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 方文山\n[00:03.00]编曲：黄雨勋\n[00:04.00]制作人：周杰伦\n[00:05.00]录音师：杨瑞代Gary\n[00:06.00]录音室：JVR Studio\n[00:07.00]混音工程：杨大纬录音工作室\n[00:12.09]繁华声 遁入空门 折煞了世人\n[00:18.01]梦偏冷 辗转一生 情债又几本\n[00:24.32]如你默认 生死枯等\n[00:30.55]枯等一圈 又一圈的 年轮\n[00:36.99]浮图塔 断了几层 断了谁的魂\n[00:43.28]痛直奔 一盏残灯 倾塌的山门\n[00:49.26]容我再等 历史转身\n[00:55.74]等酒香醇 等你弹 一曲古筝\n[01:02.17]雨纷纷 旧故里草木深\n[01:08.58]我听闻 你始终一个人\n[01:14.35]斑驳的城门 盘踞着老树根\n[01:20.65]石板上回荡的是 再等\n[01:26.93]雨纷纷 旧故里草木深\n[01:32.97]我听闻 你仍守着孤城\n[01:39.40]城郊牧笛声 落在那座野村\n[01:45.76]缘份落地生根是 我们\n[01:54.98]听青春 迎来笑声 羡煞许多人\n[02:01.37]那史册 温柔不肯 下笔都太狠\n[02:07.39]烟花易冷 人事易分\n[02:13.51]而你在问 我是否还 认真\n[02:19.70]千年后 累世情深 还有谁在等\n[02:25.80]而青史 岂能不真 魏书洛阳城\n[02:32.08]如你在跟 前世过门\n[02:39.02]跟着红尘 跟随我 浪迹一生\n[02:44.97]雨纷纷 旧故里草木深\n[02:50.96]我听闻 你始终一个人\n[02:57.47]斑驳的城门 盘踞着老树根\n[03:03.61]石板上回荡的是 再等\n[03:09.78]雨纷纷 旧故里草木深\n[03:15.95]我听闻 你仍守着孤城\n[03:22.40]城郊牧笛声 落在那座野村\n[03:28.68]缘份落地生根是 我们\n[03:35.34]雨纷纷 旧故里草木深\n[03:37.64]我听闻 你始终一个人\n[03:39.60]斑驳的城门 盘踞着老树根\n[03:41.47]石板上回荡的是 再等\n[03:42.89]雨纷纷 雨纷纷 旧故里草木深\n[03:44.77]我听闻 我听闻 你仍守着孤城\n[03:47.48]城郊牧笛声 落在那座野村\n[03:52.16]缘份落地生根是 我们\n[03:59.91]缘份落地生根是 我们\n[04:05.74]伽蓝寺听雨声盼 永恒', '/song/周杰伦-烟花易冷.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (18, 2, '周杰伦-听妈妈的话', '依然范特西', '2018-12-30 03:08:45', '2018-12-30 03:08:45', '/img/songPic/yanhuayileng.jpg', '[00:08.619]小朋友你是否有很多问号\n[00:12.049]为什么 别人在那看漫画 我却在学画画 对着钢琴说话\n[00:17.100]别人在玩游戏 我却靠在墙壁背我的ABC\n[00:20.359]我说我要一个大大的飞机 但却得到一台旧旧录音机\n[00:25.319]为什么要听妈妈的话 长大后你就会开始懂了这段话\n[00:30.278]长大后我开始明白\n[00:32.948]为什么我跑得比别人快 飞得比别人高\n[00:35.728]将来大家看的都是我画的漫画 大家唱的都是我写的歌\n[00:40.868]妈妈的辛苦不让你看见 温暖的食谱在她心里面\n[00:46.048]有空就多多握握她的手 把手牵着一起梦游\n[00:50.988]听妈妈的话 别让她受伤 想快快长大 才能保护她\n[01:10.300]美丽的白发 幸福中发芽 天使的魔法 温暖中慈祥\n[01:30.219]在你的未来 音乐是你的王牌 拿王牌谈个恋爱\n[01:36.180]唉!我不想把你教坏 还是听妈妈的话吧 晚点再恋爱吧\n[01:40.109]我知道你未来的路 但妈比我更清楚\n[01:42.997]你会开始学其他同学在书包写东写西\n[01:46.658]但我建议最好写妈妈我会用功读书\n[01:48.219]用功读书 怎么会从我嘴巴说出\n[01:50.348]不想你输 所以要叫你用功读书\n[01:52.988]妈妈织给你的毛衣 你要好好的收着\n[01:56.180]因为母亲节到时 我要告诉她我还留着\n[01:57.988]对了 我会遇到周润发\n[01:59.949]所以你可以跟同学炫耀赌神未来是你爸爸\n[02:02.798]我找不到童年写的情书 你写完不要送人\n[02:06.349]因为过两天你会在操场上捡到\n[02:08.999]你会开始喜欢上流行歌 因为张学友开始准备唱吻别\n[02:13.009]听妈妈的话 别让她受伤 想快快长大 才能保护她\n[02:32.299]美丽的白发 幸福中发芽 天使的魔法 温暖中慈祥\n[02:52.727]听妈妈的话 别让她受伤 想快快长大 才能保护她\n[03:13.699]长大后我开始明白\n[03:18.199]为什么我跑得比别人快 飞得比别人高\n[03:20.929]将来大家看的都是我画的漫画 大家唱的都是我写的歌\n[03:26.099]妈妈的辛苦不让你看见 温暖的食谱在她心里面\n[03:31.227]有空就多多握握她的手 把手牵着一起梦游\n[03:36.239]听妈妈的话 别让她受伤 想快快长大 才能保护她\n[03:54.939]美丽的白发 幸福中发芽 天使的魔法 温暖中慈祥', '/song/周杰伦-听妈妈的话.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (19, 2, '周杰伦-七里香', '七里香', '2018-12-30 03:13:15', '2018-12-30 03:13:15', '/img/songPic/qilixiang.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 方文山\n[00:27.430]窗外的麻雀 在电线杆上多嘴\n[00:34.330]你说这一句 很有夏天的感觉\n[00:40.980]手中的铅笔 在纸上来来回回\n[00:47.300]我用几行字形容你是我的谁\n[00:54.030]秋刀鱼的滋味 猫跟你都想了解\n[01:01.100]初恋的香味就这样被我们寻回\n[01:07.400]那温暖的阳光 像刚摘的鲜艳草莓\n[01:14.140]你说你舍不得吃掉这一种感觉\n[01:20.450]雨下整夜 我的爱溢出就像雨水\n[01:27.240]院子落叶 跟我的思念厚厚一叠\n[01:33.920]几句是非 也无法将我的热情冷却\n[01:41.510]你出现在我诗的每一页\n[01:47.470]雨下整夜 我的爱溢出就像雨水\n[01:54.120]窗台蝴蝶 像诗里纷飞的美丽章节\n[02:00.840]我接着写 把永远爱你写进诗的结尾\n[02:08.350]你是我唯一想要的了解\n[02:14.660]\n[02:41.250]雨下整夜 我的爱溢出就像雨水\n[02:47.850]院子落叶 跟我的思念厚厚一叠\n[02:54.550]几句是非 也无法将我的热情冷却\n[03:02.150]你出现在我诗的每一页\n[03:07.790]\n[03:08.510]那饱满的稻穗 幸福了这个季节\n[03:15.850]而你的脸颊像田里熟透的蕃茄\n[03:21.870]你突然对我说 七里香的名字很美\n[03:28.560]我此刻却只想亲吻你倔强的嘴\n[03:35.010]雨下整夜 我的爱溢出就像雨水\n[03:41.680]院子落叶 跟我的思念厚厚一叠\n[03:48.300]几句是非 也无法将我的热情冷却\n[03:55.900]你出现在我诗的每一页\n[04:02.360]整夜 我的爱溢出就像雨水\n[04:08.520]窗台蝴蝶 像诗里纷飞的美丽章节\n[04:15.470]我接着写 把永远爱你写进诗的结尾\n[04:22.770]你是我唯一想要的了解\n[04:29.280]', '/song/周杰伦-七里香.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (20, 2, '周杰伦-晴天', '叶惠美', '2018-12-30 03:17:20', '2018-12-30 03:17:20', '/img/songPic/qingtian.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 周杰伦\n[00:28.950]故事的小黄花\n[00:32.380]从出生那年就飘着\n[00:35.870]童年的荡秋千\n[00:39.370]随记忆一直晃到现在\n[00:42.440]ㄖㄨㄟ ㄙㄡ ㄙㄡ ㄒ一 ㄉㄡ ㄒ一ㄌㄚ\n[00:45.530]ㄙㄡ ㄌㄚ ㄒ一 ㄒ一 ㄒ一 ㄒ一 ㄌㄚ ㄒ一 ㄌㄚ ㄙㄡ\n[00:49.570]吹着前奏望着天空\n[00:52.870]我想起花瓣试着掉落\n[00:56.410]为你翘课的那一天\n[00:58.550]花落的那一天\n[01:00.190]教室的那一间\n[01:01.990]我怎么看不见\n[01:03.880]消失的下雨天\n[01:05.410]我好想再淋一遍\n[01:09.750]没想到失去的勇气我还留着\n[01:15.530]好想再问一遍\n[01:17.520]你会等待还是离开\n[01:24.500]刮风这天我试过握着你手\n[01:30.080]但偏偏雨渐渐大到我看你不见\n[01:38.450]还要多久我才能在你身边\n[01:44.870]等到放晴的那天也许我会比较好一点\n[01:52.330]从前从前有个人爱你很久\n[01:57.960]但偏偏风渐渐把距离吹得好远\n[02:06.240]好不容易又能再多爱一天\n[02:12.910]但故事的最后你好像还是说了拜拜\n[02:21.990]\n[02:34.660]为你翘课的那一天\n[02:36.500]花落的那一天\n[02:38.300]教室的那一间\n[02:40.040]我怎么看不见\n[02:41.780]消失的下雨天\n[02:43.680]我好想再淋一遍\n[02:47.610]没想到失去的勇气我还留着\n[02:54.090]好想再问一遍\n[02:55.650]你会等待还是离开\n[03:02.470]刮风这天我试过握着你手\n[03:07.900]但偏偏雨渐渐大到我看你不见\n[03:16.420]还要多久我才能在你身边\n[03:22.900]等到放晴的那天也许我会比较好一点\n[03:30.310]从前从前有个人爱你很久\n[03:36.440]偏偏风渐渐把距离吹得好远\n[03:44.290]好不容易又能再多爱一天\n[03:50.770]但故事的最后你好像还是说了拜拜\n[03:58.010]刮风这天我试过握着你手\n[04:01.760]但偏偏雨渐渐大到我看你不见\n[04:05.050]还要多久我才能够在你身边\n[04:08.630]等到放晴那天也许我会比较好一点\n[04:12.570]从前从前有个人爱你很久\n[04:15.510]但偏偏雨渐渐把距离吹得好远\n[04:18.950]好不容易又能再多爱一天\n[04:22.430]但故事的最后你好像还是说了拜', '/song/周杰伦-晴天.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (21, 3, '林允儿-月亮代表我的心', 'Blossom', '2018-12-30 03:26:32', '2018-12-30 03:26:32', '/img/songPic/Blossom.jpg', '[00:00.00] 作曲 : 翁清溪\n[00:01.00] 作词 : 孙仪\n[00:09.54]编曲 : 이재명\n[00:11.67]你问我爱你有多深　\n[00:17.32]我爱你有几分\n[00:22.72]我的情也真　\n[00:25.49]我的爱也真　\n[00:28.39]月亮代表我的心\n[00:34.02]\n[00:34.46]你问我爱你有多深　\n[00:40.13]我爱你有几分\n[00:45.51]我的情不移　\n[00:48.56]我的爱不变　\n[00:51.26]月亮代表我的心\n[00:56.25]\n[00:56.92]轻轻的一个吻\n[01:02.74]已经打动我的心\n[01:08.43]深深的一段情　\n[01:14.13]叫我思念到如今\n[01:19.23]\n[01:20.11]你问我爱你有多深　\n[01:25.81]我爱你有几分\n[01:31.23]你去想一想\n[01:34.11]你去看一看　\n[01:36.92]月亮代表我的心\n[01:42.08]\n[01:54.15]轻轻的一个吻\n[01:59.83]已经打动我的心\n[02:05.59]深深的一段情　\n[02:11.21]叫我思念到如今\n[02:16.62]\n[02:17.27]你问我爱你有多深　\n[02:23.10]我爱你有几分\n[02:28.40]你去想一想\n[02:31.25]你去看一看　\n[02:34.16]月亮代表我的心\n[02:38.92]\n[02:39.76]你去想一想\n[02:42.66]你去看一看　\n[02:45.56]月亮代表我的心\n[03:03.30]', '/song/林允儿-月亮代表我的心.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (22, 3, '林允儿-小幸运', 'Blossom', '2018-12-30 03:31:39', '2018-12-30 03:31:39', '/img/songPic/Blossom.jpg', '[00:00.00] 作曲 : JerryC\n[00:01.00] 作词 : 徐世珍/吴辉福\n[00:12.97]编曲 : 추대관\n[00:13.18]我听见雨滴落在青青草地\n[00:19.45]我听见远方下课钟声响起\n[00:25.38]可是我没有听见你的声音\n[00:30.36]认真 呼唤 我姓名\n[00:35.69]\n[00:37.68]爱上你的时候还不懂感情\n[00:43.87]离别了才觉得刻骨铭心\n[00:50.00]为什么没有发现遇见了你\n[00:54.60]是生命最好的事情\n[00:59.72]\n[01:00.39]也许当时忙着 微笑和哭泣\n[01:06.50]忙着追逐天空中的流星\n[01:12.30]人理所当然的忘记\n[01:16.87]是谁风里雨里一直 默默守护在原地\n[01:24.26]\n[01:24.68]原来你是我 最想留住的幸运\n[01:30.07]原来我们和爱情 曾经靠得那么近\n[01:36.10]那为我对抗世界的决定\n[01:40.79]那陪我淋的雨\n[01:43.86]一幕幕都是你 一尘不染的真心\n[01:51.20]与你相遇 好幸运\n[01:54.58]可我已失去为你 泪流满面的权利\n[02:00.75]但愿在我看不到的天际\n[02:05.38]你张开了双翼\n[02:08.53]遇见你的注定\n[02:13.27]她会有多幸运\n[02:17.64]\n[02:26.73]原来你是我 最想留住的幸运\n[02:31.54]原来我们和爱情 曾经靠得那么近\n[02:37.69]但愿在我看不到的天际\n[02:42.32]你张开了双翼\n[02:45.48]遇见你的注定\n[02:53.18]她会有多幸运\n[02:58.15]', '/song/林允儿-小幸运.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (23, 3, '林允儿-红豆', 'Blossom', '2018-12-30 04:00:19', '2018-12-30 04:00:19', '/img/songPic/Blossom.jpg', '[00:00.00] 作曲 : 柳重言\n[00:01.00] 作词 : 林夕\n[00:15.28]编曲 : 추대관\n[00:16.70]还没好好的感受 雪花绽放的气候\n[00:25.13]我们一起颤抖 会更明白 什么是温柔\n[00:33.74]还没跟你牵着手 走过荒芜的沙丘\n[00:42.21]可能从此以后 学会珍惜 天长和地久\n[00:50.95]有时候 有时候 我会相信一切有尽头\n[00:59.40]相聚离开 都有时候 没有什么会永垂不朽\n[01:07.97]可是我 有时候 宁愿选择留恋不放手\n[01:16.55]等到风景都看透\n[01:20.78]也许你会陪我看 细水长流\n[01:42.38]还没为你把红豆 熬成缠绵的伤口\n[01:50.94]然后一起分享 会更明白 相思的哀愁\n[01:59.46]还没好好的感受 醒着亲吻的温柔\n[02:08.02]可能在我左右 你才追求 孤独的自由\n[02:18.78]有时候 有时候 我会相信一切有尽头\n[02:27.29]相聚离开 都有时候 没有什么会永垂不朽\n[02:35.87]可是我 有时候 宁愿选择留恋不放手\n[02:44.47]等到风景都看透\n[02:48.65]也许你会陪我看 细水长流\n[03:08.22]有时候 有时候 我会相信一切有尽头\n[03:16.52]相聚离开 都有时候 没有什么会永垂不朽\n[03:25.15]可是我 有时候 宁愿选择留恋不放手\n[03:33.73]等到风景都看透\n[03:38.01]也许你会陪我看 细水长流\n[03:46.33]', '/song/林允儿-红豆.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (24, 4, '陈奕迅-红玫瑰', 'The 1st Eleven Years 然后呢?', '2018-12-30 04:21:48', '2018-12-30 04:21:48', '/img/songPic/hongmeigui.jpg', '[ar:陈奕迅]\n[00:00.00] 作曲 : 梁翘柏\n[00:01.00] 作词 : 李焯雄\n[00:16.32]梦里梦到醒不来的梦\n[00:18.92]红线里被软禁的红\n[00:23.62]所有刺激剩下疲乏的痛\n[00:26.82]再无动于衷\n[00:30.12]从背后抱你的时候\n[00:34.02]期待的却是她的面容\n[00:37.75]说来实在嘲讽我不太懂\n[00:41.35]偏渴望你懂\n[00:44.75]是否幸福轻得太沉重\n[00:48.50]过度使用不痒不痛\n[00:52.31]烂熟透红空洞了的瞳孔\n[00:56.56]终于掏空终于有始无终\n[00:59.81]得不到的永远在骚动\n[01:03.41]被偏爱的都有恃无恐\n[01:07.11]玫瑰的红容易受伤的梦\n[01:11.46]握在手中却流失于指缝\n[01:14.96]又落空\n[01:31.02]红是朱砂痣烙印心口\n[01:33.82]红是蚊子血般平庸\n[01:38.73]时间美化那仅有的悸动\n[01:41.82]也磨平激动\n[01:45.12]从背后抱你的时候\n[01:48.98]期待的却是她的面容\n[01:52.82]说来实在嘲讽\n[01:55.15]我不太懂偏渴望你懂\n[01:59.85]是否幸福轻得太沉重\n[02:03.60]过度使用不痒不痛\n[02:07.10]烂熟透红空洞了的瞳孔\n[02:11.45]终于掏空终于有始无终\n[02:14.70]得不到的永远在骚动\n[02:18.50]被偏爱的都有恃无恐\n[02:22.35]玫瑰的红容易受伤的梦\n[02:26.35]握在手中却流失于指缝\n[02:29.75]又落空\n[02:44.99]是否说爱都太过沉重\n[02:48.54]过度使用不痒不痛\n[02:52.24]烧得火红蛇行缠绕心中\n[02:56.34]终于冷冻终于有始无终\n[02:59.74]得不到的永远在骚动\n[03:03.49]被偏爱的都有恃无恐\n[03:07.24]玫瑰的红容易受伤的梦\n[03:11.39]握在手中却流失于指缝\n[03:14.84]得不到的永远在骚动\n[03:18.49]被偏爱的都有恃无恐\n[03:22.34]玫瑰的红伤口绽放的梦\n[03:26.44]握在手中却流失于指缝\n[03:29.79]再落空', '/song/陈奕迅-红玫瑰.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (25, 4, '陈奕迅 + 王菲-因为爱情', 'Stranger Under My Skin', '2018-12-30 08:22:41', '2018-12-30 08:22:41', '/img/songPic/yinweiaiqing.jpg', '[00:00.00] 作曲 : 小柯\n[00:01.00] 作词 : 小柯\n[00:11.739]给你一张过去的CD\n[00:16.299]听听那时我们的爱情\n[00:21.340]有时会突然忘了我还在爱着你\n[00:30.990]\n[00:33.390]再唱不出那样的歌曲\n[00:37.690]听到都会红着脸躲避\n[00:43.140]虽然会经常忘了我依然爱着你\n[00:52.110]\n[00:53.790]因为爱情 不会轻易悲伤\n[00:59.540]所以一切都是幸福的模样\n[01:05.129]因为爱情 简单的生长\n[01:10.730]依然随时可以为你疯狂\n[01:15.200]\n[01:16.000]因为爱情 怎么会有沧桑\n[01:21.350]所以我们还是年轻的模样\n[01:26.890]因为爱情 在那个地方\n[01:32.530]依然还有人在那里游荡人来人往\n[01:42.128]\n[02:00.730]再唱不出那样的歌曲\n[02:05.300]听到都会红着脸躲避\n[02:10.509]虽然会经常忘了我依然爱着你\n[02:20.510]\n[02:20.779]因为爱情 不会轻易悲伤\n[02:26.820]所以一切都是幸福的模样\n[02:32.399]因为爱情 简单的生长\n[02:38.100]依然随时可以为你疯狂\n[02:42.140]\n[02:42.589]因为爱情 怎么会有沧桑\n[02:48.499]所以我们还是年轻的模样\n[02:54.700]因为爱情 在那个地方\n[02:59.909]依然还有人在那里游荡人来人往\n[03:09.279]\n[03:11.629]给你一张过去的CD\n[03:16.279]听听那时我们的爱情\n[03:21.640]有时会突然忘了我还在爱着你', '/song/陈奕迅 + 王菲-因为爱情.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (26, 4, '陈奕迅-不要说话', '不想放手', '2018-12-30 08:30:03', '2018-12-30 08:30:03', '/img/songPic/buyaoshuohua.jpg', '[ti:不要说话]\n[ar:陈奕迅]\n[al:博儿Lrc试练]\n[by:博儿]\n[00:00.00] 作曲 : 小柯\n[00:01.00] 作词 : 小柯\n[00:18.77]深色的海面布满白色的月光\n[00:24.51]\n[00:25.11]我出神望着海 心不知飞哪去\n[00:31.64]听到她在告诉你\n[00:35.28]说她真的喜欢你\n[00:39.48]我不知该 躲哪里\n[00:47.17]爱一个人是不是应该有默契\n[00:54.15]我以为你懂得每当我看着你\n[01:00.07]我藏起来的秘密\n[01:03.67]在每一天清晨里\n[01:07.60]暖成咖啡 安静的拿给你\n[01:14.33]愿意 用一支黑色的铅笔\n[01:18.81]画一出沉默舞台剧\n[01:22.95]灯光再亮 也抱住你\n[01:28.53]愿意 在角落唱沙哑的歌\n[01:33.06]再大声也都是给你\n[01:37.24]请用心听 不要说话\n[01:51.54]爱一个人是不是应该要默契\n[01:58.36]我以为你懂得每当我看着你\n[02:04.34]我藏起来的秘密\n[02:08.22]在每一天清晨里\n[02:11.47]暖成咖啡 安静的拿给你\n[02:18.49]愿意 用一支黑色的铅笔\n[02:22.92]画一出沉默舞台剧\n[02:27.31]灯光再亮 也抱住你\n[02:33.04]愿意 在角落唱沙哑的歌\n[02:37.33]再大声也都是给你\n[02:41.46]请用心听 不要说话\n[03:15.81]愿意 用一支黑色的铅笔\n[03:19.95]画一出沉默舞台剧\n[03:24.43]灯光再亮 也抱住你\n[03:29.82]愿意 在角落唱沙哑的歌\n[03:34.19]再大声也都是给你\n[03:38.48]请原谅我 不会说话\n[03:44.11]愿意 用一支黑色的铅笔\n[03:48.55]画一出沉默舞台剧\n[03:52.68]灯光再亮 也抱住你\n[03:58.35]愿意 在角落唱沙哑的歌\n[04:02.84]再大声也都是给你\n[04:06.97]爱是用心吗 不要说话', '/song/陈奕迅-不要说话.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (27, 5, 'G.E.M.邓紫棋-泡沫', 'Xposed', '2018-12-30 08:42:26', '2018-12-30 08:42:26', '/img/songPic/1598961549702zenuo.jpeg', '[00:00.00] 作曲 : G.E.M.\n[00:00.169] 作词 : G.E.M.\n[00:00.509]阳光下的泡沫 是彩色的 就像被骗的我 是幸福的\n[00:14.940]追究什么对错 你的谎言 基于你还爱我\n[00:27.819]美丽的泡沫 虽然一刹花火 你所有承诺 虽然都太脆弱\n[00:41.780]但爱像泡沫 如果能够看破 有什么难过\n[00:53.750]\n[00:57.230]早该知道泡沫 一触就破 就像已伤的心 不胜折磨\n[01:11.040]也不是谁的错 谎言再多 基于你还爱我\n[01:24.200]美丽的泡沫 虽然一刹花火 你所有承诺 虽然都太脆弱\n[01:38.800]爱本是泡沫 如果能够看破 有什么难过\n[01:50.560]\n[01:52.629]再美的花朵 盛开过就凋落 再亮眼的星 一闪过就坠落\n[02:06.650]爱本是泡沫 如果能够看破 有什么难过\n[02:20.889]为什么难过 有什么难过 为什么难过\n[02:41.650]\n[02:45.799]全都是泡沫 只一刹的花火 你所有承诺 全部都太脆弱\n[02:59.560]而你的轮廓 怪我没有看破 才如此难过\n[03:13.769]相爱的把握 要如何再搜索 相拥着寂寞 难道就不寂寞\n[03:28.820]爱本是泡沫 怪我没有看破 才如此难过\n[03:39.980]\n[03:43.829]在雨下的泡沫 一触就破 当初炽热的心 早已沉没\n[03:57.940]说什么你爱我 如果骗我 我宁愿你沉默\n[04:10.000]\n[04:10.209]\n[59:59.700]', '/song/G.E.M.邓紫棋-泡沫.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (28, 5, 'G.E.M.邓紫棋-龙卷风', '龙卷风', '2018-12-30 08:48:44', '2018-12-30 08:48:44', '/img/songPic/longjuanfeng.jpg', '[00:00.00] 作曲 : 周杰伦\n[00:01.00] 作词 : 徐若瑄/周杰伦\n[00:20.05]爱像一阵风吹完它就走\n[00:26.54]这样的节奏谁都无可奈何\n[00:33.34]没有你以后我灵魂失控\n[00:39.81]黑云在降落我被它拖着走\n[00:46.30]静静悄悄默默离开\n[00:49.57]陷入了危险边缘Baby\n[00:53.74]我的世界已狂风暴雨\n[01:00.37]爱情来的太快就像龙卷风\n[01:03.29]离不开暴风圈来不及逃\n[01:06.32]我不能再想我不能再想\n[01:09.89]我不我不我不能\n[01:13.35]爱情走的太快就像龙卷风\n[01:16.58]不能承受我已无处可躲\n[01:19.51]我不要再想我不要再想\n[01:23.13]我不我不我不要再想你\n[01:26.97]不知不觉你已经离开我\n[01:30.00]不知不觉我跟了这节奏\n[01:33.31]后知后觉又过了一个秋\n[01:36.90]后知后觉我该好好生活\n[01:39.87]静静悄悄默默离开\n[01:42.86]陷入了危险边缘Baby\n[01:47.24]我的世界已狂风暴雨\n[01:53.64]爱情来的太快就像龙卷风\n[01:56.92]离不开暴风圈来不及逃\n[01:59.55]我不能再想我不能再想\n[02:02.83]我不我不我不能\n[02:06.61]爱情走的太快就像龙卷风\n[02:09.93]不能承受我已无处可躲\n[02:12.85]我不要再想我不要再想\n[02:16.19]我不我不我不要再想你\n[02:32.89]现在你要我说多难堪\n[02:35.43]我根本就不想分开\n[02:37.13]为什么还要我用用微笑来带过\n[02:40.56]没有我没有没有这种天分\n[02:43.31]包容你也接受他\n[02:44.64]但不用担心太多\n[02:45.90]我会一直好好过\n[02:47.25]我看着你已经远远离开\n[02:49.90]我也会慢慢的走开\n[02:51.50]为什么我连分开都迁就着你\n[02:54.01]我真的没有天分安静的没那么快\n[02:56.49]and i will learn to give up because\n[02:58.93]我爱你\n[03:00.27]爱情来的太快就像龙卷风\n[03:03.30]离不开暴风圈来不及逃\n[03:06.26]我不能再想我不能再想\n[03:09.59]我不我不我不能\n[03:13.61]爱情走的太快就像龙卷风\n[03:16.58]不能承受我已无处可躲\n[03:19.53]我不要再想我不要再想\n[03:22.82]我不我不我不要再想你\n[03:27.16]不知不觉你已经离开我\n[03:29.99]不知不觉我跟了这节奏\n[03:33.25]后知后觉又过了一个秋\n[03:36.62]后知后觉我该好好生活\n[03:41.62]你已经离开我\n[03:44.82]你已经留下我\n[03:47.91]我应该好好地生活\n[03:53.73]不知不觉你已经离开我\n[03:56.67]不知不觉我跟了这节奏\n[03:59.96]后知后觉又过了一个秋\n[04:03.31]后知后觉后知后觉', '/song/G.E.M.邓紫棋-龙卷风.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (29, 5, 'G.E.M.邓紫棋-夜空中最亮的星', '龙卷风', '2018-12-30 08:53:52', '2018-12-30 08:53:52', '/img/songPic/yekongzhongzuiliangdexing.jpg', '[00:00.00] 作曲 : 逃跑计划\n[00:01.00] 作词 : 逃跑计划\n[00:07.87]编曲 : Lupo Groinig\n[00:08.87]夜空中最亮的星 能否听清\n[00:17.23]那仰望的人 心底的孤独和叹息\n[00:26.09]夜空中最亮的星 能否记起\n[00:34.58]曾与我同行 消失在风里的身影\n[00:42.35]我祈祷拥有一颗透明的心灵\n[00:47.41]和会流泪的眼睛\n[00:52.91]给我再去相信的勇气\n[00:56.23]越过谎言去拥抱你\n[01:00.01]每当我找不到存在的意义\n[01:04.69]每当我迷失在黑夜里\n[01:10.36]夜空中最亮的星\n[01:13.71]请照亮我前行\n[01:22.91]夜空中最亮的星 是否知道\n[01:31.30]曾与我同行的身影 如今在哪里\n[01:40.43]夜空中最亮的星 是否在意\n[01:48.71]是太阳先升起 还是意外先来临\n[01:56.55]我祈祷拥有一颗透明的心灵\n[02:01.62]和会流泪的眼睛\n[02:07.07]给我再去相信的勇气\n[02:10.31]越过谎言去拥抱你\n[02:14.25]每当我找不到存在的意义\n[02:18.89]每当我迷失在黑夜里\n[02:24.53]夜空中最亮的星\n[02:27.91]请照亮我前行\n[02:33.63]夜空中最亮的星  请照亮我前行\n[02:41.98]夜空中最亮的星  请照亮我前行\n[02:50.76]夜空中最亮的星  请照亮我前行\n[02:59.46]夜空中最亮的星  请照亮我前行\n[03:11.62]我不愿忘记你的眼睛\n[03:16.81]给我再去相信的勇气\n[03:22.00]去拥抱你\n[03:25.74]我找不到存在的意义\n[03:28.90]我迷失在黑夜里\n[03:34.47]夜空中最亮的星 请照亮我前行', '/song/G.E.M.邓紫棋-夜空中最亮的星.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (30, 6, '梁耀燮-Shadow (그림자)', 'The First Collage', '2018-12-30 09:08:58', '2018-12-30 09:08:58', '/img/songPic/Shadow.jpg', '[00:00.00] 作曲 : 龙俊亨/金泰洙\n[00:01.00] 作词 : 龙俊亨/金泰洙\n[00:03.990]Shadow Shadow\n[00:11.950]Because I`m a Shadow\n[00:13.450]Shadow Shadow\n[00:16.750]Rainy Cloudy No light Darkness Day N Night\n[00:19.890]너 떠나버린\n[00:20.820]그 때부터 어쩌면 Maybe 내 존재 자체가 없어졌지\n[00:25.200]Back in the day\n[00:25.700]화창한 날씨 화려한 불빛\n[00:27.970]항상 네 곁에 있었지 내가 있었지 내가\n[00:30.450]Cause I`m Shadow Shadow Shadow\n[00:32.570]Give me the light light light\n[00:34.860]You are ma ma ma sunrise\n[00:38.470]너 없는 난 아무것도 아냐\n[00:41.110]넌 내 마지막 You`re my last\n[00:43.440]언제까지나 You`re my last\n[00:45.570]네가 불길이라도 난 뛰어들게\n[00:49.210]너와 나의 저 하늘을 검게 물들인 저 이별을 어서 지워줘\n[00:57.210]더 이상 내가 다가갈 수 없게\n[01:00.000]너를 바라볼 수 없게\n[01:02.250]네 곁에 머물고 싶어\n[01:03.909]Because I`m a Shadow Shadow Shadow\n[01:05.700]간절하게 원하고 있는데\n[01:09.130]눈부셨던 그때로 나 돌아갈래\n[01:13.980]그림자처럼 항상 함께였던\n[01:16.820]아름다운 네 미소가 날 비추던\n[01:20.660]Because I`m a Shadow Shadow Shadow\n[01:24.300]Early in the morning\n[01:26.310]오늘도 역시\n[01:28.500]The sun is hiding\n[01:32.740]빛은 사라졌지 널 데리고서 저 저 멀리로\n[01:37.539]Cause I`m a Shadow Shadow Shadow\n[01:39.300]Give me the light light light\n[01:41.920]You are ma ma ma sunrise\n[01:45.240]너 없는 난 아무것도 아냐\n[01:47.929]넌 내 마지막 You`re my last\n[01:50.270]언제까지나 You`re my last\n[01:52.300]네가 불길이라도 난 뛰어들게\n[01:56.000]너와 나의 저 하늘을 검게 물들인 저 이별을 어서 지워줘\n[02:04.000]더 이상 내가 다가갈 수 없게\n[02:06.880]너를 바라볼 수 없게\n[02:09.000]네 곁에 머물고 싶어\n[02:10.788]Because I`m a Shadow Shadow Shadow\n[02:12.459]간절하게 원하고 있는데\n[02:16.270]눈부셨던 그때로 나 돌아갈래\n[02:20.640]그림자처럼 항상 함께였던\n[02:23.570]아름다운 네 미소가 날 비추던\n[02:27.340]Because I`m a Shadow Shadow Shadow\n[02:30.420]Erase erase 잊어 지워\n[02:32.239]이젠 이젠 싫어 미워\n[02:34.640]Fall fall falln`down.Faded faded faded\n[02:38.000]I`m not a vampire，Not a night ghost\n[02:40.179]어둠 속에 흐느껴 네 이름 부르고\n[02:42.579]우리가 다시 함께 하기를 기다려\n[02:45.529]Cause a Shadow Shadow Shadow\n[02:47.630]Oh 너를 잊는다는 건 나 역시 지워진다는 걸\n[02:54.460]너와 나의 저 하늘을 검게 물들인 저 이별을 어서 지워줘\n[03:02.310]더 이상 내가 다가갈 수 없게\n[03:05.340]너를 바라볼 수 없게\n[03:07.420]네 곁에 머물고 싶어\n[03:09.119]Because I`m a Shadow Shadow Shadow\n[03:11.140]간절하게 원하고 있는데\n[03:14.660]눈부셨던 그때로 나 돌아갈래\n[03:19.260]그림자처럼 항상 함께였던\n[03:21.999]아름다운 네 미소가 날 비추던\n[03:26.000]Because I`m a Shadow Shadow Shadow\n[03:30.210]Because I`m a Shadow Shadow Shadow', '/song/梁耀燮-Shadow (그림자).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (31, 6, '梁耀燮-리본(Ribbon)', 'Highlight', '2018-12-30 09:59:49', '2018-12-30 09:59:49', '/img/songPic/Ribbon.jpg', '[by:Jensen48_]\n[00:00.00] 作曲 : Good Life\n[00:01.00] 作词 : 龙俊亨\n[00:29.02]단단했던 매듭이 결국엔\n[00:31.61]풀려버리고 마네요\n[00:35.66]설마 했던 이별이 가까이\n[00:38.65]다가와 버렸네요 정말로\n[00:42.98]아마도 지금 이 순간이\n[00:45.59]가장 힘든 순간이에요 내겐\n[00:50.23]걱정 말아요 그래도\n[00:52.36]그대 원망하진 않아요\n[00:56.96]모든 걸 잃어도 돌릴 수 없고\n[01:00.68]소중한 걸 지킬 수조차 없는\n[01:04.58]초라한 내 모습 뗄 수 없는 입술이\n[01:08.69]그댈 잡을 수 없게 하죠\n[01:11.50]난 다시 한 번 풀려버린\n[01:15.23]우리를 예쁘게 묶고 싶어\n[01:19.20]있는 힘껏 서로를 당기며\n[01:22.75]사랑을 매듭지을 수 있게\n[01:26.31]Tie up a ribbon 절대 풀리지 않게\n[01:29.93]Tie up a ribbon 서로를 놓을 수 없게\n[01:33.75]아직 늦은 게 아니라면\n[01:36.74]너도 나와 같을 수 있다면\n[01:41.29]받아들이는 게 아냐\n[01:42.96]내 뜻대로 할 수 있는 건\n[01:44.67]지금처럼 질질 짜거나\n[01:46.47]취한 채로 널 향해 걷는 거\n[01:48.43]아주 가끔씩 꿈에 찾아온\n[01:50.14]널 반갑게 맞아주는 거\n[01:51.87]아무렇지 않은 척 괜찮다며\n[01:54.05]웃어주는 것뿐이야 Baby\n[01:56.78]맞아 좋은 남잔 아니었어\n[01:58.47]나는 너에게\n[02:00.28]언제나 부족한 사람이었기에\n[02:03.86]지금처럼 노래 부르는 것도\n[02:06.32]부담이라면 미안해\n[02:08.89]전부를 버려도 바꿀 수 없고\n[02:12.64]싫어도 빼앗길 수밖에 없는\n[02:16.53]초라한 내 모습 뗄 수 없는 입술이\n[02:20.63]그댈 잡을 수 없게 하죠\n[02:23.44]난 다시 한 번 풀려버린\n[02:27.28]우리를 예쁘게 묶고 싶어\n[02:31.24]있는 힘껏 서로를 당기며\n[02:34.76]사랑을 매듭지을 수 있게\n[02:38.26]Tie up a ribbon 절대 풀리지 않게\n[02:41.83]Tie up a ribbon 서로를 놓을 수 없게\n[02:45.74]아직 늦은 게 아니라면\n[02:48.71]너도 나와 같을 수 있다면\n[02:52.93]너무 아름답게 또 당연한 듯이\n[02:56.72]내 곁에 머물러준 너\n[02:59.93]그래서 가까이 와버린 이별조차\n[03:03.89]알아채지 못한 걸까\n[03:07.27]이렇게 쉽게 끝나버린 만큼\n[03:11.11]그리움도 쉽게 지울 순 없을까\n[03:15.12]언제쯤이면 나는 널 웃으며\n[03:18.57]떠올릴 수 있을까\n[03:21.36]난 다시 한 번 풀려버린\n[03:24.89]우리를 예쁘게 묶고 싶어\n[03:28.82]있는 힘껏 서로를 당기며\n[03:32.40]다시 널 사랑할 수 있게\n[03:35.74]Tie up a ribbon 절대 풀리지 않게\n[03:39.46]Tie up a ribbon 서로를 놓을 수 없게\n[03:43.34]아직 늦은 게 아니라면\n[03:46.36]너도 나와 같을 수 있다면\n[03:50.57]Tie up a ribbon', '/song/梁耀燮-리본(Ribbon).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (32, 6, '梁耀燮-Bye Bye Love', 'Bye Bye Love', '2018-12-30 10:01:26', '2018-12-30 10:01:26', '/img/songPic/ByeByeLove.jpg', '[00:00.270]Be My love 너만을 원해도\n[00:08.380]Be My love 넌 고개를 돌려\n[00:16.440]숨이 막혀와 (난 너를 잊지 못해)\n[00:20.440]눈물이 흐르고 (너 정말 떠나가나 봐)\n[00:24.270]입술을 다문 채 (가슴에 맺혀진 말)\n[00:28.140]You! Be my love\n[00:34.270]나에게 전부였던 너야\n[00:38.270]보낼 수가 없는 너란 말야\n[00:42.340]너를 사랑하는 나란 말야\n[00:46.400]Never let you go\n[00:50.520]날 웃게 하던 너의 기억\n[00:54.270]우리 함께하던 지난 추억\n[00:58.340]널 지워낼 수가 없단 말야\n[01:02.090]Don\'t go away\n[01:05.150]행복하라는 그 거짓말\n[01:08.770]날 사랑하기에 너 떠나간다는\n[01:13.090]슬픈 거짓말 가시처럼 차갑게 찌르지만\n[01:18.770]이젠 잊어볼게\n[01:23.090]지워볼께 Bye Bye Bye\n[01:26.710]내일은 더 아플 것만 같아도\n[01:30.710]그리움이 나를 적셔도\n[01:33.810]이젠 널 모두 다 보내줄게\n[01:40.330]Bye Bye Love, Bye Bye Love\n[01:48.260]Bye Bye Love, Bye Bye Love\n[01:58.570]Be My love 너만을 원해도\n[02:06.630]Be My love 넌 고개를 돌려\n[02:14.320]숨이 막혀와 (난 너를 잊지 못해)\n[02:18.320]눈물이 흐르고 (너 정말 떠나가나 봐)\n[02:22.450]입술을 다문 채 (가슴에 맺혀진 말)\n[02:26.380]You! Be my love\n[02:32.450]눈뜨면 니가 보고 싶어\n[02:36.130]너의 목소리가 듣고 싶어\n[02:40.380]니가 미칠 듯이 아른거려\n[02:43.900]Don\'t go away\n[02:46.880]행복하라는 그 거짓말\n[02:50.760]날 사랑하기에 너 떠나간다는\n[02:55.080]슬픈 거짓말 가시처럼 차갑게 찌르지만\n[03:00.580]이젠 잊어볼게\n[03:05.070]지워볼께 Bye Bye Bye\n[03:08.630]내일은 더 아플 것만 같아도\n[03:12.760]그리움이 나를 적셔도\n[03:15.690]이젠 널 모두 다 보내줄게\n[03:21.330]행복하라는 그 거짓말\n[03:24.630]날 사랑하기에 너 떠나간다는\n[03:28.950]슬픈 거짓말 가시처럼 차갑게 찌르지만\n[03:34.810]이젠 잊어볼게\n[03:39.070]지워볼께 Bye Bye Bye\n[03:42.700]내일은 더 아플 것만 같아도\n[03:46.700]그리움이 나를 적셔도\n[03:49.690]이젠 널 모두 다 보내줄게\n[03:55.850]Oh 넘실대는 눈물이 내 두 눈에 차다가 넘치고\n[04:00.160]널 잡지 못한 후회로 또 바보처럼 내 가슴을 치고\n[04:04.100]참아볼게 지워볼게 흐르는 눈물은 다 닦아볼게\n[04:07.890]너도 나처럼 아파하고 있다는 믿음이 먼지처럼 흩어져만 가\n[04:12.420]Bye Bye Love', '/song/梁耀燮-Bye Bye Love.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (33, 7, '艺声-문 열어봐 (Here I am)', 'Here I am', '2018-12-30 10:31:30', '2018-12-30 10:31:30', '/img/songPic/HereIam.jpg', '[00:00.00] 作曲 : 艺声/BrotherSu\n[00:01.00] 作词 : 艺声/BrotherSu\n[00:17.39]핑계가 필요 했었나 봐\n[00:24.44]편의점 앞에서 술을 조금 마셨어\n[00:32.90]정말 조금 인데도\n[00:36.07]세상이 흐려지는 게\n[00:39.13]좀 취한 것 같아 나\n[00:45.11]시계를 잃어 버렸나 봐\n[00:52.24]한쪽 팔이 허전해\n[00:55.87]바라보다 알았어\n[01:00.82]시계 탓도 아니고 내 팔 위에 있던\n[01:06.30]네 손 하나 느낄 수 없단 걸\n[01:12.85]매일 가던 길인데\n[01:16.55]어떻게 이렇게 네가\n[01:21.44]좋아하는 게 많았는지\n[01:26.84]손에 잡히는 데로\n[01:29.79]술기운에 사긴 샀는데\n[01:33.96]넌 아직 그 곳에 사는지\n[01:40.33]문 열어봐 내가 여기 왔잖아\n[01:45.78]왜 몰라 네가 좋아하던 화분에\n[01:51.05]꽃도 조금 샀는데\n[01:54.14]이것 봐 네가 사준 셔츠에\n[01:59.72]네 향기 빼고 모든 게 돌아왔는데\n[02:05.39]너만 없네 문 열어봐\n[02:15.76]그리 쉬운 말인데 그 땐 왜 그렇게\n[02:22.56]사랑한단 말이 어려웠는지\n[02:29.19]우리 헤어진 후에\n[02:32.43]네 모습 보이지 않아도\n[02:36.49]넌 아직 내 맘에 사는 지\n[02:42.51]문 열어봐 내가 여기 왔잖아\n[02:48.25]왜 몰라 네가 좋아하던 화분에\n[02:53.60]꽃도 조금 샀는데\n[02:56.70]이것 봐 네가 사준 셔츠에\n[03:02.32]네 향기 빼고 모든 게 돌아왔는데\n[03:07.83]너만 없네 문 열어봐\n[03:12.72]불 켜진 네 방 창가에\n[03:16.58]흐릿하게 보여\n[03:19.64]이름을 불러보지만\n[03:24.56]내 목소리 닿을 것만 같아\n[03:27.90]내 마음도 닿을 것만 같아\n[03:32.34]제발 닫힌 이 문 좀 열어봐\n[03:38.45]내게 돌아와\n[03:44.57]문 열어봐 내가 여기 왔잖아\n[03:50.18]왜 몰라 네가 좋아하던 화분에\n[03:55.45]꽃도 조금 샀는데\n[03:58.58]이것 봐 네가 사준 셔츠에\n[04:04.12]네 향기 빼고 모든 게 돌아왔는데\n[04:09.72]너만 없네 문 열어봐\n[04:19.82]문 열어봐', '/song/艺声-문 열어봐 (Here I am).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (34, 7, '艺声-春天的阵雨 (Paper Umbrella)', '봄날의 소나기', '2018-12-30 10:37:22', '2018-12-30 10:37:22', '/img/songPic/Umbrella.jpg', '[00:00.00] 作曲 : 1601\n[00:00.789] 作词 : 徐智恩\n[00:02.367]编曲：1601\n[00:16.785]네가 떠난 그 순간\n[00:20.411]온 세상이 내게서 등을 돌리더라\n[00:27.508]미친 사람같이 보고 싶어 헤매이는데\n[00:35.684]너는 지금 어디니\n[00:42.177]서투르게 사랑한 것처럼\n[00:49.283]헤어짐까지 또 서툴러서 미안해\n[00:56.639]아무것도 모르고 널 보낸 나라서\n[01:03.491]온다 떨어진다\n[01:06.158]내 찢어진 하늘 사이로\n[01:10.546]한 방울 두 방울 봄날의 소나기\n[01:17.698]너를 그려보다 불러보다\n[01:21.775]기억이 비처럼 내린 새벽\n[01:26.358]밤새 난 그 빗속에\n[01:29.686]종이로 된 우산을 쓰고 있네\n[01:39.305]괜찮다곤 했지만\n[01:42.883]버텨낼 수 있을까\n[01:45.452]나도 모르겠어\n[01:49.940]네가 없는 이 거리\n[01:53.816]그럼에도 꽃은 피는데\n[01:58.000]하염없는 기다림\n[02:04.642]미련하게 사랑한 것처럼\n[02:11.744]헤어짐까지\n[02:14.410]또 미련해서 미안해\n[02:18.999]못해준 게\n[02:20.661]이렇게 발목을 잡는 걸\n[02:25.948]온다 떨어진다\n[02:28.465]내 찢어진 하늘 사이로\n[02:32.989]한 방울 두 방울\n[02:36.560]봄날의 소나기\n[02:40.188]너를 그려보다 불러보다\n[02:44.166]기억이 비처럼 내린 새벽\n[02:48.602]밤새 난 그 빗속에\n[02:52.178]널 보내던 그날과 같은 하루\n[02:57.372]온몸이 굳어버린 난\n[03:00.946]그때처럼\n[03:02.309]단 한 발도 움직일 수 없는데\n[03:12.430]간다 사라진다\n[03:15.105]내 흐려진 시선 너머로\n[03:19.540]한 방울 두 방울 그리고 여전히\n[03:26.702]슬피 떨어지던 꽃잎 위에\n[03:30.834]기억이 비처럼 내린 새벽\n[03:35.217]밤새 난 그 빗속에 종이로\n[03:39.452]된 우산을 쓰고 있네', '/song/艺声-春天的阵雨 (Paper Umbrella).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (35, 7, '艺声 + 灿烈-어떤 말로도 (Confession)', '봄날의 소나기', '2018-12-30 17:00:27', '2018-12-30 17:00:27', '/img/songPic/Confession.jpg', '[00:00.00] 作曲 : 艺声/BrotherSu\n[00:01.00] 作词 : 艺声/BrotherSu\n[00:08.89]생각나 잊을 수 없어 그 미소\n[00:13.32]난 말이야 온통 네 생각뿐인 걸\n[00:19.14]대체 무슨 마법을 건 거야\n[00:22.65]내 마음의 꽃이 피고 있는 걸\n[00:27.19]있잖아 들리니 내 심장소리\n[00:31.65]Only you 내 생애 가장 아름다운 별\n[00:37.68]너 하나로 빛나고 있는\n[00:40.84]이 세상 우리 함께라면\n[00:45.36]어떤 말로도 어떤 표현도\n[00:49.65]내 마음 다 전할 수 없지만 괜찮아\n[00:56.47]사랑이란 쉽지 만은 않을 거야\n[01:03.44]꽃을 들고서 다가가 볼까\n[01:07.97]허전한 네 손 꼭 잡으며\n[01:12.07]이렇게 용기를 내어 내 사랑을\n[01:20.62]고백하고 싶어\n[01:31.71]요즘 나 이유 없이 웃음이나\n[01:33.78]또 너의 꿈을 꾸는 것도 일상이야\n[01:36.49]처음 주고 받은 메시지\n[01:38.04]보고 또 다시 보는 것도\n[01:39.82]벌써 몇 번째인지\n[01:41.10]기분 좋은 향기 같은 너\n[01:42.88]조금씩 서로를 닮아가고 있는 걸\n[01:45.00]오늘은 손을 잡고 걷고 싶어\n[01:47.34]한발씩 가까워지는\n[01:48.59]하루 하루가 꿈만 같아\n[01:50.03]난 그냥 가만히 잘 있다가도\n[01:54.13]문득 떠오르는 네 생각에\n[01:56.35]자꾸 바보처럼 실없이 웃게 돼\n[01:59.69]날 바라보고 웃던 미소가 좋아\n[02:03.08]매일 볼 수 있다면\n[02:07.40]어떤 말로도 어떤 표현도\n[02:11.91]내 마음 다 전할 수 없지만 괜찮아\n[02:18.74]사랑이란 쉽지 만은 않을 거야\n[02:25.61]꽃을 들고서 다가가 볼까\n[02:30.25]허전한 네 손 꼭 잡으며\n[02:34.27]이렇게 용기를 내어 내 사랑을\n[02:42.87]고백하고 싶어\n[02:45.56]스쳐 지나간 흔한 인연이라 해도\n[02:54.34]난 평생 너를 잊지 못할 것 같은데\n[03:02.59]어떤 말로도 어떤 표현도\n[03:06.80]내 마음 다 전할 수 없지만 괜찮아\n[03:13.64]사랑이란 쉽지 만은 않더라도\n[03:20.57]꽃을 들고서 다가가 볼게\n[03:25.16]허전한 네 손 꼭 잡으며\n[03:29.06]이렇게 용기를 내어 내 사랑을\n[03:37.67]고백하고 싶어', '/song/艺声 + 灿烈-어떤 말로도 (Confession).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (36, 8, 'Ennio Morricone-Once Upon a Time in the West', 'Once Upon a Time in the West', '2019-03-19 15:57:07', '2019-03-19 15:57:07', '/img/songPic/OnceUponaTimeintheWest.jpg', '[00:00:00]纯音乐', '/song/Ennio Morricone-Once Upon a Time in the West.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (37, 8, 'Ennio Morricone-Titoli', 'Per un Pugno di Dollari', '2019-03-19 15:50:47', '2019-03-19 15:50:47', '/img/songPic/Titoli.jpg', '[00:00:00]纯音乐', '/song/Ennio Morricone-Titoli.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (38, 9, '林俊杰-关键词', '和自己对话 From M.E. To Myself', '2019-03-19 13:38:54', '2019-03-19 13:38:54', '/img/songPic/guanjianci.jpg', '[00:00.000] 作曲 : 林俊杰\n[00:01.000] 作词 : 林怡凤\n[00:14.12]好好爱自己 就有人会爱你\n[00:17.43]这乐观的说词\n[00:21.05]幸福的样子 我感觉好真实\n[00:24.31]找不到形容词\n[00:27.72]沉默在掩饰 快泛滥的激情\n[00:31.43]只剩下语助词\n[00:35.05]有一种踏实 当你口中喊我名字\n[00:40.49]落叶的位置 谱出一首诗\n[00:47.67]时间在消逝 我们的故事开始\n[00:54.34]这是第一次\n[00:58.13]让我见识爱情 可以慷慨又自私\n[01:04.67]你是我的关键词\n[01:10.22]\n[01:21.26]我不太确定 爱最好的方式\n[01:24.45]是动词或名词\n[01:28.09]很想告诉你 最赤裸的感情\n[01:31.46]却又忘词\n[01:35.35]聚散总有时 而哭笑也有时\n[01:38.49]我不怕潜台词\n[01:41.55]有一种踏实 是你心中有我名字\n[01:47.63]落叶的位置 谱出一首诗\n[01:54.41]时间在消逝 我们的故事开始\n[02:01.62]这是第一次\n[02:05.35]让我见识爱情 可以慷慨又自私\n[02:11.86]你是我的关键词\n[02:17.66]你藏在歌词\n[02:20.94]代表的意思\n[02:24.50]是专有名词\n[02:30.18]落叶的位置\n[02:33.55]谱出一首诗\n[02:37.05]我们的故事\n[02:40.51]才正要开始\n[02:44.35]这是第一次\n[02:47.33]爱一个人爱得如此慷慨又自私\n[02:54.33]你是我的关键词', '/song/林俊杰-关键词.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (39, 9, '林俊杰-期待爱', 'JJ陆', '2019-03-19 13:44:19', '2019-04-24 22:35:28', '/img/songPic/guanjianci.jpg', '[00:33.790]My Life 一直在等待\n[00:38.790]空荡的口袋\n[00:41.490]想在里面放 一份爱\n[00:45.860]Why 总是被打败\n[00:49.850]真的好无奈\n[00:53.760]其实我 实实在在\n[00:55.750]不管帅不帅\n[01:00.030]想要找回来 自己的节拍\n[01:05.380]所以这一次\n[01:08.130]我要勇敢 大声说出来\n[01:13.220]\n[01:13.680]期待 期待你发现我的爱\n[01:18.790]无所不在 我自然而然的关怀\n[01:24.230]你的存在 心灵感应的方向\n[01:29.570]我一眼就看出来\n[01:33.780]是因为爱\n[01:36.160]我猜 你早已发现我的爱\n[01:41.080]绕几个弯 越靠近越明白\n[01:46.850]不要走开\n[01:49.580]幸福的开始 就是放手去爱\n[02:22.620]想要找回来 自己的节拍\n[02:27.790]所以这一次\n[02:30.700]我要勇敢 大声说出来\n[02:36.420]\n[02:37.030]期待 期待你发现我的爱\n[02:41.920]无所不在 我自然而然的关怀\n[02:47.510]你的存在 心灵感应的方向\n[02:52.870]我一眼就看出来\n[02:57.080]是因为爱\n[02:59.520]我猜 你早已发现我的爱\n[03:04.380]绕几个弯 越靠近越明白\n[03:09.930]不要走开\n[03:12.580]幸福的开始 就是放手去爱\n[03:21.140]\n[03:22.020]幸福的开始 就是放手去爱', '/song/林俊杰-期待爱.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (40, 10, '王力宏-需要人陪', '十八般武艺', '2019-03-19 13:52:02', '2019-03-19 13:52:02', '/img/songPic/xuyaorenpei.jpg', '[00:00.000] 作曲 : 王力宏\n[00:01.000] 作词 : 王力宏\n[00:12.330]打开窗户让孤单透气\n[00:17.130]这一间屋子 如此密闭\n[00:23.970]欢呼声仍飘在空气里\n[00:28.950]像空无一人一样华丽\n[00:33.780]\n[00:35.190]我 渐渐失去知觉\n[00:40.860]就当做是种自我逃避\n[00:47.170]你 飞到天的边缘\n[00:52.540]我也不猜落在何地\n[00:57.230]\n[00:58.020]一个我 需要梦想 需要方向 需要眼泪\n[01:03.850]更需要 一个人来 点亮天的黑\n[01:09.830]我已经 无能为力 无法抗拒 无路可退\n[01:16.000]这无声的夜 现在的我 需要人陪\n[01:25.300]\n[01:34.990]闭上眼睛 就看不清\n[01:39.909]这双人床 欠缺的 温馨\n[01:46.960]谁能 陪我 直到天明\n[01:52.080]穿透这片 迷蒙寂静\n[01:56.830]\n[01:57.909]我 渐渐失去知觉\n[02:03.640]就当做是种自我逃避\n[02:09.909]你 飞到天的边缘\n[02:15.740]我已不猜落在何地\n[02:20.200]\n[02:20.840]一个我 需要梦想 需要方向 需要眼泪\n[02:26.800]更需要 一个人来 点亮天的黑\n[02:32.600]我已经 无能为力 无法抗拒 无路可退\n[02:38.970]这无声的夜 现在的我 需要人陪\n[02:47.890]\n[03:08.230]一个我 需要梦想 需要方向 需要眼泪\n[03:14.000]更需要 一个人来 点亮天的黑\n[03:20.010]我已经 无能为力 无法抗拒 无路可退\n[03:26.360]这无声的夜 现在的我 需要人陪\n[03:36.240]', '/song/王力宏-需要人陪.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (41, 11, 'Eminem-Love The Way You Lie', 'Life After Recovery', '2019-03-19 15:30:21', '2019-03-19 15:30:21', '/img/songPic/LoveTheWayYouLie.jpg', '[00:00.000] 作曲 : Marshall Mathers/Alexander Grant/Holly Hafermann\n[00:00.100] 作词 : Marshall Mathers/Alexander Grant/Holly Hafermann\n[00:00.300]Just gonna stand there and watch me burn\n[00:05.350]But that\'s alright because I like the way it hurts\n[00:11.230]Just gonna stand there and hear me cry\n[00:16.260]But that\'s alright because I love the way you lie, I love the way you lie\n[00:25.130]I can\'t tell you what it really is\n[00:26.890]I can only tell you what it feels like\n[00:28.930]And right now there\'s a steel knife in my windpipe\n[00:31.550]I can\'t breathe but I still fight while I can fight\n[00:34.440]As long as the wrong feels right it\'s like I\'m in flight\n[00:37.440]High off the love, drunk from my hate,\n[00:39.220]It\'s like I\'m huffing paint and I love her the more i suffer, I suffocate\n[00:42.770]And right before I\'m about to drown, she resuscitates me\n[00:46.000]She ****ing hates me and I love it.\n[00:47.850]Wait! Where you going? I\'m leaving you\n[00:50.260]No you ain\'t. Come back we\'re running right back.\n[00:52.850]Here we go again\n[00:53.790]It\'s so insane cus when its going good its going great.\n[00:56.530]I\'m superman with the wind at his back\n[00:58.490]Shes Louis Lane but when its bad its awful, I feel so ashamed I snap\n[01:02.640]Whos that dude? I don\'t even know his name\n[01:04.800]I laid hands on him, I\'ll never stoop so low again\n[01:07.500]I guess I don\'t know my own strength\n[01:09.490]Just gonna stand there and watch me burn\n[01:14.200]But that\'s alright because I like the way it hurts\n[01:20.500]Just gonna stand there and hear me cry\n[01:25.290]But that\'s alright because I love the way you lie, I love the way you lie\n[01:42.800]You ever love somebody so much you can barely breathe\n[01:45.320]When you\'re with \'em\n[01:46.050]You meet and neither one of you even know what hit \'em\n[01:48.540]Got that warm fuzzy feeling\n[01:50.090]Yeah, them those chills you used to get \'em\n[01:51.360]Now you\'re getting ****ing sick of looking at him\n[01:53.730]You swore you\'d never hit him; never do nothing to hurt him\n[01:56.370]Now you\'re in each other\'s face spewing venom in your words when you spit them\n[02:00.000]You push pull each other\'s hair, scratch claw hit him\n[02:02.440]Throw him down pin him\n[02:03.370]So lost in the moments when you\'re in them\n[02:05.260]It\'s a race that\'s the culprit controls your boat\n[02:07.580]So they say you\'re best to go your separate ways\n[02:09.730]Guess if they don\'t know you cus today that was yesterday\n[02:12.320]Yesterday is over it\'s a different day\n[02:14.430]Sound like broken records playing over but you promised her\n[02:17.180]Next time you show restraint\n[02:18.740]You don\'t get another chance\n[02:19.920]Life is no Nintendo game\n[02:21.450]But you lied again\n[02:22.430]Now you get to watch her leave out the window\n[02:24.500]I guess that\'s why they call it window pain\n[02:26.650]Just gonna stand there and watch me burn\n[02:31.440]But that\'s alright because I like the way it hurts\n[02:37.690]Just gonna stand there and hear me cry\n[02:42.520]But that\'s alright because I love the way you lie, I love the way you lie\n[03:00.130]Now I know he said things hit things that we didn\'t mean\n[03:03.150]And we fall back into the same patterns same routine\n[03:06.420]But your temper\'s just as bad as mine is\n[03:07.940]You\'re the same as me\n[03:09.000]But when it comes to love you\'re just as blinded\n[03:11.020]Baby, please come back\n[03:12.270]It wasn\'t you, baby it was me\n[03:14.110]Maybe our relationship wasn\'t as crazy as it seemed\n[03:16.820]Maybe that\'s what happens when a tornado meets a volcano\n[03:19.910]All I know is I love you too much to walk away though\n[03:22.910]Come inside, pick up your bags off the sidewalk\n[03:25.500]Don\'t you hear sincerity in my voice when I talk\n[03:28.180]I told you this is my fault\n[03:29.470]Look me in the eye ball\n[03:30.880]Next time I\'m pissed, I lay my fist at the drywall\n[03:33.780]Next time. There won\'t be no next time\n[03:35.850]I apologize even though I know its lies\n[03:38.580]I\'m tired of the games I just want her back\n[03:40.710]I know I\'m a liar\n[03:41.830]If she ever tries to ****ing leave again\n[03:43.780]Im\'a tie her to the bed and set this house on fire\n[03:46.510]Just gonna stand there and watch me burn\n[03:51.600]But that\'s alright because I like the way it hurts\n[03:57.520]Just gonna stand there and hear me cry\n[04:02.690]But that\'s alright because I love the way you lie, I love the way you lie\n[04:13.670]I love the way you lie', '/song/Eminem-Love The Way You Lie.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (42, 27, 'Álvaro Soler-Sofía', 'Sofía', '2019-06-02 23:32:39', '2019-06-02 23:32:39', '/img/songPic/1382086122014772.jpg', '[00:00:00]暂无歌词', '/song/Álvaro Soler-Sofía.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (43, 27, 'Álvaro Soler-El Mismo Sol', 'El Mismo Sol', '2019-06-02 23:34:12', '2019-06-02 23:34:12', '/img/songPic/1382086122014772.jpg', '[00:00:00]暂无歌词', '/song/Álvaro Soler-El Mismo Sol.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (44, 8, 'Ennio Morricone-Il Buono Il Cattivo Il Brutto', 'The Good, the Bad and the Ugly', '2019-03-19 16:04:25', '2019-03-19 16:04:25', '/img/songPic/IlBuonoIlCattivoIlBrutto.jpg', '[00:00:00]纯音乐', '/song/Ennio Morricone-Il Buono, Il Cattivo, Il Brutto.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (45, 13, '田馥甄-魔鬼中的天使', 'My Love', '2019-04-25 20:13:09', '2019-06-02 18:07:49', '/img/songPic/moguizhongdetianshi.jpg', '[00:00.00] 暂无歌词', '/song/田馥甄-魔鬼中的天使.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (46, 12, '李荣浩 - 年少有为', '耳朵', '2019-06-02 18:39:02', '2019-06-02 18:39:02', '/img/songPic/lironghao.jpg', '[00:00.65]李荣浩 - 年少有为\n[00:02.38]作词：李荣浩\n[00:03.69]作曲：李荣浩\n[00:30.08]电视一直闪\n[00:33.74]联络方式都还没删\n[00:37.23]你待我的好\n[00:40.62]我却错手毁掉\n[00:44.63]也曾一起想\n[00:47.93]有个地方睡觉吃饭\n[00:51.78]可怎么去熬日夜颠倒\n[00:55.45]连头款也凑不到\n[00:59.29]墙板 被我砸烂\n[01:02.77]到现在还没修\n[01:06.07]一碗热的粥 你怕我没够\n[01:10.03]都留一半带走\n[01:12.85]给你形容美好\n[01:16.14]今后你常常眼睛会红\n[01:20.66]原来心疼我 我那时候不懂\n[01:27.39]假如我年少有为不自卑\n[01:31.93]懂得什么是珍贵\n[01:34.31]那些美梦\n[01:37.85]没给你 我一生有愧\n[01:41.90]假如我年少有为 知进退\n[01:46.33]才不会让你替我受罪\n[01:50.17]婚礼上 多喝几杯\n[01:53.47]和你现在那位\n[02:26.42]也曾一起想\n[02:30.07]有个地方睡觉吃饭\n[02:33.56]可怎么去熬日夜颠倒\n[02:37.06]连头款也凑不到\n[02:41.07]墙板 被我砸烂\n[02:44.61]到现在还没修\n[02:47.80]一碗热的粥 你怕我没够\n[02:51.79]都留一半带走\n[02:54.78]给你形容美好\n[02:57.87]今后你常常眼睛会红\n[03:02.37]原来心疼我 我那时候不懂\n[03:09.34]假如我年少有为不自卑\n[03:13.64]懂得什么是珍贵\n[03:16.13]那些美梦\n[03:19.68]没给你 我一生有愧\n[03:23.79]假如我年少有为 知进退\n[03:28.19]才不会让你替我受罪\n[03:31.95]婚礼上 多喝几杯\n[03:35.20]和你现在那位\n[03:42.09]假如我年少有为不自卑\n[03:46.31]尝过后悔的滋味\n[03:48.93]金钱地位\n[03:52.47]搏到了却好想退回\n[03:56.38]假如我年少有为 知进退\n[04:00.89]才不会让你替我受罪\n[04:04.74]婚礼上 多喝几杯\n[04:08.03]和你现在那位\n[04:15.52]在婚礼上 多喝几杯\n[04:18.81]祝我年少有为\n[04:26.36]制作人：李荣浩\n[04:27.08]编曲：李荣浩\n[04:27.28]吉他：李荣浩\n[04:27.48]贝斯：李荣浩\n[04:27.63]鼓：Alex\n[04:27.74]和声编写：李荣浩\n[04:28.04]和声：李荣浩\n[04:28.24]弦乐编写：李荣浩\n[04:28.50]弦乐：国际首席爱乐乐团\n[04:28.85]录音师：李荣浩\n[04:29.06]混音师：李荣浩\n[04:29.31]录音室：北京一样音乐录音室\n[04:29.77]混音室：北京一样音乐录音室\n[04:30.17]母带后期制作人：李荣浩\n[04:30.53]母带后期处理工程师：周天澈TC Z.\n[04:31.03]母带后期处理录音室：TC Faders', '/song/李荣浩-年少有为.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (47, 10, '王力宏-大城小爱', '盖世英雄', '2019-06-02 18:41:59', '2019-06-02 18:41:59', '/img/songPic/dachengxiaoai.jpg', '[00:00.60]王力宏 - 大城小爱\n[00:01.60]词：王力宏/陈镇川/K. Tee\n[00:02.60]曲：王力宏\n[00:14.46]乌黑的发尾 盘成一个圈\n[00:17.71]缠绕所有对你的眷恋\n[00:21.56]隔着半透明门帘\n[00:23.16]嘴里说的语言\n[00:25.71]完全没有欺骗\n[00:28.44]屋顶灰色瓦片 安静的画面\n[00:32.29]灯火是你美丽那张脸\n[00:36.00]终于找到所有流浪的终点\n[00:40.10]你的微笑结束了疲倦\n[00:45.26]千万不要说天长地久\n[00:48.91]免的你觉得我不切实际\n[00:52.65]想多么简单就多么简单\n[00:56.45]是妈妈告诉我的哲理\n[00:59.41]脑袋都是你 心里都是你\n[01:03.11]小小的爱在大城里好甜蜜\n[01:06.67]念的都是你 全部都是你\n[01:10.38]小小的爱在大城里\n[01:12.18]只为你倾心\n[01:16.46]乌黑的发尾 盘成一个圈\n[01:19.72]缠绕所有对你的眷恋\n[01:23.58]终于找到所有流浪的终点\n[01:27.54]你的微笑结束了疲倦\n[01:30.97]千万不要说天长地久\n[01:34.51]免的你觉得我不切实际\n[01:38.13]想多么简单就多么简单\n[01:42.09]让我大声的对你说\n[01:44.57]I\'m thinking of you\n[01:48.69]脑袋都是你 心里都是你\n[01:52.39]小小的爱在大城里好甜蜜\n[01:56.00]念的都是你 全部都是你\n[01:59.65]小小的爱在大城里\n[02:01.50]只为你倾心\n[02:04.25]那回城的票根 你留做纪念\n[02:07.75]不必害怕面对离别\n[02:11.53]剪掉一丝头发\n[02:13.18]让我放在胸前\n[02:15.08]走到那里都有你陪\n[02:18.34]相随 yah\n[02:21.54]脑袋都是你 心里都是你\n[02:25.25]小小的爱在大城里好甜蜜\n[02:28.80]念的都是你 全部都是你\n[02:32.51]小小的爱在大城里\n[02:34.36]只为你倾心\n[02:36.11]脑袋都是你 心里都是你\n[02:39.82]小小的爱在大城里好甜蜜\n[02:43.42]念的都是你 全部都是你\n[02:47.08]小小的爱在大城里\n[02:48.98]只为你倾心\n[02:51.01]啦啦啦啦啦 啦啦啦啦啦\n[02:54.39]啦啦啦啦啦啦啦啦啦啦啦\n[02:58.03]啦啦啦啦啦 啦啦啦啦啦\n[03:01.79]啦啦啦啦啦啦啦啦啦啦\n[03:04.00]啦啦啦\n[03:05.53]啦啦啦啦啦 啦啦啦啦啦\n[03:09.03]啦啦啦啦啦啦啦啦啦啦啦\n[03:12.74]啦啦啦啦啦 啦啦啦啦啦\n[03:16.34]啦啦啦啦啦啦啦啦啦啦啦啦\n[03:22.31]乌黑的发尾盘成一个圈\n[03:25.72]缠绕所有对你的眷恋\n[03:29.35]那一种寸步不离的感觉\n[03:33.46]我知道就叫做永远', '/song/王力宏-大城小爱.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (48, 4, '陈奕迅-陪你度过漫长岁月', '陪你度过漫长岁月', '2019-06-02 18:48:29', '2019-06-02 18:48:29', '/img/songPic/qW4N08_Q8PSePV7iewwvHg==_34381728607582.jpg', '[00:00.01]陈奕迅 - 陪你度过漫长岁月(电影《陪安东尼度过漫长岁月》主题曲)\n[00:04.89]作词：葛大为\n[00:05.79]作曲：黎晓阳、谢国维\n[00:07.34]编曲：C. Y. Kong\n[00:08.36]监制：思歪江、C. Y. Kong\n[00:10.68]走过了人来人往\n[00:15.53]不喜欢也得欣赏\n[00:20.29]我是沉默的存在\n[00:25.19]不当你的世界\n[00:27.39]只作你肩膀\n[00:30.05]拒绝成长到成长\n[00:34.62]变成想要的模样\n[00:39.53]在举手投降以前\n[00:42.98]让我再陪你一段\n[00:49.06]陪你把沿路感想 活出了答案\n[00:54.00]陪你把独自孤单 变成了勇敢\n[00:59.23]一次次失去又重来 我没离开\n[01:04.18]陪伴是 最长情的告白\n[01:08.49]陪你把想念的酸 拥抱成温暖\n[01:13.09]陪你把彷徨 写出情节来\n[01:18.34]未来多漫长 再漫长 还有期待\n[01:23.29]陪伴你 一直到 故事给说完\n[01:46.92]让我们静静分享\n[01:51.52]此刻难得的坦白\n[01:56.33]只是无声地交谈\n[01:59.73]都感觉幸福 感觉不孤单\n[02:05.88]陪你把沿路感想 活出了答案\n[02:10.79]陪你把独自孤单 变成了勇敢\n[02:16.05]一次次失去 又重来 我没离开\n[02:20.71]陪伴是 最长情的告白\n[02:25.16]陪你把想念的酸 拥抱成温暖\n[02:29.87]陪你把彷徨 写出情节来\n[02:35.18]未来多漫长 再漫长 还有期待\n[02:39.93]陪伴你 一直到 故事给说完\n[03:03.64]陪你把沿路感想 活出了答案\n[03:08.29]陪你把独自孤单 变成了勇敢\n[03:13.53]一次次失去 又重来 我没离开\n[03:18.45]陪伴是 最长情的告白\n[03:22.75]陪你把想念的酸 拥抱成温暖\n[03:27.77]陪你把彷徨 写出情节来\n[03:32.75]未来多漫长 再漫长 还有期待\n[03:37.51]陪伴你 一直到 这故事说完', '/song/陈奕迅-陪你度过漫长岁月.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (49, 16, '华晨宇 + 杨宗纬-国王与乞丐', '国王与乞丐', '2019-06-02 18:49:50', '2019-06-02 18:49:50', '/img/songPic/109951163077613693.jpg', '[00:00.93]华晨宇 - 国王与乞丐\n[00:02.63]词：代岳东\n[00:03.53]曲：Mike Chan、Faizal Tahir\n[00:12.66]怎么了 怎么了\n[00:15.82]一份爱失去了光泽\n[00:18.97]面对面 背对背\n[00:22.38]反复挣扎怎么都痛\n[00:25.80]以为爱坚固像石头\n[00:28.85]谁知一秒钟就碎落\n[00:32.16]难道心痛都要不断打磨\n[00:38.06]抱紧你的我比国王富有\n[00:45.33]曾多么快乐\n[00:50.99]失去你的我比乞丐落魄\n[00:58.39]痛多么深刻\n[01:05.17]当一切 结束了 安静了 过去了\n[01:11.62]为什么 还拥有 一万个 舍不得\n[01:20.33]喔 喔\n[01:30.81]谁又能感受\n[01:36.37]回忆里的我比国王富有\n[01:43.82]奢侈的快乐\n[01:49.49]失去你以后比乞丐落魄\n[01:59.95]心痛如刀割\n[02:07.26]怀念那时你安静陪着我\n[02:13.67]柔软时光里最美的挥霍\n[02:22.89]爱有多快乐\n[02:34.04]痛有多深刻', '/song/华晨宇 + 杨宗纬-国王与乞丐.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (50, 18, '李克勤-护花使者', '护花使者', '2019-06-02 18:51:19', '2019-06-02 18:51:19', '/img/songPic/109951163157531184.jpg', '[00:00.60]李克勤 - 护花使者\n[00:01.60]词：潘伟源\n[00:02.60]曲：长谷川集平\n[00:35.79]这晚在街中偶遇心中的她\n[00:38.37]两脚决定不听叫唤跟她归家\n[00:41.42]深宵的冷风 不准吹去她\n[00:44.48]她那幽幽眼神快要对我说话\n[00:47.67]纤纤身影飘飘身影默默转来吧\n[00:50.74]对我说浪漫情人爱我吗\n[00:53.98]贪心的晚风 竟敢拥吻她\n[00:56.97]将她秀发温温柔柔每缕每缕放下\n[01:00.14]卑污的晚风 不应抚慰她\n[01:03.23]我已决意一生护着心中的她\n[01:28.12]这晚在街中偶遇心中的她\n[01:31.34]两脚决定不听叫唤跟她归家\n[01:34.49]深宵的冷风 不准吹去她\n[01:37.58]她那幽幽眼神快要对我说话\n[01:40.77]纤纤身影飘飘身影默默转来吧\n[01:43.66]对我说浪漫情人爱我吗\n[01:46.53]贪心的晚风 竟敢拥吻她\n[01:49.58]将她秀发温温柔柔每缕每缕放下\n[01:52.77]卑污的晚风 不应抚慰她\n[01:55.80]我已决意一生护着心中的她\n[02:20.79]这晚在街中偶遇心中的她\n[02:23.91]两脚决定不听叫唤跟她归家\n[02:27.05]深宵的冷风 不准吹去她\n[02:30.16]她那幽幽眼神快要对我说话\n[02:33.32]纤纤身影飘飘身影默默转来吧\n[02:36.42]对我说浪漫情人爱我吗\n[02:39.57]贪心的晚风 竟敢拥吻她\n[02:42.63]将她秀发温温柔柔每缕每缕放下\n[02:45.88]卑污的晚风 不应抚慰她\n[02:48.85]我已决意一生护着心中的她', '/song/李克勤-护花使者.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (51, 18, '李克勤-月半小夜曲', '经典金曲', '2019-06-02 19:16:24', '2019-06-02 19:16:24', '/img/songPic/19196373509550737.jpg', '[00:00.35]李克勤 - 月半小夜曲\n[00:00.20]词：向雪怀\n[00:00.30]曲：河合奈保子\n[00:24.76]仍然倚在失眠夜 望天边星宿\n[00:30.68]仍然听见小提琴 如泣似诉再挑逗\n[00:36.46]为何只剩一弯月 留在我的天空\n[00:43.28]这晚以后音讯隔绝\n[00:48.62]人如天上的明月 是不可拥有\n[00:54.51]情如曲过只遗留 无可挽救再分别\n[01:00.45]为何只是失望 填密我的空虚\n[01:07.16]这晚夜 没有吻别\n[01:12.49]仍在说永久 想不到是借口\n[01:18.56]从未意会要分手\n[01:27.38]但我的心每分每刻 仍然被她占有\n[01:34.29]她似这月儿 仍然是不开口\n[01:39.46]提琴独奏独奏着 明月半倚深秋\n[01:45.81]我的牵挂 我的渴望 直至以后\n[02:21.45]仍然倚在失眠夜 望天边星宿\n[02:27.34]仍然听见小提琴 如泣似诉再挑逗\n[02:33.24]为何只剩一弯月 留在我的天空\n[02:39.91]这晚以后音讯隔绝\n[02:45.27]人如天上的明月 是不可拥有\n[02:51.29]情如曲过只遗留 无可挽救再分别\n[02:57.16]为何只是失望 填密我的空虚\n[03:03.90]这晚夜没有吻别\n[03:09.14]仍在说永久 想不到是借口\n[03:15.45]从未意会要分手\n[03:24.17]但我的心每分每刻 仍然被她占有\n[03:31.16]她似这月儿 仍然是不开口\n[03:36.16]提琴独奏独奏着 明月半倚深秋\n[03:42.75]我的牵挂 我的渴望 直至以后\n[03:48.10]仍在说永久 想不到是借口\n[03:54.38]从未意会要分手\n[04:03.03]但我的心每分每刻 仍然被她占有\n[04:10.11]她似这月儿 仍然是不开口\n[04:15.10]提琴独奏独奏着 明月半倚深秋\n[04:21.62]我的牵挂 我的渴望 直至以后', '/song/李克勤-月半小夜曲.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (52, 18, '李克勤-K歌之王', '经典金曲', '2019-06-02 19:17:33', '2019-06-02 19:17:33', '/img/songPic/796046418510127.jpg', '[00:00:00]暂无歌词', '/song/李克勤-K歌之王.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (53, 12, '李荣浩-李白', '模特', '2019-06-02 19:19:44', '2019-06-02 19:19:44', '/img/songPic/109951163187393370.jpg', '[00:00.10]李荣浩 - 李白\n[00:00.66]词：李荣浩\n[00:00.83]曲：李荣浩\n[00:01.01]编曲：李荣浩\n[00:18.09]大部分人让我学习去看\n[00:20.95]世俗的眼光\n[00:26.22]我认真学习了世俗眼光\n[00:29.26]世俗到天亮\n[00:34.28]一部外国电影没听懂一句话\n[00:38.27]看完结局才是笑话\n[00:42.48]你看我多乖多聪明多么听话\n[00:45.98]多奸诈\n[00:51.31]喝了几大碗米酒再离开是为了模仿\n[00:59.66]一出门不小心吐的那幅是谁的书画\n[01:07.54]你一天一口一个 亲爱的对方\n[01:11.57]多么不流行的模样\n[01:15.78]都应该练练书法再出门闯荡\n[01:19.43]才会有人热情买账\n[01:23.36]要是能重来 我要选李白\n[01:27.40]几百年前做的好坏\n[01:30.09]没那么多人猜\n[01:31.90]要是能重来 我要选李白\n[01:35.64]至少我还能写写诗来澎湃\n[01:38.62]逗逗女孩\n[01:40.28]要是能重来 我要选李白\n[01:44.03]创作也能到那么高端\n[01:46.82]被那么多人崇拜\n[01:51.47]要是能重来\n[01:53.99]喝了几大碗米酒再离开是为了模仿\n[02:02.24]一出门不小心吐的那幅是谁的书画\n[02:10.00]你一天一口一个 亲爱的对方\n[02:14.21]多么不流行的模样\n[02:18.43]都应该练练书法再出门闯荡\n[02:22.00]才会有人热情买账\n[02:25.97]要是能重来 我要选李白\n[02:29.94]几百年前做的好坏\n[02:32.64]没那么多人猜\n[02:34.25]要是能重来 我要选李白\n[02:38.24]至少我还能写写诗来澎湃\n[02:41.23]逗逗女孩\n[02:42.85]要是能重来 我要选李白\n[02:46.54]创作也能到那么高端\n[02:49.38]被那么多人崇拜\n[02:54.07]要是能重来\n[03:28.64]要是能重来 我要选李白\n[03:32.52]几百年前做的好坏 没那么多人猜\n[03:36.82]要是能重来 我要选李白\n[03:40.79]至少我还能写写诗来澎湃\n[03:43.76]逗逗女孩\n[03:45.25]要是能重来 我要选李白\n[03:49.11]创作也能到那么高端\n[03:51.89]被那么多人崇拜\n[03:56.72]要是能重来', '/song/李荣浩-李白.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (54, 12, '李荣浩-作曲家', '李荣浩', '2019-06-02 19:21:29', '2019-06-02 19:21:29', '/img/songPic/3243559303261105.jpg', '[00:00.60]李荣浩 - 作曲家\n[00:01.60]词：李荣浩\n[00:02.60]曲：李荣浩\n[00:09.98]又很久没见\n[00:11.63]你剪了长发\n[00:14.44]谈怎么说话\n[00:16.09]谈怎么启发\n[00:19.26]怕歌词写的肉麻\n[00:22.11]怕浮夸\n[00:28.24]放一盘磁带\n[00:29.90]七八十年代\n[00:32.75]才听了一半\n[00:34.40]就悲伤起来\n[00:37.52]每一句里的感慨\n[00:40.22]都是现在\n[00:44.98]作曲家\n[00:48.68]写一首我们一生最平凡的歌\n[00:53.99]作曲家\n[00:57.85]告诉你爱的人你多真多深刻\n[01:03.27]作曲家\n[01:06.93]我还是你多年未见的老友啊\n[01:13.00]而你还是不太明白\n[01:16.22]孤独是个节拍\n[01:27.71]音符不会写\n[01:29.26]写歌是感觉\n[01:32.17]看几眼世界\n[01:33.82]多几个头衔\n[01:36.91]理论书上的观点\n[01:39.86]有缺陷\n[01:45.96]颁一个奖牌\n[01:47.56]说一段对白\n[01:50.35]不谈情说爱\n[01:52.10]也尽量精彩\n[01:55.33]没几个人生下来\n[01:57.83]不是天才\n[02:02.51]作曲家\n[02:06.41]写一首我们一生最平凡的歌\n[02:11.88]作曲家\n[02:15.54]告诉你爱的人你多真多深刻\n[02:20.98]作曲家\n[02:24.63]我还是你多年未见的老友啊\n[02:30.74]而你还是不太明白\n[02:33.97]孤独是个节拍\n[02:45.66]是个节拍\n[02:52.87]作曲家\n[02:56.58]写一首我们一生最平凡的歌\n[03:02.20]作曲家\n[03:05.80]告诉你爱的人你多真多深刻\n[03:11.37]作曲家\n[03:14.87]我还是你多年未见的老友啊\n[03:21.05]而你还是不太明白\n[03:24.20]孤独是个节拍', '/song/李荣浩-作曲家.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (55, 16, '杨宗纬-多余', '昨天今天明天', '2019-06-01 19:45:59', '2019-06-02 18:07:41', '/img/songPic/109951163167487498.jpg', '[00:00.00] 暂无歌词', '/song/杨宗纬-多余.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (56, 23, '毛不易-那时的我们', '那时的我们', '2019-06-02 19:23:46', '2019-06-02 19:23:46', '/img/songPic/109951163681898984.jpg', '[00:00.29]毛不易 - 那时的我们\n[00:01.91]作词：毛不易\n[00:02.87]作曲：毛不易\n[00:03.88]制作人：谭伊哲\n[00:04.95]编曲：黄竣琮、TYZ\n[00:06.51]混音：刘天鸿\n[00:07.47]吉他：黄竣琮\n[00:08.48]鼓：陈志昆\n[00:09.24]贝斯：王瀚一\n[00:10.25]和声：梁古驰\n[00:17.05]透过这时光向后望\n[00:20.49]来时的脚印是什么形状\n[00:24.19]歪歪扭扭却三三两两\n[00:27.68]是你啊一直在我身旁\n[00:31.68]久违的旋律轻轻淌\n[00:35.37]顺着回忆的方向\n[00:39.17]流光溢彩的小世界\n[00:42.50]是不是也别来无恙\n[00:47.44]敲下回忆的空白键\n[00:50.37]一起回到相遇那天\n[00:53.68]好像青春的誓言\n[00:56.10]从来都不曾飘远\n[01:01.67]那时我们有一双翅膀\n[01:05.42]飞过高山海洋\n[01:08.81]那时我们指尖有星光\n[01:12.81]照亮彼此的前方\n[01:16.21]就像年轻的水手要去远航\n[01:20.36]在风雨里成长\n[01:23.75]那些有你陪伴的时光\n[01:28.46]依然藏在手掌\n[01:47.31]敲下回忆的空白键\n[01:50.40]一起回到相遇那天\n[01:53.80]一串节奏\n[01:55.11]将我们的心跳紧紧相连\n[02:01.64]那时我们有一双翅膀\n[02:05.49]飞过高山海洋\n[02:08.78]那时我们指尖有星光\n[02:12.97]照亮彼此的前方\n[02:16.26]就像年轻的水手要去远航\n[02:20.31]在风雨里成长\n[02:23.79]那些有你陪伴的时光\n[02:28.54]依然藏在手掌\n[02:31.64]今天我们有一双翅膀\n[02:35.44]飞过高山海洋\n[02:38.84]今天我们指尖有星光\n[02:43.04]照亮彼此的前方\n[02:46.28]放下故作成熟的模样\n[02:50.28]穿上最爱的衣裳\n[02:53.72]回到青春的舞台亮起灯光\n[02:57.87]重新闪亮登场\n[03:01.57]那个青春的舞台亮着灯光\n[03:05.63]你和我闪亮登场', '/song/毛不易-那时的我们.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (57, 23, '毛不易-无问', '无问', '2019-06-02 19:24:40', '2019-06-02 19:24:40', '/img/songPic/109951163099854364.jpg', '[00:01.25]毛不易 - 无问(电影《无问西东》宣传曲)\n[00:04.20]作词：毛不易\n[00:05.11]作曲：毛不易\n[00:06.59]编曲：刘卓\n[00:07.19]制作人：刘卓\n[00:08.00]混音：周天澈\n[00:08.66]配唱制作人：刘芳\n[00:09.58]弦乐编写：靳锐\n[00:10.34]弦乐录音：国际首席爱乐乐团首席李朋\n[00:19.73]你问风为什么托着候鸟飞翔\n[00:25.26]却又吹的让他慌张\n[00:29.57]你问雨为什么滋养万物生长\n[00:35.10]却也湿透他的衣裳\n[00:39.69]你问他为什么亲吻他的伤疤\n[00:45.21]却又不能带他回家\n[00:50.44]你问我为什么还是不敢放下\n[00:55.16]明知听不到回答\n[00:59.88]如果光已忘了要将前方照亮\n[01:05.22]你会握着我的手吗\n[01:10.09]如果路会通往不知名的地方\n[01:15.21]你会跟我一起走吗\n[01:19.75]一生太短一瞬好长\n[01:24.53]我们哭着醒来\n[01:27.80]又哭着遗忘\n[01:30.18]幸好啊\n[01:32.53]你的手曾落在我肩膀\n[01:39.45]就像空中漂浮的\n[01:42.10]渺小的某颗尘土\n[01:49.81]它到底为什么\n[01:52.52]为什么不肯停驻\n[02:00.14]直到乌云散去\n[02:06.57]风雨落幕\n[02:10.42]他会带你找到\n[02:14.69]光的来处\n[02:19.53]就像手边落满了\n[02:22.12]灰尘的某一本书\n[02:30.05]它可曾单薄地\n[02:32.39]承载了谁的酸楚\n[02:40.29]尽管岁月无声\n[02:46.65]流向迟暮\n[02:50.37]他会让你想起\n[02:54.44]你的归途\n[03:44.98]如果光已忘了要将前方照亮\n[03:50.71]你会握着我的手吗\n[03:55.92]如果路会通往不知名的地方\n[04:01.52]你会跟我一起走吗', '/song/毛不易-无问.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (58, 19, '张碧晨-一吻之间', '一吻之间', '2019-06-01 20:15:19', '2019-06-02 18:07:27', '/img/songPic/3244658814415290.jpg', '[00:00.00] 暂无歌词', '/song/张碧晨-一吻之间.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (59, 19, '张碧晨-下一秒', '微微一笑很倾城', '2019-06-02 19:27:48', '2019-06-02 19:27:48', '/img/songPic/1369991503018202.jpg', '[00:00.37]张碧晨 - 下一秒\n[00:02.24]作词：汪苏泷\n[00:06.47]作曲：汪苏泷\n[00:13.22]好想能看到\n[00:16.20]你嘴角微笑\n[00:19.03]最好在下一秒\n[00:25.30]好想能听到\n[00:28.43]你轻声歌唱\n[00:31.42]最好在下一秒\n[00:37.64]纯白棒球帽\n[00:40.63]墨绿色衣角\n[00:43.76]时间静止的美好\n[00:49.98]默契发生在每个下一秒\n[00:56.00]爱上同一种口味的蛋糕\n[01:02.27]不约而同哼唱一段曲调\n[01:08.34]喜欢这样看你傻傻的笑\n[01:14.62]好想能这样\n[01:17.61]就白头到老\n[01:20.60]最好从下一秒\n[01:39.19]好想能看到\n[01:42.22]你嘴角微笑\n[01:45.20]最好在下一秒\n[01:51.38]好想能听到\n[01:54.46]你轻声歌唱\n[01:57.55]最好在下一秒\n[02:03.31]纯白棒球帽\n[02:06.96]墨绿色衣角\n[02:09.79]时间静止的美好\n[02:16.16]默契发生在每个下一秒\n[02:22.37]爱上同一种口味的蛋糕\n[02:28.45]不约而同哼唱一段曲调\n[02:34.72]喜欢这样看你傻傻的笑\n[02:40.69]好想能这样\n[02:43.67]就白头到老\n[02:46.81]最好从下一秒\n[02:53.18]最好从下一秒', '/song/张碧晨-下一秒.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (60, 14, '许嵩-我乐意', '我乐意', '2019-06-02 19:35:54', '2019-06-02 19:35:54', '/img/songPic/109951163261278540.jpg', '[00:00.42]许嵩 - 我乐意\n[00:01.28]作词：许嵩\n[00:01.93]作曲：许嵩\n[00:02.60]编曲：蔡廷贵、许嵩\n[00:03.81]制作人：许嵩\n[00:04.67]和声编写：许嵩\n[00:05.63]和声：许嵩\n[00:06.30]录音师：许嵩\n[00:07.15]混音师：许嵩\n[00:07.97]母带处理工程：许嵩\n[00:13.94]潇洒如我\n[00:14.75]最近却变得有点敏感\n[00:18.24]半小时收不到你讯息\n[00:20.72]就会坐立不安\n[00:22.80]都说别爱的太满\n[00:25.03]这道理知易行难\n[00:27.31]我还挺乐意享受\n[00:29.19]这份甜中微酸\n[00:31.72]你的笑像西瓜最中间\n[00:34.21]那一勺的口感\n[00:36.18]点亮了一整个夏天\n[00:38.37]星空也为你斑斓\n[00:40.70]我不会深情款款\n[00:42.98]上演什么套路桥段\n[00:45.12]我的爱纯粹简单\n[00:50.93]我乐意站在你身后\n[00:53.11]把你揽在胸口\n[00:55.18]低头看你素净的脸颊粉红\n[00:59.91]我乐意把着你的手\n[01:02.09]心猿意马弹奏\n[01:04.22]每颗音符里都有幸福闪动\n[01:08.73]我乐意守在你左右\n[01:11.02]为你挡雨遮风\n[01:13.20]今后的路我陪你一起走过\n[01:17.57]我乐意把自己奉送\n[01:20.00]做你独家宇宙\n[01:22.23]抱着你旁若无人尽情舞动\n[01:32.41]你的笑像西瓜最中间\n[01:34.74]那一勺的口感\n[01:36.82]点亮了一整个夏天\n[01:38.94]星空也为你斑斓\n[01:41.22]我不会深情款款\n[01:43.14]上演什么套路桥段\n[01:45.67]我的爱纯粹简单\n[01:51.31]我乐意站在你身后\n[01:53.69]把你揽在胸口\n[01:55.77]低头看你素净的脸颊粉红\n[02:00.43]我乐意把着你的手\n[02:02.67]心猿意马弹奏\n[02:04.75]每颗音符里都有幸福闪动\n[02:09.22]我乐意守在你左右\n[02:11.56]为你挡雨遮风\n[02:13.74]今后的路我陪你一起走过\n[02:18.11]我乐意把自己奉送\n[02:20.60]做你独家宇宙\n[02:22.78]抱着你旁若无人尽情舞动\n[02:30.81]我非常乐意\n[02:32.49]为你做任何任何的事情\n[02:36.39]你说只要求我\n[02:37.50]每天过得开心\n[02:39.78]我非常乐意\n[02:41.40]陪你到任何任何地方去\n[02:45.51]你说今年秋天想去趟南极\n[02:48.70]我非常乐意看着你的眼睛\n[02:52.96]落俗而真诚的\n[02:55.04]说出那一句我爱你\n[03:05.53]我乐意站在你身后\n[03:07.66]把你揽在胸口\n[03:09.85]低头看你素净的脸颊粉红\n[03:14.30]我乐意把着你的手\n[03:16.68]心猿意马弹奏\n[03:18.81]每颗音符里都有幸福闪动\n[03:23.18]我乐意守在你左右\n[03:25.61]为你挡雨遮风\n[03:27.74]今后的路我陪你一起走过\n[03:32.20]我乐意把自己奉送\n[03:34.63]做你独家宇宙\n[03:36.82]抱着你旁若无人尽情舞动\n[03:41.24]我乐意守在你左右\n[03:43.62]为你挡雨遮风\n[03:45.75]今后的路我陪你一起走过\n[03:50.13]我乐意把自己奉送\n[03:52.57]做你独家宇宙\n[03:54.90]抱着你旁若无人尽情舞动', '/song/许嵩-我乐意.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (61, 20, 'IU-Twenty-three (二十三)', 'CHAT-SHIRE', '2019-06-02 19:37:44', '2019-06-02 19:37:44', '/img/songPic/3285340745228795.jpg', '[00:00.13]IU - 二十三\n[00:00.67]词：아이유\n[00:00.78]曲：이종훈/이채규/아이유\n[00:00.89]I\'m twenty three\n[00:01.86]난 수수께끼\n[00:05.63]뭐게요 맞혀봐요\n[00:41.27]I\'m twenty three\n[00:42.05]난 수수께끼 Question\n[00:45.10]뭐게요 맞혀봐요\n[00:48.98]I\'m twenty three\n[00:49.95]틀리지 말기 Because\n[00:52.79]난 몹시 예민해요\n[00:55.00]맞혀봐\n[00:55.63]한 떨기 스물셋 좀\n[00:57.74]아가씨 태가 나네\n[00:59.60]다 큰 척해도 적당히 믿어줘요\n[01:03.57]얄미운 스물셋\n[01:05.51]아직 한참 멀었다 얘\n[01:07.46]덜 자란 척해도\n[01:08.95]대충 속아줘요\n[01:11.02]난 그래 확실히 지금이 좋아요\n[01:15.14]아냐 아냐 사실은 때려 치고 싶어요\n[01:18.70]아 알겠어요 나는 사랑이 하고 싶어\n[01:22.66]아니 돈이나 많이 벌래\n[01:25.05]맞혀봐\n[01:25.65]어느 쪽이게\n[01:27.06]얼굴만 보면 몰라\n[01:28.87]속마음과 다른 표정을 짓는 일\n[01:32.02]아주 간단하거든\n[01:33.54]어느 쪽이게\n[01:34.77]사실은 나도 몰라\n[01:36.67]애초에 나는 단 한 줄의\n[01:39.28]거짓말도 쓴 적이 없거든\n[01:41.90]여우인 척 하는 곰인 척\n[01:45.17]하는 여우 아니면\n[01:46.86]아예 다른 거\n[01:49.02]어느 쪽이게\n[01:50.65]뭐든 한 쪽을 골라\n[01:52.39]색안경 안에 비춰지는 거 뭐\n[01:55.53]이제 익숙하거든\n[01:59.23]Check it out\n[02:00.14]겁나는 게 없어요\n[02:02.07]엉망으로 굴어도\n[02:03.97]사람들은 내게 매일 친절해요\n[02:07.88]인사하는 저 여자\n[02:09.87]모퉁이를 돌고도 아직 웃고 있을까\n[02:13.87]늘 불안해요\n[02:15.39]난 영원히 아이로 남고 싶어요\n[02:19.58]아니 아니 물기 있는 여자가 될래요\n[02:22.98]아 정했어요 난 죽은 듯이 살래요\n[02:26.99]아냐 다 뒤집어 볼래\n[02:29.60]맞혀봐\n[02:30.08]어느 쪽이게\n[02:31.29]얼굴만 보면 몰라\n[02:33.28]속마음과 다른 표정을 짓는 일\n[02:36.40]아주 간단하거든\n[02:38.48]어느 쪽이게\n[02:39.12]사실은 나도 몰라\n[02:41.10]애초에 나는 단 한 줄의\n[02:43.66]거짓말도 쓴 적이 없거든\n[02:46.11]여우인 척 여우인 척\n[02:47.86]하는 곰인 척 곰인 척\n[02:50.13]여우 아니면 여우 아니면\n[02:51.78]아예 다른 거\n[02:53.66]어느 쪽이게\n[02:54.74]뭐든 한 쪽을 골라\n[02:56.70]색안경 안에 비춰지는\n[02:59.19]거 뭐 이제 익숙하거든\n[03:02.36]난 당신 맘에 들고 싶어요\n[03:05.75]아주 살짝만 얄밉게 해도 돼요\n[03:09.96]난 당신 맘에 들고 싶어요\n[03:13.14]자기 머리 꼭대기 위에서 놀아도 돼요\n[03:16.31]맞혀봐\n[03:16.68]어느 쪽이게\n[03:18.03]얼굴만 보면 몰라\n[03:20.09]속마음과 다른 표정을 짓는 일\n[03:23.20]아주 간단하거든\n[03:25.34]어느 쪽이게\n[03:26.11]사실은 나도 몰라\n[03:27.90]애초에 나는 단 한 줄의\n[03:30.49]거짓말도 쓴 적이 없거든\n[03:32.92]여우인 척 여우인 척\n[03:34.77]하는 곰인 척 곰인 척\n[03:36.81]여우 아니면 여우 아니면\n[03:38.56]아예 다른 거\n[03:40.68]어느 쪽이게\n[03:41.43]뭐든 한 쪽을 골라\n[03:43.53]색안경 안에 비춰지는 거\n[03:46.35]뭐 이제 익숙하거든\n 推荐相关视频\n\n\n\n 歌手其他歌曲\n#	歌名	\n1	삐삐	\n2	잼잼(Jam Jam)	\n3	Marry You (Live)	\n4	喜帖街 (Live)	\n5	小幸运 (Live)	\n 最近30天\n点击: 10', '/song/IU-Twenty-three (二十三).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (62, 20, 'IU-Someday', 'CHAT-드림하이 OST - (Dream High)', '2019-06-02 19:38:54', '2019-06-02 19:38:54', '/img/songPic/778454232471313.jpg', '[00:00.02]Someday (《Dream High》韩剧插曲) - 아이유 (IU)\n[00:01.07]词：박진영\n[00:01.18]曲：박진영\n[00:01.29]编曲：홍지상/박진영/심은지\n[00:03.88]언젠간 이 눈물이 멈추길\n[00:08.73]언젠간 이 어둠이 걷히고\n[00:14.08]따스한 햇살이\n[00:16.45]이 눈물을 말려주길\n[00:22.25]지친 내 모습이\n[00:26.77]조금씩 지겨워지는 걸 느끼면\n[00:33.53]다 버리고 싶죠\n[00:36.02]힘들게 지켜오던 꿈을\n[00:41.37]가진 것보다는 부족한 것이\n[00:47.81]너무나도 많은 게\n[00:52.68]느껴질 때마다 다리에\n[00:56.19]힘이 풀려서 나 주저앉죠\n[01:01.54]언젠간 이 눈물이 멈추길\n[01:06.36]언젠간 이 어둠이 걷히고\n[01:11.63]따스한 햇살이\n[01:14.12]이 눈물을 말려주길\n[01:19.86]괜찮을 거라고 내 스스로를\n[01:26.57]위로하며 버티는\n[01:31.16]하루하루가 날 조금씩\n[01:34.40]두렵게 만들고\n[01:38.99]나를 믿으라고 말하면서도\n[01:45.57]믿지 못하는 나는\n[01:50.13]이제 얼마나 더\n[01:53.11]오래 버틸 수 있을 지\n[01:55.32]모르겠어요\n[01:59.06]기다리면 언젠간 오겠지\n[02:04.31]밤이 길어도 해는 뜨듯이\n[02:08.92]아픈 내 가슴도\n[02:11.69]언젠간 다 낫겠지\n[02:17.41]날 이젠 도와주길\n[02:21.89]하늘이 제발 도와주길\n[02:26.67]나 혼자서만 이겨내기가\n[02:31.51]점점 더 자신이 없어져요\n[02:39.96]언젠간 이 눈물이 멈추길\n[02:44.76]언젠간 이 어둠이 걷히고\n[02:50.01]따스한 햇살이\n[02:52.54]이 눈물을 말려주길\n[02:55.45]이 눈물을 말려주길\n[02:59.35]기다리면 언젠가 오겠지\n[03:04.18]밤이 길어도 해는 뜨듯이\n[03:08.64]이 아픈 내 가슴도\n[03:11.63]언젠간 다 낫겠지\n[03:19.09]언젠간\n[03:21.30]언젠간', '/song/IU-Someday.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (63, 21, '金泰妍-제주도의 푸른 밤', '밴드 고맙삼다', '2019-06-01 20:11:23', '2019-06-02 18:07:31', '/img/songPic/1413971959305351.jpg', '[00:00.00] 暂无歌词', '/song/金泰妍-제주도의 푸른 밤.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (64, 15, '张国荣-当爱已成往事', '当爱已成往事', '2019-06-02 19:40:56', '2019-06-02 19:40:56', '/img/songPic/103354093011859.jpg', '[00:00.00]张国荣 - 当爱已成往事\n[00:01.38]作词：李宗盛\n[00:02.29]作曲：李宗盛\n[00:45.45]往事不要再提\n[00:49.45]人生已多风雨\n[00:53.80]纵然记忆抹不去\n[00:55.57]爱与恨都还在心里\n[01:00.61]真的要断了过去\n[01:04.35]让明天好好继续\n[01:08.77]你就不要再\n[01:10.04]苦苦追问我的消息\n[01:15.59]爱情它是个难题\n[01:19.49]让人目眩神迷\n[01:23.79]忘了痛或许可以\n[01:25.61]忘了你却太不容易\n[01:30.69]你不曾真的离去\n[01:34.44]你始终在我心里\n[01:38.67]我对你仍有爱意\n[01:40.49]我对自己无能为力\n[01:45.37]因为我仍有梦\n[01:49.11]依然将你放在我心中\n[01:53.43]总是容易被往事打动\n[01:57.02]总是为了你心痛\n[02:00.51]别流恋岁月中\n[02:04.06]我无意的柔情万种\n[02:08.29]不要问我是否再相逢\n[02:12.08]不要管我是否言不由衷\n[02:15.33]为何你不懂\n[02:19.48]只要有爱就有痛\n[02:23.78]有一天你会知道\n[02:26.85]人生没有我并不会不同\n[02:30.70]人生已经太匆匆\n[02:34.41]我好害怕总是泪眼朦胧\n[02:38.82]忘了我就没有痛\n[02:40.98]将往事留在风中\n[03:15.71]因为我仍有梦\n[03:19.16]依然将你放在我心中\n[03:23.52]总是容易被往事打动\n[03:27.07]总是为了你心痛\n[03:30.51]别流恋岁月中\n[03:34.20]我无意的柔情万种\n[03:38.41]不要问我是否再相逢\n[03:42.18]不要管我是否言不由衷\n[03:45.46]为何你不懂\n[03:49.71]只要有爱就有痛\n[03:53.96]有一天你会知道\n[03:57.05]人生没有我并不会不同\n[04:00.80]人生已经太匆匆\n[04:04.54]我好害怕总是泪眼朦胧\n[04:08.94]忘了我就没有痛\n[04:11.18]将往事留在风中\n[04:15.53]为何你不懂\n[04:19.57]只要有爱就有痛\n[04:23.98]有一天你会知道\n[04:27.12]人生没有我并不会不同\n[04:30.91]人生已经太匆匆\n[04:34.48]我好害怕总是泪眼朦胧\n[04:38.93]忘了我就没有痛\n[04:44.13]将往事留在风中', '/song/张国荣-当爱已成往事.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (65, 15, '张国荣-想你', '想你', '2019-06-02 19:42:02', '2019-06-02 19:42:02', '/img/songPic/78065325577772.jpg', '[00:01.06]想你 - 张国荣\n[00:02.93]词：小美\n[00:04.24]曲：张国荣\n[00:27.77]呆坐半晚 咖啡早渗着冰冷\n[00:34.28]是否心已淡是挂念你的冷淡\n[00:40.97]难合上眼 枕边早垫着冰冷\n[00:48.05]夜深不觉冷但似躺在泥滩\n[00:55.07]长夜冷冷 晚风想冷漠驱散\n[01:01.53]但千种慨叹在脑内快速泛滥\n[01:08.42]垂下了眼 压抑想淌泪的眼\n[01:15.33]但沙吹进眼令我极甚为难\n[01:22.16]无助无望无奈曾立心想放弃\n[01:29.22]自制自我在每日怨天怨地\n[01:36.06]情话情意情路情尽都经过也是因你\n[01:42.89]留下我在昨日过活但如死\n[01:49.07]痴心像马戏 似小丑眼内希冀\n[01:56.45]为想得到你愿竭力以心献技\n[02:02.81]想你但怨你 暗街灯也在想你\n[02:10.08]但却在暗示结局甚迷离\n[02:55.15]无助无望无奈曾立心想放弃\n[03:01.62]自制自我在每日怨天怨地\n[03:08.60]情话情意情路情尽都经过也是因你\n[03:15.33]留下我在昨日过活但如死\n[03:21.70]痴心像马戏 似小丑眼内希冀\n[03:29.07]为想得到你愿竭力以心献技\n[03:34.65]想你但怨你 暗街灯也在等你\n[03:42.71]但却在暗示结局甚迷离\n[03:49.76]但却在暗示结局甚迷离', '/song/张国荣-想你.m4a', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (67, 15, '张国荣-倩女幽魂', '倩女幽魂', '2019-06-02 19:45:39', '2019-06-02 19:45:39', '/img/songPic/78065325577772.jpg', '[00:04.11]张国荣 - 倩女幽魂\n[00:07.66]词：黄沾\n[00:07.66]曲：黄沾\n[00:07.66]人生路 美梦似路长\n[00:15.80]路里风霜 风霜扑面干\n[00:24.04]红尘里 美梦有几多方向\n[00:31.82]找痴痴梦幻中心爱\n[00:37.23]路随人茫茫\n[00:42.46]人生是 美梦与热望\n[00:50.44]梦里依稀 依稀有泪光\n[00:58.55]何从何去 去觅我心中方向\n[01:05.95]风仿佛在梦中轻叹\n[01:12.10]路和人茫茫\n[02:40.56]人间路 快乐少年郎\n[02:48.09]路里崎岖 崎岖不见阳光\n[02:56.95]泥尘里 快乐有几多方向\n[03:04.50]一丝丝梦幻般风雨\n[03:09.95]路随人茫茫\n[03:14.64]丝丝梦幻般风雨\n[03:20.07]路随人茫茫', '/song/张国荣-倩女幽魂.m4a', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (68, 15, '张国荣-最冷一天', '最冷一天', '2019-06-02 12:29:33', '2019-06-02 18:07:22', '/img/songPic/103354093011859.jpg', '[00:00.00] 暂无歌词', '/song/张国荣-最冷一天.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (69, 13, '田馥甄-小幸运', '小幸运', '2019-06-02 19:46:36', '2019-06-02 19:46:36', '/img/songPic/109951163520335473.jpg', '[00:00.50]田馥甄 - 小幸运\n[00:00.50]词：徐世珍/吴辉福\n[00:00.50]曲：JerryC\n[00:00.50]编曲：JerryC\n[00:02.36]我听见雨滴落在青青草地\n[00:08.38]我听见远方下课钟声响起\n[00:14.44]可是我没有听见你的声音\n[00:19.30]认真 呼唤我姓名\n[00:26.60]爱上你的时候还不懂感情\n[00:32.64]离别了才觉得刻骨 铭心\n[00:38.73]为什么没有发现遇见了你\n[00:43.28]是生命最好的事情\n[00:49.00]也许当时忙着微笑和哭泣\n[00:55.03]忙着追逐天空中的流星\n[01:00.73]人理所当然的忘记\n[01:05.27]是谁风里雨里\n[01:07.92]一直默默守护在原地\n[01:12.90]原来你是我最想留住的幸运\n[01:18.30]原来我们和爱情\n[01:20.90]曾经靠得那么近\n[01:24.37]那为我对抗世界的决定\n[01:28.85]那陪我淋的雨\n[01:31.85]一幕幕都是你\n[01:34.97]一尘不染的真心\n[01:39.11]与你相遇 好幸运\n[01:42.55]可我已失去为你\n[01:45.25]泪流满面的权利\n[01:48.63]但愿在我看不到的天际\n[01:53.16]你张开了双翼\n[01:56.19]遇见你的注定\n[02:00.98]她会有多幸运\n[02:15.94]青春是段跌跌撞撞的旅行\n[02:22.02]拥有着后知后觉的美丽\n[02:28.07]来不及感谢是你给我勇气\n[02:32.64]让我能做回我自己\n[02:38.32]也许当时忙着微笑和哭泣\n[02:44.44]忙着追逐天空中的流星\n[02:50.09]人理所当然的忘记\n[02:54.63]是谁风里雨里\n[02:57.36]一直默默守护在原地\n[03:02.25]原来你是我最想留住的幸运\n[03:07.62]原来我们和爱情\n[03:10.27]曾经靠得那么近\n[03:13.70]那为我对抗世界的决定\n[03:18.26]那陪我淋的雨\n[03:21.26]一幕幕都是你\n[03:24.26]一尘不染的真心\n[03:28.45]与你相遇 好幸运\n[03:31.93]可我已失去为你\n[03:34.57]泪流满面的权利\n[03:38.03]但愿在我看不到的天际\n[03:42.46]你张开了双翼\n[03:45.56]遇见你的注定\n[03:48.96]Oh\n[03:53.15]她会有多幸运', '/song/田馥甄-小幸运.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (70, 13, '田馥甄-你就不要想起我', '你就不要想起我', '2019-06-02 19:47:27', '2019-06-02 19:47:27', '/img/songPic/109951163520335473.jpg', '[00:00.26]田馥甄 - 你就不要想起我\n[00:01.05]作词：施人诚\n[00:01.11]作曲：杨子朴、刘大江\n[00:01.56]编曲：洪敬尧、温奕哲\n[00:21.05]我都寂寞多久了还是没好\n[00:29.46]感觉全世界都在窃窃嘲笑\n[00:36.94]我能有多骄傲\n[00:40.87]不堪一击好不好\n[00:46.61]一碰到你我就被撂倒\n[00:55.21]吵醒沉睡冰山后从容脱逃\n[01:03.80]你总是有办法轻易做到\n[01:11.00]一个远远的微笑\n[01:15.24]就掀起汹涌波涛\n[01:19.84]又闻到眼泪沸腾的味道\n[01:28.03]明明你也很爱我\n[01:30.51]没理由爱不到结果\n[01:36.67]只要你敢不懦弱\n[01:38.99]凭什么我们要错过\n[01:45.68]夜长梦还多\n[01:49.53]你就不要想起我\n[01:54.09]到时候你就知道有多痛\n[02:21.18]那些快乐多难得美好\n[02:29.50]你真的有办法舍得不要\n[02:36.55]才刚成真的美梦\n[02:41.02]转眼就幻灭破掉\n[02:45.45]祝福你真的可以睡得好\n[02:53.75]明明你也最爱我\n[02:56.18]没理由爱不到结果\n[03:02.31]只要你敢不懦弱\n[03:04.76]凭什么我们要错过\n[03:11.37]夜长梦很多\n[03:15.13]你就不要想起我\n[03:19.98]到时候最好别来要认错\n[03:27.45]你就不要 想我到 疯掉\n[03:41.00]明明你也还爱我\n[03:43.34]没理由爱不到结果\n[03:49.41]只要你敢不懦弱\n[03:51.91]凭什么我们要错过\n[03:58.50]夜长梦会多\n[04:02.28]你就不要想起我\n[04:06.91]我等夜监听你说多爱我', '/song/田馥甄-你就不要想起我.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (71, 30, '五月天-孙悟空', '神的孩子都在跳舞', '2019-06-02 19:51:45', '2019-06-02 19:51:45', '/img/songPic/109951163188724796.jpg', '[00:00.87]五月天 - 孙悟空\n[00:01.73]作词：阿信\n[00:01.88]作曲：怪兽\n[00:02.03]编曲：五月天、黄少雍、山地人、TEN、可乐\n[00:02.69]和声：郑知明、可乐、黄士杰\n[00:20.12]兵荒马乱五百年来没改变过\n[00:24.56]花果山下满天的烽火\n[00:29.12]人类累不累啊\n[00:31.40]还在你争我夺\n[00:33.67]西天取经回来后\n[00:35.94]有没有人有读过\n[00:38.48]师父每年都会寄卡片来问候\n[00:42.82]五百张了算多不算多\n[00:47.37]看到卡片我都想起那段奋斗\n[00:51.97]金箍棒那么神勇\n[00:54.39]现在只能掏掏耳朵\n[00:57.34]齐天大圣是我 谁能奈何了我\n[01:01.69]但是我却依然\n[01:03.48]不小心败给了寂寞\n[01:25.06]如果要让我活 让我有希望的活\n[01:29.56]我从不怕爱错 就怕没爱过\n[01:34.11]如果能有一天 再一次重返光荣\n[01:38.71]记得找我 我的好朋友\n[01:43.72]听说国玺已经植发治好秃头\n[01:48.12]有了论及婚嫁的女友\n[01:52.66]八戒这个猪头手机老是不通\n[01:57.22]好色本性多隽永\n[01:59.58]好像时间从来没走\n[02:02.45]西天取完了经 东边应该还有\n[02:06.94]伙伴们好不好\n[02:08.80]让我们再拯救地球\n[02:11.76]如果要让我活 让我有希望的活\n[02:16.40]我从不怕爱错 就怕没爱过\n[02:20.96]如果能有一天 再一次重返光荣\n[02:25.75]记得找我 我的好朋友\n[02:56.47]如果要让我活 请给我快乐苦痛\n[03:00.97]我从不怕爱错 就怕没爱过\n[03:05.48]如果能有一天 再一次重返光荣\n[03:10.08]记得找我 我的好朋友\n[03:14.64]如果要让我活 让我有希望的活\n[03:19.19]我从不怕爱错 就怕没爱过\n[03:23.79]如果能有一天 再一次重返光荣\n[03:28.62]记得找我 我的好朋友\n[03:51.42]记得找我 我的好朋友', '/song/五月天-孙悟空.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (72, 30, '五月天-如果我们不曾相遇', '如果我们不曾相遇', '2019-06-02 19:52:50', '2019-06-02 19:52:50', '/img/songPic/109951163188724796.jpg', '[00:00.36]如果我们不曾相遇 (《青云志》电视剧插曲) - 五月天\n[00:00.79]词：阿信\n[00:00.94]曲：阿信\n[00:01.09]编曲：五月天/陶山\n[00:04.80]如果我们不曾相遇\n[00:09.38]我会是在哪里\n[00:13.94]如果我们从不曾相识\n[00:18.52]不存在这首歌曲\n[00:22.85]每秒都活着 每秒都死去\n[00:27.52]每秒都问着自己\n[00:31.81]谁不曾找寻 谁不曾怀疑\n[00:36.73]茫茫人生奔向何地\n[00:41.89]那一天 那一刻 那个场景\n[00:46.35]你出现在我生命\n[00:50.87]从此后 从人生 重新定义\n[00:55.37]从我故事里苏醒\n[01:02.40]如果我们不曾相遇\n[01:06.89]你又会在哪里\n[01:11.56]如果我们从不曾相识\n[01:16.17]人间又如何运行\n[01:20.41]晒伤的脱皮 意外的雪景\n[01:25.08]与你相依的四季\n[01:29.64]苍狗又白云 身旁有了你\n[01:34.28]匆匆轮回又有何惧\n[01:39.46]那一天 那一刻 那个场景\n[01:44.06]你出现在我生命\n[01:48.49]每一分 每一秒 每个表情\n[01:53.18]故事都充满惊奇\n[01:57.93]偶然与巧合 舞动了蝶翼\n[02:00.23]谁的心头风起\n[02:02.45]前仆而后继 万千人追寻\n[02:04.91]荒漠唯一菩提\n[02:07.11]是擦身相遇 或擦肩而去\n[02:09.34]命运犹如险棋\n[02:11.71]无数时间线 无尽可能性\n[02:13.89]终于交织向你\n[02:16.50]那一天 那一刻 那个场景\n[02:20.86]你出现在我生命\n[02:25.47]未知的 未来里 未定机率\n[02:30.06]然而此刻拥有你\n[02:34.99]某一天 某一刻 某次呼吸\n[02:39.33]我们终将再分离\n[02:43.92]而我的 自传里 曾经有你\n[02:48.50]没有遗憾的诗句\n[02:55.04]诗句里 充满感激\n[03:00.44]如果我们不曾相遇\n[03:04.68]我会是在哪里\n[03:09.27]如果我们从不曾相识\n[03:13.88]不存在这首歌曲', '/song/五月天-如果我们不曾相遇.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (73, 30, '五月天-倔强', '倔强', '2019-06-02 19:53:48', '2019-06-02 19:53:48', '/img/songPic/109951163188724796.jpg', '[00:00.62]倔强 - 五月天\n[00:01.51]词：阿信\n[00:02.13]曲：阿信\n[00:02.69]编曲：五月天\n[00:42.30]当我和世界不一样\n[00:46.17]那就让我不一样\n[00:49.24]坚持对我来说就是以刚克刚\n[00:54.22]我如果对自己妥协\n[00:58.41]如果对自己说谎\n[01:01.54]即使别人原谅我也不能原谅\n[01:06.53]最美的愿望\n[01:09.65]一定最疯狂\n[01:12.64]我就是我自己的神\n[01:15.82]在我活的地方\n[01:18.84]我和我最后的倔强\n[01:21.90]握紧双手绝对不放\n[01:24.95]下一站是不是天堂\n[01:27.88]就算失望 不能绝望\n[01:31.07]我和我骄傲的倔强\n[01:34.19]我在风中大声的唱\n[01:37.25]这一次为自己疯狂\n[01:40.37]就这一次我和我的倔强\n[01:59.09]对爱我的人别紧张\n[02:03.02]我的固执很善良\n[02:06.15]我的手越肮脏眼神越是发光\n[02:11.07]你不在乎我的过往\n[02:15.38]看到了我的翅膀\n[02:18.38]你说被火烧过才能出现凤凰\n[02:23.43]逆风的方向\n[02:26.36]更适合飞翔\n[02:29.48]我不怕千万人阻挡\n[02:32.72]只怕自己投降\n[02:35.73]我和我最后的倔强\n[02:38.79]握紧双手绝对不放\n[02:41.83]下一站是不是天堂\n[02:44.96]就算失望不能绝望\n[02:48.01]我和我骄傲的倔强\n[02:51.09]我在风中大声的唱\n[02:54.27]这一次为自己疯狂\n[02:57.20]就这一次我和我的倔强\n[03:12.73]我和我最后的倔强\n[03:15.66]握紧双手绝对不放\n[03:18.79]下一站是不是天堂\n[03:21.65]就算失望不能绝望\n[03:24.77]我和我骄傲的倔强\n[03:27.96]我在风中大声的唱\n[03:31.08]这一次为自己疯狂\n[03:34.14]就这一次我和我的倔强\n[03:40.40]就这一次让我大声唱\n[03:43.52]啦 啦 啦 啦 啦 啦 啦 啦\n[03:46.47]啦 啦 啦 啦 啦 啦 啦 啦\n[03:49.47]啦 啦 啦 啦 啦 啦 啦 啦\n[03:52.58]就算失望不能绝望\n[03:55.64]啦 啦 啦 啦 啦 啦 啦 啦\n[03:58.64]啦 啦 啦 啦 啦 啦 啦 啦\n[04:01.76]啦 啦 啦 啦 啦 啦 啦 啦\n[04:04.75]就这一次我和我的倔强', '/song/五月天-倔强.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (74, 11, 'Eminem-Lose Yourself', 'Lose Yourself', '2019-06-02 16:40:56', '2019-06-02 18:07:17', '/img/songPic/6656443395492431.jpg', '[00:00.00] 暂无歌词', '/song/Eminem-Lose Yourself.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (75, 11, 'Eminem-When I\'m Gone', 'When I\'m Gone', '2019-06-02 16:42:25', '2019-06-02 18:07:13', '/img/songPic/6656443395492431.jpg', '[00:00.00] 暂无歌词', '/song/Eminem-When I\'m Gone.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (76, 17, '朴树-平凡之路', '平凡之路', '2019-06-02 19:55:55', '2019-06-02 19:55:55', '/img/songPic/18885211718782327.jpg', '[00:00.00]朴树 - 平凡之路(《后会无期》电影主题曲)\n[00:03.25]词：韩寒/朴树\n[00:04.38]曲：朴树\n[00:11.80]徘徊着的 在路上的\n[00:17.58]你要走吗 Via Via\n[00:23.30]易碎的 骄傲着\n[00:29.01]那也曾是我的模样\n[00:34.70]沸腾着的 不安着的\n[00:40.46]你要去哪 Via Via\n[00:46.19]谜一样的 沉着的\n[00:51.92]故事你真的在听吗\n[00:56.16]我曾经跨过山和大海\n[00:59.28]也穿过人山人海\n[01:01.90]我曾经拥有着的一切\n[01:05.02]转眼都飘散如烟\n[01:07.61]我曾经失落失望失掉所有方向\n[01:13.44]直到看见平凡才是唯一的答案\n[01:31.85]当你仍然 还在幻想\n[01:37.66]你的明天 Via Via\n[01:43.20]她会好吗 还是更烂\n[01:49.01]对我而言是另一天\n[01:53.37]我曾经毁了我的一切\n[01:56.43]只想永远地离开\n[01:59.03]我曾经堕入无边黑暗\n[02:02.13]想挣扎无法自拔\n[02:04.84]我曾经像你像他像那野草野花\n[02:10.65]绝望着 也渴望着\n[02:13.55]也哭也笑平凡着\n[03:03.42]向前走 就这么走\n[03:06.10]就算你被给过什么\n[03:08.95]向前走 就这么走\n[03:11.88]就算你被夺走什么\n[03:14.68]向前走 就这么走\n[03:17.63]就算你会错过什么\n[03:20.42]向前走 就这么走\n[03:23.22]就算你会\n[03:24.98]我曾经跨过山和大海\n[03:27.92]也穿过人山人海\n[03:30.55]我曾经拥有着的一切\n[03:33.61]转眼都飘散如烟\n[03:36.12]我曾经失落失望失掉所有方向\n[03:42.23]直到看见平凡才是唯一的答案\n[03:47.85]我曾经毁了我的一切\n[03:50.74]只想永远地离开\n[03:53.19]我曾经堕入无边黑暗\n[03:56.41]想挣扎无法自拔\n[03:58.91]我曾经像你像他像那野草野花\n[04:04.91]绝望着 也渴望着\n[04:07.89]也哭也笑平凡着\n[04:10.78]我曾经跨过山和大海\n[04:13.56]也穿过人山人海\n[04:16.32]我曾经问遍整个世界\n[04:19.34]从来没得到答案\n[04:21.85]我不过像你像他像那野草野花\n[04:27.99]冥冥中这是我 唯一要走的路啊\n[04:34.69]时间无言 如此这般\n[04:40.38]明天已在 Hia Hia\n[04:46.09]风吹过的 路依然远\n[04:51.84]你的故事讲到了哪', '/song/朴树-平凡之路.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (77, 17, '朴树-白桦林', '白桦林', '2019-06-02 19:56:38', '2019-06-02 19:56:38', '/img/songPic/18885211718782327.jpg', '[00:00.11]朴树 - 白桦林(Live)\n[00:00.86]作词：朴树\n[00:01.06]作曲：朴树\n[00:26.93]静静的村庄飘着白的雪\n[00:33.36]阴霾的天空下鸽子飞翔\n[00:40.13]白桦树刻着那两个名字\n[00:46.95]他们发誓相爱用尽这一生\n[00:54.41]有一天战火烧到了家乡\n[01:00.36]小伙子拿起枪奔赴边疆\n[01:07.06]心上人你不要为我担心\n[01:13.77]等着我回来在那片白桦林\n[01:20.82]天空依然阴霾\n[01:23.62]依然有鸽子在飞翔\n[01:27.22]谁来证明那些没有\n[01:30.72]墓碑的爱情和生命\n[01:33.97]雪依然在下那村庄依然安详\n[01:40.63]年轻的人们消失在白桦林\n[01:47.67]噩耗声传来在那个午后\n[01:54.18]心上人战死在远方沙场\n[02:00.93]她默默来到那片白桦林\n[02:07.65]望眼欲穿地每天守在那里\n[02:27.88]她说他只是迷失在远方\n[02:34.53]他一定会来\n[02:37.43]来这片白桦林\n[02:41.33]天空依然阴霾\n[02:44.08]依然有鸽子在飞翔\n[02:48.03]谁来证明那些\n[02:50.63]没有墓碑的爱情和生命\n[02:54.68]雪依然在下那村庄依然安详\n[03:01.48]年轻的人们消失在白桦林\n[03:08.28]长长的路呀就要到尽头\n[03:14.98]那姑娘已经是白发苍苍\n[03:21.68]她时常听他在枕边呼唤\n[03:28.33]来吧亲爱的来这片白桦林\n[03:35.43]在死的时候她喃喃地说\n[03:41.79]我来了等着我在那片白桦林', '/song/朴树-白桦林.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (78, 31, 'Beyond-光辉岁月', '光辉岁月', '2019-06-02 20:00:14', '2019-06-02 20:00:14', '/img/songPic/29686813951246.jpg', '[00:00.61]beyond - 光辉岁月\n[00:01.47]词：黄家驹\n[00:02.18]曲：黄家驹\n[00:02.89]编曲：黄家驹\n[00:28.57]钟声响起归家的讯号\n[00:32.98]在他生命里\n[00:36.27]仿佛带点唏嘘\n[00:41.51]黑色肌肤给他的意义\n[00:45.94]是一生奉献 肤色斗争中\n[00:54.20]年月把拥有变作失去\n[01:00.96]疲倦的双眼带着期望\n[01:07.45]今天只有残留的躯壳\n[01:11.08]迎接光辉岁月\n[01:14.22]风雨中抱紧自由\n[01:20.41]一生经过彷徨的挣扎\n[01:24.02]自信可改变未来\n[01:27.23]问谁又能做到\n[01:43.17]可否不分肤色的界限\n[01:47.58]愿这土地里\n[01:50.78]不分你我高低\n[01:56.05]缤纷色彩闪出的美丽\n[02:00.51]是因它没有\n[02:03.70]分开每种色彩\n[02:08.75]年月把拥有变作失去\n[02:15.46]疲倦的双眼带着期望\n[02:21.95]今天只有残留的躯壳\n[02:25.61]迎接光辉岁月\n[02:28.86]风雨中抱紧自由\n[02:34.89]一生经过彷徨的挣扎\n[02:38.64]自信可改变未来\n[02:41.78]问谁又能做到\n[03:23.66]今天只有残留的躯壳\n[03:27.21]迎接光辉岁月\n[03:30.40]风雨中抱紧自由\n[03:36.59]一生经过彷徨的挣扎\n[03:40.20]自信可改变未来\n[03:43.41]问谁又能做到\n[03:59.33]今天只有残留的躯壳\n[04:02.83]迎接光辉岁月\n[04:06.12]风雨中抱紧自由\n[04:12.30]一生经过彷徨的挣扎\n[04:15.85]自信可改变未来\n[04:19.10]问谁又能做到\n[04:34.93]今天只有残留的躯壳\n[04:38.53]迎接光辉岁月\n[04:41.76]风雨中抱紧自由\n[04:47.89]一生经过彷徨的挣扎\n[04:51.60]自信可改变未来', '/song/Beyond-光辉岁月.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (79, 31, 'Beyond-无悔这一生', '无悔这一生', '2019-06-02 20:01:05', '2019-06-02 20:01:05', '/img/songPic/29686813951246.jpg', '[00:00.60]Beyond - 无悔这一生\n[00:02.98]词：卢国宏\n[00:02.60]曲：黄家驹\n[00:16.52]阳光历次消散别去\n[00:23.97]无理冲击我心绪\n[00:30.76]前景没法打算怎么\n[00:38.32]谁会偷生远方里\n[00:46.86]每次记忆哭笑\n[00:51.26]将心意再变改\n[00:53.99]一分一秒\n[01:00.37]无意对一切话别\n[01:03.97]无意却远走他方\n[01:08.68]没有泪光风里劲闯\n[01:12.71]怀着心中新希望\n[01:16.68]能冲一次\n[01:18.48]多一次\n[01:20.01]不息自强\n[01:23.19]没有泪光风里劲闯\n[01:27.32]重植根于小岛岸\n[01:30.82]如天可变风可转\n[01:34.57]不息自强\n[01:37.52]这方向\n[01:52.81]无奈静听不舍心声\n[02:00.27]和我偏偏正呼应\n[02:07.18]前方或会一生奔波\n[02:14.51]无悔这一生经过\n[02:23.03]纵有冷风飘过\n[02:27.48]将心绪再痛逼\n[02:30.48]紧守不变\n[02:36.63]无意对一切话别\n[02:40.44]无意再远走他方\n[02:45.02]没有泪光风里劲闯\n[02:48.91]怀着心中新希望\n[02:53.01]能冲一次\n[02:54.47]多一次\n[02:56.43]不息自强\n[02:59.21]没有泪光风里劲闯\n[03:03.52]重植根于小岛岸\n[03:07.27]如天可变风可转\n[03:10.88]不息自强\n[03:14.12]没有泪光风里劲闯\n[03:17.97]怀着心中新希望\n[03:21.72]能冲一次\n[03:23.92]多一次\n[03:25.52]不息自强\n[03:28.57]没有泪光风里劲闯\n[03:32.58]重植根于小岛岸\n[03:36.70]如天可变风可转\n[03:39.95]不息自强\n[03:42.95]这方向', '/song/Beyond-无悔这一生.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (80, 31, 'Beyond-真的爱你', '真的爱你', '2019-06-02 20:02:11', '2019-06-02 20:02:11', '/img/songPic/29686813951246.jpg', '[00:00.60]Beyond - 真的爱你\n[00:01.60]词：梁美薇\n[00:02.60]曲：黄家驹\n[00:27.10]无法可修饰的一对手\n[00:30.97]带出温暖永远在背后\n[00:34.07]纵使啰嗦始终关注\n[00:36.00]不懂珍惜太内疚\n[00:39.50]沉醉于音阶她不赞赏\n[00:43.36]母亲的爱却永未退让\n[00:46.52]决心冲开心中挣扎\n[00:48.45]亲恩终可报答\n[00:52.36]春风化雨暖透我的心\n[00:55.51]一生眷顾无言地送赠\n[01:00.18]是你多么温馨的目光\n[01:03.68]教我坚毅望着前路\n[01:06.78]叮嘱我跌倒不应放弃\n[01:12.62]没法解释怎可报尽亲恩\n[01:16.09]爱意宽大是无限\n[01:19.20]请准我说声真的爱你\n[01:37.13]无法可修饰的一对手\n[01:41.04]带出温暖永远在背后\n[01:44.14]纵使啰嗦始终关注\n[01:46.08]不懂珍惜太内疚\n[01:49.59]仍记起温馨的一对手\n[01:53.45]始终给我照顾未变样\n[01:56.59]理想今天终于等到\n[01:58.52]分享光辉盼做到\n[02:02.43]春风化雨暖透我的心\n[02:05.53]一生眷顾无言地送赠\n[02:10.21]是你多么温馨的目光\n[02:13.71]教我坚毅望着前路\n[02:16.87]叮嘱我跌倒不应放弃\n[02:22.66]没法解释怎可报尽亲恩\n[02:26.17]爱意宽大是无限\n[02:29.22]请准我说声真的爱你\n[03:00.06]春风化雨暖透我的心\n[03:03.21]一生眷顾无言地送赠\n[03:07.73]是你多么温馨的目光\n[03:11.34]教我坚毅望着前路\n[03:14.43]叮嘱我跌倒不应放弃\n[03:20.33]没法解释怎可报尽亲恩\n[03:23.79]爱意宽大是无限\n[03:26.83]请准我说声真的爱你\n[03:32.72]是你多么温馨的目光\n[03:36.23]教我坚毅望着前路\n[03:39.38]叮嘱我跌倒不应放弃\n[03:45.22]没法解释怎可报尽亲恩\n[03:48.68]爱意宽大是无限\n[03:51.77]请准我说声真的爱你', '/song/Beyond-真的爱你.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (81, 10, '王力宏-唯一', '唯一', '2019-06-02 20:04:32', '2019-06-02 20:04:32', '/img/songPic/4460718673904110.jpg', '[00:00.25]萌萌哒天团 - 唯一\n[00:01.01]作词：芊芊\n[00:01.77]作曲：芊芊\n[00:18.29]说好生生世世在一起\n[00:22.24]但不知为何每一世都找不到你\n[00:26.23]如果不小心找到了你\n[00:30.17]老天任何考验也不要与我别离\n[00:34.22]当初在天庭相遇情景清晰\n[00:38.16]不切实际的寻寻觅觅\n[00:42.15]却换来满心的悲与凄\n[00:46.20]不再相信两情总依依\n[00:49.78]万杞梁和孟姜女\n[00:53.01]万里长城也只是绝壁\n[00:57.21]而那梁山伯与祝英台\n[01:00.95]生死相随竟是蝴蝶意\n[01:05.13]明明白白的愿力加业力\n[01:09.02]看不见的世界都在天上\n[01:13.12]看得见的世界在身旁\n[01:17.01]真心都叫做唯一\n[01:38.14]时空的差距眼神交集\n[01:42.13]只为你那短暂的笑颜舍命不惜\n[01:46.18]爱在错的时机泪着地\n[01:50.15]坚持着无悔的决定我依然孤寂\n[01:54.15]是目眩神迷从来不忘自己\n[01:58.14]深情的胸襟有过泪滴\n[02:02.09]无畏惧痛在心隐于底\n[02:06.18]捍卫你是使命别问起\n[02:09.71]万杞梁和孟姜女\n[02:12.95]万里长城也只是绝壁\n[02:17.15]而那梁山伯与祝英台\n[02:20.95]生死相随竟是蝴蝶意\n[02:25.09]明明白白的愿力加业力\n[02:28.93]看不见的世界都在天上\n[02:33.13]看得见的世界在身旁\n[02:36.91]真心都叫做唯一\n[02:41.76]万杞梁和孟姜女\n[02:45.00]万里长城也只是绝壁\n[02:49.09]而那梁山伯与祝英台\n[02:52.98]生死相随竟是蝴蝶意\n[02:57.12]明明白白的愿力加业力\n[03:00.96]看不见的世界都在天上\n[03:05.10]看得见的世界在身旁\n[03:08.94]真心都叫做唯一\n[03:14.30]真心都叫做唯一', '/song/王力宏-唯一.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (82, 9, '林俊杰-一千年以后', '一千年以后', '2019-06-02 20:05:35', '2019-06-02 20:05:35', '/img/songPic/109951163187405670.jpg', '[00:00.10]林俊杰 - 一千年以后\n[00:00.50]作词：李瑞洵\n[00:00.71]作曲：林俊杰\n[00:00.91]编曲：蔡政勋、陈建玮、许环良、David Koon\n[00:15.96]心跳乱了节奏\n[00:20.01]梦也不自由\n[00:23.76]爱是个绝对承诺\n[00:27.28]不说撑到一千年以后\n[00:31.70]放任无奈 淹没尘埃\n[00:35.65]我在废墟之中守着你走来\n[00:38.89]喔\n[00:39.60]我的泪光承载不了喔\n[00:45.37]所有一切你要的爱\n[00:49.90]因为在 一千年以后\n[00:54.76]世界早已没有我\n[00:58.76]无法深情挽着你的手\n[01:02.91]浅吻着你额头\n[01:05.90]别等到 一千年以后\n[01:10.25]所有人都遗忘了我\n[01:14.50]那时红色黄昏的沙漠\n[01:18.38]能有谁\n[01:20.41]解开缠绕千年的寂寞\n[01:41.41]呜呜\n[01:42.48]放任无奈 淹没尘埃\n[01:46.43]我在废墟之中守着你走来\n[01:49.67]喔\n[01:50.47]我的泪光\n[01:52.25]承载不了喔\n[01:55.74]所有一切你需要的爱\n[02:00.76]因为在 一千年以后\n[02:05.55]世界早已没有我\n[02:09.55]无法深情挽着你的手\n[02:13.60]浅吻着你额头\n[02:16.69]别等到 一千年以后\n[02:21.15]所有人都遗忘了我\n[02:25.20]那时红色黄昏的沙漠\n[02:29.02]能有谁\n[02:31.17]解开缠绕千年的寂寞\n[02:42.43]Oh yeah\n[02:47.28]oh\n[02:48.95]无法深情挽着你的手\n[02:52.96]浅吻着你额头\n[02:55.99]别等到 一千年以后\n[03:00.39]所有人都遗忘了我\n[03:04.59]那时红色黄昏的沙漠\n[03:08.39]能有谁\n[03:10.57]解开缠绕千年的寂寞\n[03:16.30]oh\n[03:18.98]缠绕千年的寂寞', '/song/林俊杰-一千年以后.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (83, 9, '林俊杰-江南', '江南', '2019-06-02 20:07:10', '2019-06-02 20:07:10', '/img/songPic/109951163187405670.jpg', '[00:00.60]林俊杰 - 江南\n[00:01.60]词：李瑞洵\n[00:02.60]曲：林俊杰\n[00:36.02]风到这里就是粘\n[00:39.55]粘住过客的思念\n[00:43.97]雨到了这里缠成线\n[00:47.52]缠着我们留恋人世间\n[00:52.09]你在身边就是缘\n[00:55.36]缘分写在三生石上面\n[01:00.07]爱有万分之一甜\n[01:03.63]宁愿我就葬在这一点\n[01:08.02]圈圈圆 圆圈圈\n[01:09.89]天天年 年天天 的我\n[01:12.45]深深看你的脸\n[01:15.02]生气的温柔\n[01:17.04]埋怨的温柔 的脸\n[01:23.10]不懂爱恨情愁煎熬的我们\n[01:26.84]都以为相爱就像风云的善变\n[01:31.13]相信爱一天 抵过永远\n[01:35.31]在这一刹那冻结了时间\n[01:39.11]不懂怎么表现温柔的我们\n[01:42.92]还以为殉情只是古老的传言\n[01:46.72]离愁能有多痛 痛有多浓\n[01:51.26]当梦被埋在江南烟雨中\n[01:54.58]心碎了才懂\n[02:19.99]圈圈圆 圆圈圈\n[02:21.87]天天年 年天天 的我\n[02:24.55]深深看你的脸\n[02:27.00]生气的温柔\n[02:29.05]埋怨的温柔 的脸\n[02:35.11]不懂爱恨情愁煎熬的我们\n[02:38.88]都以为相爱就像风云的善变\n[02:42.85]相信爱一天 抵过永远\n[02:47.31]在这一刹那冻结了时间\n[02:51.01]不懂怎么表现温柔的我们\n[02:54.87]还以为殉情只是古老的传言\n[02:58.82]离愁能有多痛 痛有多浓\n[03:03.30]当梦被埋在江南烟雨中\n[03:06.54]心碎了才懂\n[03:18.99]相信爱一天 抵过永远\n[03:23.34]在这一刹那冻结了时间\n[03:27.05]不懂怎么表现温柔的我们\n[03:30.81]还以为殉情只是古老的传言\n[03:34.72]离愁能有多痛 痛有多浓\n[03:39.31]当梦被埋在江南烟雨中\n[03:44.66]心碎了才懂', '/song/林俊杰-江南.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (84, 9, '林俊杰-学不会', '学不会', '2019-06-02 20:08:12', '2019-06-02 20:08:12', '/img/songPic/109951163187405670.jpg', '[00:00.90]原唱：林俊杰\n[00:01.10]作词：姚若龙\n[00:01.30]作曲：林俊杰\n[00:01.50]编曲：闫天午\n[00:01.71]制作人：黄怡\n[00:01.96]音乐总监：刘卓\n[00:02.16]音响总监：金少刚\n[00:02.46]吉他：金天、崔万平、高恭鹏\n[00:02.92]键盘：孙梦迪、李海郡、尹岳洋\n[00:03.43]Program：尹岳洋\n[00:03.58]贝斯：李九君\n[00:03.83]鼓手：卢炜、陈志龙\n[00:04.13]打击乐：刘效松\n[00:04.38]和音：朱江、张炜、樊竹青、关冰效\n[00:04.94]弦乐：靳海音®弦乐团\n[00:05.29]音乐混音：周天澈混音团队\n[00:16.73]你的痛苦我都心疼\n[00:18.65]想为你解决\n[00:24.39]挡开流言紧握你手\n[00:26.46]想飞奔往前\n[00:31.01]我相信爱能证明一切\n[00:35.06]够真心会超越时间\n[00:38.86]多付出也多了喜悦\n[00:42.60]让幸福蔓延\n[00:48.72]总是学不会\n[00:52.46]再聪明一点\n[00:56.25]记得自我保护\n[00:58.13]必要时候讲些\n[01:01.06]善意谎言\n[01:04.03]总是学不会\n[01:08.03]真爱也有现实面\n[01:13.69]不是谁情愿\n[01:17.53]就能够解决\n[01:28.48]一次争吵一个心结\n[01:30.24]累积着改变\n[01:35.96]内心疏远足够秒杀\n[01:37.99]外表多浓烈\n[01:42.52]才发现爱不代表一切\n[01:46.51]再真心也会被阻绝\n[01:50.45]这世界天天有诡雷\n[01:54.17]随时会爆裂\n[01:58.17]还是学不会\n[02:02.04]少浪漫一点\n[02:05.94]拼命着想的事\n[02:07.78]未必带来感动\n[02:10.75]或被感谢\n[02:13.63]还是学不会\n[02:17.47]解释我最伤最累\n[02:25.21]痛死都不愿怪谁\n[02:33.55]把每段痴情苦恋\n[02:37.36]在此刻排列面前\n[02:41.21]也感觉不埋怨只怀念\n[02:52.32]总是学不会\n[02:56.18]再聪明一点\n[03:00.03]记得自我保护\n[03:01.86]必要时候讲些\n[03:04.89]善意谎言\n[03:07.87]不是学不会\n[03:11.61]只是觉得爱太美\n[03:19.30]值得去沉醉流泪', '/song/林俊杰-学不会.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (85, 9, '林俊杰-醉赤壁', '醉赤壁', '2019-06-02 20:08:45', '2019-06-02 20:08:45', '/img/songPic/109951163187405670.jpg', '[00:00.03]林俊杰 - 醉赤壁(《赤壁Online》网游主题曲)\n[00:00.20]词：方文山\n[00:00.30]曲：林俊杰\n[00:00.40]编曲：谢占隽\n[00:25.50]落叶堆积了好几层 而我踩过青春\n[00:32.01]听见 前世谁在泪语纷纷\n[00:40.10]一次缘分结一次绳 我今生还在等\n[00:46.69]一世 就只能有一次的认真\n[00:55.92]确认过眼神 我遇上对的人\n[01:01.64]我挥剑转身 而鲜血如红唇\n[01:08.26]前朝记忆渡红尘 伤人的不是刀刃\n[01:14.80]是你转世而来的魂\n[01:19.26]确认过眼神 我遇上对的人\n[01:24.98]我策马出征 马蹄声如泪奔\n[01:31.27]青石板上的月光照进这山城\n[01:37.83]我一路的跟 你轮回声\n[01:41.24]我对你用情极深\n[02:08.05]洛阳城旁的老树根 像回忆般延伸\n[02:14.39]你问 经过是谁的心跳声\n[02:22.62]我拿醇酒一坛饮恨 你那千年眼神\n[02:29.07]是我 醉醉坠入赤壁的 伤痕\n[02:38.36]确认过眼神 我遇上对的人\n[02:44.05]我挥剑转身 而鲜血如红唇\n[02:50.66]前朝记忆渡红尘 伤人的不是刀刃\n[02:57.24]是你转世而来的魂\n[03:01.73]确认过眼神 我遇上对的人\n[03:07.46]我策马出征 马蹄声如泪奔\n[03:13.74]青石板上的月光照进这山城\n[03:20.36]我一路的跟 你轮回声\n[03:23.66]我对你用情极深\n[03:30.86]确认过眼神 我遇上对的人\n[03:36.73]我策马出征 马蹄声如泪奔\n[03:42.87]青石板上的月光照进这山城\n[03:49.75]我一路的跟 你轮回声\n[03:52.90]我对你用情极深\n[03:58.65]我一路的跟 你轮回声\n[04:02.09]我对你用情极深', '/song/林俊杰-醉赤壁.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (86, 40, 'a_hisa - night', 'night', '2019-06-02 22:55:18', '2019-06-02 22:55:18', '/img/songPic/2505786999719472.jpg', '[00:00:00]轻音乐', '/song/a_hisa - night.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (87, 39, 'Yiruma - River Flows in You', 'River Flows in You', '2019-06-02 22:53:59', '2019-06-02 22:53:59', '/img/songPic/2324367581169008.jpg', '[00:00:00]轻音乐', '/song/Yiruma - River Flows in You.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (88, 38, 'Vince Zhang - G小调的巴赫 (Vince Moonrise Edit)', 'G小调的巴赫', '2019-06-02 22:52:39', '2019-06-02 22:52:39', '/img/songPic/109951162991116739.jpg', '[00:00:00]轻音乐', '/song/Vince Zhang - G小调的巴赫 (Vince Moonrise Edit).mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (89, 24, '胡歌-忘记时间', '忘记时间', '2019-06-02 20:17:24', '2019-06-02 20:17:24', '/img/songPic/46179488378975.jpg', '[00:03.25]胡歌 - 忘记时间\n[00:05.10]作词：孙艺\n[00:06.35]作曲：程振兴\n[00:32.76]沉默着走了有 多遥远\n[00:40.40]抬起头 蓦然间 才发现\n[00:47.38]一直倒退 倒退到原点\n[00:54.86]倔强坚持 对抗时间\n[01:02.43]说好了的永远 断了线\n[01:09.91]期许了 不变的 却都已改变\n[01:16.93]紧闭 双眼 才能看得见\n[01:23.94]那些曾经温暖 鲜艳过的画面\n[01:30.79]渐渐地忘记 赶不上明天\n[01:34.44]只要用力地抓紧了想念\n[01:38.51]明天再也 没有你的笑脸\n[01:45.49]渐渐地忘记 忘记了时间\n[01:49.26]我只要沿着记忆的路线\n[01:53.44]到最深处 纵然那只是瞬间\n[02:01.63]当眼泪 滑落的 是句点\n[02:08.88]心里面 始终你 从没有走远\n[02:15.67]耳边 誓言 还在回旋\n[02:22.91]我会好好珍惜 没有你的明天\n[02:59.43]渐渐地忘记 赶不上明天\n[03:02.93]只要用力地抓紧了想念\n[03:07.18]明天再也 没有你的笑脸\n[03:14.25]渐渐地忘记 忘记了时间\n[03:17.91]我只要沿着记忆的路线\n[03:22.17]到最深处 纵然那只是瞬间\n[03:28.91]渐渐地忘记 忘记了时间\n[03:32.59]我只要沿着记忆的路线\n[03:37.02]到最深处 纵然那只是瞬间', '/song/胡歌-忘记时间.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (90, 24, '胡歌-逍遥叹', '逍遥叹', '2019-06-02 20:18:26', '2019-06-02 20:18:26', '/img/songPic/109951163240682406.jpg', '[00:00.01]胡歌 - 逍遥叹\n[00:02.15]词：Funck\n[00:03.06]曲：Funck\n[00:24.97]岁月难得沉默\n[00:28.29]秋风厌倦漂泊\n[00:31.61]夕阳赖着不走\n[00:34.17]挂在墙头舍不得我\n[00:38.22]昔日伊人耳边话\n[00:41.60]已和潮声向东流\n[00:44.97]再回首往事也随\n[00:48.20]枫叶一片片落\n[00:51.88]爱已走到尽头\n[00:54.85]恨也放弃承诺\n[00:58.32]命运自认幽默想法太多\n[01:02.37]由不得我\n[01:04.91]壮志凌云几分愁\n[01:08.28]知己难逢几人留\n[01:11.54]再回首\n[01:13.25]却闻笑传醉梦中\n[01:19.58]笑叹词穷\n[01:21.65]古痴今狂终成空\n[01:26.09]刀钝刃乏恩断义绝\n[01:29.96]梦方破\n[01:32.83]路荒已叹饱览足迹\n[01:36.56]没人懂\n[01:39.44]多年望眼欲穿过\n[01:42.55]红尘滚滚我没看透\n[01:46.14]自嘲墨尽千情万怨\n[01:49.90]英杰愁\n[01:52.87]曲终人散发花鬓白\n[01:56.60]红颜殁\n[01:59.52]烛残未觉与日争辉\n[02:03.23]图消瘦\n[02:06.11]当泪干血隐狂涌\n[02:09.15]白雪纷飞都成空\n[02:38.49]爱已走到尽头\n[02:41.57]恨也放弃承诺\n[02:44.89]命运自认幽默想法太多\n[02:49.12]由不得我\n[02:51.82]壮志凌云几分愁知己\n[02:55.70]难逢几人留\n[02:58.21]再回首却闻笑传醉梦中\n[03:06.16]笑叹词穷古痴今狂终成空\n[03:12.83]刀钝刃乏恩断义绝梦方破\n[03:19.51]路荒已叹饱览足迹没人懂\n[03:26.12]多年望眼欲穿过\n[03:29.19]红尘滚滚我没看透\n[03:32.85]自嘲墨尽\n[03:34.94]千情万怨英杰愁\n[03:39.48]曲终人散发\n[03:41.94]花鬓白红颜殁\n[03:46.15]烛残未觉\n[03:48.23]与日争辉图消瘦\n[03:52.82]当泪干血隐狂涌\n[03:55.85]白雪纷飞都成空\n[03:59.47]笑叹词穷\n[04:01.50]古痴今狂终成空\n[04:06.16]刀钝刃乏恩断义绝\n[04:09.89]梦方破\n[04:12.75]路荒已叹饱览\n[04:15.69]足迹没人懂\n[04:19.44]多年望眼欲穿过\n[04:22.46]红尘滚滚我没看透\n[04:26.17]自嘲墨尽\n[04:28.30]千情万怨英杰愁\n[04:32.82]曲终人散\n[04:34.93]发花鬓白红颜殁\n[04:39.49]烛残未觉\n[04:41.63]与日争辉图消瘦\n[04:46.13]当泪干血隐狂涌\n[04:49.17]白雪纷飞都成空', '/song/胡歌-逍遥叹.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (91, 24, '胡歌-六月的雨', '六月的雨', '2019-06-02 17:34:16', '2019-06-02 18:07:07', '/img/songPic/109951163240682406.jpg', '[00:00.00] 暂无歌词', '/song/胡歌-六月的雨.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (92, 25, '陈势安-天后', '天后', '2019-06-02 20:25:37', '2019-06-02 20:25:37', '/img/songPic/109951163272878671.jpg', '[00:02.81]作词：彭学斌\n[00:04.61]作曲：彭学斌\n[00:24.96]终于找到借口\n[00:28.01]趁着醉意上心头\n[00:30.91]表达我所有感受\n[00:35.06]寂寞渐浓\n[00:37.36]沉默留在舞池角落\n[00:41.36]你说的太少或太多\n[00:44.71]都会让人更惶恐\n[00:49.02]谁任由谁放纵\n[00:51.97]谁会先让出自由\n[00:54.87]最后一定总是我\n[00:58.62]双脚悬空\n[01:01.27]在你冷酷热情间游走\n[01:05.52]被侵占所有还要笑着接受\n[01:10.72]我嫉妒你的爱气势如虹\n[01:16.67]像个人气高居不下的天后\n[01:22.68]你要的不是我而是一种虚荣\n[01:28.63]有人疼才显得多么出众\n[01:34.63]我陷入盲目狂恋的宽容\n[01:40.63]成全了你万众宠爱的天后\n[01:46.69]若爱只剩诱惑只剩彼此忍受\n[01:52.69]别再互相折磨\n[01:57.94]因为我们都有错\n[02:15.94]推开苍白的手\n[02:18.99]推开苍白的厮守\n[02:21.94]管你有多么失措\n[02:25.59]别再叫我\n[02:28.29]心软是最致命的脆弱\n[02:32.44]我明明都懂却仍拼死效忠\n[02:37.65]我嫉妒你的爱气势如虹\n[02:43.65]像个人气高居不下的天后\n[02:49.70]你要的不是我而是一种虚荣\n[02:55.65]有人疼才显得多么出众\n[03:01.65]我陷入盲目狂恋的宽容\n[03:07.65]成全了你万众宠爱的天后\n[03:13.75]若爱只剩诱惑只剩彼此忍受\n[03:19.70]别再互相折磨\n[03:24.90]因为我们都有错\n[03:49.70]如果有一天爱不再迷惑\n[03:55.65]足够去看清所有是非对错\n[04:01.75]直到那个时候你在我的心中\n[04:07.65]将不再被歌颂\n[04:13.75]把你当作天后\n[04:20.30]不会再是我', '/song/陈势安-天后.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (93, 26, '王菲-匆匆那年', '匆匆那年', '2019-06-02 20:26:21', '2019-06-02 20:26:21', '/img/songPic/2542070884980240.jpg', '[00:00.60]王菲 - 匆匆那年\n[00:01.60]词：林夕\n[00:02.60]曲：梁翘柏\n[00:28.68]匆匆那年我们\n[00:30.03]究竟说了几遍\n[00:31.49]再见之后再拖延\n[00:34.27]可惜谁有没有\n[00:35.53]爱过不是一场\n[00:36.83]七情上面的雄辩\n[00:39.62]匆匆那年我们\n[00:41.13]一时匆忙撂下\n[00:42.38]难以承受的诺言\n[00:45.49]只有等别人兑现\n[00:51.26]不怪那吻痕还\n[00:53.72]没积累成茧\n[00:56.63]拥抱着冬眠也没能\n[01:00.09]羽化再成仙\n[01:02.25]不怪这一段情\n[01:04.96]没空反复再排练\n[01:07.77]是岁月宽容恩赐\n[01:11.85]反悔的时间\n[01:18.70]如果再见不能红着眼\n[01:21.76]是否还能红着脸\n[01:24.82]就像那年匆促\n[01:26.22]刻下永远一起\n[01:27.62]那样美丽的谣言\n[01:30.03]如果过去还值得眷恋\n[01:33.40]别太快冰释前嫌\n[01:35.95]谁甘心就这样\n[01:39.03]彼此无挂也无牵\n[01:41.69]我们要互相亏欠\n[01:47.15]要不然凭何怀缅\n[01:58.60]匆匆那年我们\n[01:59.85]见过太少世面\n[02:01.00]只爱看同一张脸\n[02:04.07]那么莫名其妙\n[02:05.47]那么讨人欢喜\n[02:06.78]闹起来又太讨厌\n[02:09.84]相爱那年活该\n[02:11.14]匆匆因为我们\n[02:12.84]不懂顽固的诺言\n[02:15.36]只是分手的前言\n[02:21.16]不怪那天太冷\n[02:23.82]泪滴水成冰\n[02:26.73]春风也一样没\n[02:29.39]吹进凝固的照片\n[02:32.20]不怪每一个人\n[02:35.06]没能完整爱一遍\n[02:37.97]是岁月善意落下\n[02:41.93]残缺的悬念\n[02:48.82]如果再见不能红着眼\n[02:51.68]是否还能红着脸\n[02:54.88]就像那年匆促\n[02:56.09]刻下永远一起\n[02:57.35]那样美丽的谣言\n[02:59.91]如果过去还值得眷恋\n[03:03.12]别太快冰释前嫌\n[03:05.94]谁甘心就这样\n[03:08.90]彼此无挂也无牵\n[03:11.25]如果再见不能红着眼\n[03:14.11]是否还能红着脸\n[03:17.27]就像那年匆促\n[03:18.68]刻下永远一起\n[03:19.93]那样美丽的谣言\n[03:22.54]如果过去还值得眷恋\n[03:25.49]别太快冰释前嫌\n[03:28.40]谁甘心就这样\n[03:31.42]彼此无挂也无牵\n[03:34.18]我们要互相亏欠\n[03:39.83]我们要藕断丝连', '/song/王菲-匆匆那年.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (94, 26, '王菲-红豆', '红豆', '2019-06-02 20:27:14', '2019-06-02 20:27:14', '/img/songPic/2542070884980240.jpg', '[00:00.10]红豆 - 王菲\n[00:00.20]词：林夕\n[00:00.30]曲：柳重言\n[00:17.15]还没好好的感受\n[00:20.59]雪花绽放的气候\n[00:24.96]我们一起颤抖\n[00:28.03]会更明白 什么是温柔\n[00:33.59]还没跟你牵着手\n[00:37.72]走过荒芜的沙丘\n[00:42.10]可能从此以后 学会珍惜\n[00:47.42]天长和地久\n[00:50.74]有时候 有时候\n[00:54.93]我会相信一切有尽头\n[00:59.18]相聚离开 都有时候\n[01:03.62]没有什么会永垂不朽\n[01:07.88]可是我 有时候\n[01:12.01]宁愿选择留恋不放手\n[01:16.38]等到风景都看透\n[01:20.76]也许你会陪我 看细水长流\n[01:40.12]还没为你把红豆\n[01:46.38]熬成缠绵的伤口\n[01:50.69]然后一起分享\n[01:53.88]会更明白 相思的哀愁\n[01:59.20]还没好好的感受\n[02:03.57]醒着亲吻的温柔\n[02:07.76]可能在我左右\n[02:11.02]你才追求 孤独的自由\n[02:18.57]有时候 有时候\n[02:22.95]我会相信一切有尽头\n[02:27.14]相聚离开 都有时候\n[02:31.52]没有什么会永垂不朽\n[02:35.96]可是我 有时候\n[02:39.96]宁愿选择留恋不放手\n[02:44.34]等到风景都看透\n[02:48.53]也许你会陪我 看细水长流\n[03:07.93]有时候 有时候\n[03:12.13]我会相信一切有尽头\n[03:16.37]相聚离开 都有时候\n[03:20.69]没有什么会永垂不朽\n[03:25.01]可是我 有时候\n[03:29.26]宁愿选择留恋不放手\n[03:33.57]等到风景都看透\n[03:37.89]也许你会陪我 看细水长流', '/song/王菲-红豆.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (95, 32, 'Ramin Djawadi-The Children', 'The Children', '2019-06-02 17:42:56', '2019-06-02 18:06:50', '/img/songPic/6013229092830804.jpg', '[00:00.00] 暂无歌词', '/song/Ramin Djawadi-The Children.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (96, 33, '小林未郁-Perfect Time', 'Perfect Time', '2019-06-02 17:44:05', '2019-06-02 18:06:54', '/img/songPic/2539871862623611.jpg', '[00:00.00] 暂无歌词', '/song/小林未郁-Perfect Time.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (97, 34, 'Various Artists-Soundtrack', 'Zoosters Breakout', '2019-06-02 17:44:59', '2020-04-05 17:38:18', '/img/songPic/2539871861239300.jpg', '[00:00.00] 暂无歌词', '/song/Soundtrack-Zoosters Breakout.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (98, 35, '少女时代 - Oh!', 'Oh!', '2019-06-02 17:45:51', '2019-06-02 18:07:01', '/img/songPic/2529976256578329.jpg', '[00:00.00] 暂无歌词', '/song/少女时代 - Oh!.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (99, 36, 'The Piano Guys-Let It Go', '冰雪奇缘', '2019-06-02 22:41:30', '2019-06-02 22:41:30', '/img/songPic/109951163437997103.jpg', '[00:00:00]钢琴曲', '/song/The Piano Guys-Let It Go.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (100, 37, 'Peter Broderick - I Am Piano', 'I Am Piano', '2019-06-02 22:50:31', '2019-06-02 22:50:31', '/img/songPic/6661940953400245.jpg', '[00:00:00]轻音乐', '/song/Peter Broderick - I Am Piano.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (101, 38, 'Shayne Ward-Until You', 'Until You', '2019-06-02 23:37:53', '2019-06-02 23:37:53', '/img/songPic/18252992533269375.jpg', '[00:00:00]暂无歌词', '/song/Shayne Ward-Until You.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (102, 28, 'Celine Dion-My Heart Will Go On', 'My Heart Will Go On', '2019-06-02 23:39:37', '2019-06-02 23:39:37', '/img/songPic/813638604607979.jpg', '[00:00:00]暂无歌词', '/song/Celine Dion-My Heart Will Go On.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (103, 39, '倪椤 - 疯狂的法老', '疯狂的法老', '2019-06-03 01:27:43', '2019-06-03 01:27:43', '/img/songPic/109951162945634228.jpg', '[00:00:00]暂无歌词', '/song/倪椤 - 疯狂的法老.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (104, 40, '群星 - aloha heja he', 'aloha heja he', '2019-06-03 01:30:42', '2019-06-03 01:30:42', '/img/songPic/109951163926969186.jpg', '[00:00:00]暂无歌词', '/song/群星 - aloha heja he.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (105, 29, '胡伟立 - 侠风', '侠风', '2019-06-03 01:33:36', '2019-06-03 01:33:36', '/img/songPic/2537672838499056.jpg', '[00:00:00]暂无歌词', '/song/胡伟立 - 侠风.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (106, 29, '胡伟立 - 嬉戏', '嬉戏', '2019-06-03 01:34:22', '2019-06-03 01:34:22', '/img/songPic/2537672838499056.jpg', '[00:00:00]暂无歌词', '/song/胡伟立 - 嬉戏.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (107, 43, 'Jessica - Falling Crazy in Love', 'Falling Crazy in Love', '2019-06-03 01:35:45', '2019-06-03 01:35:45', '/img/songPic/1366692963716373.jpg', '[00:00:00]暂无歌词', '/song/Jessica - Falling Crazy in Love.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (108, 40, 'Josh Ritter - Change of Time', 'Change of Time', '2019-06-03 01:36:53', '2019-06-03 01:36:53', '/img/songPic/2532175279910174.jpg', '[00:00:00]暂无歌词', '/song/Josh Ritter - Change of Time.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (109, 40, 'Josh Ritter - Darlin', 'Darlin', '2019-06-03 01:37:14', '2019-06-03 01:37:14', '/img/songPic/2532175279910174.jpg', '[00:00:00]暂无歌词', '/song/Josh Ritter - Darlin.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (110, 29, '胡伟立 - 太极乐', '太极乐', '2019-06-03 01:37:45', '2020-04-05 16:46:18', '/img/songPic/2537672838499056.jpg', '[00:00:00]暂无歌词', '/song/武聆音雄 - 太极乐.mp3', 0, 0, 0, 0, NULL);
INSERT INTO `song` VALUES (112, 41, 'Tone Damli Aaberge - Stupid', 'Stupid', '2019-06-03 01:38:40', '2019-06-03 01:38:40', '/img/songPic/1775711278864263.jpg', '[00:00:00]暂无歌词', '/song/Tone Damli Aaberge - Stupid.mp3', 0, 0, 1, 1, NULL);

-- ----------------------------
-- Table structure for song_like
-- ----------------------------
DROP TABLE IF EXISTS `song_like`;
CREATE TABLE `song_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_id` int NOT NULL COMMENT '歌曲ID',
  `today_likes` int NULL DEFAULT 0 COMMENT '今日点赞数',
  `total_likes` int NULL DEFAULT 0 COMMENT '总点赞数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_song_id`(`song_id` ASC) USING BTREE,
  INDEX `idx_today_likes`(`today_likes` DESC) USING BTREE,
  INDEX `idx_total_likes`(`total_likes` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '歌曲点赞统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_like
-- ----------------------------
INSERT INTO `song_like` VALUES (1, 12, 31, 99, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (2, 13, 43, 159, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (3, 113, 1, 1, '2025-06-22 15:16:56', '2025-06-22 15:32:08');
INSERT INTO `song_like` VALUES (4, 112, 1, 1, '2025-06-22 15:16:56', '2025-06-22 15:32:01');
INSERT INTO `song_like` VALUES (5, 1, 19, 93, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (6, 2, 18, 42, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (7, 3, 32, 80, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (8, 4, 4, 22, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (9, 5, 24, 120, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (10, 6, 8, 134, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (11, 7, 17, 59, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (12, 8, 12, 144, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (13, 9, 9, 93, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (14, 10, 5, 32, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (15, 11, 1, 32, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (16, 14, 38, 115, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (17, 15, 35, 177, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (18, 16, 11, 42, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (19, 17, 49, 77, '2025-06-22 15:16:56', '2025-06-23 10:10:10');
INSERT INTO `song_like` VALUES (20, 18, 11, 57, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (21, 19, 7, 154, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (22, 20, 1, 149, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (23, 21, 33, 181, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (24, 22, 12, 161, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (25, 23, 10, 159, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (26, 24, 15, 16, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (27, 25, 45, 51, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (28, 26, 29, 59, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (29, 27, 7, 136, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (30, 28, 50, 159, '2025-06-22 15:16:56', '2025-06-23 15:09:52');
INSERT INTO `song_like` VALUES (31, 29, 27, 36, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (32, 30, 36, 52, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (33, 31, 0, 0, '2025-06-22 15:16:56', '2025-06-22 21:52:13');
INSERT INTO `song_like` VALUES (34, 32, 36, 111, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (35, 33, 32, 93, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (36, 34, 4, 84, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (37, 35, 20, 90, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (38, 36, 40, 149, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (39, 37, 38, 73, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (40, 38, 19, 167, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (41, 39, 30, 66, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (42, 40, 41, 77, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (43, 41, 18, 91, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (44, 42, 15, 121, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (45, 43, 21, 35, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (46, 44, 10, 63, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (47, 45, 38, 110, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (48, 46, 6, 57, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (49, 47, 18, 58, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (50, 48, 20, 69, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (51, 49, 45, 171, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (52, 50, 15, 49, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (53, 51, 38, 131, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (54, 52, 46, 109, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (55, 53, 14, 49, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (56, 54, 32, 168, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (57, 55, 18, 143, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (58, 56, 45, 112, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (59, 57, 19, 132, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (60, 58, 10, 74, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (61, 59, 43, 174, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (62, 60, 34, 50, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (63, 61, 40, 174, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (64, 62, 48, 73, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (65, 63, 21, 45, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (66, 64, 9, 54, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (67, 65, 33, 36, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (68, 67, 38, 70, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (69, 68, 39, 188, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (70, 69, 33, 85, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (71, 70, 44, 156, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (72, 71, 22, 128, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (73, 72, 29, 74, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (74, 73, 29, 84, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (75, 74, 8, 148, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (76, 75, 1, 89, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (77, 76, 29, 50, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (78, 77, 44, 185, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (79, 78, 33, 74, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (80, 79, 32, 114, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (81, 80, 10, 148, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (82, 81, 2, 145, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (83, 82, 32, 34, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (84, 83, 2, 36, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (85, 84, 14, 26, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (86, 85, 15, 122, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (87, 86, 30, 83, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (88, 87, 7, 99, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (89, 88, 44, 46, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (90, 89, 48, 82, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (91, 90, 7, 23, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (92, 91, 42, 170, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (93, 92, 37, 178, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (94, 93, 7, 29, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (95, 94, 25, 162, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (96, 95, 1, 22, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (97, 96, 0, 0, '2025-06-22 15:16:56', '2025-06-22 21:51:07');
INSERT INTO `song_like` VALUES (98, 97, 8, 69, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (99, 98, 44, 64, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (100, 99, 44, 110, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (101, 100, 37, 160, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (102, 101, 2, 118, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (103, 102, 0, 0, '2025-06-22 15:16:56', '2025-06-22 21:50:50');
INSERT INTO `song_like` VALUES (104, 103, 35, 141, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (105, 104, 29, 80, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (106, 105, 42, 129, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (107, 106, 21, 152, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (108, 107, 28, 124, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (109, 108, 27, 114, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (110, 109, 2, 148, '2025-06-22 15:16:56', '2025-06-22 15:43:16');
INSERT INTO `song_like` VALUES (111, 110, 26, 47, '2025-06-22 15:16:56', '2025-06-22 15:43:16');

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `pic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '歌单图片',
  `introduction` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '简介',
  `style` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '风格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '歌单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (1, 'The Good, the Bad and the Ugly', '/img/songListPic/a32415ca9a21f6f9a1d99b2731f224b5d319c424.jpg', 'he Good, the Bad and the Ugly: Original Motion Picture Soundtrack was released in 1966 alongside the Western film, The Good, the Bad and the Ugly, directed by Sergio Leone. The score is composed by frequent Leone collaborator Ennio Morricone, whose distinctive original compositions, containing gunfire, whistling, and yodeling permeate the film. The main theme, resembling the howling of a coyote, is a two-note melody that is a frequent motif, and is used for the three main characters, with a different instrument used for each one: flute for Blondie (Man With No Name), Arghilofono (Ocarina) for Angel Eyes, and human voices for Tuco.', '欧美-轻音乐');
INSERT INTO `song_list` VALUES (2, '年轻之歌 有关爱与挑衅', '/img/songListPic/wv2NdfZrUnLDSwk_kQoSZg==_109951163751040922.jpg', '那些喜欢到会循环播放的歌', '华语');
INSERT INTO `song_list` VALUES (3, '希望十八岁你爱的人是八十岁在你身边的人', '/img/songListPic/q0ZyCw22PCiTG2LX_A2kew==_109951163594989759.jpg', '让你怦然心动', '华语');
INSERT INTO `song_list` VALUES (4, '你的青春里有没有属于你的一首歌？', '/img/songListPic/109951163271025942.jpg', '关于青春里的那首歌，唱的是你和谁的回忆呢？那年你们有什么故事？\n\n总是有许多的记忆，是关于青春的。\n\n青春时埋下的那份躁动，总会在多年后，装饰着笑容。\n\n总是有许多的遗憾，是关于青春的。\n\n青春时还没来得及表达的情感，总会在多年以后，偶尔的左右着悲欢。\n\n那些最美年华里的相遇，那些青春里的不知所措，都被勾勒成了一幅幅画。\n\n而这些画，只在心情最愉悦时，只在心情最低落时，悄悄的，在内心深处闪过。', '华语');
INSERT INTO `song_list` VALUES (5, '那些喜欢到循环播放的歌', '/img/songListPic/109951163609743240.jpg', '那些喜欢到会循环播放的歌\n\n感谢收听', '华语');
INSERT INTO `song_list` VALUES (6, '林俊杰的正确打开方式【路人请参考简介】', '/img/songListPic/19080924789030458.jpg', '这是一个一定要顺序播放并且不切歌才能发现其中奥妙的歌单。\n这是一个可以完美呈现林俊杰音乐态度的歌单。\n这是一个林俊杰的立体化打开方式。', '华语');
INSERT INTO `song_list` VALUES (7, '高 级 感 vlog 纯音乐 BGM', '/img/songListPic/vLSB9-NGsd4CLYf_4ShGww==_109951163609572271.jpg', '歌单', '轻音乐');
INSERT INTO `song_list` VALUES (8, '世界上很好听的纯音乐(经典不朽)', '/img/songListPic/92NWlGo76ha-if-WMK3vCg==_1410673428769729.jpg', '歌单', '轻音乐');
INSERT INTO `song_list` VALUES (9, '『粤语』好听到爆的粤语歌单', '/img/songListPic/QHD2Uy2y9ktndbK1UKgdgg==_18611433325258133.jpg', '歌单', '粤语');
INSERT INTO `song_list` VALUES (10, '韩剧OST｜祝你走过半生，仍有颗少女心', '/img/songListPic/zhunizouguobansheng.jpg', '歌单', '日韩');
INSERT INTO `song_list` VALUES (11, '我喜欢你，喜欢没用，没用也喜欢', '/img/songListPic/109951163919069037.jpg', '情不知所起，一往而情深。\n伤不知所因，痛彻心扉\n\n从前你是我心上的一束光，倾世温暖。\n现在你是我心里的一根刺，刻骨铭心。\n以后你是我心底的一粒尘，无关痛痒。\n\n我喜欢你，喜欢没用，没用也喜欢', '华语');
INSERT INTO `song_list` VALUES (12, '生活感到疲惫的话就听这些歌吧', '/img/songListPic/109951163936991203.jpg', '当你感到疲惫的时候\n睡一个沉稳的觉醒来\n和陌生人对视互笑\n买一杯刚好温度的奶茶\n吃到合口味的菜\n遇见喜欢人的时候自己是最美的状态\n下雨 清晨 初雪 深夜 亲吻 拥抱 牵手 大笑\n快乐总被说很难\n但我希望你顶...', '华语');
INSERT INTO `song_list` VALUES (13, '熬夜和想你，我都该戒掉了', '/img/songListPic/109951163216834301.jpg', '命运似乎是一个轮回，在一次次的偶然下，平行线交叉，再平行，故事始终有\"然后\"，可后来的我们，都学会如何去爱了吗？\n\n如果当时你没走，后来的我们会不会不一样。或许，我们每个人都想回到故事最开始的地方。', '华语');
INSERT INTO `song_list` VALUES (14, '怀旧向||时光流转从前，人生如寄', '/img/songListPic/109951163443093546.jpg', '岁月悠扬，娓娓动听\n在流失了的记忆之中\n听到属于我们这一代人的歌\n想起属于我们这一代人的路\n愿\n星辰大海\n春暖花开', '华语');
INSERT INTO `song_list` VALUES (15, '不曾刻骨铭心，为何念念不忘？', '/img/songListPic/109951163887710551.jpg', '“所爱隔山海 山海皆可平”\n你拒绝的 不珍惜的 不代表别人也不喜欢\n人生都是向前走的 我们都一样\n\n谁先认真谁先输，我只能说我输了\n再忙碌还是会想你 真的不明白\n都说未曾刻骨铭心，又为何总是念念不忘', '华语');
INSERT INTO `song_list` VALUES (16, '社会语录！土嗨', '/img/songListPic/109951163858422257.jpg', '社会！', '华语');
INSERT INTO `song_list` VALUES (17, '听青春ost，心悸的时光里有你', '/img/songListPic/109951163826485303.jpg', '我们青春就像是被大雨淋湿的自己，即使是感冒了，也愿意再淋一次。只有爱过了，伤过了，痛过了，这才叫青春。', '华语');
INSERT INTO `song_list` VALUES (18, '【经典】聼一首老歌，想念一段时光', '/img/songListPic/109951163311246502.jpg', '寂静的黄昏，总让人怀念，总是深深沦陷...\n那些个细数光阴在手中沉淀的日子，一去不复返...\n偶尔，我一个人站在黄昏的角落，代替你主持夕阳的葬礼...\n想着想着，痛凝重了时间，曳落了容颜...\n青春的羽翼...', '华语');
INSERT INTO `song_list` VALUES (19, '华语百首｜好听的才是耳朵最想要的', '/img/songListPic/109951163597665130.jpg', '好听的音乐才是耳朵最想要的', '华语');
INSERT INTO `song_list` VALUES (20, '【华语抒情-林俊杰】—孤独，是我的享受', '/img/songListPic/109951163826685601.jpg', '我喜欢孤独，不与任何人说话，在一份静谧中安然地做自己喜欢的事。任身心徜徉，暂时忘却“柴米油盐酱醋茶”的烦琐，去体验“琴棋书画诗酒花”的高雅；暂时抛开追名逐利的忙碌奔波，去感受心无杂念的宁静淡泊；暂时摆脱困扰你的喜怒哀乐，去体味生活中的充实祥和。', '华语');
INSERT INTO `song_list` VALUES (21, '睡觉必备心灵鸡汤', '/img/songListPic/109951163879964479.jpg', '缓缓的声音，流进心里的枯井', '轻音乐');
INSERT INTO `song_list` VALUES (22, '愿山野浓雾都有路灯 风雨漂泊都有归舟', '/img/songListPic/109951163594594622.jpg', '你慢慢走\n回忆暗涌\n悲喜翻滚', '华语');
INSERT INTO `song_list` VALUES (23, '「女声控」音色沁人心 旋律美如画', '/img/songListPic/109951163098238240.jpg', '女声控福利来啦-=≡Σ((( つ•̀ω•́)つ', '欧美');
INSERT INTO `song_list` VALUES (24, 'Moombahton 丨电流律动的异域风', '/img/songListPic/109951163500933771.jpg', 'Moombahton融合了Dutch House和Reggaeton，常常带有Trap的元素，特别是在Bulid Up部分，厚实的Bass与密集的打击鼓点，节拍丰富，加上旋律和音色比较异域，一般都有人声部分，其BPM多数基于110，更突出在Drop高潮，让人不禁联想抖动的节奏。', '欧美');
INSERT INTO `song_list` VALUES (25, '【励志电音】愿你身披星芒 执笔为剑', '/img/songListPic/109951163321304060.jpg', '为了父母期待的目光\n为了那深藏于你心底的梦想\n为了你朝思暮想的那个可望而不可及...', '欧美');
INSERT INTO `song_list` VALUES (26, '史诗 • 神级BGM丨灵魂的震颤&心灵的洗涤', '/img/songListPic/109951163692248020.jpg', '随着一声怒吼，千军万马进行着一场浩荡的战争，马的嘶吼声与兵器碰撞的金属声谱写着一部史前的震撼。\n欢迎来到此歌单，晚上睡觉别点开！\n别点开！\n别点开！', 'BGM');
INSERT INTO `song_list` VALUES (27, '全球超大气势磅礴背景音乐精选100首合集', '/img/songListPic/109951163579465390.jpg', '熟悉的感觉，你值得拥有', 'BGM');
INSERT INTO `song_list` VALUES (28, '史诗级震撼人心大气磅礴超燃BGM', '/img/songListPic/109951163618525359.jpg', '史诗级震撼人心超燃BGM,每首都是本人精心挑选和最喜欢的，歌单歌曲是按我个人喜欢排序，持续更新中……', 'BGM');
INSERT INTO `song_list` VALUES (29, '肾上腺素飙升（赛车必备）', '/img/songListPic/109951163578540101.jpg', '赛车运动，自吸为王，涡轮必胜.', 'BGM');
INSERT INTO `song_list` VALUES (30, '『欧美神曲』让你怦然心动', '/img/songListPic/109951163621168769.jpg', '让你怦然心动', '欧美');
INSERT INTO `song_list` VALUES (31, '健身丨做自己平凡世界的超级英雄', '/img/songListPic/109951163670223947.jpg', '热爱健身的朋友们一起嗨！', 'BGM');
INSERT INTO `song_list` VALUES (32, '『空灵欧美』论◎怎样唱出星辰大海', '/img/songListPic/109951163921593479.jpg', '“我们在哪里？”\n\n“星空，是星空！美丽而触手可及！”\n\n“这里，是星辰大海，是你小时候的幻想……”', '欧美');
INSERT INTO `song_list` VALUES (33, 'Space Club 蹦迪', '/img/songListPic/109951163738160487.jpg', 'Sapce Clup全球百大DJ丨Urumqi', 'BGM');
INSERT INTO `song_list` VALUES (34, '那些超带感的英文歌曲~『一秒沦陷』', '/img/songListPic/109951163736178562.jpg', '每天，都要去去做一些枯燥的事\n一些让人心烦的事\n可是又不得不去做\n一切都在重复\n都在复制、粘贴，复制、粘贴……\n何必不去做那些让人愉快的事呢\n比如说\n听歌\n它能让生活有趣起来\n有意义起来\n那么就去欣赏...', '欧美');
INSERT INTO `song_list` VALUES (35, '【游戏原声】屏幕之后，更是另一个世界', '/img/songListPic/109951163408189924.jpg', '我们曾与白狼一起踏上寻找女儿的征途\n走遍大陆与史凯利杰群岛，寻遍北方诸国与尼弗迦德 甘当布尔维坎的屠夫\n只为那因意外率而与自己命运相连的辛特拉幼狮\n只为那曾在布洛克莱昂森林惊慌失措的小女孩\n重回自...', 'BGM');
INSERT INTO `song_list` VALUES (36, '极致旋律&空灵飘纱', '/img/songListPic/109951163672593019.jpg', '心在寂静之中冒着烟 寻找安寄所', '欧美');
INSERT INTO `song_list` VALUES (37, '我们的心如此自由 思绪辽远无边', '/img/songListPic/109951163932838310.jpg', '我想每个人的心底，都潜藏着一个向往远方的梦，此处已无再多风景，熟悉的地方也不再有惊喜。人心思动，都渴望去流浪天涯，无论以哪种方式。', '欧美');
INSERT INTO `song_list` VALUES (38, '欧美精选 | 嗨 伙计 要来首10w+吗？', '/img/songListPic/109951163414509421.jpg', '个别曲目未收录很可能是由于我没买人家的专辑 emmmm.... \n没买就是没买。没兴趣，不想买，买不起，这答案您满意吗？', '欧美');
INSERT INTO `song_list` VALUES (39, '「高质量英文歌」让你单曲循环的英文歌', '/img/songListPic/18814842976746273.jpg', 'I love the endless sea, I love the rain softly, I love flying snow, I love bringing a bright full moon, but I love the starry night sky.', '欧美');
INSERT INTO `song_list` VALUES (40, '稀 | 奇 | 古 | 怪 | 音 | 效 | 工 | 厂', '/img/songListPic/109951163462173993.jpg', '不好意思 在我耳朵化掉之前是能数清的\n\n麻烦大家帮黑哥数数\n\n这些里面藏了多少个稀奇古怪的音效\n\n听归听 收藏某首歌之后我也不知道明天你的日推怎么作妖哈', '欧美');
INSERT INTO `song_list` VALUES (41, '〖欧美女声〗 倾城一刻，我似乎更懂你', '/img/songListPic/18591642116274551.jpg', '个性，风格，颜值，行为，年龄段……差不多的人，听歌的兴趣差不多哦', '欧美');
INSERT INTO `song_list` VALUES (42, '『电影配乐』当优雅华尔兹遇上激情探戈', '/img/songListPic/109951163904955394.jpg', '华尔兹有着与生俱来的华贵与优雅。简约却不简单的舞步透出的是舞者相互心灵的体会与传达……', '欧美');
INSERT INTO `song_list` VALUES (43, '妄想去流浪，独自陶醉在自己的世界里。', '/img/songListPic/109951163543366840.jpg', '生活乏味 ，学习一直倒退，工作失意。\n害怕失去，想像和现实的差距将我打败。\n我想要远离这里。', '轻音乐');
INSERT INTO `song_list` VALUES (44, '晚安曲丨我温柔而通透的小宇宙', '/img/songListPic/109951163646671507.jpg', '晚安～今夜好梦啊！', '轻音乐');
INSERT INTO `song_list` VALUES (45, '晚安曲丨我温柔而通透的小宇宙', '/img/songListPic/109951163808060526.jpg', '你别怕，总有人熬夜陪你，下雨接你，说我爱你，好的总是压箱底\n当一个人能够影响你心情的时候，说明你在乎了；\n当一个人能赚到你眼泪的时候，说明你投入了；\n当一个人能驾驭你情绪的时候，说明你沦陷...', '轻音乐');
INSERT INTO `song_list` VALUES (46, '性欲与孤独，容易让人误解爱情', '/img/songListPic/109951163924312766.jpg', '平常拍片子时，我喜欢在拍摄现场放一些有画面感的音乐让模特找感觉，抽空整理了一下近期的播放列表，做了这套新歌单，或许适合姑娘们在以下一些场景聆听', '轻音乐');
INSERT INTO `song_list` VALUES (47, '人生就要嗨', '/img/songListPic/109951163938242029.jpg', '我命由我不由天', '日韩-BGM');
INSERT INTO `song_list` VALUES (48, '吃鸡必备BGM', '/img/songListPic/109951163776201870.jpg', '大吉大利 今晚吃鸡\n此歌单适合在素质广场，飞机上，杀完人后，轰炸区天选之人的情况下播放，并不是让你全程听音乐玩游戏。', 'BGM');
INSERT INTO `song_list` VALUES (49, '伤感日语 · 芳华少女的孤独内心', '/img/songListPic/109951163942747948.jpg', 'お母さん', '日韩');
INSERT INTO `song_list` VALUES (50, '「予你情书」明年一起去看樱花吧', '/img/songListPic/19079825277149145.jpg', '想和你去看樱花\n看夏日的烟火大会\n看秋日京都岚山的枫叶\n和冬日落雪的小樽\n\n想和你一起去看一场樱花\n看漫天的飞舞的樱花在我们周围\n就这样安静地待着也好彼此交换心事\n\n想予你一封情书\n写尽关于我们的一切...', '日韩');
INSERT INTO `song_list` VALUES (51, '那些年我们听过的韩国歌', '/img/songListPic/18804947371714354.jpg', 'J.Fla，原名Kim Jung Hwa，韩国歌手,歌曲制作人。2013年正式出道并发行首张原创EP《바보 같은 Story》出道后不久就迅速在日本和韩国成为热门话题\n2016年，J.Fla的翻唱作品在国内转载而得到关注，因其甜美声线和惊艳侧颜得到许多人的喜爱。', '日韩');
INSERT INTO `song_list` VALUES (52, '小众而惊艳 ·韩国独立音乐精选集', '/img/songListPic/109951163833244126.jpg', '在无数的灰色版权中找到了它们。\n宝藏一般的旋律，它们不应该被如此埋没。', '日韩');
INSERT INTO `song_list` VALUES (53, '一秒就会中毒的韩语歌单~', '/img/songListPic/109951163515798929.jpg', '愿对这世界温柔以待的人 被温柔以待.', '日韩');
INSERT INTO `song_list` VALUES (54, '［韩语］少女情怀总是诗~', '/img/songListPic/109951162839104712.jpg', '希望所有的少女心事都能梦想成真', '日韩');
INSERT INTO `song_list` VALUES (55, '【燃向】 精选燃曲', '/img/songListPic/19085322835476516.jpg', '封面画师 bilibili Wlop', 'BGM');
INSERT INTO `song_list` VALUES (56, '日系燃向丨此刻光辉 将引领着我们', '/img/songListPic/109951163097151464.jpg', '天空燃尽如灰，\n繁星烧毁似尘，\n那些音乐所带来的力量，化作为光，将引领着我们前行！', '日韩-BGM');
INSERT INTO `song_list` VALUES (57, '日系』有一种调皮叫小清新~', '/img/songListPic/19152393044479439.jpg', '阳光明媚的日子\n心情好到爆炸\n总想要找支歌来抒发一下感情，分享自己的喜悦。\n虽然我听不懂日语，但是并不影响我喜欢它的调皮与清新，舒服的日系小调，让人心情变好~\n\n阳光灿烂，微风拂面，大概就是这个歌单给人的感觉吧~', '日韩');
INSERT INTO `song_list` VALUES (58, '【日系抒情】早晚终相会 忧思情愈深', '/img/songListPic/109951163802235324.jpg', '瀬を早み 岩にせかるる 滝川の\nわれても末に 逢はむとぞ思ふ', '日韩-轻音乐');
INSERT INTO `song_list` VALUES (59, '日系沙哑女声| 愿这份歌声融化你的心', '/img/songListPic/109951163862683663.jpg', '相信大家都听过沙哑的歌吧，majiko，aimer大家都很熟悉了吧。\n\n这种嗓音真的超温柔呀，这个单选出了些沙哑声线歌手的歌，希望大家喜欢。\n\n愿这温柔的声音可以用听觉的方式带给你一场现实上和想象上的一种迷离感，同时陷入一种与女声错觉般的邂逅。\n\np站id:73189154 画师:gomzi', '日韩');
INSERT INTO `song_list` VALUES (60, '『韩语』 感性伴秋风渐起 随秋意渐浓', '/img/songListPic/109951163606909947.jpg', '走过林荫道\n落叶从眼前划过\n才晓得秋天已经降临了一段时间\n我静静看着你的日子\n似乎还是昨天\n你回头看向别处的那个瞬间\n却已经成为今天\n\n若我们离别\n不要说Good bye\n说See you吧\n如同再次光临的秋天一样\n总...', '日韩');
INSERT INTO `song_list` VALUES (61, '韩‖轻柔小调，治愈系旋律', '/img/songListPic/19053436998325469.jpg', '我爬上全世界的屋顶，\n带着全部的清醒和一只酒瓶。\n— — 张艾嘉《我站在全世界的屋顶》', '日韩-轻音乐');
INSERT INTO `song_list` VALUES (62, '听首老歌 回味永不褪色的华语经典', '/img/songListPic/109951163203287436.jpg', '回味光辉岁月三十年\n\n岁月是一场充满告别的旅程\n\n怀旧\n不是因为那个时代多美好\n而是那时\n你正年轻\n\n百许流年忆往事\n千几往事暖流年', '粤语');
INSERT INTO `song_list` VALUES (63, '【粤语】要有多坚强，才敢念念不忘', '/img/songListPic/18878614648960788.jpg', '你说\n你不愿意种花\n我不愿看见它\n一点点的凋落\n是的\n为了避免结束\n你避免了一切\n也避免了所有\n\n开始\n你说你喜欢雨滴\n但是你在下雨的时候打伞\n你说你喜欢太阳\n但是你在阳光明媚的时候\n躲在阴凉的地方 \n你说...', '粤语');
INSERT INTO `song_list` VALUES (64, '初听不知曲中意 再听已是曲中人', '/img/songListPic/19101815510024256.jpg', '有时候听到一首歌，觉得旋律很好，歌词很好。但怎么也不能体会到，歌里唱的感情。后来有一天，你遇到了一个人，发生了一段故事。当你再听到那首歌时，就会觉得歌里唱的，都是你的故事。\n每一首你喜欢的歌曲，都附有非一般的意义，因为都唱出了你内心的声音和过往经历，其实你听到的都是你自己，那些年你累积在心里的所有欢乐悲伤，所有故事过往。', '粤语');
INSERT INTO `song_list` VALUES (65, '粤语男声：我爱你依旧如初，不曾改变。', '/img/songListPic/18612532836990988.jpg', '记得曾经看过一段话：爱情不是抱一抱，亲一亲，改个情侣网名，换个情侣头像，就是情侣了...', '粤语');
INSERT INTO `song_list` VALUES (66, '『粤语』虐到心痛的曲 听到泪落的词', '/img/songListPic/3434874325869351.jpg', '此歌单多为小众粤语，听过太多评论999+的人人传颂的经典歌曲，每次淘到一首鲜为人知人的歌曲，都会非常的惊喜，听歌嘛，最重要的就是自己听着觉得舒服就对啦，不一定非要高热度的啦。此歌单内歌曲不仅旋律打动人心，每首歌词都超虐心，痴情人的爱有时候那么卑微，低到尘埃里，爱到不死不休.....有时候看着歌词听着这些歌情不自禁泪奔，烦请听歌的人，千万不要对号入座，伤害指数超高! 绝对不容错过的小众粤语!', '粤语');
INSERT INTO `song_list` VALUES (67, '富士山下钟无艳 吴哥窟内我本人', '/img/songListPic/109951162869937004.jpg', '男不听七友 女不听钟无艳', '粤语');
INSERT INTO `song_list` VALUES (68, '流行男声||谦谦君子，情浓粤语', '/img/songListPic/109951163193554791.jpg', '慧极必伤，情深不寿，强极则辱，谦谦君子，温润如玉！细数那些唯美男声', '粤语');
INSERT INTO `song_list` VALUES (69, '粤语live||赛赢录音棚流行live', '/img/songListPic/109951163196627760.jpg', '听腻了录影棚里的无杂音歌声？也许换成live会是心的开始', '粤语');
INSERT INTO `song_list` VALUES (70, '从未跟你饮过冰 零度天气看风景', '/img/songListPic/109951163933917463.jpg', '这个世界烂透了 坏透了 我都接受\n\n所有人都习惯于流于表面的热情和爱意 我也接受\n\n但你不行 你得是那个例外才行', '粤语');
INSERT INTO `song_list` VALUES (71, '「致青春」粤语带你回忆', '/img/songListPic/109951163024198570.jpg', '歌听多了 粤语也熟了 \n越听越有感觉', '粤语');
INSERT INTO `song_list` VALUES (72, 'Beyond的辉煌岁月是人生旅途的伴奏', '/img/songListPic/109951163278666363.jpg', 'Beyond是那种有自己独特的风格，有自己的精神，能象征一个时代，也能映射一类人的组合。他们的歌带入感很强，总有共鸣产生，因为他们没有无病呻吟的悲情，也不爱写迎合大众的爱情故事，而是用自己的歌词和声音在诠释着生活，激励着人生', '粤语');
INSERT INTO `song_list` VALUES (73, '听说，钢琴和民谣也很搭配', '/img/songListPic/109951163503924397.jpg', '我们始终会远行，也可能，在最遥远最陌生的地方感知另一个自己，最后发现丢失了好久的钥匙就藏在自己的口袋里', '乐器-轻音乐');
INSERT INTO `song_list` VALUES (74, '新古典钢琴 散落的时光', '/img/songListPic/109951163401615779.jpg', '当时间走过 其风猎猎\n\n覆灭仅存的模糊记忆使昨日土崩瓦解\n\n其实没有什么好担忧的\n\n在生命的内里 不是还有许多\n\n继续延展着的细微线索\n\n以祖先的容颜 来将你形塑\n\n当时间走过 其声簌簌\n\n如狼群之迅疾穿越秋...', '乐器-轻音乐');
INSERT INTO `song_list` VALUES (75, '流行歌曲钢琴演奏', '/img/songListPic/18577348464819001.jpg', '大都是一些华语流行歌曲的钢琴版，也含有少部分这些弹奏者自己创造的钢琴曲与一些他们翻奏的世界较为有名的钢琴曲，希望你们喜欢～\n前50首为精选，请不要错过哦～', '乐器');
INSERT INTO `song_list` VALUES (76, '『钢琴』与流行歌曲的完美邂逅', '/img/songListPic/5832909185359651.jpg', '选集是华语流行音乐的钢琴版，或许你会更喜欢钢琴演奏的故事', '乐器');
INSERT INTO `song_list` VALUES (77, '治愈钢琴｜伟大的时光和伟大的我们', '/img/songListPic/109951162895796021.jpg', '从钢琴的旋律和节奏中慢慢释怀、也许还有所领悟\n钢琴的世界里还有很多很多让人驻足停歇的地方\n如同我们在生活经历中面对的许许多多的小挫折之后\n也要找个角...', '乐器');
INSERT INTO `song_list` VALUES (78, '写作业专用BGM（钢琴向）', '/img/songListPic/1390882211100783.jpg', '暂时停更啦 我来排排顺序', '乐器-轻音乐');
INSERT INTO `song_list` VALUES (79, '钢琴的故事', '/img/songListPic/18731280092485571.jpg', '你一定和我一样有烦恼和故事吧', '乐器');
INSERT INTO `song_list` VALUES (80, '各种乐器演绎流行曲', '/img/songListPic/3416182643161526.jpg', '乐器成精系列之用各种成精乐器重新演绎这些流行歌曲，让你耳目一新', '乐器');
INSERT INTO `song_list` VALUES (81, '听, 吉他在唱歌', '/img/songListPic/1390882209600111343.jpg', '听吉他谱写那些熟悉的旋律，遇见不一样的感动，电吉他、尤克里里会客串哦', '乐器');
INSERT INTO `song_list` VALUES (82, '还不快去练琴？', '/img/songListPic/19169985230816413.jpg', '都是自己很喜欢的吉他指弹', '乐器');
INSERT INTO `song_list` VALUES (83, '国风传统器乐赏~~♪', '/img/songListPic/18907201951803673.jpg', '中国音乐是光辉灿烂的中国文化的一个重要组成部分。当古典音乐流泻而出的一刹那间，你可以清楚的看到，在空气中流动的是高山、是流水、是丝竹、是冬雪、是千古的生命，那份说不出、道不尽的感动，就是中国古典音乐之美。', '乐器');
INSERT INTO `song_list` VALUES (84, '『钢琴纯音』八十八个黑白键勾勒出的美', '/img/songListPic/109951162873752063.jpg', '钢琴如生活，是一首永远弹不完的小曲', '轻音乐-乐器');

-- ----------------------------
-- Table structure for song_type
-- ----------------------------
DROP TABLE IF EXISTS `song_type`;
CREATE TABLE `song_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '音乐类型id',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_type
-- ----------------------------
INSERT INTO `song_type` VALUES (1, '随心听', 'https://y.qq.com/music/common/upload/t_music_radio/1260297.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (2, '抖音神曲', 'https://y.qq.com/music/common/upload/t_music_radio/2054458.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (3, '深度睡眠', 'https://y.qq.com/music/common/upload/t_music_radio/3188826.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (4, '情感治愈站', 'https://y.qq.com/music/common/upload/t_music_radio/2929760.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (5, 'KTV必点歌', 'https://y.qq.com/music/common/upload/t_music_radio/2054525.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (6, '经典', 'https://y.qq.com/music/common/upload/t_music_radio/2054444.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (7, '网络流行', 'https://y.qq.com/music/common/upload/t_music_radio/2054505.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (8, '宝宝胎教', 'https://y.qq.com/music/common/upload/t_music_radio/4488415.jpeg');
INSERT INTO `song_type` VALUES (9, 'DJ舞曲', 'https://y.qq.com/music/common/upload/t_music_radio/2054474.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (10, '助眠白噪音', 'https://y.qq.com/music/common/upload/t_music_radio/3171367.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (11, '热歌', 'https://y.qq.com/music/common/upload/t_music_radio/2054413.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (12, '忧伤', 'https://y.qq.com/music/common/upload/t_music_radio/1829116.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (13, '快乐', 'https://y.qq.com/music/common/upload/t_music_radio/1829120.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (14, '平静', 'https://y.qq.com/music/common/upload/t_music_radio/1829086.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (15, '兴奋', 'https://y.qq.com/music/common/upload/t_music_radio/1829133.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (16, '寂寞', 'https://y.qq.com/music/common/upload/t_music_radio/1829073.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (17, '治愈', 'https://y.qq.com/music/common/upload/t_music_radio/1829079.jpg?max_age=2592000');
INSERT INTO `song_type` VALUES (18, '情歌', 'https://y.qq.com/music/common/upload/t_music_radio/2054429.jpg?max_age=2592000');

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标题id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (1, '热门');
INSERT INTO `title` VALUES (2, '主题');
INSERT INTO `title` VALUES (3, '心情');
INSERT INTO `title` VALUES (4, '场景');
INSERT INTO `title` VALUES (5, '曲风');
INSERT INTO `title` VALUES (6, '语言');
INSERT INTO `title` VALUES (7, '人群');
INSERT INTO `title` VALUES (8, '乐器');
INSERT INTO `title` VALUES (9, '陪你听');
INSERT INTO `title` VALUES (10, '厂牌');

-- ----------------------------
-- Table structure for type_song
-- ----------------------------
DROP TABLE IF EXISTS `type_song`;
CREATE TABLE `type_song`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `song_id` int NULL DEFAULT NULL COMMENT '歌曲id',
  `type_id` int NULL DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_song
-- ----------------------------
INSERT INTO `type_song` VALUES (1, 1, 1);
INSERT INTO `type_song` VALUES (2, 2, 1);
INSERT INTO `type_song` VALUES (3, 3, 1);
INSERT INTO `type_song` VALUES (4, 4, 1);
INSERT INTO `type_song` VALUES (5, 5, 1);
INSERT INTO `type_song` VALUES (6, 6, 1);
INSERT INTO `type_song` VALUES (7, 7, 1);
INSERT INTO `type_song` VALUES (8, 8, 1);
INSERT INTO `type_song` VALUES (9, 9, 1);
INSERT INTO `type_song` VALUES (10, 10, 1);

-- ----------------------------
-- Table structure for type_title
-- ----------------------------
DROP TABLE IF EXISTS `type_title`;
CREATE TABLE `type_title`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title_id` int NOT NULL COMMENT '标题id',
  `type_id` int NOT NULL COMMENT '类型id',
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_title
-- ----------------------------
INSERT INTO `type_title` VALUES (1, 1, 1);
INSERT INTO `type_title` VALUES (2, 1, 2);
INSERT INTO `type_title` VALUES (3, 1, 3);
INSERT INTO `type_title` VALUES (4, 1, 4);
INSERT INTO `type_title` VALUES (5, 1, 5);
INSERT INTO `type_title` VALUES (6, 1, 6);
INSERT INTO `type_title` VALUES (7, 2, 7);
INSERT INTO `type_title` VALUES (8, 2, 2);
INSERT INTO `type_title` VALUES (9, 2, 3);
INSERT INTO `type_title` VALUES (10, 2, 9);
INSERT INTO `type_title` VALUES (11, 2, 10);
INSERT INTO `type_title` VALUES (12, 3, 11);
INSERT INTO `type_title` VALUES (13, 3, 13);
INSERT INTO `type_title` VALUES (14, 3, 6);
INSERT INTO `type_title` VALUES (15, 3, 7);
INSERT INTO `type_title` VALUES (16, 4, 14);
INSERT INTO `type_title` VALUES (17, 4, 15);
INSERT INTO `type_title` VALUES (18, 4, 16);
INSERT INTO `type_title` VALUES (19, 4, 4);
INSERT INTO `type_title` VALUES (20, 5, 11);
INSERT INTO `type_title` VALUES (21, 5, 2);
INSERT INTO `type_title` VALUES (22, 5, 12);
INSERT INTO `type_title` VALUES (23, 6, 10);
INSERT INTO `type_title` VALUES (24, 6, 11);
INSERT INTO `type_title` VALUES (25, 6, 3);
INSERT INTO `type_title` VALUES (26, 6, 4);
INSERT INTO `type_title` VALUES (27, 7, 6);
INSERT INTO `type_title` VALUES (28, 7, 7);
INSERT INTO `type_title` VALUES (29, 8, 1);
INSERT INTO `type_title` VALUES (30, 8, 12);
INSERT INTO `type_title` VALUES (31, 8, 4);
INSERT INTO `type_title` VALUES (32, 9, 15);
INSERT INTO `type_title` VALUES (33, 9, 2);
INSERT INTO `type_title` VALUES (34, 9, 17);
INSERT INTO `type_title` VALUES (35, 9, 4);
INSERT INTO `type_title` VALUES (36, 10, 1);
INSERT INTO `type_title` VALUES (37, 10, 12);
INSERT INTO `type_title` VALUES (38, 10, 11);
INSERT INTO `type_title` VALUES (39, 1, 6);
INSERT INTO `type_title` VALUES (40, 1, 8);
INSERT INTO `type_title` VALUES (41, 1, 9);
INSERT INTO `type_title` VALUES (42, 1, 11);
INSERT INTO `type_title` VALUES (43, 1, 12);
INSERT INTO `type_title` VALUES (44, 1, 14);
INSERT INTO `type_title` VALUES (45, 1, 15);
INSERT INTO `type_title` VALUES (46, 1, 16);
INSERT INTO `type_title` VALUES (47, 1, 17);
INSERT INTO `type_title` VALUES (48, 10, 8);
INSERT INTO `type_title` VALUES (49, 10, 2);
INSERT INTO `type_title` VALUES (50, 10, 5);
INSERT INTO `type_title` VALUES (51, 10, 7);
INSERT INTO `type_title` VALUES (52, 10, 4);

-- ----------------------------
-- Table structure for vedio
-- ----------------------------
DROP TABLE IF EXISTS `vedio`;
CREATE TABLE `vedio`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `v_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频名称',
  `v_author` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `v_playback` int NOT NULL COMMENT '播放量',
  `v_createtime` date NOT NULL COMMENT '创建时间',
  `v_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频图片',
  `v_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频地址',
  `regionid` int NOT NULL COMMENT '区域id',
  `versionid` int NOT NULL COMMENT '版本id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vedio
-- ----------------------------
INSERT INTO `vedio` VALUES (35, '09ae2ee5ee5b95902cbfe8a72d41aa3b', 'Panjy', 918, '2025-06-22', '/vedio/09ae2ee5ee5b95902cbfe8a72d41aa3b.jpg', '/vedio/09ae2ee5ee5b95902cbfe8a72d41aa3b.mp4', 14, 1);
INSERT INTO `vedio` VALUES (36, '0d6004f97f7e88392d5f5c078efbab0b', 'Panjy', 761, '2025-06-22', '/vedio/0d6004f97f7e88392d5f5c078efbab0b.jpg', '/vedio/0d6004f97f7e88392d5f5c078efbab0b.mp4', 14, 1);
INSERT INTO `vedio` VALUES (37, '2b50adf1f0d6df742317820c00120ba9', 'Panjy', 459, '2025-06-22', '/vedio/2b50adf1f0d6df742317820c00120ba9.jpg', '/vedio/2b50adf1f0d6df742317820c00120ba9.mp4', 14, 1);
INSERT INTO `vedio` VALUES (38, '3323b86bc92b6850ebd5d92050ba8cb6', 'Panjy', 64, '2025-06-22', '/vedio/3323b86bc92b6850ebd5d92050ba8cb6.jpg', '/vedio/3323b86bc92b6850ebd5d92050ba8cb6.mp4', 14, 1);
INSERT INTO `vedio` VALUES (39, '5cc0cf6dacfd7dd2c69a6b457d7f96a8', 'Panjy', 234, '2025-06-22', '/vedio/5cc0cf6dacfd7dd2c69a6b457d7f96a8.jpg', '/vedio/5cc0cf6dacfd7dd2c69a6b457d7f96a8.mp4', 14, 1);
INSERT INTO `vedio` VALUES (40, '66ef954cc8218700d38d6b244f05fa89', 'Panjy', 322, '2025-06-22', '/vedio/66ef954cc8218700d38d6b244f05fa89.jpg', '/vedio/66ef954cc8218700d38d6b244f05fa89.mp4', 14, 1);
INSERT INTO `vedio` VALUES (41, '7eefe3a855fef8d6c9189f41ef9ee29e', 'Panjy', 654, '2025-06-22', '/vedio/7eefe3a855fef8d6c9189f41ef9ee29e.jpg', '/vedio/7eefe3a855fef8d6c9189f41ef9ee29e.mp4', 14, 1);
INSERT INTO `vedio` VALUES (42, '杭州', 'Panjy', 170, '2025-06-22', '/vedio/7ef93fd71056db82c871ce36da4c11c0.jpg', '/vedio/7ef93fd71056db82c871ce36da4c11c0.mp4', 14, 1);
INSERT INTO `vedio` VALUES (43, '84bbaed1f49cf795317e7d8ca7f9086a', 'Panjy', 965, '2025-06-22', '/vedio/84bbaed1f49cf795317e7d8ca7f9086a.jpg', '/vedio/84bbaed1f49cf795317e7d8ca7f9086a.mp4', 14, 1);
INSERT INTO `vedio` VALUES (44, '9b43af31943681c05d02fa9528354af5', 'Panjy', 587, '2025-06-22', '/vedio/9b43af31943681c05d02fa9528354af5.jpg', '/vedio/9b43af31943681c05d02fa9528354af5.mp4', 14, 1);
INSERT INTO `vedio` VALUES (45, '济南CCPC', 'Panjy', 808, '2025-06-22', '/vedio/b935c3182243c724d2ed2f8dde81d290.jpg', '/vedio/b935c3182243c724d2ed2f8dde81d290.mp4', 14, 1);
INSERT INTO `vedio` VALUES (46, '刀怒斩逆徒', 'Panjy', 673, '2025-06-22', '/vedio/bd003792363d984e3ec1c4167ae0dedc.jpg', '/vedio/bd003792363d984e3ec1c4167ae0dedc.mp4', 14, 1);
INSERT INTO `vedio` VALUES (49, '泸州老窖', 'Panjy', 533, '2025-06-22', '/vedio/ed345c1845b3d1c33731ede9ac22b4f1.jpg', '/vedio/ed345c1845b3d1c33731ede9ac22b4f1.mp4', 14, 1);
INSERT INTO `vedio` VALUES (50, '塔山', 'Panjy', 269, '2025-06-22', '/vedio/fdbe3dea7f16c88a09f1f22b0f9eea84.jpg', '/vedio/fdbe3dea7f16c88a09f1f22b0f9eea84.mp4', 14, 1);

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '版本id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES (1, '全部');
INSERT INTO `version` VALUES (2, 'MV');
INSERT INTO `version` VALUES (3, '现场');
INSERT INTO `version` VALUES (4, '翻唱');
INSERT INTO `version` VALUES (5, '舞蹈');
INSERT INTO `version` VALUES (6, '影视');
INSERT INTO `version` VALUES (7, '综艺');
INSERT INTO `version` VALUES (8, '儿歌');

SET FOREIGN_KEY_CHECKS = 1;
