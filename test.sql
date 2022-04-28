/*
Navicat MySQL Data Transfer

Source Server         : Rent
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-04-19 08:47:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat_record
-- ----------------------------
DROP TABLE IF EXISTS `chat_record`;
CREATE TABLE `chat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `num` varchar(16) NOT NULL COMMENT '编号',
  `send` varchar(16) DEFAULT NULL COMMENT '发送者',
  `receive` varchar(16) DEFAULT NULL COMMENT '接受者',
  `state` varchar(4) DEFAULT NULL COMMENT '状态',
  `outtime` date DEFAULT NULL COMMENT '过期时间',
  `sendtime` date DEFAULT NULL COMMENT '发送时间',
  `dsize` float DEFAULT NULL COMMENT '大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for dialogue
-- ----------------------------
DROP TABLE IF EXISTS `dialogue`;
CREATE TABLE `dialogue` (
  `num` varchar(16) NOT NULL COMMENT '编号',
  `send` varchar(16) DEFAULT NULL COMMENT '发送者',
  `receive` varchar(16) DEFAULT NULL COMMENT '接受者',
  `state` varchar(4) DEFAULT NULL COMMENT '状态',
  `outtime` date DEFAULT NULL COMMENT '过期时间',
  `sendtime` date DEFAULT NULL COMMENT '发送时间',
  `dsize` float DEFAULT NULL COMMENT '大小',
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dialogue
-- ----------------------------

-- ----------------------------
-- Table structure for documentfile
-- ----------------------------
DROP TABLE IF EXISTS `documentfile`;
CREATE TABLE `documentfile` (
  `id` tinyint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(40) DEFAULT NULL COMMENT '路径',
  `rent_id` tinyint DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of documentfile
-- ----------------------------
INSERT INTO `documentfile` VALUES ('1', '2022012615240613440564.xlsx', '106');
INSERT INTO `documentfile` VALUES ('4', '2022022316444116344789.xlsx', '106');
INSERT INTO `documentfile` VALUES ('5', '2022022316476996238802.xlsx', '106');
INSERT INTO `documentfile` VALUES ('6', '2022022316498132369046.md', '106');
INSERT INTO `documentfile` VALUES ('7', '2022022316563792364147.xlsx', '106');
INSERT INTO `documentfile` VALUES ('8', '2022022316565387302633.md', '106');
INSERT INTO `documentfile` VALUES ('9', '2022022318062371235983.xlsx', '106');
INSERT INTO `documentfile` VALUES ('10', '2022022318060206369570.md', '106');
INSERT INTO `documentfile` VALUES ('11', 'ertyu', '106');
INSERT INTO `documentfile` VALUES ('12', 'fghjkl', '106');
INSERT INTO `documentfile` VALUES ('13', 'tyjkl', '106');
INSERT INTO `documentfile` VALUES ('14', '2022012615240613440564.xlsx', '107');
INSERT INTO `documentfile` VALUES ('15', '2022022316444116344789.xlsx', '107');
INSERT INTO `documentfile` VALUES ('16', '2022022316476996238802.xlsx', '107');
INSERT INTO `documentfile` VALUES ('17', '2022022316498132369046.md', '107');
INSERT INTO `documentfile` VALUES ('18', '2022022316563792364147.xlsx', '107');
INSERT INTO `documentfile` VALUES ('19', '2022022316565387302633.md', '107');
INSERT INTO `documentfile` VALUES ('20', '2022022318062371235983.xlsx', '107');
INSERT INTO `documentfile` VALUES ('21', '2022040721263931946439.png', '2');
INSERT INTO `documentfile` VALUES ('22', '2022040721357551253214.png', '2');
INSERT INTO `documentfile` VALUES ('23', '2022040721373481721323.png', '2');
INSERT INTO `documentfile` VALUES ('24', '2022040721409344121248.png', '2');
INSERT INTO `documentfile` VALUES ('25', '2022040721593030811697.png', '1');
INSERT INTO `documentfile` VALUES ('26', '2022040721595489500257.png', '1');
INSERT INTO `documentfile` VALUES ('27', '2022040722077892994475.png', '1');
INSERT INTO `documentfile` VALUES ('28', '2022040909080781570644.png', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '资源类型，菜单或都按钮(menu,button)',
  `menu_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `child_num` int NOT NULL DEFAULT '0',
  `listorder` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('00dc5c51e4824f49a30013385f680b0c', '日志管理', 'auth', '/console/log/index', 'log:index', 'e5f52fe2115e46229c60803e478d2e9a', null, '0', '1', '2017-01-06 14:11:23', '2017-05-08 14:55:21');
INSERT INTO `menu` VALUES ('1cc3d9ad04e4424db1bb086d1678925e', '菜单删除', 'auth', '/console/menu/delete', 'menu:delete', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2017-05-10 16:45:30', '2017-05-10 16:45:30');
INSERT INTO `menu` VALUES ('2191c9efc2fa431bb427b81ad938e8aa', '角色保存', 'auth', '/console/role/save', 'role:save', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:41:21', '2017-05-10 16:41:21');
INSERT INTO `menu` VALUES ('362923d31e064f84adb8c23ba91e54d8', '管理员编辑', 'auth', '/console/admin/from', 'admin:edit', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-08 14:57:39', '2017-05-10 16:40:47');
INSERT INTO `menu` VALUES ('3ac96215e82f40b5bfe442e6828641df', '系统管理', 'menu', '/console/system/admin', 'system:admin', '0', null, '3', '1', '2016-12-07 16:00:00', '2017-05-10 16:46:27');
INSERT INTO `menu` VALUES ('6580896645d046a0acf3c1194d7bbf8e', '管理员删除', 'menu', '/console/admin/delete', 'admin:delete', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-10 16:39:44', '2017-05-10 16:39:44');
INSERT INTO `menu` VALUES ('6cda978dc9404ba2bf5854b74735b0bc', '角色管理', 'auth', '/console/role/index', 'role:index', '3ac96215e82f40b5bfe442e6828641df', null, '4', '2', '2016-12-07 16:47:40', '2016-12-07 16:47:40');
INSERT INTO `menu` VALUES ('736bdf0b9aec4c59928a530e34bd9aad', '菜单管理', 'auth', '/console/menu/index', 'menu:index', '3ac96215e82f40b5bfe442e6828641df', null, '3', '3', '2016-12-07 16:50:17', '2016-12-07 16:50:17');
INSERT INTO `menu` VALUES ('85dad2bd9023451fab632dcfc4357d3b', '管理员保存', 'auth', '/console/admin/save', 'admin:save', 'e0dde3b9227c471eb3bd2ba0a7fab131', null, '0', '0', '2017-05-10 16:38:07', '2017-05-10 16:41:00');
INSERT INTO `menu` VALUES ('8a653e3fb15642d9be6aad13b02009fb', '角色授权', 'auth', '/console/role/grant', 'role:grant', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:42:37', '2017-05-10 16:42:37');
INSERT INTO `menu` VALUES ('984909260a06410d9be37c300e3df09d', '会员管理', 'menu', '/console/member/default', 'member:default', '0', null, '1', '0', '2017-05-10 16:50:16', '2018-06-13 14:36:46');
INSERT INTO `menu` VALUES ('9f41af1454d046b596023a2822c5078c', '角色编辑', 'auth', '/console/role/from', 'role:edit', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-08 14:59:25', '2017-05-08 14:59:25');
INSERT INTO `menu` VALUES ('aab7966c97db4643a36cb5afa24be38b', '角色删除', 'menu', '/console/role/delete', 'role:delete', '6cda978dc9404ba2bf5854b74735b0bc', null, '0', '0', '2017-05-10 16:43:37', '2017-05-10 16:43:37');
INSERT INTO `menu` VALUES ('c5cca135ee534bfeb482fb04b9311982', '菜单编辑', 'auth', '/console/menu/from', 'menu:from', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2016-12-07 16:51:31', '2017-05-08 15:00:02');
INSERT INTO `menu` VALUES ('e0dde3b9227c471eb3bd2ba0a7fab131', '管理员管理', 'auth', '/console/admin/index', 'admin:index', '3ac96215e82f40b5bfe442e6828641df', null, '3', '1', '2016-12-07 16:45:47', '2017-05-10 16:39:08');
INSERT INTO `menu` VALUES ('e5f52fe2115e46229c60803e478d2e9a', '扩展设置', 'menu', '/console/system/setting', 'system:setting', '0', null, '1', '3', '2016-12-07 16:36:42', '2017-05-10 16:50:00');
INSERT INTO `menu` VALUES ('e85b2fb3e6ee4d0a9711c577bc842821', '会员管理', 'auth', '/console/member/index', 'member:index', '984909260a06410d9be37c300e3df09d', null, '0', '0', '2017-05-10 16:51:20', '2017-05-10 16:51:20');
INSERT INTO `menu` VALUES ('f4237d06c0c94906bdc04f5ed19cbaeb', '菜单保存', 'auth', '/console/menu/save', 'menu:save', '736bdf0b9aec4c59928a530e34bd9aad', null, '0', '0', '2017-05-10 16:44:51', '2017-05-10 16:44:51');

-- ----------------------------
-- Table structure for paid
-- ----------------------------
DROP TABLE IF EXISTS `paid`;
CREATE TABLE `paid` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(20) NOT NULL COMMENT '地址',
  `price` decimal(10,2) DEFAULT NULL COMMENT '租金',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '应缴日期',
  `paydate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '付款日期',
  `name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '租客',
  `status` tinyint DEFAULT NULL COMMENT '是否付款',
  `house_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paid
-- ----------------------------
INSERT INTO `paid` VALUES ('1', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('2', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('3', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('4', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('5', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('6', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('7', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('8', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('9', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('10', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('11', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('12', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('13', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('14', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('15', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');
INSERT INTO `paid` VALUES ('16', '重庆', '123.00', '2022-03-22 20:23:12', '2022-03-31 20:23:16', '李四', '1', '1');

-- ----------------------------
-- Table structure for rent
-- ----------------------------
DROP TABLE IF EXISTS `rent`;
CREATE TABLE `rent` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rcode` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '信息编码',
  `vname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '会员账号',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标题',
  `area` varchar(16) DEFAULT NULL COMMENT '地区',
  `community` varchar(16) DEFAULT NULL COMMENT '小区名',
  `pay` float DEFAULT NULL COMMENT '租金',
  `content` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详情描述',
  `contacts` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `sys_user_id` tinyint DEFAULT '1' COMMENT '用户id',
  `mode` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '出租方式',
  `storey` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '楼层高度',
  `orientation` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '朝向',
  `elevator` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '是否有电梯',
  `is_rent` tinyint(1) DEFAULT '0' COMMENT '是否出租',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rent
-- ----------------------------
INSERT INTO `rent` VALUES ('1', '7T7P9iZ9sk', 'Zhang Lan', '空中花园', '重庆', 'SDEmETGvBh', '1200', '无', '拎包入住', '90-2682-7622', '0', '1', '0', '0', '0', '1');
INSERT INTO `rent` VALUES ('2', 'eVfQJEaNF6', 'Kathleen Reyes', '空中花园', '重庆', 'vBtTCXqyRB', '974.49', 'PXBrO7nvlX', '拎包入住', '20-368-9823', '0', '1', '0', '0', '0', '1');
INSERT INTO `rent` VALUES ('3', 'oDc3aL8h5k', 'Aoki Mai', '空中花园', '重庆', 'N6Za5CCnZh', '169.48', 'OSrwjt2SVL', '拎包入住', '312-838-4239', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('4', 'WIvyN1nioU', 'Jiang Xiaoming', '空中花园', '重庆', '9vZORUwmrz', '479.58', 'Um8h78mK71', '拎包入住', '52-797-2153', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('5', 'HcUvkSQVha', 'Rosa Simpson', '空中花园', '重庆', '0eCZWxaPdV', '189.99', 'xFZLo9GFWK', '拎包入住', '189-3698-2865', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('6', 'CPmQgpqJgd', 'Yamashita Hazuki', '空中花园', '重庆', 'FuOlUVu3nO', '301.03', '0tFfkTn4nK', '拎包入住', '(121) 983 0203', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('7', 'Eb9DqMdfwV', 'Michael Hamilton', '空中花园', '重庆', 'HukuAJtbN1', '679.25', 'FYHz5LS7qy', '拎包入住', '52-015-7011', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('8', '7VKezVsTFs', 'Wong Wing Sze', '空中花园', '重庆', 'ZWdMy3yYO2', '559.87', 'oqPi8rktmJ', '拎包入住', '330-770-7048', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('9', 'NoL9xTNssB', 'Kam Sau Man', '空中花园', '重庆', 'DOUWRmFjXt', '203.65', 'Gr7AEu3rTO', '拎包入住', '838-525-8301', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('10', '6zNllTAzUN', 'Mo Ming', '空中花园', '重庆', 'BefMdKcI1q', '769.74', 'FGEDrf2cbG', '拎包入住', '7253 155957', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('11', 'V24r2OdV4D', 'Chang Zitao', '空中花园', '重庆', 'duWZpeCMQi', '165.46', 'ObNP5jpuf4', '拎包入住', '7775 599231', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('12', 'G3yfOvLk15', 'Chung Hiu Tung', '空中花园', '重庆', 'ZtcbLOVGq8', '994.01', '4b0vz5Bju5', '拎包入住', '5205 010416', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('13', 'BG8g8pYGWt', 'Liu Zhiyuan', '空中花园', '重庆', '5oKk4LSHvc', '218.21', 'PHhCfwyUXJ', '拎包入住', '212-899-9572', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('14', 'mI8XSH27C7', 'Nathan Sanders', '空中花园', '重庆', 'cUMDyb4kUi', '2.08', 'tpkWiQQTBj', '拎包入住', '(121) 895 7707', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('15', 'TO0iKs7EVq', 'Gary Lee', '空中花园', '重庆', 'xtT9goypUj', '357.9', 'rCuWgIG7gH', '拎包入住', '718-626-7004', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('16', '7H6pt0JHr6', 'Joyce Parker', '空中花园', '重庆', 'Lxz9hYPhaJ', '994.46', 'dk5ElukV8X', '拎包入住', '212-294-8949', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('17', 'ZaBUdb7Sku', 'Kelly Mendoza', '空中花园', '重庆', 'iEDshwwgDJ', '218.38', 'ZVgIwZxtJ0', '拎包入住', '11-100-5990', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('18', 'HuP60xiHLF', 'Gu Zhennan', '空中花园', '重庆', '0HrD6voNmm', '29.23', 'L7olAU6Xcm', '拎包入住', '718-752-9059', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('19', 'qxg8q3tTkI', 'Eva Jimenez', '空中花园', '重庆', 'ZEEZtHh3vR', '445.91', 'VhGStE2J4B', '拎包入住', '718-684-7779', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('20', 'LXxkIkAZkk', 'Fan Jialun', '空中花园', '重庆', 'CVp43bXYIy', '506.58', 'RQF25nVBKq', '拎包入住', '(20) 0476 7436', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('21', 'PcH0d5pLzy', 'Fukuda Daisuke', '空中花园', '重庆', 'iMwOI6uAIJ', '448.26', 'hv280SvnJ0', '拎包入住', '90-7870-4484', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('22', 'f4oJ0piEyM', 'Siu Lik Sun', '空中花园', '重庆', 'RW2i8kmIOw', '930.59', 'Czf70AhE5U', '拎包入住', '11-972-4223', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('23', 'x8t5cGxXI9', 'Fujii Yuto', '空中花园', '重庆', 'e7vW3ZLsVp', '941.99', 'm5XL4Oo11G', '拎包入住', '7125 977416', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('24', 'j8fZRugI1V', 'Chen Ziyi', '空中花园', '重庆', '67163nOMvz', '643.19', 'PlEXOwUiq4', '拎包入住', '330-676-5427', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('25', 'JfiGKDYSq2', 'Mori Hana', '空中花园', '重庆', 'DpFaZ0ZCr1', '396.01', 'SfZbVyImZr', '拎包入住', '5073 076827', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('26', 'NiEZqw2MK8', 'Maeda Itsuki', '空中花园', '重庆', 'eotBPMePBR', '890.88', 's3StVyKc60', '拎包入住', '213-060-9552', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('27', 'vrkz4mCrwH', 'Francis Stephens', '空中花园', '重庆', 'IuE52HiSj6', '846.35', '7o7enCA4K6', '拎包入住', '52-707-9225', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('28', 'eXQXlWpTwg', 'Wong Lai Yan', '空中花园', '重庆', 'Ih3Ok8jP3A', '802.05', 'Gy3JThxgWe', '拎包入住', '80-0376-9559', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('29', 'SAfI8zAvON', 'Yan Anqi', '空中花园', '重庆', 'qpoL4P6b5e', '810.24', 'Z81DPUPxg2', '拎包入住', '718-967-2907', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('30', '1RDsfIybK6', 'Xu Xiaoming', '空中花园', '重庆', 'QOLovwxJVV', '568.31', 'yxw7V4Wv4S', '拎包入住', '213-754-0007', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('31', '0g5qTcby6m', 'Nakano Minato', '空中花园', '重庆', '86vbKZGO96', '322.67', 'wR8dXgkg2F', '拎包入住', '(161) 520 1014', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('32', 'UVbig72Kd2', 'Tang Kwok Yin', '空中花园', '重庆', 'Urxlr3KfrZ', '503.8', '4loAXLqt6x', '拎包入住', '20-707-4680', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('33', 'VQKPb8PTgF', 'Choi Chiu Wai', '空中花园', '重庆', 'Pdhxy6N18q', '654.75', 'NPoAUiLTLF', '拎包入住', '213-750-9725', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('34', 'C1FPpBgJeL', 'Wu Sze Kwan', '空中花园', '重庆', 'WQJGB5N5Hf', '309.22', 'J9L3wDGGLs', '拎包入住', '5297 692196', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('35', 'QnDyFBxRcL', 'Zheng Zhiyuan', '空中花园', '重庆', 'mI92ySh2FN', '445.15', '5CoAmqjnJJ', '拎包入住', '5813 635769', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('36', 'r2oPtiq1rC', 'Sakamoto Itsuki', '空中花园', '重庆', 's6c5uDmcAp', '151.21', 'Etozfn3O79', '拎包入住', '90-1531-4638', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('37', 'kktYhlJ7Lr', 'Todd Johnson', '空中花园', '重庆', '4HoQvesntA', '236.82', 'TJ5kPd90e6', '拎包入住', '70-8367-6121', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('38', 'rlYSVxUzzj', 'Takeda Ryota', '空中花园', '重庆', 'AkZA142Ao5', '531.64', 'UwHvSgihiF', '拎包入住', '74-189-7268', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('39', '52taqxDxO7', 'Zeng Zhennan', '空中花园', '重庆', 'sLKjuF1x8u', '557.59', 'K2JQsB8kz5', '拎包入住', '213-662-7562', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('40', 'ppTHf04vdS', 'Craig Lopez', '空中花园', '重庆', 'C0FzDwFPeX', '373.84', 'ypjN1oa2C3', '拎包入住', '185-1361-4710', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('41', '91djC5YCuK', 'Ogawa Seiko', '空中花园', '重庆', 'UNQE4cJu6P', '813.2', 'EjXUputJbF', '拎包入住', '(20) 9235 2121', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('42', 'lsKkIsOphP', 'Edith Ruiz', '空中花园', '重庆', 'eP4dmnLm6f', '388.26', 'wPvpvHVP6r', '拎包入住', '66-250-8719', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('43', 'qxQQbajiCK', 'Wei Zhennan', '空中花园', '重庆', 'NC2R3PPyU5', '857.98', '2ti8oWbd52', '拎包入住', '213-385-3913', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('44', 'DftI2ajw9K', 'William Ward', '空中花园', '重庆', 'WXa0105r3o', '647.24', 'gdQsWI2LgI', '拎包入住', '614-671-7673', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('45', 'dXUkrwCEDY', 'Sugiyama Rena', '空中花园', '重庆', 'aKoDuD0fiz', '943.03', 'Rvg4DR79Ic', '拎包入住', '28-5318-2126', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('46', 'E1JpTvDj6B', 'Au Fat', '空中花园', '重庆', '7ZStWcNJQv', '352.87', 'ShNLO2QXsP', '拎包入住', '165-5642-8806', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('47', 'EFebBJ2Smb', 'Chiba Sakura', '空中花园', '重庆', 'u0iMSXzqPd', '683.58', 'KyNUYog0l6', '拎包入住', '70-8564-0931', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('48', 'Ajq4C0QhKM', 'Dawn Russell', '空中花园', '重庆', 'qvfYtpWlBN', '200.74', 'xYNpnDZGlV', '拎包入住', '212-627-4613', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('49', 'YEfGhBGBGA', 'Gu Zhennan', '空中花园', '重庆', 'LMcfOQ8GsD', '489.77', '9bgDHnYv0Y', '拎包入住', '769-861-4065', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('50', 'AWQvVVlftR', 'Lee Wai Yee', '空中花园', '重庆', '2SzA3jdFRg', '742.88', 'CPzhXMQl8H', '拎包入住', '213-763-2283', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('51', 'bdv5EmhTfJ', 'Ma Yuning', '空中花园', '重庆', '4uY3I90Ei1', '181.47', 'XBTS6fHAlR', '拎包入住', '(151) 902 7240', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('52', 'DY4CZ5ZBoZ', 'Antonio Torres', '空中花园', '重庆', 'Z3V38HoZNA', '226.52', 'WQxONTnc12', '拎包入住', '90-7073-5349', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('53', '6YJF2aJvZG', 'Tao Jiehong', '空中花园', '重庆', 'MbLA23kjBV', '534.52', '2eCd1l1khZ', '拎包入住', '80-3960-2814', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('54', 'dziK5ebS8g', 'Kono Yuito', '空中花园', '重庆', 'KHYrQWHHhW', '565.73', 'wY6i2wptd3', '拎包入住', '718-590-5380', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('55', 'y2pCk2xkm8', 'Kikuchi Yuito', '空中花园', '重庆', 'DNoByAWa0B', '415.56', 'ZJH5RhqDjG', '拎包入住', '7179 215636', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('56', '1C19nnhLCf', 'Tsui Chi Ming', '空中花园', '重庆', 'SNS1usohEw', '184.44', 'xuE3dJW9nN', '拎包入住', '164-4931-9689', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('57', 'FF9Euw3jbo', 'Qin Rui', '空中花园', '重庆', 'oLCCR34Cuj', '579.99', '2geQjM2Uer', '拎包入住', '212-350-7769', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('58', 'ar1FMGenIz', 'Cheung Sze Yu', '空中花园', '重庆', '79y2dw0DWX', '838.33', 'rbbbkUCmdU', '拎包入住', '5693 482016', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('59', 'uztmNDsu8H', 'Lu Lan', '空中花园', '重庆', 'IYr0OixlTj', '235.24', 'lQKxBE5n4e', '拎包入住', '150-2609-3103', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('60', 'DhFWNmHdwl', 'Sugiyama Ryota', '空中花园', '重庆', '7AjszZvmLE', '263.69', '0ZGovwo342', '拎包入住', '(151) 119 8051', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('61', 'gzoLFk3zis', 'Fujiwara Takuya', '空中花园', '重庆', 'YmuSiodNJo', '115.9', 'jIXn7pK7xa', '拎包入住', '10-634-5220', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('62', '9Z6Hz2OaO4', 'Tang Fat', '空中花园', '重庆', 'eHCU0UDsWl', '423.77', 'FrlTCdC77Z', '拎包入住', '(151) 124 2114', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('63', '4CL54P1Npx', 'Janice Graham', '空中花园', '重庆', 'EPRx2Qn5xc', '714.07', 'SgKO8AyDvk', '拎包入住', '196-0458-3492', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('64', 'DLfBI5KBGE', 'Noguchi Aoshi', '空中花园', '重庆', '2gTRI5mvvx', '616.27', 'uqw1wO7TqH', '拎包入住', '52-298-2106', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('65', 'QHpWNTsOT8', 'Hayashi Hazuki', '空中花园', '重庆', '4GKtzsPKkR', '633.38', 'IvoWtAc9gJ', '拎包入住', '7248 717742', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('66', 'ndG6xLqSjb', 'Ma Suk Yee', '空中花园', '重庆', 'cltSY0HdDK', '896.25', 'lnJvom9Mb0', '拎包入住', '(20) 6883 8666', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('67', 'XThxU7jJdc', 'Ren Jialun', '空中花园', '重庆', 'eSYRDAeTEb', '269.36', 'x6KLgNeJYG', '拎包入住', '5808 123782', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('68', 'lBJw11LpEP', 'Xu Zhiyuan', '空中花园', '重庆', 'asRT0Kdhms', '410.64', 'bwZ6T88siP', '拎包入住', '74-156-1915', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('69', 'EJfJrDXTNn', 'Chang Lik Sun', '空中花园', '重庆', 'rPkvBfuMEb', '305.54', 'hv4d3ajl8N', '拎包入住', '80-1226-8296', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('70', 'fp7vopXUfZ', 'Edna Anderson', '空中花园', '重庆', 'h19EC1idUL', '819.82', 'sOUeoMN4cz', '拎包入住', '5403 732612', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('71', 'EG0LLCwjI5', 'Saito Ayano', '空中花园', '重庆', 'y4s7stduaa', '995.88', 'AGnBIsehRT', '拎包入住', '7191 168629', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('72', 'rspGmrFJNY', 'Duan Lu', '空中花园', '重庆', '9KcHesZ5Gv', '142.64', '5JD1IgGjET', '拎包入住', '11-162-1203', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('73', 'm2qaMTWcpD', 'Miguel Rivera', '空中花园', '重庆', 'T8xaTYkp00', '981.98', 'jKT320QUI4', '拎包入住', '(1223) 23 9806', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('74', 'ajmmBEscjb', 'Tsui Wai Man', '空中花园', '重庆', 'K2ZQdIsaf1', '398.18', 'CO0yNOyfcg', '拎包入住', '70-4982-0301', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('75', 'koNzz4mhZ1', 'Iwasaki Aoshi', '空中花园', '重庆', '3T3PnvJQKV', '669.39', 'STYZEbgkhd', '拎包入住', '5899 860179', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('76', 'VghWaNztQo', 'Shibata Mio', '空中花园', '重庆', 'nqnVDRMwCr', '737.57', '5MzhVY12R6', '拎包入住', '718-247-9843', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('77', 'uY1lfir9bq', 'Kinoshita Kenta', '空中花园', '重庆', 'dtynJVk7JQ', '57.17', 'id85DijTJ7', '拎包入住', '90-8434-9921', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('78', 'BNHBcE0wVG', 'Takeda Mitsuki', '空中花园', '重庆', 'YpfxTZvSaq', '805.72', 'nFL3bPLbD2', '拎包入住', '(20) 4799 1518', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('79', '7NU38Ve7zN', 'Liao Ziyi', '空中花园', '重庆', '9GgeEtyv6u', '809.19', 'PVtsAs85lZ', '拎包入住', '614-492-0333', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('80', 'SaICqxSP3p', 'Yin Kwok Ming', '空中花园', '重庆', '1bOtAFuyPo', '406.22', 'uaiMMOZPMA', '拎包入住', '141-3747-4113', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('81', 'W3wUUin4H5', 'Rose Griffin', '空中花园', '重庆', 'gywg0AXyVM', '254.16', 'jqMwMq0rlX', '拎包入住', '718-351-1063', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('82', '5j6L26unlw', 'Xue Zitao', '空中花园', '重庆', 'gNho7lxUjC', '467.02', 'GuZ1fH0Kdz', '拎包入住', '(1223) 79 3842', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('83', '0Ow22RWCxf', 'Takagi Nanami', '空中花园', '重庆', 'EsLQQ4G4cr', '897.72', 'Ysb3HTTVhS', '拎包入住', '90-1482-6896', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('84', 'Rq6aOgOzfY', 'Song Rui', '空中花园', '重庆', 'GuRXu5yyrb', '69.13', '3x2hkzhIUn', '拎包入住', '172-7116-4608', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('85', 'BJDd9AwGCf', 'Sakai Ikki', '空中花园', '重庆', 'x5zbEyEYXi', '351.05', 'uJyooOx193', '拎包入住', '838-493-4064', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('86', 'VyLh8cclMD', 'Sugawara Ayato', '空中花园', '重庆', 'mVT6Xw6Hhu', '83.89', 'Lmi6dFqHmU', '拎包入住', '212-870-1054', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('87', 'F3gg2IaD0W', 'Hou Zhennan', '空中花园', '重庆', '0tV6bLZ95k', '581.7', 'STZmQ9mjVI', '拎包入住', '66-432-2285', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('88', 'DlA4y2SbyP', 'Liu Rui', '空中花园', '重庆', '3PapB0aU8c', '397.14', 'JuRQByRRsY', '拎包入住', '330-049-2976', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('89', 'gm4FGspOr4', 'Lee On Kay', '空中花园', '重庆', 'unH3DdiGxT', '187.9', 'Mtwr6c9zpl', '拎包入住', '21-563-3390', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('90', 'Uy4mriTFY8', 'Yuen Hok Yau', '空中花园', '重庆', 'QvcXrr9l9N', '602.26', 'D3NVEknvgD', '拎包入住', '90-1830-4667', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('91', 'XJyppYEXN8', 'Terry Kim', '空中花园', '重庆', '6vnfhnfcAv', '208.06', 'V4rl2UxGm6', '拎包入住', '74-705-8883', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('92', 'cEdqKNju6Q', 'Yao Zitao', '空中花园', '重庆', 'xFg6m7qbKB', '152.13', 'ORiYkCzlXU', '拎包入住', '(116) 264 2085', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('93', 'xQ7kL8fYVq', 'Fukuda Ayato', '空中花园', '重庆', 'a50OtxwOE0', '481.1', 'M5qPCbOQyr', '拎包入住', '10-261-3847', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('94', '2AvpOJk6Db', 'Chan Ming', '空中花园', '重庆', 'Lgrxfyu0PK', '833.94', '9vck3bqud9', '拎包入住', '5175 177437', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('95', 'UzEoi3RRge', 'Ishii Mio', '空中花园', '重庆', 'DgXhQ84URI', '492.7', 'FUevxldNRY', '拎包入住', '66-764-5218', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('96', 'LOHLUujeeY', 'Yue Kwok Kuen', '空中花园', '重庆', 'EXJnsMbJxz', '628.35', 'i7Vd1FlhQu', '拎包入住', '20-860-5836', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('97', 'V88G4OXY0M', 'Zeng Lan', '空中花园', '重庆', 'Msc1JFMaKh', '720.61', '3eOzxzNeYv', '拎包入住', '330-899-4172', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('98', 'wUEHXna5bF', 'Irene Hamilton', '空中花园', '重庆', 'JVXrY7dc9p', '652.88', '6XXF9v6Wsg', '拎包入住', '5384 385321', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('99', '2dOpRcBFgD', 'Jiang Xiaoming', '空中花园', '重庆', 'xhvvODUinM', '600.19', '0bVGzt4P7i', '拎包入住', '80-3707-5842', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('100', 'pSVnziiReI', 'Larry Herrera', '空中花园', '重庆', 'SOtF7s7sOG', '553.04', 'LjaEjiqSck', '拎包入住', '(116) 661 0576', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('101', '1314', '小巧', '空中花园', '重庆', null, '3000', '空中花园', '拎包入住', '110', '0', '1', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('106', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '拎包入住', '12313', '1', '1', '2', '2', '0', '0');
INSERT INTO `rent` VALUES ('107', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '拎包入住', '12313', '1', '2', '2', '2', '0', '0');
INSERT INTO `rent` VALUES ('108', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '拎包入住', '12313', '1', '2', '2', '2', '0', '0');
INSERT INTO `rent` VALUES ('109', null, null, '空中花园', '重庆', null, '1500', '无', '拎包入住', null, '2', '1', '2', '1', '0', '0');
INSERT INTO `rent` VALUES ('110', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '3', '1', '0', '0');
INSERT INTO `rent` VALUES ('111', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '3', '2', '0', '0');
INSERT INTO `rent` VALUES ('112', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '2', '2', '1', '0', '0');
INSERT INTO `rent` VALUES ('113', null, null, '空中花园', '重庆', null, null, null, '拎包入住', null, '2', '2', '2', '1', '0', '0');
INSERT INTO `rent` VALUES ('114', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '3', '1', '0', '0');
INSERT INTO `rent` VALUES ('115', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '1', '4', '0', '0');
INSERT INTO `rent` VALUES ('116', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '1', '4', '0', '0');
INSERT INTO `rent` VALUES ('117', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '3', '1', '0', '0');
INSERT INTO `rent` VALUES ('118', null, null, '空中花园', '重庆', null, '1200', null, '拎包入住', null, '2', '1', '3', '1', '0', '0');
INSERT INTO `rent` VALUES ('119', null, null, '空中花园', '重庆', null, null, null, '拎包入住', null, '2', '0', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('120', null, null, '空中花园', '重庆', null, null, null, '拎包入住', null, '2', '0', '0', '0', '0', '0');
INSERT INTO `rent` VALUES ('121', null, null, '空中花园', '重庆', null, null, null, '拎包入住', null, '2', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `role_menu_foreign` (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '00dc5c51e4824f49a30013385f680b0c');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', '984909260a06410d9be37c300e3df09d');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'e5f52fe2115e46229c60803e478d2e9a');
INSERT INTO `role_menu` VALUES ('cbe8356d64a8433cb5dad5c7fccf8dce', 'e85b2fb3e6ee4d0a9711c577bc842821');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `time` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1778507786 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1778507785', '23', '2022-03-29 22:39:09', '酷酷酷');

-- ----------------------------
-- Table structure for solve
-- ----------------------------
DROP TABLE IF EXISTS `solve`;
CREATE TABLE `solve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(30) DEFAULT NULL COMMENT '地址',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上报日期',
  `name` varchar(20) DEFAULT NULL COMMENT '保修人',
  `detail` varchar(50) DEFAULT NULL COMMENT '详情',
  `status` tinyint DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of solve
-- ----------------------------
INSERT INTO `solve` VALUES ('3', '重庆', '2022-03-28 20:43:23', '见见', '水管堡', '0');
INSERT INTO `solve` VALUES ('4', '重庆', '2022-04-01 19:29:54', '见见', '水管堡', '1');
INSERT INTO `solve` VALUES ('5', '重庆', '2022-04-01 19:29:54', '见见', '水管堡', '1');
INSERT INTO `solve` VALUES ('6', '重庆', '2022-04-01 19:29:54', '见见', '水管堡', '1');
INSERT INTO `solve` VALUES ('7', '广州', '2022-03-30 20:16:20', '卡卡', '电灯', '0');
INSERT INTO `solve` VALUES ('8', '杭州', '2022-03-22 21:40:52', '卡卡', '解决', '1');
INSERT INTO `solve` VALUES ('9', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限ID',
  `url` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `sort` tinyint DEFAULT NULL COMMENT '排序',
  `style` varchar(255) DEFAULT NULL COMMENT '样式（可设置css图标）',
  `parent_id` int DEFAULT NULL COMMENT '父主键ID（有值的，属于该值菜单的下级菜单）',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '10001', null, '1', null, null, '88888888', '2021-03-23 15:09:11', null, null, '0');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '10002', '/sys/permission', '2', null, '1', '88888888', '2021-03-23 15:09:11', null, null, '0');
INSERT INTO `sys_menu` VALUES ('3', '角色管理', '10003', '/sys/role', '3', null, '1', '88888888', '2021-03-23 15:09:11', null, null, '0');
INSERT INTO `sys_menu` VALUES ('4', '用户管理', '10004', '/sys/user', '4', null, '1', '88888888', '2021-03-23 15:09:11', null, null, '0');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限ID（自定义）可设置唯一索引UNIQUE',
  `permission_name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述说明',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '10001', '系统管理', '菜单权限（一级菜单）', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('2', '10002', '权限管理', '菜单权限（二级菜单）', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('3', '10003', '角色管理', '菜单权限（二级菜单）', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('4', '10004', '用户管理', '菜单权限（二级菜单）', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('5', '00001', '超级管理员', '当用户角色拥有该权限时，可分配sys_role表中权限ID为该值的角色给用户', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('6', '50001', '组长管理员', '组长角色拥有该权限时，可分配测试员的角色给用户', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('7', '60001', '查询权限列表', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('8', '60002', '新增权限', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('9', '60003', '修改权限', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('10', '60004', '删除权限', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('11', '60005', '查询角色列表', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('12', '60006', '新增角色', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('13', '60007', '修改角色', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('14', '60008', '删除角色', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('15', '60009', '查询用户列表', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('16', '60010', '新增用户', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('17', '60011', '修改用户', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');
INSERT INTO `sys_permission` VALUES ('18', '60012', '删除用户', '接口权限', '88888888', '2021-03-23 15:11:42', null, null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID（自定义）可设置唯一索引UNIQUE',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限类别（主要定义角色属于哪种层级）',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '888888', '超级管理员', '', '88888888', '2021-03-23 15:18:10', null, null, '0');
INSERT INTO `sys_role` VALUES ('2', '100001', 'admin', '00001', '88888888', '2021-03-23 15:18:10', null, null, '0');
INSERT INTO `sys_role` VALUES ('3', '100002', '测试员', '50001', '88888888', '2021-03-23 15:18:10', null, null, '0');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限ID',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限关联表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '888888', '10001', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('2', '888888', '10002', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('3', '888888', '10003', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('4', '888888', '10004', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('5', '888888', '00001', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('6', '888888', '50001', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('7', '888888', '60001', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('8', '888888', '60002', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('9', '888888', '60003', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('10', '888888', '60004', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('11', '888888', '60005', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('12', '888888', '60006', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('13', '888888', '60007', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('14', '888888', '60008', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('15', '888888', '60009', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('16', '888888', '60010', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('17', '888888', '60011', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('18', '888888', '60012', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('19', '100001', '10001', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('20', '100001', '10004', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('21', '100001', '60009', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('22', '100001', '60010', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('23', '100001', '60011', '88888888', '2021-03-23 15:29:09', null, null, '0');
INSERT INTO `sys_role_permission` VALUES ('24', '100001', '60012', '88888888', '2021-03-23 15:29:09', null, null, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID（可设置唯一索引UNIQUE）',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '88888888', '超级管理员', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('2', '80000001', '张三', '$2a$10$kZT9t57ahsVVWQ/dUVAiQuga7SgvevnWzudJjQhBVUKrEK8DWpzpy', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('3', '80000002', '李四', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('4', '80000003', '王五', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('8', null, '小红', '$2a$10$8G90ywa3A7M5TmXLuGym1OkUKa3sQjLN/hN4LgYSi9TuTZ7DyFY2q', '张三', '2022-03-29 21:38:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('9', '5657f9716b6e4eb19a9c5d7a2a19c0b4', '小就', '$2a$10$919sAP9SO8blNz4osmFnu.3ZJ9AeXaSmMDMxL.0p5nixK8OJgI6vi', '张三', '2022-03-29 22:06:09', null, null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '88888888', '888888', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('2', '88888888', '100001', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('3', '88888888', '100002', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('4', '80000001', '100001', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('5', '80000001', '100002', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('6', '80000002', '100002', '88888888', '2021-03-23 15:54:17', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('7', '80000003', '100002', '88888888', '2021-03-23 15:54:17', null, null, '0');

-- ----------------------------
-- Table structure for user_ren_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_ren_ref`;
CREATE TABLE `user_ren_ref` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `rent_id` int DEFAULT NULL COMMENT '出租房id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_ren_ref
-- ----------------------------
