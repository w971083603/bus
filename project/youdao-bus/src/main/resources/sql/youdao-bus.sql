/*
 Navicat Premium Data Transfer

 Source Server         : 47.94.83.94
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 47.94.83.94:3306
 Source Schema         : youdao-bus

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 16/03/2019 20:07:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_config
-- ----------------------------
DROP TABLE IF EXISTS `m_config`;
CREATE TABLE `m_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `minute` int(11) NULL DEFAULT NULL COMMENT '司机端倒计时过期分钟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_config
-- ----------------------------
INSERT INTO `m_config` VALUES (1, 10);

-- ----------------------------
-- Table structure for m_modules
-- ----------------------------
DROP TABLE IF EXISTS `m_modules`;
CREATE TABLE `m_modules`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问URL',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级节点ID',
  `module_type` int(11) NULL DEFAULT 1 COMMENT '枚举（1：菜单 2：按钮）',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标CSS',
  `seq` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `open_mode` int(11) NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '资源状态（0：有效 1：无效）',
  `opened` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源模块' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_modules
-- ----------------------------
INSERT INTO `m_modules` VALUES (1, '订单管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (2, '订单列表', 'order/order', 1, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (3, '订单查询', '', 2, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (4, '订单审核', '', 2, 2, 'examine', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (10, '车队入住管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 1, 0);
INSERT INTO `m_modules` VALUES (11, '车队入住列表', 'fleet/fleet', 10, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 1, 0);
INSERT INTO `m_modules` VALUES (12, '车队入住审核', '', 11, 2, 'examine', '', 0, 0, 1, 0);
INSERT INTO `m_modules` VALUES (13, '车队入住查询', '', 11, 1, 'search', '', 0, 0, 1, 0);
INSERT INTO `m_modules` VALUES (20, '账号管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (21, '账号列表', 'user/systemuser', 20, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (22, '账号新增', '', 21, 2, 'add', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (23, '账号查询', '', 21, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (24, '账号修改', '', 21, 2, 'update', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (30, '角色管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (31, '角色列表', 'user/rolelist', 30, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (32, '角色新增', '', 31, 2, 'add', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (33, '角色查询', '', 31, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (34, '角色修改', '', 31, 2, 'update', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (40, '客服管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (41, '客服列表', 'user/kflist', 40, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (42, '客服新增', '', 41, 2, 'add', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (43, '客服查询', '', 41, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (44, '客服修改', '', 41, 2, 'update', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (50, '系统管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (51, '问题反馈', 'system/problemlist', 50, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (52, '问题反馈查询', '', 51, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (53, '消息提醒', 'system/massagelist', 50, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (54, '消息提醒查询', '', 53, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (55, '发送消息', '', 53, 2, 'add', '', 0, 0, 1, 0);
INSERT INTO `m_modules` VALUES (56, '车队管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (57, '车队列表', 'user/buslist', 56, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (58, '车队新增', '', 57, 2, 'add', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (59, '车队查询', '', 57, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (60, '车队修改', '', 57, 2, 'update', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (61, '注册用户管理', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (62, '注册用户列表', 'user/userlist', 61, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (63, '注册用户查询', '', 61, 2, 'search', '', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (64, '车队时间设置', '', 0, 1, 'look', 'fa fa-user', 0, 0, 0, 0);
INSERT INTO `m_modules` VALUES (65, '车队过期时间设置', 'config/config', 64, 1, 'look', 'fa fa-calendar-check-o', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for m_role_modules
-- ----------------------------
DROP TABLE IF EXISTS `m_role_modules`;
CREATE TABLE `m_role_modules`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '角色ID',
  `module_id` bigint(20) NULL DEFAULT NULL COMMENT '模块ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wy_rm`(`role_id`, `module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 612 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_role_modules
-- ----------------------------
INSERT INTO `m_role_modules` VALUES (554, 1, 1);
INSERT INTO `m_role_modules` VALUES (555, 1, 2);
INSERT INTO `m_role_modules` VALUES (556, 1, 3);
INSERT INTO `m_role_modules` VALUES (557, 1, 4);
INSERT INTO `m_role_modules` VALUES (558, 1, 10);
INSERT INTO `m_role_modules` VALUES (559, 1, 11);
INSERT INTO `m_role_modules` VALUES (560, 1, 12);
INSERT INTO `m_role_modules` VALUES (561, 1, 13);
INSERT INTO `m_role_modules` VALUES (562, 1, 20);
INSERT INTO `m_role_modules` VALUES (563, 1, 21);
INSERT INTO `m_role_modules` VALUES (564, 1, 22);
INSERT INTO `m_role_modules` VALUES (565, 1, 23);
INSERT INTO `m_role_modules` VALUES (566, 1, 24);
INSERT INTO `m_role_modules` VALUES (567, 1, 30);
INSERT INTO `m_role_modules` VALUES (568, 1, 31);
INSERT INTO `m_role_modules` VALUES (569, 1, 32);
INSERT INTO `m_role_modules` VALUES (570, 1, 33);
INSERT INTO `m_role_modules` VALUES (571, 1, 34);
INSERT INTO `m_role_modules` VALUES (572, 1, 40);
INSERT INTO `m_role_modules` VALUES (573, 1, 41);
INSERT INTO `m_role_modules` VALUES (574, 1, 42);
INSERT INTO `m_role_modules` VALUES (575, 1, 43);
INSERT INTO `m_role_modules` VALUES (576, 1, 44);
INSERT INTO `m_role_modules` VALUES (577, 1, 50);
INSERT INTO `m_role_modules` VALUES (578, 1, 51);
INSERT INTO `m_role_modules` VALUES (579, 1, 52);
INSERT INTO `m_role_modules` VALUES (580, 1, 53);
INSERT INTO `m_role_modules` VALUES (581, 1, 54);
INSERT INTO `m_role_modules` VALUES (601, 1, 55);
INSERT INTO `m_role_modules` VALUES (602, 1, 56);
INSERT INTO `m_role_modules` VALUES (603, 1, 57);
INSERT INTO `m_role_modules` VALUES (604, 1, 58);
INSERT INTO `m_role_modules` VALUES (605, 1, 59);
INSERT INTO `m_role_modules` VALUES (606, 1, 60);
INSERT INTO `m_role_modules` VALUES (607, 1, 61);
INSERT INTO `m_role_modules` VALUES (608, 1, 62);
INSERT INTO `m_role_modules` VALUES (609, 1, 63);
INSERT INTO `m_role_modules` VALUES (610, 1, 64);
INSERT INTO `m_role_modules` VALUES (611, 1, 65);
INSERT INTO `m_role_modules` VALUES (593, 2, 1);
INSERT INTO `m_role_modules` VALUES (594, 2, 2);
INSERT INTO `m_role_modules` VALUES (595, 2, 3);
INSERT INTO `m_role_modules` VALUES (596, 2, 4);
INSERT INTO `m_role_modules` VALUES (597, 2, 10);
INSERT INTO `m_role_modules` VALUES (598, 2, 11);
INSERT INTO `m_role_modules` VALUES (599, 2, 12);
INSERT INTO `m_role_modules` VALUES (600, 2, 13);

-- ----------------------------
-- Table structure for m_role_user
-- ----------------------------
DROP TABLE IF EXISTS `m_role_user`;
CREATE TABLE `m_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色关联用户表',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `write_by` bigint(20) NULL DEFAULT NULL,
  `write_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role_user
-- ----------------------------
INSERT INTO `m_role_user` VALUES (1, 1, 1, 1, '2018-06-29 12:50:10', 1, '2018-06-29 23:13:09');
INSERT INTO `m_role_user` VALUES (7, 4, 2, 1, '2018-07-18 18:29:28', 1, '2018-07-18 18:29:28');
INSERT INTO `m_role_user` VALUES (8, 5, 3, 1, '2018-07-18 18:42:41', 1, '2018-07-18 18:42:41');

-- ----------------------------
-- Table structure for m_roles
-- ----------------------------
DROP TABLE IF EXISTS `m_roles`;
CREATE TABLE `m_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '记录是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_roles
-- ----------------------------
INSERT INTO `m_roles` VALUES (1, '超级管理员', '2017-08-12 06:28:02', '2017-08-12 06:28:09', 0);
INSERT INTO `m_roles` VALUES (2, '客服', '2017-10-01 05:13:40', '2018-07-18 13:01:24', 0);
INSERT INTO `m_roles` VALUES (3, '測試', '2018-07-18 18:42:16', '2018-07-18 18:42:16', 0);

-- ----------------------------
-- Table structure for m_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `m_sys_user`;
CREATE TABLE `m_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10000' COMMENT '组织编号',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MD5加密',
  `user_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `last_time` datetime(0) NULL DEFAULT NULL,
  `last_by` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of m_sys_user
-- ----------------------------
INSERT INTO `m_sys_user` VALUES (1, 'admin', '1', 'http://203.195.152.189:8080/lot_images/dc30659dca2b495c8e610666f466f8fb.jpg?1530701392699', '超级管理员', '15260282340', 'e10adc3949ba59abbe56e057f20f883e', '0', '', '2017-10-31 22:57:30', NULL, '2018-04-02 11:44:24', 1);
INSERT INTO `m_sys_user` VALUES (4, 'YW002', '83389', NULL, '高和通', '15260282340', 'e10adc3949ba59abbe56e057f20f883e', '0', '', '2018-07-18 18:29:27', 1, '2018-07-18 18:29:27', 1);
INSERT INTO `m_sys_user` VALUES (5, '222', '573104', NULL, '', '15260282340', 'e10adc3949ba59abbe56e057f20f883e', '0', '', '2018-07-18 18:42:41', 1, '2018-07-18 18:42:41', 1);

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '途径地址表',
  `order_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单uuid',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (41, '20180809085811936', '宁波市区', '2018-08-09 08:58:11');
INSERT INTO `t_address` VALUES (42, '20180809110200601', '啊实打实的', '2018-08-09 11:02:00');
INSERT INTO `t_address` VALUES (43, '20180809032112732', '小白鹭', '2018-08-09 15:21:12');
INSERT INTO `t_address` VALUES (44, '20180811030018957', '泰顺 福鼎', '2018-08-11 15:00:18');
INSERT INTO `t_address` VALUES (45, '20180812041422861', '大罗山', '2018-08-12 16:14:22');
INSERT INTO `t_address` VALUES (46, '20180813114839336', '测试', '2018-08-13 23:48:39');
INSERT INTO `t_address` VALUES (47, '20180815014200662', '温州', '2018-08-15 13:42:00');
INSERT INTO `t_address` VALUES (48, '20180819114718937', '测试', '2018-08-19 11:47:18');
INSERT INTO `t_address` VALUES (49, '20180927105657011', '宁波', '2018-09-27 10:56:57');
INSERT INTO `t_address` VALUES (50, '20180927105657011', '普陀山', '2018-09-27 10:56:57');
INSERT INTO `t_address` VALUES (51, '20180927105657011', '西湖', '2018-09-27 10:56:57');

-- ----------------------------
-- Table structure for t_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '常用联系方式',
  `user_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uuid',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_del` int(11) NULL DEFAULT 0 COMMENT '是否删除，0-不删除，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contact
-- ----------------------------
INSERT INTO `t_contact` VALUES (2, 'c302f0ff8d3240b9a243a4297680c090', '1', '2', '2018-07-21 18:19:17', 0);
INSERT INTO `t_contact` VALUES (3, 'c302f0ff8d3240b9a243a4297680c090', '2', '2', '2018-07-21 18:19:30', 0);
INSERT INTO `t_contact` VALUES (6, 'c302f0ff8d3240b9a243a4297680c090', '222', '1112222', '2018-07-21 18:38:01', 0);
INSERT INTO `t_contact` VALUES (7, 'c9fd0279293a408687c5a598c817c9de', '斯超', '13757743578', '2018-07-22 15:08:54', 0);
INSERT INTO `t_contact` VALUES (8, 'c9fd0279293a408687c5a598c817c9de', '童哲', '13456010828', '2018-07-22 15:09:18', 0);
INSERT INTO `t_contact` VALUES (9, '06684d83ce39403d9fb06d6603f3e476', '张斌', '13957721053', '2018-08-11 13:33:22', 0);

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '反馈建议',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型，包车，单接送',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈建议',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uuid，反馈人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_fleet
-- ----------------------------
DROP TABLE IF EXISTS `t_fleet`;
CREATE TABLE `t_fleet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '车队管理',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人电话',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队信息',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `aduit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `aduit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `aduit_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `status` int(11) NULL DEFAULT 1 COMMENT '审核状态，1-待审核，2-审核通过，3-审核不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_invoice`;
CREATE TABLE `t_invoice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '发票',
  `user_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uuid',
  `invoice_header` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `invoice_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `invoice_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `invoice_duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税号',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_massage
-- ----------------------------
DROP TABLE IF EXISTS `t_massage`;
CREATE TABLE `t_massage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息',
  `user_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户uuid',
  `massage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `is_yorn` int(11) NULL DEFAULT NULL COMMENT '是否已读，0-未读，1-已读',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除，0-不删除，1-删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `write_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 762 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_massage
-- ----------------------------
INSERT INTO `t_massage` VALUES (117, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180809085811936正在报价中,请前往参加', 0, 0, '2018-08-09 09:02:23', NULL);
INSERT INTO `t_massage` VALUES (118, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180809085811936正在报价中,请前往参加', 0, 0, '2018-08-09 09:02:23', NULL);
INSERT INTO `t_massage` VALUES (119, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180809085811936正在报价中,请前往参加', 0, 0, '2018-08-09 09:02:24', NULL);
INSERT INTO `t_massage` VALUES (120, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180809085811936正在报价中,请前往参加', 0, 0, '2018-08-09 09:02:24', NULL);
INSERT INTO `t_massage` VALUES (121, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180809085811936正在报价中,请前往参加', 0, 0, '2018-08-09 09:02:24', NULL);
INSERT INTO `t_massage` VALUES (122, '6811fad9861c4784991cc965c0e13419', '【就道巴士】订单【20180809085811936】订车成功。', 0, 0, '2018-08-09 09:06:52', NULL);
INSERT INTO `t_massage` VALUES (123, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单【20180809085811936】订车成功，联系电话：18606639590，联系人：吴正章。', 0, 0, '2018-08-09 09:06:53', NULL);
INSERT INTO `t_massage` VALUES (124, '6811fad9861c4784991cc965c0e13419', '【就道巴士】你的订单【20180809085811936】的车辆车牌号：浙C58587，司机联系电话：18606639590', 0, 0, '2018-08-09 09:07:57', NULL);
INSERT INTO `t_massage` VALUES (130, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180809110200601正在报价中,请前往参加', 0, 0, '2018-08-09 11:06:11', NULL);
INSERT INTO `t_massage` VALUES (131, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180809110200601正在报价中,请前往参加', 0, 0, '2018-08-09 11:06:11', NULL);
INSERT INTO `t_massage` VALUES (132, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180809110200601正在报价中,请前往参加', 0, 0, '2018-08-09 11:06:11', NULL);
INSERT INTO `t_massage` VALUES (133, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180809110200601正在报价中,请前往参加', 0, 0, '2018-08-09 11:06:11', NULL);
INSERT INTO `t_massage` VALUES (134, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180809110200601正在报价中,请前往参加', 0, 0, '2018-08-09 11:06:11', NULL);
INSERT INTO `t_massage` VALUES (135, '6811fad9861c4784991cc965c0e13419', '【就道巴士】订单【20180809110200601】订车成功。', 0, 0, '2018-08-09 11:08:13', NULL);
INSERT INTO `t_massage` VALUES (136, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180809110200601】订车成功，联系电话：18606639590，联系人：吴政璋。', 0, 0, '2018-08-09 11:08:13', NULL);
INSERT INTO `t_massage` VALUES (137, '5681094a077c4abdb2b52b88d0c91ba1', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 12:10:39', NULL);
INSERT INTO `t_massage` VALUES (138, '974c30d3398547d393f914d37a922433', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 13:44:09', NULL);
INSERT INTO `t_massage` VALUES (139, '1602f4c9449640a086bde613769f5d69', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 13:46:32', NULL);
INSERT INTO `t_massage` VALUES (140, '723a7eb55a7c458eb1c46c18475e1d4a', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 14:18:12', NULL);
INSERT INTO `t_massage` VALUES (141, 'f85b8dc6c7f14edda9fa179903f24cd7', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 14:30:01', NULL);
INSERT INTO `t_massage` VALUES (142, 'bba3e8f961a74acc87378b43d613ca06', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 15:06:43', NULL);
INSERT INTO `t_massage` VALUES (143, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:25', NULL);
INSERT INTO `t_massage` VALUES (144, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:25', NULL);
INSERT INTO `t_massage` VALUES (145, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:25', NULL);
INSERT INTO `t_massage` VALUES (146, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:25', NULL);
INSERT INTO `t_massage` VALUES (147, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:25', NULL);
INSERT INTO `t_massage` VALUES (148, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:26', NULL);
INSERT INTO `t_massage` VALUES (149, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-21 09:00:00, 出发地址：浙江温州大象城, 目的地地址：福建宁德九鲤溪, 用车数量：54座', 0, 0, '2018-08-09 15:21:26', NULL);
INSERT INTO `t_massage` VALUES (150, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:16', NULL);
INSERT INTO `t_massage` VALUES (151, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:16', NULL);
INSERT INTO `t_massage` VALUES (152, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:16', NULL);
INSERT INTO `t_massage` VALUES (153, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:16', NULL);
INSERT INTO `t_massage` VALUES (154, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:16', NULL);
INSERT INTO `t_massage` VALUES (155, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:17', NULL);
INSERT INTO `t_massage` VALUES (156, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180809032112732正在报价中,请前往参加', 0, 0, '2018-08-09 15:26:17', NULL);
INSERT INTO `t_massage` VALUES (157, '172a126883824d19ab541bc6d417e97c', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-09 16:17:29', NULL);
INSERT INTO `t_massage` VALUES (158, '83e2b86881b341818c0aaf469ddac894', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-10 15:36:59', NULL);
INSERT INTO `t_massage` VALUES (159, '2ceaa2135e7349a6a9556590f3dd1388', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-10 18:11:00', NULL);
INSERT INTO `t_massage` VALUES (160, '18278ae4c6574279a9a8ea785df8d457', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-11 11:43:32', NULL);
INSERT INTO `t_massage` VALUES (161, '44c66991f6904eecba0c6fafda7316c5', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-11 12:13:49', NULL);
INSERT INTO `t_massage` VALUES (162, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:00', NULL);
INSERT INTO `t_massage` VALUES (163, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:00', NULL);
INSERT INTO `t_massage` VALUES (164, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:00', NULL);
INSERT INTO `t_massage` VALUES (165, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:00', NULL);
INSERT INTO `t_massage` VALUES (166, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:00', NULL);
INSERT INTO `t_massage` VALUES (167, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:01', NULL);
INSERT INTO `t_massage` VALUES (168, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州鹿城区世纪广场, 目的地地址：浙江舟山宁波朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:33:01', NULL);
INSERT INTO `t_massage` VALUES (169, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:51', NULL);
INSERT INTO `t_massage` VALUES (170, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:51', NULL);
INSERT INTO `t_massage` VALUES (171, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:51', NULL);
INSERT INTO `t_massage` VALUES (172, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:52', NULL);
INSERT INTO `t_massage` VALUES (173, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:52', NULL);
INSERT INTO `t_massage` VALUES (174, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:52', NULL);
INSERT INTO `t_massage` VALUES (175, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811123252613正在报价中,请前往参加', 0, 0, '2018-08-11 12:37:52', NULL);
INSERT INTO `t_massage` VALUES (176, '06684d83ce39403d9fb06d6603f3e476', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-11 12:44:21', NULL);
INSERT INTO `t_massage` VALUES (177, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (178, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (179, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (180, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (181, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (182, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:09', NULL);
INSERT INTO `t_massage` VALUES (183, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-18 08:00:00, 出发地址：浙江温州世纪广场, 目的地地址：浙江舟山朱家尖, 用车数量：38座', 0, 0, '2018-08-11 12:46:10', NULL);
INSERT INTO `t_massage` VALUES (184, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:53', NULL);
INSERT INTO `t_massage` VALUES (185, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:53', NULL);
INSERT INTO `t_massage` VALUES (186, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:54', NULL);
INSERT INTO `t_massage` VALUES (187, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:54', NULL);
INSERT INTO `t_massage` VALUES (188, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:54', NULL);
INSERT INTO `t_massage` VALUES (189, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:54', NULL);
INSERT INTO `t_massage` VALUES (190, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811124602373正在报价中,请前往参加', 0, 0, '2018-08-11 12:50:54', NULL);
INSERT INTO `t_massage` VALUES (191, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:37', NULL);
INSERT INTO `t_massage` VALUES (192, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:37', NULL);
INSERT INTO `t_massage` VALUES (193, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:37', NULL);
INSERT INTO `t_massage` VALUES (194, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:38', NULL);
INSERT INTO `t_massage` VALUES (195, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:38', NULL);
INSERT INTO `t_massage` VALUES (196, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:38', NULL);
INSERT INTO `t_massage` VALUES (197, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江台州蛇蟠岛，国清寺，石梁飞瀑, 用车数量：34座', 0, 0, '2018-08-11 13:19:38', NULL);
INSERT INTO `t_massage` VALUES (198, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:45', NULL);
INSERT INTO `t_massage` VALUES (199, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:45', NULL);
INSERT INTO `t_massage` VALUES (200, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:46', NULL);
INSERT INTO `t_massage` VALUES (201, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:46', NULL);
INSERT INTO `t_massage` VALUES (202, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:46', NULL);
INSERT INTO `t_massage` VALUES (203, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:46', NULL);
INSERT INTO `t_massage` VALUES (204, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-08 07:30:00, 出发地址：浙江温州双屿, 目的地地址：浙江丽水箬寮，古堰画乡, 用车数量：34座', 0, 0, '2018-08-11 13:21:46', NULL);
INSERT INTO `t_massage` VALUES (205, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:19', NULL);
INSERT INTO `t_massage` VALUES (206, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:19', NULL);
INSERT INTO `t_massage` VALUES (207, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:20', NULL);
INSERT INTO `t_massage` VALUES (208, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:20', NULL);
INSERT INTO `t_massage` VALUES (209, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:20', NULL);
INSERT INTO `t_massage` VALUES (210, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:20', NULL);
INSERT INTO `t_massage` VALUES (211, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-15 07:30:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德福鼎，九鲤溪，小白鹭, 用车数量：34座', 0, 0, '2018-08-11 13:23:20', NULL);
INSERT INTO `t_massage` VALUES (212, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:55', NULL);
INSERT INTO `t_massage` VALUES (213, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:56', NULL);
INSERT INTO `t_massage` VALUES (214, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:56', NULL);
INSERT INTO `t_massage` VALUES (215, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:56', NULL);
INSERT INTO `t_massage` VALUES (216, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:56', NULL);
INSERT INTO `t_massage` VALUES (217, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:56', NULL);
INSERT INTO `t_massage` VALUES (218, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811011932319正在报价中,请前往参加', 0, 0, '2018-08-11 13:23:57', NULL);
INSERT INTO `t_massage` VALUES (219, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:57', NULL);
INSERT INTO `t_massage` VALUES (220, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (221, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (222, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (223, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (224, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (225, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811012142175正在报价中,请前往参加', 0, 0, '2018-08-11 13:25:58', NULL);
INSERT INTO `t_massage` VALUES (226, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:27:59', NULL);
INSERT INTO `t_massage` VALUES (227, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:27:59', NULL);
INSERT INTO `t_massage` VALUES (228, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:28:00', NULL);
INSERT INTO `t_massage` VALUES (229, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:28:00', NULL);
INSERT INTO `t_massage` VALUES (230, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:28:00', NULL);
INSERT INTO `t_massage` VALUES (231, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:28:00', NULL);
INSERT INTO `t_massage` VALUES (232, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811012316788正在报价中,请前往参加', 0, 0, '2018-08-11 13:28:00', NULL);
INSERT INTO `t_massage` VALUES (233, 'd87440e8b4274d8e95558d60f859e74a', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-11 14:36:49', NULL);
INSERT INTO `t_massage` VALUES (234, 'afb7482e786349ffb54613d754c521d6', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-11 14:56:20', NULL);
INSERT INTO `t_massage` VALUES (235, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:29', NULL);
INSERT INTO `t_massage` VALUES (236, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:29', NULL);
INSERT INTO `t_massage` VALUES (237, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:29', NULL);
INSERT INTO `t_massage` VALUES (238, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:29', NULL);
INSERT INTO `t_massage` VALUES (239, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:29', NULL);
INSERT INTO `t_massage` VALUES (240, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:30', NULL);
INSERT INTO `t_massage` VALUES (241, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-24 09:00:00, 出发地址：浙江温州鹿城区新城客运站, 目的地地址：浙江温州泰顺姐妹廊桥附近, 用车数量：54座/54座', 0, 0, '2018-08-11 15:00:30', NULL);
INSERT INTO `t_massage` VALUES (242, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:02', NULL);
INSERT INTO `t_massage` VALUES (243, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:03', NULL);
INSERT INTO `t_massage` VALUES (244, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:03', NULL);
INSERT INTO `t_massage` VALUES (245, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:03', NULL);
INSERT INTO `t_massage` VALUES (246, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:03', NULL);
INSERT INTO `t_massage` VALUES (247, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:03', NULL);
INSERT INTO `t_massage` VALUES (248, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180811030018957正在报价中,请前往参加', 0, 0, '2018-08-11 15:05:04', NULL);
INSERT INTO `t_massage` VALUES (249, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:46', NULL);
INSERT INTO `t_massage` VALUES (250, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:46', NULL);
INSERT INTO `t_massage` VALUES (251, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:46', NULL);
INSERT INTO `t_massage` VALUES (252, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:46', NULL);
INSERT INTO `t_massage` VALUES (253, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:46', NULL);
INSERT INTO `t_massage` VALUES (254, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:47', NULL);
INSERT INTO `t_massage` VALUES (255, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-31 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：湖北十堰乡下, 用车数量：18座/35座/63座', 0, 0, '2018-08-12 16:14:47', NULL);
INSERT INTO `t_massage` VALUES (256, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:18', NULL);
INSERT INTO `t_massage` VALUES (257, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:18', NULL);
INSERT INTO `t_massage` VALUES (258, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:18', NULL);
INSERT INTO `t_massage` VALUES (259, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:19', NULL);
INSERT INTO `t_massage` VALUES (260, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:19', NULL);
INSERT INTO `t_massage` VALUES (261, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:19', NULL);
INSERT INTO `t_massage` VALUES (262, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180812041422861正在报价中,请前往参加', 0, 0, '2018-08-12 16:24:19', NULL);
INSERT INTO `t_massage` VALUES (263, '6811fad9861c4784991cc965c0e13419', '【就道巴士】订单【20180812041422861】订车成功。', 0, 0, '2018-08-12 16:33:01', NULL);
INSERT INTO `t_massage` VALUES (264, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180812041422861】订车成功，联系电话：18606639590，联系人：18606639590。', 0, 0, '2018-08-12 16:33:01', NULL);
INSERT INTO `t_massage` VALUES (265, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:02', NULL);
INSERT INTO `t_massage` VALUES (266, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:02', NULL);
INSERT INTO `t_massage` VALUES (267, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:02', NULL);
INSERT INTO `t_massage` VALUES (268, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:03', NULL);
INSERT INTO `t_massage` VALUES (269, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:03', NULL);
INSERT INTO `t_massage` VALUES (270, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:03', NULL);
INSERT INTO `t_massage` VALUES (271, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-12 21:04:00, 出发地址：浙江温州测试数据, 目的地地址：浙江温州测试数据, 用车数量：18座', 0, 0, '2018-08-12 21:05:03', NULL);
INSERT INTO `t_massage` VALUES (272, 'ff37b227a0f24cdf9aabfff6d4091ced', '【就道巴士】订单【20180812090457702】订车成功。', 0, 0, '2018-08-12 21:06:22', NULL);
INSERT INTO `t_massage` VALUES (273, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单【20180812090457702】订车成功，联系电话：15260282340，联系人：15260282340。', 0, 0, '2018-08-12 21:06:22', NULL);
INSERT INTO `t_massage` VALUES (274, 'ff37b227a0f24cdf9aabfff6d4091ced', '【就道巴士】你的订单【20180812090457702】的车辆车牌号：测试数据，司机联系电话：测试数据', 0, 0, '2018-08-12 21:06:47', NULL);
INSERT INTO `t_massage` VALUES (275, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:48', NULL);
INSERT INTO `t_massage` VALUES (276, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:48', NULL);
INSERT INTO `t_massage` VALUES (277, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:48', NULL);
INSERT INTO `t_massage` VALUES (278, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:49', NULL);
INSERT INTO `t_massage` VALUES (279, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:49', NULL);
INSERT INTO `t_massage` VALUES (280, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:49', NULL);
INSERT INTO `t_massage` VALUES (281, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-13 23:50:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-13 23:48:49', NULL);
INSERT INTO `t_massage` VALUES (282, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:17', NULL);
INSERT INTO `t_massage` VALUES (283, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:17', NULL);
INSERT INTO `t_massage` VALUES (284, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:17', NULL);
INSERT INTO `t_massage` VALUES (285, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:17', NULL);
INSERT INTO `t_massage` VALUES (286, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:18', NULL);
INSERT INTO `t_massage` VALUES (287, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:18', NULL);
INSERT INTO `t_massage` VALUES (288, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180813114839336正在报价中,请前往参加', 0, 0, '2018-08-13 23:58:18', NULL);
INSERT INTO `t_massage` VALUES (289, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:18', NULL);
INSERT INTO `t_massage` VALUES (290, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:18', NULL);
INSERT INTO `t_massage` VALUES (291, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:18', NULL);
INSERT INTO `t_massage` VALUES (292, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:18', NULL);
INSERT INTO `t_massage` VALUES (293, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:19', NULL);
INSERT INTO `t_massage` VALUES (294, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:19', NULL);
INSERT INTO `t_massage` VALUES (295, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-16 07:00:00, 出发地址：浙江温州新城站, 目的地地址：浙江温州洞头, 用车数量：29座', 0, 0, '2018-08-14 08:44:19', NULL);
INSERT INTO `t_massage` VALUES (296, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:26', NULL);
INSERT INTO `t_massage` VALUES (297, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:26', NULL);
INSERT INTO `t_massage` VALUES (298, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:26', NULL);
INSERT INTO `t_massage` VALUES (299, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:26', NULL);
INSERT INTO `t_massage` VALUES (300, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:27', NULL);
INSERT INTO `t_massage` VALUES (301, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:27', NULL);
INSERT INTO `t_massage` VALUES (302, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180814084414831正在报价中,请前往参加', 0, 0, '2018-08-14 08:53:27', NULL);
INSERT INTO `t_massage` VALUES (303, 'cc114ca49c58444c86631c12197cbf6d', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-14 12:16:01', NULL);
INSERT INTO `t_massage` VALUES (304, 'e08b0e1d75324d15918069a8dc5473cf', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-14 13:57:07', NULL);
INSERT INTO `t_massage` VALUES (305, '3e75618080aa4f519ada0fcd77385c00', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-14 16:02:10', NULL);
INSERT INTO `t_massage` VALUES (306, 'c48706f7bbfe4d43b443b0e0fbdf51aa', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-15 12:48:24', NULL);
INSERT INTO `t_massage` VALUES (307, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:47', NULL);
INSERT INTO `t_massage` VALUES (308, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:47', NULL);
INSERT INTO `t_massage` VALUES (309, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:48', NULL);
INSERT INTO `t_massage` VALUES (310, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:48', NULL);
INSERT INTO `t_massage` VALUES (311, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:48', NULL);
INSERT INTO `t_massage` VALUES (312, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:48', NULL);
INSERT INTO `t_massage` VALUES (313, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-19 06:30:00, 出发地址：浙江温州龙湾和瓯北两站接送, 目的地地址：浙江宁波象山阿拉的海 象山影视城, 用车数量：53座', 0, 0, '2018-08-15 12:53:48', NULL);
INSERT INTO `t_massage` VALUES (314, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:50', NULL);
INSERT INTO `t_massage` VALUES (315, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:50', NULL);
INSERT INTO `t_massage` VALUES (316, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:50', NULL);
INSERT INTO `t_massage` VALUES (317, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:50', NULL);
INSERT INTO `t_massage` VALUES (318, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:51', NULL);
INSERT INTO `t_massage` VALUES (319, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:51', NULL);
INSERT INTO `t_massage` VALUES (320, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180815125339248正在报价中,请前往参加', 0, 0, '2018-08-15 13:02:51', NULL);
INSERT INTO `t_massage` VALUES (321, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:04', NULL);
INSERT INTO `t_massage` VALUES (322, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:04', NULL);
INSERT INTO `t_massage` VALUES (323, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:04', NULL);
INSERT INTO `t_massage` VALUES (324, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:04', NULL);
INSERT INTO `t_massage` VALUES (325, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:05', NULL);
INSERT INTO `t_massage` VALUES (326, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:05', NULL);
INSERT INTO `t_massage` VALUES (327, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-15 13:41:00, 出发地址：浙江温州测试, 目的地地址：浙江温州测试, 用车数量：35座', 0, 0, '2018-08-15 13:42:05', NULL);
INSERT INTO `t_massage` VALUES (328, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:52', NULL);
INSERT INTO `t_massage` VALUES (329, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:53', NULL);
INSERT INTO `t_massage` VALUES (330, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:53', NULL);
INSERT INTO `t_massage` VALUES (331, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:53', NULL);
INSERT INTO `t_massage` VALUES (332, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:53', NULL);
INSERT INTO `t_massage` VALUES (333, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:53', NULL);
INSERT INTO `t_massage` VALUES (334, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180815014200662正在报价中,请前往参加', 0, 0, '2018-08-15 13:51:54', NULL);
INSERT INTO `t_massage` VALUES (335, '734ba42bd3644216bbc5adfb4756a50c', '【就道巴士】订单【20180815014200662】订车成功。', 0, 0, '2018-08-15 13:55:37', NULL);
INSERT INTO `t_massage` VALUES (336, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单【20180815014200662】订车成功，联系电话：15167184543，联系人：15167184543。', 0, 0, '2018-08-15 13:55:37', NULL);
INSERT INTO `t_massage` VALUES (337, 'b4473f4727a74ae39bd88b0016965297', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-15 21:59:29', NULL);
INSERT INTO `t_massage` VALUES (338, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:52', NULL);
INSERT INTO `t_massage` VALUES (339, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:53', NULL);
INSERT INTO `t_massage` VALUES (340, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:53', NULL);
INSERT INTO `t_massage` VALUES (341, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:53', NULL);
INSERT INTO `t_massage` VALUES (342, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:53', NULL);
INSERT INTO `t_massage` VALUES (343, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:53', NULL);
INSERT INTO `t_massage` VALUES (344, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州永嘉县人民医院, 目的地地址：浙江温州温州机场国内厅, 用车数量：29座', 0, 0, '2018-08-15 22:03:54', NULL);
INSERT INTO `t_massage` VALUES (345, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:01', NULL);
INSERT INTO `t_massage` VALUES (346, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:01', NULL);
INSERT INTO `t_massage` VALUES (347, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:01', NULL);
INSERT INTO `t_massage` VALUES (348, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:01', NULL);
INSERT INTO `t_massage` VALUES (349, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:02', NULL);
INSERT INTO `t_massage` VALUES (350, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:02', NULL);
INSERT INTO `t_massage` VALUES (351, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180815100151410正在报价中,请前往参加', 0, 0, '2018-08-15 22:13:02', NULL);
INSERT INTO `t_massage` VALUES (352, 'b4473f4727a74ae39bd88b0016965297', '【就道巴士】订单【20180815100151410】订车成功。', 0, 0, '2018-08-15 22:16:08', NULL);
INSERT INTO `t_massage` VALUES (353, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180815100151410】订车成功，联系电话：13757743578，联系人：斯超。', 0, 0, '2018-08-15 22:16:09', NULL);
INSERT INTO `t_massage` VALUES (354, '0001dd96b54d48bdb3ae1e30e67dd0d1', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-16 16:53:49', NULL);
INSERT INTO `t_massage` VALUES (355, '589a754d198f4493a63674ba37dbbb5a', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-18 10:00:16', NULL);
INSERT INTO `t_massage` VALUES (356, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:50', NULL);
INSERT INTO `t_massage` VALUES (357, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:50', NULL);
INSERT INTO `t_massage` VALUES (358, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:50', NULL);
INSERT INTO `t_massage` VALUES (359, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:50', NULL);
INSERT INTO `t_massage` VALUES (360, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:51', NULL);
INSERT INTO `t_massage` VALUES (361, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:51', NULL);
INSERT INTO `t_massage` VALUES (362, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-19 08:30:00, 出发地址：浙江温州南塘天桥大榕树（少艺校西大门）, 目的地地址：浙江杭州千岛湖, 用车数量：63座', 0, 0, '2018-08-18 10:14:51', NULL);
INSERT INTO `t_massage` VALUES (363, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:50', NULL);
INSERT INTO `t_massage` VALUES (364, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:51', NULL);
INSERT INTO `t_massage` VALUES (365, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:51', NULL);
INSERT INTO `t_massage` VALUES (366, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:51', NULL);
INSERT INTO `t_massage` VALUES (367, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:51', NULL);
INSERT INTO `t_massage` VALUES (368, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:52', NULL);
INSERT INTO `t_massage` VALUES (369, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180818101440941正在报价中,请前往参加', 0, 0, '2018-08-18 10:23:52', NULL);
INSERT INTO `t_massage` VALUES (370, '589a754d198f4493a63674ba37dbbb5a', '【就道巴士】订单【20180818101440941】订车成功。', 0, 0, '2018-08-18 10:25:38', NULL);
INSERT INTO `t_massage` VALUES (371, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单【20180818101440941】订车成功，联系电话：13957789651，联系人：精诚晓惠。', 0, 0, '2018-08-18 10:25:38', NULL);
INSERT INTO `t_massage` VALUES (372, '589a754d198f4493a63674ba37dbbb5a', '【就道巴士】你的订单【20180818101440941】的车辆车牌号：浙C39160，司机联系电话：13626589918', 0, 0, '2018-08-18 10:26:53', NULL);
INSERT INTO `t_massage` VALUES (373, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:51', NULL);
INSERT INTO `t_massage` VALUES (374, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:51', NULL);
INSERT INTO `t_massage` VALUES (375, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:51', NULL);
INSERT INTO `t_massage` VALUES (376, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:51', NULL);
INSERT INTO `t_massage` VALUES (377, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:52', NULL);
INSERT INTO `t_massage` VALUES (378, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:52', NULL);
INSERT INTO `t_massage` VALUES (379, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-20 15:00:00, 出发地址：浙江温州上塘戈田口, 目的地地址：浙江温州温州机场T2国内航站楼, 用车数量：35座', 0, 0, '2018-08-19 14:42:52', NULL);
INSERT INTO `t_massage` VALUES (380, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:15', NULL);
INSERT INTO `t_massage` VALUES (381, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:15', NULL);
INSERT INTO `t_massage` VALUES (382, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:15', NULL);
INSERT INTO `t_massage` VALUES (383, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:16', NULL);
INSERT INTO `t_massage` VALUES (384, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:16', NULL);
INSERT INTO `t_massage` VALUES (385, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:16', NULL);
INSERT INTO `t_massage` VALUES (386, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180819024246527正在报价中,请前往参加', 0, 0, '2018-08-19 14:52:16', NULL);
INSERT INTO `t_massage` VALUES (387, 'b4473f4727a74ae39bd88b0016965297', '【就道巴士】订单【20180819024246527】订车成功。', 0, 0, '2018-08-19 14:53:58', NULL);
INSERT INTO `t_massage` VALUES (388, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180819024246527】订车成功，联系电话：13567728369，联系人：周巧巧。', 0, 0, '2018-08-19 14:53:59', NULL);
INSERT INTO `t_massage` VALUES (389, 'b4473f4727a74ae39bd88b0016965297', '【就道巴士】你的订单【20180819024246527】的车辆车牌号：浙C35737，司机联系电话：18608618858', 0, 0, '2018-08-19 15:32:29', NULL);
INSERT INTO `t_massage` VALUES (390, 'c650e1b9bd374721884952fe89dfd9ec', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-20 10:34:23', NULL);
INSERT INTO `t_massage` VALUES (391, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:50', NULL);
INSERT INTO `t_massage` VALUES (392, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:50', NULL);
INSERT INTO `t_massage` VALUES (393, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:51', NULL);
INSERT INTO `t_massage` VALUES (394, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:51', NULL);
INSERT INTO `t_massage` VALUES (395, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:51', NULL);
INSERT INTO `t_massage` VALUES (396, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:51', NULL);
INSERT INTO `t_massage` VALUES (397, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/59座', 0, 0, '2018-08-20 10:39:52', NULL);
INSERT INTO `t_massage` VALUES (398, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:33', NULL);
INSERT INTO `t_massage` VALUES (399, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:33', NULL);
INSERT INTO `t_massage` VALUES (400, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:34', NULL);
INSERT INTO `t_massage` VALUES (401, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:34', NULL);
INSERT INTO `t_massage` VALUES (402, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:34', NULL);
INSERT INTO `t_massage` VALUES (403, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:34', NULL);
INSERT INTO `t_massage` VALUES (404, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180820103934109正在报价中,请前往参加', 0, 0, '2018-08-20 10:49:35', NULL);
INSERT INTO `t_massage` VALUES (405, 'c3c00c4266d54c2991fb04e2eacec27b', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-20 13:26:22', NULL);
INSERT INTO `t_massage` VALUES (406, '2a3867dba89f461f8d4e27e2a0560882', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-20 14:24:42', NULL);
INSERT INTO `t_massage` VALUES (407, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:03', NULL);
INSERT INTO `t_massage` VALUES (408, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:04', NULL);
INSERT INTO `t_massage` VALUES (409, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:04', NULL);
INSERT INTO `t_massage` VALUES (410, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:04', NULL);
INSERT INTO `t_massage` VALUES (411, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:04', NULL);
INSERT INTO `t_massage` VALUES (412, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:04', NULL);
INSERT INTO `t_massage` VALUES (413, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-25 08:30:00, 出发地址：浙江温州市区, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-08-20 15:50:05', NULL);
INSERT INTO `t_massage` VALUES (414, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:39', NULL);
INSERT INTO `t_massage` VALUES (415, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:40', NULL);
INSERT INTO `t_massage` VALUES (416, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:40', NULL);
INSERT INTO `t_massage` VALUES (417, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:40', NULL);
INSERT INTO `t_massage` VALUES (418, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:40', NULL);
INSERT INTO `t_massage` VALUES (419, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:40', NULL);
INSERT INTO `t_massage` VALUES (420, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180820034958958正在报价中,请前往参加', 0, 0, '2018-08-20 15:59:41', NULL);
INSERT INTO `t_massage` VALUES (421, '6c47b4ad9ddb4a4a9b46d6c4f39ac474', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-20 16:12:21', NULL);
INSERT INTO `t_massage` VALUES (422, '31afe8a19711494889c87d6efb4a0d7f', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-20 16:49:57', NULL);
INSERT INTO `t_massage` VALUES (423, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:22', NULL);
INSERT INTO `t_massage` VALUES (424, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:22', NULL);
INSERT INTO `t_massage` VALUES (425, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:22', NULL);
INSERT INTO `t_massage` VALUES (426, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:22', NULL);
INSERT INTO `t_massage` VALUES (427, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:23', NULL);
INSERT INTO `t_massage` VALUES (428, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:23', NULL);
INSERT INTO `t_massage` VALUES (429, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-21 08:50:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州大门岛, 用车数量：35座', 0, 0, '2018-08-20 16:54:23', NULL);
INSERT INTO `t_massage` VALUES (430, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:43', NULL);
INSERT INTO `t_massage` VALUES (431, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:43', NULL);
INSERT INTO `t_massage` VALUES (432, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:43', NULL);
INSERT INTO `t_massage` VALUES (433, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:43', NULL);
INSERT INTO `t_massage` VALUES (434, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:43', NULL);
INSERT INTO `t_massage` VALUES (435, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:44', NULL);
INSERT INTO `t_massage` VALUES (436, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180820045219365正在报价中,请前往参加', 0, 0, '2018-08-20 17:03:44', NULL);
INSERT INTO `t_massage` VALUES (437, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (438, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (439, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (440, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (441, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (442, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:23', NULL);
INSERT INTO `t_massage` VALUES (443, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：59座/59座', 0, 0, '2018-08-21 15:00:24', NULL);
INSERT INTO `t_massage` VALUES (444, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:02', NULL);
INSERT INTO `t_massage` VALUES (445, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:02', NULL);
INSERT INTO `t_massage` VALUES (446, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:03', NULL);
INSERT INTO `t_massage` VALUES (447, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:03', NULL);
INSERT INTO `t_massage` VALUES (448, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:03', NULL);
INSERT INTO `t_massage` VALUES (449, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:03', NULL);
INSERT INTO `t_massage` VALUES (450, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180821030016236正在报价中,请前往参加', 0, 0, '2018-08-21 15:10:04', NULL);
INSERT INTO `t_massage` VALUES (451, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:25:59', NULL);
INSERT INTO `t_massage` VALUES (452, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:00', NULL);
INSERT INTO `t_massage` VALUES (453, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:00', NULL);
INSERT INTO `t_massage` VALUES (454, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:00', NULL);
INSERT INTO `t_massage` VALUES (455, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:00', NULL);
INSERT INTO `t_massage` VALUES (456, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:01', NULL);
INSERT INTO `t_massage` VALUES (457, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：63座/63座', 0, 0, '2018-08-22 09:26:01', NULL);
INSERT INTO `t_massage` VALUES (458, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:19', NULL);
INSERT INTO `t_massage` VALUES (459, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:19', NULL);
INSERT INTO `t_massage` VALUES (460, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:19', NULL);
INSERT INTO `t_massage` VALUES (461, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:19', NULL);
INSERT INTO `t_massage` VALUES (462, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:19', NULL);
INSERT INTO `t_massage` VALUES (463, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:20', NULL);
INSERT INTO `t_massage` VALUES (464, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180822092549836正在报价中,请前往参加', 0, 0, '2018-08-22 09:35:20', NULL);
INSERT INTO `t_massage` VALUES (465, 'f10ffaa6aa2544e7a43307a1d71ae6fa', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-22 14:38:04', NULL);
INSERT INTO `t_massage` VALUES (466, '91a46ee26d6e47cab6c7b745bad64fca', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-22 15:02:50', NULL);
INSERT INTO `t_massage` VALUES (467, '89485fc81bb1462a83f07ef1178c3012', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-22 15:24:09', NULL);
INSERT INTO `t_massage` VALUES (468, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:11', NULL);
INSERT INTO `t_massage` VALUES (469, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:12', NULL);
INSERT INTO `t_massage` VALUES (470, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:12', NULL);
INSERT INTO `t_massage` VALUES (471, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:12', NULL);
INSERT INTO `t_massage` VALUES (472, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:12', NULL);
INSERT INTO `t_massage` VALUES (473, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:13', NULL);
INSERT INTO `t_massage` VALUES (474, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-29 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州萧山机场, 用车数量：37座', 0, 0, '2018-08-22 16:03:13', NULL);
INSERT INTO `t_massage` VALUES (475, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:26', NULL);
INSERT INTO `t_massage` VALUES (476, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:26', NULL);
INSERT INTO `t_massage` VALUES (477, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:27', NULL);
INSERT INTO `t_massage` VALUES (478, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:27', NULL);
INSERT INTO `t_massage` VALUES (479, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:27', NULL);
INSERT INTO `t_massage` VALUES (480, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:28', NULL);
INSERT INTO `t_massage` VALUES (481, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180822040238469正在报价中,请前往参加', 0, 0, '2018-08-22 16:12:29', NULL);
INSERT INTO `t_massage` VALUES (482, '85c00b22fcb145ce8f2a7c83bbf91ded', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-22 16:15:40', NULL);
INSERT INTO `t_massage` VALUES (483, 'bc2a7b9871a24369a809289f16b96538', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-22 16:29:56', NULL);
INSERT INTO `t_massage` VALUES (484, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:44', NULL);
INSERT INTO `t_massage` VALUES (485, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:44', NULL);
INSERT INTO `t_massage` VALUES (486, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:44', NULL);
INSERT INTO `t_massage` VALUES (487, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:44', NULL);
INSERT INTO `t_massage` VALUES (488, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:44', NULL);
INSERT INTO `t_massage` VALUES (489, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:45', NULL);
INSERT INTO `t_massage` VALUES (490, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-27 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江杭州千岛湖, 用车数量：37座/37座/53座', 0, 0, '2018-08-23 09:15:45', NULL);
INSERT INTO `t_massage` VALUES (491, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:43', NULL);
INSERT INTO `t_massage` VALUES (492, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:43', NULL);
INSERT INTO `t_massage` VALUES (493, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:43', NULL);
INSERT INTO `t_massage` VALUES (494, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:44', NULL);
INSERT INTO `t_massage` VALUES (495, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:44', NULL);
INSERT INTO `t_massage` VALUES (496, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:44', NULL);
INSERT INTO `t_massage` VALUES (497, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180823091538051正在报价中,请前往参加', 0, 0, '2018-08-23 09:24:44', NULL);
INSERT INTO `t_massage` VALUES (498, 'c650e1b9bd374721884952fe89dfd9ec', '【就道巴士】订单【20180823091538051】订车成功。', 0, 0, '2018-08-23 11:04:50', NULL);
INSERT INTO `t_massage` VALUES (499, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单【20180823091538051】订车成功，联系电话：13957797181，联系人：13957797181。', 0, 0, '2018-08-23 11:04:50', NULL);
INSERT INTO `t_massage` VALUES (500, 'f2a24d94e70f492f8bc0579f3015e1a7', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-24 12:27:14', NULL);
INSERT INTO `t_massage` VALUES (501, 'd2e91d759a9845bebc208f4beefd05ef', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-25 15:51:22', NULL);
INSERT INTO `t_massage` VALUES (502, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:52', NULL);
INSERT INTO `t_massage` VALUES (503, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:52', NULL);
INSERT INTO `t_massage` VALUES (504, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:52', NULL);
INSERT INTO `t_massage` VALUES (505, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:52', NULL);
INSERT INTO `t_massage` VALUES (506, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:53', NULL);
INSERT INTO `t_massage` VALUES (507, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:53', NULL);
INSERT INTO `t_massage` VALUES (508, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-07 07:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州望海楼、仙叠岩、海霞主题公园, 用车数量：18座', 0, 0, '2018-08-29 12:55:53', NULL);
INSERT INTO `t_massage` VALUES (509, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:37', NULL);
INSERT INTO `t_massage` VALUES (510, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:37', NULL);
INSERT INTO `t_massage` VALUES (511, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:38', NULL);
INSERT INTO `t_massage` VALUES (512, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:38', NULL);
INSERT INTO `t_massage` VALUES (513, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:38', NULL);
INSERT INTO `t_massage` VALUES (514, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:38', NULL);
INSERT INTO `t_massage` VALUES (515, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180829125542457正在报价中,请前往参加', 0, 0, '2018-08-29 13:05:38', NULL);
INSERT INTO `t_massage` VALUES (516, '4116ed08498c48b7b26d519ddd089a84', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-08-30 08:35:57', NULL);
INSERT INTO `t_massage` VALUES (517, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:37', NULL);
INSERT INTO `t_massage` VALUES (518, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:37', NULL);
INSERT INTO `t_massage` VALUES (519, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:37', NULL);
INSERT INTO `t_massage` VALUES (520, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:37', NULL);
INSERT INTO `t_massage` VALUES (521, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:37', NULL);
INSERT INTO `t_massage` VALUES (522, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:38', NULL);
INSERT INTO `t_massage` VALUES (523, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-08-31 17:00:00, 出发地址：浙江温州温州机场国内出发厅, 目的地地址：浙江温州永嘉县人民医院, 用车数量：29座', 0, 0, '2018-08-30 16:26:38', NULL);
INSERT INTO `t_massage` VALUES (524, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:01', NULL);
INSERT INTO `t_massage` VALUES (525, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:01', NULL);
INSERT INTO `t_massage` VALUES (526, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:01', NULL);
INSERT INTO `t_massage` VALUES (527, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:01', NULL);
INSERT INTO `t_massage` VALUES (528, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:01', NULL);
INSERT INTO `t_massage` VALUES (529, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:02', NULL);
INSERT INTO `t_massage` VALUES (530, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180830042628540正在报价中,请前往参加', 0, 0, '2018-08-30 16:36:02', NULL);
INSERT INTO `t_massage` VALUES (531, 'c3c1bce95c4647b5a659a0cd817bead2', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-03 14:51:08', NULL);
INSERT INTO `t_massage` VALUES (532, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:23', NULL);
INSERT INTO `t_massage` VALUES (533, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:23', NULL);
INSERT INTO `t_massage` VALUES (534, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:23', NULL);
INSERT INTO `t_massage` VALUES (535, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:24', NULL);
INSERT INTO `t_massage` VALUES (536, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:24', NULL);
INSERT INTO `t_massage` VALUES (537, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:24', NULL);
INSERT INTO `t_massage` VALUES (538, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-29 07:00:00, 出发地址：浙江温州双屿, 目的地地址：福建宁德九鲤溪, 用车数量：35座', 0, 0, '2018-09-04 15:04:24', NULL);
INSERT INTO `t_massage` VALUES (539, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:41', NULL);
INSERT INTO `t_massage` VALUES (540, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:41', NULL);
INSERT INTO `t_massage` VALUES (541, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:41', NULL);
INSERT INTO `t_massage` VALUES (542, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:41', NULL);
INSERT INTO `t_massage` VALUES (543, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:42', NULL);
INSERT INTO `t_massage` VALUES (544, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:42', NULL);
INSERT INTO `t_massage` VALUES (545, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180904030419902正在报价中,请前往参加', 0, 0, '2018-09-04 15:13:42', NULL);
INSERT INTO `t_massage` VALUES (546, '06684d83ce39403d9fb06d6603f3e476', '【就道巴士】订单【20180904030419902】订车成功。', 0, 0, '2018-09-06 11:49:25', NULL);
INSERT INTO `t_massage` VALUES (547, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单【20180904030419902】订车成功，联系电话：13957721053，联系人：13957721053。', 0, 0, '2018-09-06 11:49:26', NULL);
INSERT INTO `t_massage` VALUES (548, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:40', NULL);
INSERT INTO `t_massage` VALUES (549, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:41', NULL);
INSERT INTO `t_massage` VALUES (550, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:41', NULL);
INSERT INTO `t_massage` VALUES (551, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:41', NULL);
INSERT INTO `t_massage` VALUES (552, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:41', NULL);
INSERT INTO `t_massage` VALUES (553, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:42', NULL);
INSERT INTO `t_massage` VALUES (554, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-08 07:00:00, 出发地址：浙江温州温州松台广场, 目的地地址：浙江嘉兴南湖附近  乌镇南栅老街   康馨园（另带三个购物点）, 用车数量：63座/63座', 0, 0, '2018-09-06 12:00:42', NULL);
INSERT INTO `t_massage` VALUES (555, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:19', NULL);
INSERT INTO `t_massage` VALUES (556, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:19', NULL);
INSERT INTO `t_massage` VALUES (557, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:19', NULL);
INSERT INTO `t_massage` VALUES (558, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:20', NULL);
INSERT INTO `t_massage` VALUES (559, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:20', NULL);
INSERT INTO `t_massage` VALUES (560, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:20', NULL);
INSERT INTO `t_massage` VALUES (561, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180906120037410正在报价中,请前往参加', 0, 0, '2018-09-06 12:10:20', NULL);
INSERT INTO `t_massage` VALUES (562, 'b140ec0e3544419ea7f81952ba56af73', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-06 12:50:02', NULL);
INSERT INTO `t_massage` VALUES (563, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:49', NULL);
INSERT INTO `t_massage` VALUES (564, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:49', NULL);
INSERT INTO `t_massage` VALUES (565, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:49', NULL);
INSERT INTO `t_massage` VALUES (566, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:50', NULL);
INSERT INTO `t_massage` VALUES (567, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:50', NULL);
INSERT INTO `t_massage` VALUES (568, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:50', NULL);
INSERT INTO `t_massage` VALUES (569, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-30 07:50:00, 出发地址：浙江温州瓯北报喜鸟, 目的地地址：浙江杭州龙潭小区, 用车数量：35座', 0, 0, '2018-09-06 12:51:50', NULL);
INSERT INTO `t_massage` VALUES (570, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:22', NULL);
INSERT INTO `t_massage` VALUES (571, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:22', NULL);
INSERT INTO `t_massage` VALUES (572, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:22', NULL);
INSERT INTO `t_massage` VALUES (573, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:22', NULL);
INSERT INTO `t_massage` VALUES (574, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:23', NULL);
INSERT INTO `t_massage` VALUES (575, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:23', NULL);
INSERT INTO `t_massage` VALUES (576, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180906125141865正在报价中,请前往参加', 0, 0, '2018-09-06 13:01:23', NULL);
INSERT INTO `t_massage` VALUES (577, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:15', NULL);
INSERT INTO `t_massage` VALUES (578, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:15', NULL);
INSERT INTO `t_massage` VALUES (579, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:15', NULL);
INSERT INTO `t_massage` VALUES (580, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:15', NULL);
INSERT INTO `t_massage` VALUES (581, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:16', NULL);
INSERT INTO `t_massage` VALUES (582, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:16', NULL);
INSERT INTO `t_massage` VALUES (583, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-08 09:00:00, 出发地址：浙江温州新城, 目的地地址：浙江丽水冒险岛, 用车数量：18座', 0, 0, '2018-09-07 09:44:16', NULL);
INSERT INTO `t_massage` VALUES (584, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:41', NULL);
INSERT INTO `t_massage` VALUES (585, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:41', NULL);
INSERT INTO `t_massage` VALUES (586, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:41', NULL);
INSERT INTO `t_massage` VALUES (587, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:41', NULL);
INSERT INTO `t_massage` VALUES (588, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:42', NULL);
INSERT INTO `t_massage` VALUES (589, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:42', NULL);
INSERT INTO `t_massage` VALUES (590, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180907094345223正在报价中,请前往参加', 0, 0, '2018-09-07 09:53:42', NULL);
INSERT INTO `t_massage` VALUES (591, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:25', NULL);
INSERT INTO `t_massage` VALUES (592, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:25', NULL);
INSERT INTO `t_massage` VALUES (593, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:26', NULL);
INSERT INTO `t_massage` VALUES (594, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:26', NULL);
INSERT INTO `t_massage` VALUES (595, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:26', NULL);
INSERT INTO `t_massage` VALUES (596, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:26', NULL);
INSERT INTO `t_massage` VALUES (597, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:27', NULL);
INSERT INTO `t_massage` VALUES (598, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:27', NULL);
INSERT INTO `t_massage` VALUES (599, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:27', NULL);
INSERT INTO `t_massage` VALUES (600, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:27', NULL);
INSERT INTO `t_massage` VALUES (601, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:27', NULL);
INSERT INTO `t_massage` VALUES (602, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:28', NULL);
INSERT INTO `t_massage` VALUES (603, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:28', NULL);
INSERT INTO `t_massage` VALUES (604, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-16 07:55:00, 出发地址：浙江温州会展中心和国际大酒店都需要接, 目的地地址：浙江温州洞头仙叠岩，大沙岙，望海楼, 用车数量：35座', 0, 0, '2018-09-10 09:57:28', NULL);
INSERT INTO `t_massage` VALUES (605, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:39', NULL);
INSERT INTO `t_massage` VALUES (606, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:39', NULL);
INSERT INTO `t_massage` VALUES (607, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:39', NULL);
INSERT INTO `t_massage` VALUES (608, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:39', NULL);
INSERT INTO `t_massage` VALUES (609, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:40', NULL);
INSERT INTO `t_massage` VALUES (610, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:40', NULL);
INSERT INTO `t_massage` VALUES (611, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180910095721290正在报价中,请前往参加', 0, 0, '2018-09-10 10:06:40', NULL);
INSERT INTO `t_massage` VALUES (612, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:05', NULL);
INSERT INTO `t_massage` VALUES (613, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:05', NULL);
INSERT INTO `t_massage` VALUES (614, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:06', NULL);
INSERT INTO `t_massage` VALUES (615, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:06', NULL);
INSERT INTO `t_massage` VALUES (616, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:06', NULL);
INSERT INTO `t_massage` VALUES (617, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:06', NULL);
INSERT INTO `t_massage` VALUES (618, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-16 07:10:00, 出发地址：浙江温州会展中心和国际大酒店两个, 目的地地址：浙江温州雁荡山, 用车数量：35座', 0, 0, '2018-09-10 14:16:07', NULL);
INSERT INTO `t_massage` VALUES (619, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:44', NULL);
INSERT INTO `t_massage` VALUES (620, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:44', NULL);
INSERT INTO `t_massage` VALUES (621, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:44', NULL);
INSERT INTO `t_massage` VALUES (622, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:45', NULL);
INSERT INTO `t_massage` VALUES (623, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:45', NULL);
INSERT INTO `t_massage` VALUES (624, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:45', NULL);
INSERT INTO `t_massage` VALUES (625, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180910021602861正在报价中,请前往参加', 0, 0, '2018-09-10 14:25:45', NULL);
INSERT INTO `t_massage` VALUES (626, '097b3ee86d8a461b9faceb988a3a5808', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-18 10:44:01', NULL);
INSERT INTO `t_massage` VALUES (627, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:38', NULL);
INSERT INTO `t_massage` VALUES (628, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:38', NULL);
INSERT INTO `t_massage` VALUES (629, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:38', NULL);
INSERT INTO `t_massage` VALUES (630, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:39', NULL);
INSERT INTO `t_massage` VALUES (631, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:39', NULL);
INSERT INTO `t_massage` VALUES (632, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:39', NULL);
INSERT INTO `t_massage` VALUES (633, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:45:39', NULL);
INSERT INTO `t_massage` VALUES (634, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:07', NULL);
INSERT INTO `t_massage` VALUES (635, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:07', NULL);
INSERT INTO `t_massage` VALUES (636, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:07', NULL);
INSERT INTO `t_massage` VALUES (637, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:07', NULL);
INSERT INTO `t_massage` VALUES (638, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:08', NULL);
INSERT INTO `t_massage` VALUES (639, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:08', NULL);
INSERT INTO `t_massage` VALUES (640, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180918104530957正在报价中,请前往参加', 0, 0, '2018-09-18 10:55:08', NULL);
INSERT INTO `t_massage` VALUES (641, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:47', NULL);
INSERT INTO `t_massage` VALUES (642, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:47', NULL);
INSERT INTO `t_massage` VALUES (643, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:47', NULL);
INSERT INTO `t_massage` VALUES (644, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:48', NULL);
INSERT INTO `t_massage` VALUES (645, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:48', NULL);
INSERT INTO `t_massage` VALUES (646, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:48', NULL);
INSERT INTO `t_massage` VALUES (647, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-22 08:00:00, 出发地址：浙江温州松台广场, 目的地地址：浙江温州云岚牧场, 用车数量：49座', 0, 0, '2018-09-18 10:57:48', NULL);
INSERT INTO `t_massage` VALUES (648, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (649, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (650, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (651, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (652, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:10', NULL);
INSERT INTO `t_massage` VALUES (653, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:10', NULL);
INSERT INTO `t_massage` VALUES (654, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180918105738624正在报价中,请前往参加', 0, 0, '2018-09-18 11:07:10', NULL);
INSERT INTO `t_massage` VALUES (655, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:10', NULL);
INSERT INTO `t_massage` VALUES (656, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:10', NULL);
INSERT INTO `t_massage` VALUES (657, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:10', NULL);
INSERT INTO `t_massage` VALUES (658, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:11', NULL);
INSERT INTO `t_massage` VALUES (659, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:11', NULL);
INSERT INTO `t_massage` VALUES (660, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:11', NULL);
INSERT INTO `t_massage` VALUES (661, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-12-07 13:00:00, 出发地址：浙江温州市区, 目的地地址：浙江杭州省建院, 用车数量：29座', 0, 0, '2018-09-18 19:59:11', NULL);
INSERT INTO `t_massage` VALUES (662, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:18', NULL);
INSERT INTO `t_massage` VALUES (663, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:18', NULL);
INSERT INTO `t_massage` VALUES (664, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:18', NULL);
INSERT INTO `t_massage` VALUES (665, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:18', NULL);
INSERT INTO `t_massage` VALUES (666, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:18', NULL);
INSERT INTO `t_massage` VALUES (667, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:19', NULL);
INSERT INTO `t_massage` VALUES (668, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180918075906300正在报价中,请前往参加', 0, 0, '2018-09-18 20:08:19', NULL);
INSERT INTO `t_massage` VALUES (669, '097b3ee86d8a461b9faceb988a3a5808', '【就道巴士】订单【20180918105738624】订车成功。', 0, 0, '2018-09-19 11:48:08', NULL);
INSERT INTO `t_massage` VALUES (670, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180918105738624】订车成功，联系电话：15858007520，联系人：15858007520。', 0, 0, '2018-09-19 11:48:08', NULL);
INSERT INTO `t_massage` VALUES (671, 'e480ee26123d4828ae5775651227966d', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-19 17:01:56', NULL);
INSERT INTO `t_massage` VALUES (672, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:24', NULL);
INSERT INTO `t_massage` VALUES (673, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:24', NULL);
INSERT INTO `t_massage` VALUES (674, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:25', NULL);
INSERT INTO `t_massage` VALUES (675, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:25', NULL);
INSERT INTO `t_massage` VALUES (676, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:25', NULL);
INSERT INTO `t_massage` VALUES (677, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:25', NULL);
INSERT INTO `t_massage` VALUES (678, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-22 14:55:00, 出发地址：浙江杭州杭州东动车站, 目的地地址：浙江杭州杭州萧山机场, 用车数量：29座', 0, 0, '2018-09-20 14:16:25', NULL);
INSERT INTO `t_massage` VALUES (679, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:52', NULL);
INSERT INTO `t_massage` VALUES (680, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:52', NULL);
INSERT INTO `t_massage` VALUES (681, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:52', NULL);
INSERT INTO `t_massage` VALUES (682, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:52', NULL);
INSERT INTO `t_massage` VALUES (683, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:53', NULL);
INSERT INTO `t_massage` VALUES (684, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:53', NULL);
INSERT INTO `t_massage` VALUES (685, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180920021616007正在报价中,请前往参加', 0, 0, '2018-09-20 14:25:53', NULL);
INSERT INTO `t_massage` VALUES (686, 'e480ee26123d4828ae5775651227966d', '【就道巴士】订单【20180920021616007】订车成功。', 0, 0, '2018-09-20 14:47:23', NULL);
INSERT INTO `t_massage` VALUES (687, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180920021616007】订车成功，联系电话：13968854671，联系人：13968854671。', 0, 0, '2018-09-20 14:47:24', NULL);
INSERT INTO `t_massage` VALUES (688, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:40', NULL);
INSERT INTO `t_massage` VALUES (689, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:40', NULL);
INSERT INTO `t_massage` VALUES (690, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:40', NULL);
INSERT INTO `t_massage` VALUES (691, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:41', NULL);
INSERT INTO `t_massage` VALUES (692, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:41', NULL);
INSERT INTO `t_massage` VALUES (693, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:41', NULL);
INSERT INTO `t_massage` VALUES (694, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-09-27 17:20:00, 出发地址：浙江杭州杭州萧山机场国际抵达, 目的地地址：浙江杭州杭州东动车站, 用车数量：29座', 0, 0, '2018-09-20 15:00:41', NULL);
INSERT INTO `t_massage` VALUES (695, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:54', NULL);
INSERT INTO `t_massage` VALUES (696, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:55', NULL);
INSERT INTO `t_massage` VALUES (697, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:55', NULL);
INSERT INTO `t_massage` VALUES (698, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:55', NULL);
INSERT INTO `t_massage` VALUES (699, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:55', NULL);
INSERT INTO `t_massage` VALUES (700, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:55', NULL);
INSERT INTO `t_massage` VALUES (701, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180920030019850正在报价中,请前往参加', 0, 0, '2018-09-20 15:09:56', NULL);
INSERT INTO `t_massage` VALUES (702, 'e480ee26123d4828ae5775651227966d', '【就道巴士】订单【20180920030019850】订车成功。', 0, 0, '2018-09-21 09:28:05', NULL);
INSERT INTO `t_massage` VALUES (703, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单【20180920030019850】订车成功，联系电话：13968854671，联系人：13968854671。', 0, 0, '2018-09-21 09:28:05', NULL);
INSERT INTO `t_massage` VALUES (704, '74ce16f7fc6f46bfa8b03a1b0f83d8a3', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-27 10:49:14', NULL);
INSERT INTO `t_massage` VALUES (705, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:21', NULL);
INSERT INTO `t_massage` VALUES (706, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:21', NULL);
INSERT INTO `t_massage` VALUES (707, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:21', NULL);
INSERT INTO `t_massage` VALUES (708, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:21', NULL);
INSERT INTO `t_massage` VALUES (709, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:21', NULL);
INSERT INTO `t_massage` VALUES (710, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:22', NULL);
INSERT INTO `t_massage` VALUES (711, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-10-12 08:00:00, 出发地址：浙江温州温州香格里拉大酒店, 目的地地址：浙江杭州杭州萧山机场, 用车数量：53座', 0, 0, '2018-09-27 10:57:22', NULL);
INSERT INTO `t_massage` VALUES (712, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:08', NULL);
INSERT INTO `t_massage` VALUES (713, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:08', NULL);
INSERT INTO `t_massage` VALUES (714, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (715, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (716, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (717, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (718, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20180927105657011正在报价中,请前往参加', 0, 0, '2018-09-27 11:07:09', NULL);
INSERT INTO `t_massage` VALUES (719, '8f0bff38877545e69cb39806ae4ef743', '恭喜您注册成功，请尽快完善个人信息', 0, 0, '2018-09-30 12:00:25', NULL);
INSERT INTO `t_massage` VALUES (720, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:25', NULL);
INSERT INTO `t_massage` VALUES (721, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:25', NULL);
INSERT INTO `t_massage` VALUES (722, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:26', NULL);
INSERT INTO `t_massage` VALUES (723, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:26', NULL);
INSERT INTO `t_massage` VALUES (724, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:27', NULL);
INSERT INTO `t_massage` VALUES (725, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:27', NULL);
INSERT INTO `t_massage` VALUES (726, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-10-21 08:30:00, 出发地址：浙江温州车站大道全季酒店, 目的地地址：浙江温州江心屿, 用车数量：59座', 0, 0, '2018-10-08 14:46:27', NULL);
INSERT INTO `t_massage` VALUES (727, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:49', NULL);
INSERT INTO `t_massage` VALUES (728, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:49', NULL);
INSERT INTO `t_massage` VALUES (729, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:49', NULL);
INSERT INTO `t_massage` VALUES (730, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:50', NULL);
INSERT INTO `t_massage` VALUES (731, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:50', NULL);
INSERT INTO `t_massage` VALUES (732, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:50', NULL);
INSERT INTO `t_massage` VALUES (733, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20181008024621044正在报价中,请前往参加', 0, 0, '2018-10-08 14:55:50', NULL);
INSERT INTO `t_massage` VALUES (734, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:03:58', NULL);
INSERT INTO `t_massage` VALUES (735, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:03:58', NULL);
INSERT INTO `t_massage` VALUES (736, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:03:59', NULL);
INSERT INTO `t_massage` VALUES (737, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:03:59', NULL);
INSERT INTO `t_massage` VALUES (738, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:03:59', NULL);
INSERT INTO `t_massage` VALUES (739, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:04:00', NULL);
INSERT INTO `t_massage` VALUES (740, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-12-06 12:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术学校, 用车数量：35座', 0, 0, '2018-10-20 17:04:00', NULL);
INSERT INTO `t_massage` VALUES (741, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:02', NULL);
INSERT INTO `t_massage` VALUES (742, '68fe7038972b422c965440066e5f4039', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:02', NULL);
INSERT INTO `t_massage` VALUES (743, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:03', NULL);
INSERT INTO `t_massage` VALUES (744, '8ad829441b0c4a339f003669622e8288', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:03', NULL);
INSERT INTO `t_massage` VALUES (745, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:03', NULL);
INSERT INTO `t_massage` VALUES (746, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:03', NULL);
INSERT INTO `t_massage` VALUES (747, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】出发时间：2018-12-06 13:00:00, 出发地址：浙江温州温州建校, 目的地地址：浙江杭州浙江建设职业技术 学院, 用车数量：29座', 0, 0, '2018-10-20 17:09:04', NULL);
INSERT INTO `t_massage` VALUES (748, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:37', NULL);
INSERT INTO `t_massage` VALUES (749, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:38', NULL);
INSERT INTO `t_massage` VALUES (750, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:38', NULL);
INSERT INTO `t_massage` VALUES (751, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:38', NULL);
INSERT INTO `t_massage` VALUES (752, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:38', NULL);
INSERT INTO `t_massage` VALUES (753, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:39', NULL);
INSERT INTO `t_massage` VALUES (754, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20181020050351159正在报价中,请前往参加', 0, 0, '2018-10-20 17:13:39', NULL);
INSERT INTO `t_massage` VALUES (755, 'da944dfffab84772a8c5e2e07b81b7e9', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:40', NULL);
INSERT INTO `t_massage` VALUES (756, '68fe7038972b422c965440066e5f4039', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:41', NULL);
INSERT INTO `t_massage` VALUES (757, '367cdcc0e4f44d2bac91d870cd921861', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:41', NULL);
INSERT INTO `t_massage` VALUES (758, '8ad829441b0c4a339f003669622e8288', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:41', NULL);
INSERT INTO `t_massage` VALUES (759, '5e2196433a094f4693dc78d6ffcafcb4', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:42', NULL);
INSERT INTO `t_massage` VALUES (760, 'f58da88c9663470898670c6d42b9a534', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:42', NULL);
INSERT INTO `t_massage` VALUES (761, '1047cbb0742745fd8ad2bab6ff104ba1', '【就道巴士】订单号：20181020050856400正在报价中,请前往参加', 0, 0, '2018-10-20 17:18:42', NULL);

-- ----------------------------
-- Table structure for t_order_fleet
-- ----------------------------
DROP TABLE IF EXISTS `t_order_fleet`;
CREATE TABLE `t_order_fleet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `user_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报价车队ID',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报价金额',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '报价时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_fleet
-- ----------------------------
INSERT INTO `t_order_fleet` VALUES (20, '20180809085811936', '367cdcc0e4f44d2bac91d870cd921861', '4000', '2018-08-09 08:59:21');
INSERT INTO `t_order_fleet` VALUES (21, '20180809085811936', '6811fad9861c4784991cc965c0e13419', '4000', '2018-08-09 09:01:18');
INSERT INTO `t_order_fleet` VALUES (22, '20180809110200601', 'f58da88c9663470898670c6d42b9a534', '4000', '2018-08-09 11:02:55');
INSERT INTO `t_order_fleet` VALUES (23, '20180809032112732', 'da944dfffab84772a8c5e2e07b81b7e9', '3000    59座', '2018-08-09 15:25:34');
INSERT INTO `t_order_fleet` VALUES (24, '20180809032112732', '367cdcc0e4f44d2bac91d870cd921861', '5600', '2018-08-09 15:47:23');
INSERT INTO `t_order_fleet` VALUES (25, '20180809032112732', '8ad829441b0c4a339f003669622e8288', '3800', '2018-08-09 15:48:17');
INSERT INTO `t_order_fleet` VALUES (26, '20180811012316788', '8ad829441b0c4a339f003669622e8288', '3200', '2018-08-11 14:15:31');
INSERT INTO `t_order_fleet` VALUES (27, '20180811124602373', '8ad829441b0c4a339f003669622e8288', '5500', '2018-08-11 14:16:15');
INSERT INTO `t_order_fleet` VALUES (28, '20180811011932319', '8ad829441b0c4a339f003669622e8288', '3500', '2018-08-11 14:17:18');
INSERT INTO `t_order_fleet` VALUES (29, '20180811012142175', '8ad829441b0c4a339f003669622e8288', '3200', '2018-08-11 14:18:36');
INSERT INTO `t_order_fleet` VALUES (30, '20180811123252613', '8ad829441b0c4a339f003669622e8288', '5300', '2018-08-11 14:19:55');
INSERT INTO `t_order_fleet` VALUES (31, '20180811030018957', '8ad829441b0c4a339f003669622e8288', '7000', '2018-08-11 15:11:48');
INSERT INTO `t_order_fleet` VALUES (32, '20180811030018957', 'da944dfffab84772a8c5e2e07b81b7e9', '3800元/辆', '2018-08-12 15:34:35');
INSERT INTO `t_order_fleet` VALUES (33, '20180811012316788', 'da944dfffab84772a8c5e2e07b81b7e9', '2200元', '2018-08-12 15:35:10');
INSERT INTO `t_order_fleet` VALUES (34, '20180811012142175', 'da944dfffab84772a8c5e2e07b81b7e9', '2800元', '2018-08-12 15:35:36');
INSERT INTO `t_order_fleet` VALUES (35, '20180811011932319', 'da944dfffab84772a8c5e2e07b81b7e9', '3800元', '2018-08-12 15:36:40');
INSERT INTO `t_order_fleet` VALUES (36, '20180811124602373', 'da944dfffab84772a8c5e2e07b81b7e9', '5500元', '2018-08-12 15:37:07');
INSERT INTO `t_order_fleet` VALUES (37, '20180811123252613', 'da944dfffab84772a8c5e2e07b81b7e9', '5500元', '2018-08-12 15:37:23');
INSERT INTO `t_order_fleet` VALUES (38, '20180812041422861', 'f58da88c9663470898670c6d42b9a534', '5000', '2018-08-12 16:20:41');
INSERT INTO `t_order_fleet` VALUES (39, '20180812090457702', '1047cbb0742745fd8ad2bab6ff104ba1', '666', '2018-08-12 21:05:21');
INSERT INTO `t_order_fleet` VALUES (40, '20180809032112732', 'f58da88c9663470898670c6d42b9a534', '4000', '2018-08-12 22:20:52');
INSERT INTO `t_order_fleet` VALUES (41, '20180814084414831', 'da944dfffab84772a8c5e2e07b81b7e9', '2400', '2018-08-14 09:23:14');
INSERT INTO `t_order_fleet` VALUES (42, '20180813114839336', 'da944dfffab84772a8c5e2e07b81b7e9', '2000', '2018-08-14 09:24:07');
INSERT INTO `t_order_fleet` VALUES (43, '20180814084414831', 'f58da88c9663470898670c6d42b9a534', '2500', '2018-08-14 09:43:55');
INSERT INTO `t_order_fleet` VALUES (44, '20180815125339248', '8ad829441b0c4a339f003669622e8288', '5000', '2018-08-15 12:55:32');
INSERT INTO `t_order_fleet` VALUES (45, '20180815125339248', 'f58da88c9663470898670c6d42b9a534', '5200', '2018-08-15 12:58:56');
INSERT INTO `t_order_fleet` VALUES (46, '20180815014200662', '5e2196433a094f4693dc78d6ffcafcb4', '22', '2018-08-15 13:42:29');
INSERT INTO `t_order_fleet` VALUES (47, '20180815125339248', 'da944dfffab84772a8c5e2e07b81b7e9', '5000', '2018-08-15 14:15:22');
INSERT INTO `t_order_fleet` VALUES (48, '20180815100151410', 'f58da88c9663470898670c6d42b9a534', '1000', '2018-08-15 22:07:51');
INSERT INTO `t_order_fleet` VALUES (49, '20180818101440941', '8ad829441b0c4a339f003669622e8288', '7400', '2018-08-18 10:17:13');
INSERT INTO `t_order_fleet` VALUES (50, '20180819024246527', 'f58da88c9663470898670c6d42b9a534', '700', '2018-08-19 14:45:57');
INSERT INTO `t_order_fleet` VALUES (51, '20180820103934109', '8ad829441b0c4a339f003669622e8288', '19500', '2018-08-20 12:02:21');
INSERT INTO `t_order_fleet` VALUES (52, '20180820034958958', 'da944dfffab84772a8c5e2e07b81b7e9', '1500', '2018-08-20 16:25:38');
INSERT INTO `t_order_fleet` VALUES (53, '20180820045219365', '8ad829441b0c4a339f003669622e8288', '1600', '2018-08-20 16:56:08');
INSERT INTO `t_order_fleet` VALUES (54, '20180821030016236', '8ad829441b0c4a339f003669622e8288', '19000', '2018-08-21 15:44:12');
INSERT INTO `t_order_fleet` VALUES (55, '20180822092549836', '8ad829441b0c4a339f003669622e8288', '20000', '2018-08-22 10:30:53');
INSERT INTO `t_order_fleet` VALUES (56, '20180822040238469', '8ad829441b0c4a339f003669622e8288', '3500', '2018-08-22 16:05:48');
INSERT INTO `t_order_fleet` VALUES (57, '20180823091538051', '8ad829441b0c4a339f003669622e8288', '22000', '2018-08-23 09:30:46');
INSERT INTO `t_order_fleet` VALUES (58, '20180830042628540', 'da944dfffab84772a8c5e2e07b81b7e9', '800', '2018-08-30 16:32:23');
INSERT INTO `t_order_fleet` VALUES (59, '20180829125542457', 'da944dfffab84772a8c5e2e07b81b7e9', '1100', '2018-08-30 16:32:41');
INSERT INTO `t_order_fleet` VALUES (60, '20180904030419902', '8ad829441b0c4a339f003669622e8288', '3300', '2018-09-04 15:19:57');
INSERT INTO `t_order_fleet` VALUES (61, '20180910095721290', '8ad829441b0c4a339f003669622e8288', '1500', '2018-09-10 10:06:03');
INSERT INTO `t_order_fleet` VALUES (62, '20180910021602861', '8ad829441b0c4a339f003669622e8288', '1600', '2018-09-10 14:24:58');
INSERT INTO `t_order_fleet` VALUES (63, '20180918104530957', 'f58da88c9663470898670c6d42b9a534', '2500', '2018-09-18 10:56:08');
INSERT INTO `t_order_fleet` VALUES (64, '20180918105738624', 'f58da88c9663470898670c6d42b9a534', '3400', '2018-09-18 10:58:36');
INSERT INTO `t_order_fleet` VALUES (65, '20180918104530957', '8ad829441b0c4a339f003669622e8288', '2500', '2018-09-18 12:23:56');
INSERT INTO `t_order_fleet` VALUES (66, '20180918075906300', 'f58da88c9663470898670c6d42b9a534', '4500', '2018-09-18 20:11:03');
INSERT INTO `t_order_fleet` VALUES (67, '20180920021616007', 'f58da88c9663470898670c6d42b9a534', '650', '2018-09-20 14:28:36');
INSERT INTO `t_order_fleet` VALUES (68, '20180920030019850', 'f58da88c9663470898670c6d42b9a534', '650', '2018-09-20 17:00:44');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '个人订单表',
  `type` int(11) NULL DEFAULT NULL COMMENT '1-包车，2-单接送',
  `order_uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `user_uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联t_user表uuid',
  `from_time` datetime(0) NULL DEFAULT NULL COMMENT '出发时间',
  `to_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `from_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发省份',
  `from_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发城市',
  `from_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发详细地址',
  `to_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目的地省份',
  `to_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地城市',
  `to_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地详细地址',
  `contact_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `is_invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要发票，是、否',
  `invoice_header` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `invoice_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `invoice_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `invoice_duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税号',
  `use_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用车人数',
  `bus_number` int(11) NULL DEFAULT NULL COMMENT '用车数量，1辆，2辆，3辆，>3辆',
  `bus_number1` int(11) NULL DEFAULT 0 COMMENT '用车座位',
  `bus_number2` int(11) NULL DEFAULT 0 COMMENT '用车座位1',
  `bus_number3` int(11) NULL DEFAULT 0 COMMENT '用车座位2',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `write_time` datetime(0) NULL DEFAULT NULL COMMENT '客户确认报价时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '订单状态，0-预订单，1-等待报价，2-等待客户确认报价，3-行驶中，4-已完成,5-未出行',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `feet_by` bigint(20) NULL DEFAULT NULL COMMENT '车队报价人',
  `feet_money` decimal(18, 2) NULL DEFAULT NULL COMMENT '车队报价金额',
  `feet_time` datetime(0) NULL DEFAULT NULL COMMENT '车队报价时间',
  `feet_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车队备注',
  `audit_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人备注',
  `audit_money` decimal(18, 2) NULL DEFAULT NULL COMMENT '审核人报价金额',
  `audit_by` bigint(255) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `order_fleet_id` int(11) NULL DEFAULT NULL COMMENT '报价关联信息',
  `license_plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `bus_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系号码',
  `contract_over` int(255) NULL DEFAULT 0 COMMENT '0-没有合同，1-有合同',
  `bus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (61, 1, '20180809085811936', '6811fad9861c4784991cc965c0e13419', '2018-08-10 07:00:00', '2018-08-11 18:00:00', '浙江', '温州', NULL, '鹿城区松台', '浙江', '宁波', NULL, '象山', '18606639590', '吴正章', '否', '', '', '', '', '', '50', 1, 54, 0, 0, '', '2018-08-09 08:58:11', '2018-08-09 09:07:57', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, '浙C58587', '18606639590', 1, NULL);
INSERT INTO `t_orders` VALUES (62, 1, '20180809110200601', '6811fad9861c4784991cc965c0e13419', '2018-08-17 08:00:00', '2018-08-18 18:00:00', '内蒙古', '乌海', NULL, '12', '湖北', '襄阳', NULL, '12', '18606639590', '吴政璋', '否', '', '', '', '', '', '50', 1, 54, 0, 0, '', '2018-08-09 11:02:00', '2018-08-09 11:08:13', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (63, 1, '20180809032112732', 'bba3e8f961a74acc87378b43d613ca06', '2018-08-21 09:00:00', '2018-08-22 18:10:00', '浙江', '温州', NULL, '大象城', '福建', '宁德', NULL, '九鲤溪', '13705884553', '孙乒乒', '否', '', '', '', '', '', '62', 1, 54, 0, 0, '', '2018-08-09 15:21:12', '2018-08-09 15:27:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (64, 1, '20180811123252613', '6811fad9861c4784991cc965c0e13419', '2018-08-18 08:00:00', '2018-08-19 19:00:00', '浙江', '温州', NULL, '鹿城区世纪广场', '浙江', '舟山', NULL, '宁波朱家尖', '13957721053', '张斌', '否', '', '', '', '', '', '33', 1, 38, 0, 0, '车子新点', '2018-08-11 12:32:52', '2018-08-11 12:38:53', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (65, 1, '20180811124602373', '06684d83ce39403d9fb06d6603f3e476', '2018-08-18 08:00:00', '2018-08-19 20:00:00', '浙江', '温州', NULL, '世纪广场', '浙江', '舟山', NULL, '朱家尖', '13957721053', '张斌', '否', '', '', '', '', '', '33', 1, 38, 0, 0, '', '2018-08-11 12:46:02', '2018-08-11 12:51:55', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (66, 1, '20180811011932319', '06684d83ce39403d9fb06d6603f3e476', '2018-09-08 07:30:00', '2018-09-09 20:00:00', '浙江', '温州', NULL, '双屿', '浙江', '台州', NULL, '蛇蟠岛，国清寺，石梁飞瀑', '13957721053', '张斌', '否', '', '', '', '', '', '27', 1, 34, 0, 0, '', '2018-08-11 13:19:32', '2018-08-11 13:24:57', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (67, 1, '20180811012142175', '06684d83ce39403d9fb06d6603f3e476', '2018-09-08 07:30:00', '2018-09-09 20:30:00', '浙江', '温州', NULL, '双屿', '浙江', '丽水', NULL, '箬寮，古堰画乡', '13957721053', '张斌', '否', '', '', '', '', '', '30', 1, 34, 0, 0, '', '2018-08-11 13:21:42', '2018-08-11 13:26:59', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (68, 1, '20180811012316788', '06684d83ce39403d9fb06d6603f3e476', '2018-09-15 07:30:00', '2018-09-16 20:30:00', '浙江', '温州', NULL, '双屿', '福建', '宁德', NULL, '福鼎，九鲤溪，小白鹭', '13957721053', '张斌', '否', '', '', '', '', '', '27', 1, 34, 0, 0, '', '2018-08-11 13:23:16', '2018-08-11 13:29:01', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (69, 1, '20180811030018957', 'afb7482e786349ffb54613d754c521d6', '2018-08-24 09:00:00', '2018-08-25 18:55:00', '浙江', '温州', NULL, '鹿城区新城客运站', '浙江', '温州', NULL, '泰顺姐妹廊桥附近', '13868844622', '叶浩', '否', '', '', '', '', '', '100', 2, 54, 54, 0, '', '2018-08-11 15:00:18', '2018-08-11 15:06:04', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (70, 1, '20180812041422861', '6811fad9861c4784991cc965c0e13419', '2018-08-31 08:00:00', '2018-09-01 18:00:00', '浙江', '温州', '鹿城区', '松台广场', '湖北', '十堰', '鹿城区', '乡下', '18606639590', '18606639590', '否', '', '', '', '', '', '100', 3, 18, 35, 63, '', '2018-08-12 16:14:22', '2018-08-12 16:40:38', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (71, 1, '20180812090457702', 'ff37b227a0f24cdf9aabfff6d4091ced', '2018-08-12 21:04:00', '2018-08-12 21:04:00', '浙江', '温州', '鹿城区', '测试数据', '浙江', '温州', '鹿城区', '测试数据', '15260282340', '15260282340', '否', '', '', '', '', '', '1', 1, 18, 0, 0, '测试数据', '2018-08-12 21:04:57', '2018-08-12 21:07:23', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, '测试数据', '测试数据', 1, '测试数据');
INSERT INTO `t_orders` VALUES (72, 1, '20180813114839336', '734ba42bd3644216bbc5adfb4756a50c', '2018-08-13 23:50:00', '2018-08-14 14:45:00', '浙江', '温州', '鹿城区', '测试', '浙江', '温州', '龙湾区', '测试', '15167184543', '15167184543', '否', '', '', '', '', '', '33', 1, 35, 0, 0, '', '2018-08-13 23:48:39', '2018-08-13 23:59:18', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (73, 1, '20180814084414831', '06684d83ce39403d9fb06d6603f3e476', '2018-08-16 07:00:00', '2018-08-17 20:30:00', '浙江', '温州', '鹿城区', '新城站', '浙江', '温州', '洞头县', '洞头', '13957721053', '13957721053', '否', '', '', '', '', '', '22', 1, 29, 0, 0, '', '2018-08-14 08:44:14', '2018-08-14 08:54:27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (74, 1, '20180815125339248', 'c48706f7bbfe4d43b443b0e0fbdf51aa', '2018-08-19 06:30:00', '2018-08-20 16:55:00', '浙江', '温州', '龙湾区', '龙湾和瓯北两站接送', '浙江', '宁波', '象山县', '象山阿拉的海 象山影视城', '13957725922', '13957725922', '否', '', '', '', '', '', '50', 1, 53, 0, 0, '', '2018-08-15 12:53:39', '2018-08-15 13:03:51', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (75, 1, '20180815014200662', '734ba42bd3644216bbc5adfb4756a50c', '2018-08-15 13:41:00', '2018-08-15 13:41:00', '浙江', '温州', '龙湾区', '测试', '浙江', '温州', '永嘉县', '测试', '15167184543', '15167184543', '否', '', '', '', '', '', '33', 1, 35, 0, 0, '', '2018-08-15 13:42:00', '2018-08-15 13:55:37', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (76, 2, '20180815100151410', 'b4473f4727a74ae39bd88b0016965297', '2018-08-20 15:00:00', NULL, '浙江', '温州', '永嘉县', '永嘉县人民医院', '浙江', '温州', '鹿城区', '温州机场国内厅', '13757743578', '斯超', '否', '', '', '', '', '', '20', 1, 29, 0, 0, '中途在温州世纪广场接一批客人', '2018-08-15 22:01:51', '2018-08-15 22:16:08', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (77, 1, '20180818101440941', '589a754d198f4493a63674ba37dbbb5a', '2018-08-19 08:30:00', '2018-08-21 18:00:00', '浙江', '温州', '鹿城区', '南塘天桥大榕树（少艺校西大门）', '浙江', '杭州', '淳安县', '千岛湖', '13957789651', '精诚晓惠', '是', '温州市精诚国际旅行社有限公司', '工行1203202009045183557', '13732021685', '温州市人民东路13号楼华宫大厦九楼55586536', '913303026936476313', '63', 1, 63, 0, 0, '', '2018-08-18 10:14:40', '2018-08-18 10:26:53', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, '浙C39160', '13626589918', 1, '贾师傅');
INSERT INTO `t_orders` VALUES (78, 1, '20180819114718937', '734ba42bd3644216bbc5adfb4756a50c', '2018-08-20 11:45:00', '2018-08-21 11:45:00', '浙江', '温州', '鹿城区', '测试', '浙江', '温州', '苍南县', '测试', '15167184543', '15167184543', '否', '', '', '', '', '', '33', 1, 35, 0, 0, '', '2018-08-19 11:47:18', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (79, 2, '20180819024246527', 'b4473f4727a74ae39bd88b0016965297', '2018-08-20 15:00:00', NULL, '浙江', '温州', '永嘉县', '上塘戈田口', '浙江', '温州', '龙湾区', '温州机场T2国内航站楼', '13567728369', '周巧巧', '否', '', '', '', '', '', '23', 1, 35, 0, 0, '中途在温州世纪广场街另一波', '2018-08-19 14:42:46', '2018-08-19 15:32:29', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, '浙C35737', '18608618858', 1, '杨师傅');
INSERT INTO `t_orders` VALUES (80, 1, '20180820103934109', 'c650e1b9bd374721884952fe89dfd9ec', '2018-08-27 08:00:00', '2018-08-31 17:00:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '杭州', '淳安县', '千岛湖', '13957797181', '13957797181', '是', '温州市精诚国际旅行社有限公司', '工行温州市分行营业部1203202009045183557 ', '13957797181', '地址、电话： 温州市人民东路13号楼华宫大厦九楼 55586536 ', '913303026936476313', '120', 2, 63, 59, 0, '', '2018-08-20 10:39:34', '2018-08-20 10:50:35', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (81, 1, '20180820034958958', '3e75618080aa4f519ada0fcd77385c00', '2018-08-25 08:30:00', '2018-08-25 19:00:00', '浙江', '温州', '鹿城区', '市区', '浙江', '丽水', '莲都区', '冒险岛', '15869149795', '15869149795', '否', '', '', '', '', '', '10', 1, 18, 0, 0, '', '2018-08-20 15:49:58', '2018-08-20 16:00:41', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (82, 1, '20180820045219365', '31afe8a19711494889c87d6efb4a0d7f', '2018-08-21 08:50:00', '2018-08-21 19:50:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '温州', '洞头县', '大门岛', '13819702185', '王茹', '否', '', '', '', '', '', '30', 1, 35, 0, 0, '', '2018-08-20 16:52:19', '2018-08-20 17:04:44', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (83, 1, '20180821030016236', 'c650e1b9bd374721884952fe89dfd9ec', '2018-08-27 08:00:00', '2018-08-31 17:00:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '杭州', '淳安县', '千岛湖', '13957797181', '13957797181', '是', '温州市精诚国际旅行社有限公司 ', '工行温州市分行营业部1203202009045183557 ', '13957797181', '温州市人民东路13号楼华宫大厦九楼 55586536 ', '913303026936476313 ', '116', 2, 59, 59, 0, '要两年内新车', '2018-08-21 15:00:16', '2018-08-21 15:11:04', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (84, 1, '20180822092549836', 'c650e1b9bd374721884952fe89dfd9ec', '2018-08-27 08:00:00', '2018-08-31 17:00:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '杭州', '淳安县', '千岛湖', '13957797181', '13957797181', '是', '温州市精诚国际旅行社有限公司 ', '工行温州市分行营业部1203202009045183557 ', '13957797181', '温州市人民东路13号楼华宫大厦九楼 55586536 ', ' 913303026936476313 ', '116', 2, 63, 63, 0, '车辆需要两年内新车', '2018-08-22 09:25:49', '2018-08-22 09:36:20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (85, 2, '20180822040238469', '91a46ee26d6e47cab6c7b745bad64fca', '2018-08-29 07:00:00', NULL, '浙江', '温州', '鹿城区', '松台广场', '浙江', '杭州', '萧山区', '萧山机场', '18367835186', '18367835186', '否', '', '', '', '', '', '', 1, 37, 0, 0, '', '2018-08-22 16:02:38', '2018-08-22 16:13:29', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (86, 1, '20180823091538051', 'c650e1b9bd374721884952fe89dfd9ec', '2018-08-27 08:00:00', '2018-08-31 17:00:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '杭州', '淳安县', '千岛湖', '13957797181', '13957797181', '是', '温州市精诚国际旅行社有限公司 ', '工行温州市分行营业部1203202009045183557 ', '13957797181', '温州市人民东路13号楼华宫大厦九楼 55586536 ', ' 913303026936476313 ', '120', 3, 37, 37, 53, '需要两年内新车，一定要两年内，不能超过', '2018-08-23 09:15:38', '2018-08-24 16:10:19', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (87, 1, '20180829125542457', '89485fc81bb1462a83f07ef1178c3012', '2018-09-07 07:00:00', '2018-09-07 19:00:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '温州', '洞头县', '望海楼、仙叠岩、海霞主题公园', '13867725021', '13867725021', '否', '', '', '', '', '', '15', 1, 18, 0, 0, '', '2018-08-29 12:55:42', '2018-08-29 13:06:39', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (88, 2, '20180830042628540', 'b4473f4727a74ae39bd88b0016965297', '2018-08-31 17:00:00', NULL, '浙江', '温州', '龙湾区', '温州机场国内出发厅', '浙江', '温州', '永嘉县', '永嘉县人民医院', '13566257822', '刘海鹰', '否', '', '', '', '', '', '23', 1, 29, 0, 0, '经停 温州世纪广场', '2018-08-30 16:26:28', '2018-08-30 16:37:02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (89, 1, '20180904030419902', '06684d83ce39403d9fb06d6603f3e476', '2018-09-29 07:00:00', '2018-09-30 20:00:00', '浙江', '温州', '鹿城区', '双屿', '福建', '宁德', '福鼎市', '九鲤溪', '13957721053', '13957721053', '否', '', '', '', '', '', '30', 1, 35, 0, 0, '', '2018-09-04 15:04:19', '2018-09-06 11:49:25', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (90, 1, '20180906120037410', '0001dd96b54d48bdb3ae1e30e67dd0d1', '2018-09-08 07:00:00', '2018-09-09 20:00:00', '浙江', '温州', '鹿城区', '温州松台广场', '浙江', '嘉兴', '桐乡市', '南湖附近  乌镇南栅老街   康馨园（另带三个购物点）', '18966277729', '18966277729', '是', '苏州浙风旅行社有限公司温州分公司', '浙江温州鹿城农村商业银行股份有限公司绣山支行 201000167980415', '18966277729', '温州市鹿城区汤家桥路大自然家园2幢702室0577-88919859  ', '91330302MA287EP2XE', '60', 1, 63, 63, 0, '司机没有额外辛苦费，到时候导游分流水给司机', '2018-09-06 12:00:37', '2018-09-06 12:11:21', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (91, 1, '20180906125141865', 'b140ec0e3544419ea7f81952ba56af73', '2018-09-30 07:50:00', '2018-10-01 20:30:00', '浙江', '温州', '永嘉县', '瓯北报喜鸟', '浙江', '杭州', '桐庐县', '龙潭小区', '13957718110', '13957718110', '否', '', '', '', '', '', '30', 1, 35, 0, 0, '', '2018-09-06 12:51:41', '2018-09-06 13:02:24', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (92, 1, '20180907094345223', '3e75618080aa4f519ada0fcd77385c00', '2018-09-08 09:00:00', '2018-09-08 19:00:00', '浙江', '温州', '鹿城区', '新城', '浙江', '丽水', '莲都区', '冒险岛', '15869149795', '15869149795', '否', '', '', '', '', '', '18', 1, 18, 0, 0, '', '2018-09-07 09:43:45', '2018-09-07 09:54:43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (93, 1, '20180910095721290', 'c3c00c4266d54c2991fb04e2eacec27b', '2018-09-16 07:55:00', '2018-09-16 07:55:00', '浙江', '温州', '鹿城区', '会展中心和国际大酒店都需要接', '浙江', '温州', '洞头县', '洞头仙叠岩，大沙岙，望海楼', '15957705769', '15957705769', '否', '', '', '', '', '', '25', 1, 35, 0, 0, '可能要在核实到楠溪江的', '2018-09-10 09:57:21', '2018-09-10 10:07:40', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (94, 1, '20180910021602861', 'c3c00c4266d54c2991fb04e2eacec27b', '2018-09-16 07:10:00', '2018-09-16 18:10:00', '浙江', '温州', '鹿城区', '会展中心和国际大酒店两个', '浙江', '温州', '乐清市', '雁荡山', '15957705769', '15957705769', '否', '', '', '', '', '', '25', 1, 35, 0, 0, '', '2018-09-10 14:16:02', '2018-09-10 14:26:46', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (95, 1, '20180918104530957', '097b3ee86d8a461b9faceb988a3a5808', '2018-09-22 08:00:00', '2018-09-22 17:40:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '温州', '泰顺县', '云岚牧场', '15858007520', '15858007520', '否', '', '', '', '', '', '40', 1, 49, 0, 0, '', '2018-09-18 10:45:30', '2018-09-18 10:56:08', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (96, 1, '20180918105738624', '097b3ee86d8a461b9faceb988a3a5808', '2018-09-22 08:00:00', '2018-09-23 17:30:00', '浙江', '温州', '鹿城区', '松台广场', '浙江', '温州', '泰顺县', '云岚牧场', '15858007520', '15858007520', '否', '', '', '', '', '', '40', 1, 49, 0, 0, '', '2018-09-18 10:57:38', '2018-09-19 11:49:56', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (97, 1, '20180918075906300', '3e75618080aa4f519ada0fcd77385c00', '2018-12-07 13:00:00', '2018-12-08 13:00:00', '浙江', '温州', '鹿城区', '市区', '浙江', '杭州', '上城区', '省建院', '15869149795', '15869149795', '否', '', '', '', '', '', '28', 1, 29, 0, 0, '就是学生送过去考试，然后第二天考试结束回来这样', '2018-09-18 19:59:06', '2018-09-18 20:09:19', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (98, 2, '20180920021616007', 'e480ee26123d4828ae5775651227966d', '2018-09-22 14:55:00', NULL, '浙江', '杭州', '江干区', '杭州东动车站', '浙江', '杭州', '萧山区', '杭州萧山机场', '13968854671', '13968854671', '是', '温州市精诚国际旅行社有限公司', '1203202009045183557', '13968854671', '55586536', '913303026936476313', '17', 1, 29, 0, 0, '9月22日G7322动车抵达杭州东时间：14:40送至杭州萧山国际机场国际出发厅', '2018-09-20 14:16:16', '2018-09-20 14:49:51', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (99, 2, '20180920030019850', 'e480ee26123d4828ae5775651227966d', '2018-09-27 17:20:00', NULL, '浙江', '杭州', '萧山区', '杭州萧山机场国际抵达', '浙江', '杭州', '江干区', '杭州东动车站', '13968854671', '13968854671', '是', '温州市精诚国际旅行社有限公司', '1203202009045183557', '13968854671', '55586536', '913303026936476313', '17', 1, 29, 0, 0, '航班时间 09月27日 JT2645  0945--1700  巴厘岛-杭州\n杭州萧山机场送至杭州东动车站', '2018-09-20 15:00:19', '2018-09-21 10:33:54', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, 1, NULL);
INSERT INTO `t_orders` VALUES (100, 1, '20180927105657011', '74ce16f7fc6f46bfa8b03a1b0f83d8a3', '2018-10-12 08:00:00', '2018-10-15 14:00:00', '浙江', '温州', '乐清市', '温州香格里拉大酒店', '浙江', '杭州', '其他', '杭州萧山机场', '13306259427', '13306259427', '否', '', '', '', '', '', '47', 1, 53, 0, 0, '', '2018-09-27 10:56:57', '2018-09-27 11:08:10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (101, 1, '20181008024621044', '06684d83ce39403d9fb06d6603f3e476', '2018-10-21 08:30:00', '2018-10-21 15:00:00', '浙江', '温州', '鹿城区', '车站大道全季酒店', '浙江', '温州', '鹿城区', '江心屿', '13957721053', '13957721053', '否', '', '', '', '', '', '57', 1, 59, 0, 0, '11:30送动车站', '2018-10-08 14:46:21', '2018-10-08 14:56:51', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (102, 1, '20181020050351159', '3e75618080aa4f519ada0fcd77385c00', '2018-12-06 12:00:00', '2018-12-08 19:00:00', '浙江', '温州', '鹿城区', '温州建校', '浙江', '杭州', '萧山区', '浙江建设职业技术学校', '15869149795', '15869149795', '否', '', '', '', '', '', '30', 1, 35, 0, 0, '', '2018-10-20 17:03:51', '2018-10-20 17:14:40', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (103, 1, '20181020050856400', '3e75618080aa4f519ada0fcd77385c00', '2018-12-06 13:00:00', '2018-12-08 19:00:00', '浙江', '温州', '鹿城区', '温州建校', '浙江', '杭州', '萧山区', '浙江建设职业技术 学院', '15869149795', '15869149795', '否', '', '', '', '', '', '29', 1, 29, 0, 0, '人数是29个人', '2018-10-20 17:08:56', '2018-10-20 17:19:43', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_orders` VALUES (104, 1, '20181122035022857', '2a3867dba89f461f8d4e27e2a0560882', '2018-11-30 15:35:00', '2018-12-02 15:35:00', '浙江', '温州', '鹿城区', '松台广场', '福建', '厦门', '其他', '曾厝垵', '13868801213', '13868801213', '否', '', '', '', '', '', '30', 1, 37, 0, 0, '', '2018-11-22 15:50:22', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_code`;
CREATE TABLE `t_sms_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送到的手机号',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `send_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '短信发送时间',
  `type` smallint(255) NULL DEFAULT 1 COMMENT '短信类型，如1=注册、2=找回密码、3=更换手机号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tel_sms_code`(`tel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sms_code
-- ----------------------------
INSERT INTO `t_sms_code` VALUES (29, '18958979869', '6849', '2018-08-09 12:10:17', 1);
INSERT INTO `t_sms_code` VALUES (30, '18758723844', '2157', '2018-08-09 13:43:34', 1);
INSERT INTO `t_sms_code` VALUES (31, '18958872102', '3535', '2018-08-09 13:46:01', 1);
INSERT INTO `t_sms_code` VALUES (32, '13057778578', '27910', '2018-08-09 14:17:48', 1);
INSERT INTO `t_sms_code` VALUES (33, '18967757805', '4118', '2018-08-09 14:28:44', 1);
INSERT INTO `t_sms_code` VALUES (34, '18967757805', '1010105', '2018-08-09 14:28:50', 1);
INSERT INTO `t_sms_code` VALUES (35, '18967757805', '6628', '2018-08-09 14:29:45', 1);
INSERT INTO `t_sms_code` VALUES (36, '13705884553', '5113', '2018-08-09 15:05:09', 1);
INSERT INTO `t_sms_code` VALUES (37, '13705884553', '2365', '2018-08-09 15:05:10', 1);
INSERT INTO `t_sms_code` VALUES (38, '13705884553', '2787', '2018-08-09 15:05:58', 1);
INSERT INTO `t_sms_code` VALUES (39, '13705884553', '2865', '2018-08-09 15:06:31', 1);
INSERT INTO `t_sms_code` VALUES (40, '13777769025', '1646', '2018-08-09 16:16:12', 1);
INSERT INTO `t_sms_code` VALUES (41, '13777769025', '1948', '2018-08-09 16:16:14', 1);
INSERT INTO `t_sms_code` VALUES (42, '13777769025', '3691', '2018-08-09 16:17:18', 1);
INSERT INTO `t_sms_code` VALUES (43, '13758492988', '7339', '2018-08-10 15:36:29', 1);
INSERT INTO `t_sms_code` VALUES (44, '15867797550', '8225', '2018-08-10 18:10:32', 1);
INSERT INTO `t_sms_code` VALUES (45, '13736330052', '39106', '2018-08-11 11:43:07', 1);
INSERT INTO `t_sms_code` VALUES (46, '18957766155', '6549', '2018-08-11 12:13:23', 1);
INSERT INTO `t_sms_code` VALUES (47, '13957721053', '9873', '2018-08-11 12:43:54', 1);
INSERT INTO `t_sms_code` VALUES (48, '13857727958', '8632', '2018-08-11 14:35:28', 1);
INSERT INTO `t_sms_code` VALUES (49, '13857727958', '94910', '2018-08-11 14:35:30', 1);
INSERT INTO `t_sms_code` VALUES (50, '13857727958', '10681', '2018-08-11 14:35:47', 1);
INSERT INTO `t_sms_code` VALUES (51, '13857727958', '5565', '2018-08-11 14:36:35', 1);
INSERT INTO `t_sms_code` VALUES (52, '13868844622', '58108', '2018-08-11 14:56:01', 1);
INSERT INTO `t_sms_code` VALUES (53, '13736799739', '3442', '2018-08-14 12:15:35', 1);
INSERT INTO `t_sms_code` VALUES (54, '13566295515', '2915', '2018-08-14 13:56:40', 1);
INSERT INTO `t_sms_code` VALUES (55, '15869149795', '10922', '2018-08-14 16:01:46', 1);
INSERT INTO `t_sms_code` VALUES (56, '13957725922', '3736', '2018-08-15 12:47:59', 1);
INSERT INTO `t_sms_code` VALUES (57, '13757743578', '9548', '2018-08-15 21:58:58', 1);
INSERT INTO `t_sms_code` VALUES (58, '18966277729', '1923', '2018-08-16 16:53:28', 1);
INSERT INTO `t_sms_code` VALUES (59, '13957789651', '5827', '2018-08-18 09:52:07', 1);
INSERT INTO `t_sms_code` VALUES (60, '13957789651', '26106', '2018-08-18 09:59:41', 1);
INSERT INTO `t_sms_code` VALUES (61, '13957797181', '31035', '2018-08-20 10:34:02', 1);
INSERT INTO `t_sms_code` VALUES (62, '15957705769', '3591', '2018-08-20 13:25:45', 1);
INSERT INTO `t_sms_code` VALUES (63, '13868801213', '9762', '2018-08-20 14:24:11', 1);
INSERT INTO `t_sms_code` VALUES (64, '15067880818', '10757', '2018-08-20 16:10:36', 1);
INSERT INTO `t_sms_code` VALUES (65, '15067880818', '8247', '2018-08-20 16:10:39', 1);
INSERT INTO `t_sms_code` VALUES (66, '15067880818', '8847', '2018-08-20 16:11:50', 1);
INSERT INTO `t_sms_code` VALUES (67, '13819702185', '2577', '2018-08-20 16:49:36', 1);
INSERT INTO `t_sms_code` VALUES (68, '15067895390', '101047', '2018-08-21 16:47:48', 1);
INSERT INTO `t_sms_code` VALUES (69, '15067895390', '9921', '2018-08-21 16:48:08', 1);
INSERT INTO `t_sms_code` VALUES (70, '13857738133', '38105', '2018-08-22 14:37:43', 1);
INSERT INTO `t_sms_code` VALUES (71, '18367835186', '7716', '2018-08-22 15:02:16', 1);
INSERT INTO `t_sms_code` VALUES (72, '13867725021', '57210', '2018-08-22 15:23:34', 1);
INSERT INTO `t_sms_code` VALUES (73, '13806549109', '44109', '2018-08-22 16:15:24', 1);
INSERT INTO `t_sms_code` VALUES (74, '13968878550', '59810', '2018-08-22 16:29:37', 1);
INSERT INTO `t_sms_code` VALUES (75, '13616689776', '9964', '2018-08-24 12:26:11', 1);
INSERT INTO `t_sms_code` VALUES (76, '13615035576', '53109', '2018-08-25 15:51:02', 1);
INSERT INTO `t_sms_code` VALUES (77, '13868652651', '3479', '2018-08-30 08:35:18', 1);
INSERT INTO `t_sms_code` VALUES (78, '13587868601', '2698', '2018-09-03 14:50:44', 1);
INSERT INTO `t_sms_code` VALUES (79, '13957718110', '2138', '2018-09-06 12:49:34', 1);
INSERT INTO `t_sms_code` VALUES (80, '15858007520', '2134', '2018-09-18 10:43:47', 1);
INSERT INTO `t_sms_code` VALUES (81, '13968854671', '10531', '2018-09-19 17:01:40', 1);
INSERT INTO `t_sms_code` VALUES (82, '13968854671', '5896', '2018-09-19 17:01:40', 1);
INSERT INTO `t_sms_code` VALUES (83, '13306259727', '3456', '2018-09-27 10:48:31', 1);
INSERT INTO `t_sms_code` VALUES (84, '13306259427', '5592', '2018-09-27 10:48:43', 1);
INSERT INTO `t_sms_code` VALUES (85, '15868085008', '1635', '2018-09-30 12:00:12', 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(2) NULL DEFAULT NULL COMMENT '1-个人，2-公司',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户唯一ID，GUID去掉横线',
  `tel` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别，男，女，保密',
  `header_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `locked` smallint(6) NULL DEFAULT 0 COMMENT '用户是否被锁定，锁定后不能登录',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人，关联的是m_sys_user表id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `login_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_id_short_user`(`uuid`) USING BTREE,
  UNIQUE INDEX `p_id`(`tel`, `type`, `create_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (36, 1, 'ff37b227a0f24cdf9aabfff6d4091ced', '15260282340', '15260282340', 'e10adc3949ba59abbe56e057f20f883e', '', '', 'null', 'http://www.jiudaobus.com/cms_images/cb605cb7832847b0a97c59ac47f66b0a.jpg', 0, NULL, '2018-07-31 21:05:43', '2018-08-07 23:50:20');
INSERT INTO `t_user` VALUES (37, 2, '1047cbb0742745fd8ad2bab6ff104ba1', '15260282340', '车队1', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, 1, '2018-07-31 21:11:54', '2018-07-31 21:11:54');
INSERT INTO `t_user` VALUES (38, 1, '6811fad9861c4784991cc965c0e13419', '18606639590', '18606639590', '82b1ea83e93ce4915589536f22f9e87b', '', '', '保密', 'http://www.jiudaobus.com/cms_images/de5edb2ecddb4afc88030a8abdfd5a92.jpg', 0, NULL, '2018-08-01 09:23:33', '2018-08-26 11:10:21');
INSERT INTO `t_user` VALUES (39, 2, 'f58da88c9663470898670c6d42b9a534', '13732086423', '测试号', '82b1ea83e93ce4915589536f22f9e87b', NULL, NULL, NULL, NULL, 0, 1, '2018-08-01 09:25:11', '2018-08-01 09:31:15');
INSERT INTO `t_user` VALUES (40, 2, '5e2196433a094f4693dc78d6ffcafcb4', '13616549957', '测试号2', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, 1, '2018-08-01 21:51:52', '2018-08-01 21:51:52');
INSERT INTO `t_user` VALUES (41, 1, '734ba42bd3644216bbc5adfb4756a50c', '15167184543', '15167184543', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-01 21:53:07', '2018-08-01 21:53:07');
INSERT INTO `t_user` VALUES (42, 1, 'b6558a25e3f94622a2d7d22d9696b207', '13616605427', '13616605427', 'e0a72f1dbcd263eb513acd2863dae5ff', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-08 09:35:17', '2018-08-08 09:35:17');
INSERT INTO `t_user` VALUES (43, 1, 'ae4028555e104f66858316b2c638bb91', '13616524441', '13616524441', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-08 09:35:43', '2018-08-08 09:35:43');
INSERT INTO `t_user` VALUES (44, 2, '8ad829441b0c4a339f003669622e8288', '13616605427', '快乐之旅车队', 'e0a72f1dbcd263eb513acd2863dae5ff', NULL, NULL, NULL, NULL, 0, 1, '2018-08-08 09:55:29', '2018-08-08 10:00:32');
INSERT INTO `t_user` VALUES (45, 1, '79e448f93e324303a8ca2bf33e442afc', '13868849816', '13868849816', '0448424bf6ce90acb8ec6e9de59ac192', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-08 11:14:49', '2018-08-08 11:14:49');
INSERT INTO `t_user` VALUES (46, 1, '1cafe514adbc4c2c9a82e5b5d6d9d8d9', '15267737090', '15267737090', 'cba1138c3ae5dc5c9c12d4f9b4e59f5c', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-08 11:39:34', '2018-08-08 11:39:34');
INSERT INTO `t_user` VALUES (47, 2, '367cdcc0e4f44d2bac91d870cd921861', '18858705693', '向洋汽车租赁', '702a9fdf53d2a8c3c74b1908490daccd', NULL, NULL, NULL, NULL, 0, 1, '2018-08-09 08:54:00', '2018-08-09 08:54:00');
INSERT INTO `t_user` VALUES (48, 2, '68fe7038972b422c965440066e5f4039', '15356291980', '温州外事车队', '8f7a1c357f213441172fbde95f413c5d', NULL, NULL, NULL, NULL, 0, 1, '2018-08-09 11:14:33', '2018-08-09 11:14:33');
INSERT INTO `t_user` VALUES (49, 1, '5681094a077c4abdb2b52b88d0c91ba1', '18958979869', '18958979869', '5b8931610ca3c16f88d6805d994e75de', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 12:10:39', '2018-08-09 12:10:39');
INSERT INTO `t_user` VALUES (50, 2, 'da944dfffab84772a8c5e2e07b81b7e9', '18968814999', '中旅车队', '476854ffd891b1425833e691a1621643', NULL, NULL, NULL, NULL, 0, 1, '2018-08-09 12:43:44', '2018-08-09 12:43:44');
INSERT INTO `t_user` VALUES (51, 1, '974c30d3398547d393f914d37a922433', '18758723844', '18758723844', 'dbf99e2cf0a8f08ec3c7a9922da7757b', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 13:44:09', '2018-08-09 13:44:09');
INSERT INTO `t_user` VALUES (52, 1, '1602f4c9449640a086bde613769f5d69', '18958872102', '18958872102', 'a0bbbfe04dd503492581267c09b54116', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 13:46:31', '2018-08-09 13:46:31');
INSERT INTO `t_user` VALUES (53, 1, '723a7eb55a7c458eb1c46c18475e1d4a', '13057778578', '13057778578', '0c1200997fc62092e6b0fe4c5a7a7f05', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 14:18:12', '2018-08-09 14:18:12');
INSERT INTO `t_user` VALUES (54, 1, 'f85b8dc6c7f14edda9fa179903f24cd7', '18967757805', '18967757805', '0bf07199e392d920caba3dae952bce2b', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 14:30:01', '2018-08-09 14:30:01');
INSERT INTO `t_user` VALUES (55, 1, 'bba3e8f961a74acc87378b43d613ca06', '13705884553', '13705884553', '9c2f9a8462f53e0db4d1124b5bbc5c94', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 15:06:43', '2018-08-09 15:06:43');
INSERT INTO `t_user` VALUES (56, 1, '172a126883824d19ab541bc6d417e97c', '13777769025', '13777769025', 'bf1ef711f6f87095cb5c38f88ecd533e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-09 16:17:29', '2018-08-09 16:17:29');
INSERT INTO `t_user` VALUES (57, 1, '83e2b86881b341818c0aaf469ddac894', '13758492988', '13758492988', '1dfa099ece579446617cd75be362d7ac', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-10 15:36:59', '2018-08-10 15:36:59');
INSERT INTO `t_user` VALUES (58, 1, '2ceaa2135e7349a6a9556590f3dd1388', '15867797550', '15867797550', 'b4ed99c0de60df97c9ef2fb8b700778d', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-10 18:11:00', '2018-08-10 18:11:00');
INSERT INTO `t_user` VALUES (59, 1, '18278ae4c6574279a9a8ea785df8d457', '13736330052', '13736330052', '2ce91528a594462203f4173154c3f580', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-11 11:43:31', '2018-08-11 11:43:31');
INSERT INTO `t_user` VALUES (60, 1, '44c66991f6904eecba0c6fafda7316c5', '18957766155', '18957766155', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-11 12:13:49', '2018-08-11 12:13:49');
INSERT INTO `t_user` VALUES (61, 1, '06684d83ce39403d9fb06d6603f3e476', '13957721053', '13957721053', '647c91a39b6f44b39821ac82bf9d7283', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-11 12:44:21', '2018-08-11 12:44:21');
INSERT INTO `t_user` VALUES (62, 1, 'd87440e8b4274d8e95558d60f859e74a', '13857727958', '13857727958', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-11 14:36:49', '2018-08-11 14:36:49');
INSERT INTO `t_user` VALUES (63, 1, 'afb7482e786349ffb54613d754c521d6', '13868844622', '13868844622', 'd2e158141c58ee386dcd2080794ec316', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-11 14:56:20', '2018-08-11 14:56:20');
INSERT INTO `t_user` VALUES (64, 1, 'cc114ca49c58444c86631c12197cbf6d', '13736799739', '13736799739', '0e01938fc48a2cfb5f2217fbfb00722d', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-14 12:16:01', '2018-08-14 12:16:01');
INSERT INTO `t_user` VALUES (65, 1, 'e08b0e1d75324d15918069a8dc5473cf', '13566295515', '13566295515', '0f41337e777aba2cc36c9035c4bdb7a4', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-14 13:57:07', '2018-08-14 13:57:07');
INSERT INTO `t_user` VALUES (66, 1, '3e75618080aa4f519ada0fcd77385c00', '15869149795', '15869149795', '193999df8484d30475de8a6200627525', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-14 16:02:10', '2018-08-14 16:02:10');
INSERT INTO `t_user` VALUES (67, 1, 'c48706f7bbfe4d43b443b0e0fbdf51aa', '13957725922', '13957725922', '335d3b5a32a5e13d21874137cc4832a8', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-15 12:48:24', '2018-08-15 12:48:24');
INSERT INTO `t_user` VALUES (68, 1, 'b4473f4727a74ae39bd88b0016965297', '13757743578', '13757743578', '5f9aa8a452e2df65a1c3e4f2272a96c2', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-15 21:59:29', '2018-08-15 21:59:29');
INSERT INTO `t_user` VALUES (69, 1, '0001dd96b54d48bdb3ae1e30e67dd0d1', '18966277729', '18966277729', 'eb32c7ff875c1ec1d2625a2dadb5ff7f', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-16 16:53:49', '2018-08-16 16:53:49');
INSERT INTO `t_user` VALUES (70, 1, '589a754d198f4493a63674ba37dbbb5a', '13957789651', '13957789651', '5155f4219350d037c9d569a8f69ba440', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-18 10:00:16', '2018-08-18 10:00:16');
INSERT INTO `t_user` VALUES (71, 1, 'c650e1b9bd374721884952fe89dfd9ec', '13957797181', '13957797181', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-20 10:34:22', '2018-08-20 10:34:22');
INSERT INTO `t_user` VALUES (72, 1, 'c3c00c4266d54c2991fb04e2eacec27b', '15957705769', '15957705769', '4d4c9871047f1e73e9496ff058fcb5e2', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-20 13:26:22', '2018-08-20 13:26:22');
INSERT INTO `t_user` VALUES (73, 1, '2a3867dba89f461f8d4e27e2a0560882', '13868801213', '13868801213', 'e3bbe7260005fd8341ec67c6b1703dbf', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-20 14:24:42', '2018-08-20 14:24:42');
INSERT INTO `t_user` VALUES (74, 1, '6c47b4ad9ddb4a4a9b46d6c4f39ac474', '15067880818', '15067880818', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-20 16:12:21', '2018-08-20 16:12:21');
INSERT INTO `t_user` VALUES (75, 1, '31afe8a19711494889c87d6efb4a0d7f', '13819702185', '13819702185', '429f35fcd795928e7ad18be723c374f8', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-20 16:49:57', '2018-08-20 16:49:57');
INSERT INTO `t_user` VALUES (76, 1, 'f10ffaa6aa2544e7a43307a1d71ae6fa', '13857738133', '13857738133', 'e0356fc692c5b8d2bccf569396ae13d8', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-22 14:38:04', '2018-08-22 14:38:04');
INSERT INTO `t_user` VALUES (77, 1, '91a46ee26d6e47cab6c7b745bad64fca', '18367835186', '18367835186', '83f4dd05662696ec163c6201db1f8d2f', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-22 15:02:50', '2018-08-28 16:50:48');
INSERT INTO `t_user` VALUES (78, 1, '89485fc81bb1462a83f07ef1178c3012', '13867725021', '13867725021', '07a400b513d07452fd84b732127dcb0f', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-22 15:24:09', '2018-08-22 15:24:09');
INSERT INTO `t_user` VALUES (79, 1, '85c00b22fcb145ce8f2a7c83bbf91ded', '13806549109', '13806549109', 'a885edf96f2ffdb37801141e6de79f3a', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-22 16:15:40', '2018-08-22 16:15:40');
INSERT INTO `t_user` VALUES (80, 1, 'bc2a7b9871a24369a809289f16b96538', '13968878550', '13968878550', 'e35cf7b66449df565f93c607d5a81d09', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-22 16:29:56', '2018-08-22 16:29:56');
INSERT INTO `t_user` VALUES (81, 1, 'f2a24d94e70f492f8bc0579f3015e1a7', '13616689776', '13616689776', 'eb9ffe98560e714878c257b31e1bebf3', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-24 12:27:14', '2018-08-24 12:27:14');
INSERT INTO `t_user` VALUES (82, 1, 'd2e91d759a9845bebc208f4beefd05ef', '13615035576', '13615035576', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-25 15:51:22', '2018-08-25 15:51:22');
INSERT INTO `t_user` VALUES (83, 1, '4116ed08498c48b7b26d519ddd089a84', '13868652651', '13868652651', '6cc9c501bf50531f7db0d33d18fbb1e5', NULL, NULL, NULL, NULL, 0, NULL, '2018-08-30 08:35:57', '2018-08-30 08:35:57');
INSERT INTO `t_user` VALUES (84, 1, 'c3c1bce95c4647b5a659a0cd817bead2', '13587868601', '13587868601', 'b834ebd4acc2a799a3cf7bf302c20d49', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-03 14:51:08', '2018-09-03 14:51:08');
INSERT INTO `t_user` VALUES (85, 1, 'b140ec0e3544419ea7f81952ba56af73', '13957718110', '13957718110', '822a53fe0313f39a1d09c8d5d4067e88', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-06 12:50:02', '2018-09-06 12:50:02');
INSERT INTO `t_user` VALUES (86, 1, '097b3ee86d8a461b9faceb988a3a5808', '15858007520', '15858007520', '806b733c30958e2ab22d5048a02d70f5', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-18 10:44:01', '2018-09-18 10:44:01');
INSERT INTO `t_user` VALUES (87, 1, 'e480ee26123d4828ae5775651227966d', '13968854671', '13968854671', '0cd9e3e2e99c286ec5e1693fb1491c65', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-19 17:01:56', '2018-09-19 17:01:56');
INSERT INTO `t_user` VALUES (88, 1, '74ce16f7fc6f46bfa8b03a1b0f83d8a3', '13306259427', '13306259427', '6a89af7ae399e8304c575ff3f5b0e3bc', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-27 10:49:14', '2018-09-27 10:49:14');
INSERT INTO `t_user` VALUES (89, 1, '8f0bff38877545e69cb39806ae4ef743', '15868085008', '15868085008', '58cf703f664397ec4f0ac359b84b565c', NULL, NULL, NULL, NULL, 0, NULL, '2018-09-30 12:00:25', '2018-09-30 12:00:25');

SET FOREIGN_KEY_CHECKS = 1;
