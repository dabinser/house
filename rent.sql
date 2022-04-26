/*
Navicat MySQL Data Transfer

Source Server         : Rent
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : rent

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2022-04-26 17:48:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `rent_id` int(11) DEFAULT NULL COMMENT '房子id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '2', '1');
INSERT INTO `collection` VALUES ('2', '2', '2');
INSERT INTO `collection` VALUES ('3', '2', '3');

-- ----------------------------
-- Table structure for documentfile
-- ----------------------------
DROP TABLE IF EXISTS `documentfile`;
CREATE TABLE `documentfile` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(40) DEFAULT NULL COMMENT '路径',
  `rent_id` int(8) DEFAULT NULL COMMENT '外键',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of documentfile
-- ----------------------------
INSERT INTO `documentfile` VALUES ('1', '2022012615240613440564.xlsx', '106', '2022-04-08');
INSERT INTO `documentfile` VALUES ('4', '2022022316444116344789.xlsx', '106', null);
INSERT INTO `documentfile` VALUES ('5', '2022022316476996238802.xlsx', '106', null);
INSERT INTO `documentfile` VALUES ('6', '2022022316498132369046.md', '106', null);
INSERT INTO `documentfile` VALUES ('7', '2022022316563792364147.xlsx', '106', null);
INSERT INTO `documentfile` VALUES ('8', '2022022316565387302633.md', '106', null);
INSERT INTO `documentfile` VALUES ('9', '2022022318062371235983.xlsx', '106', null);
INSERT INTO `documentfile` VALUES ('10', '2022022318060206369570.md', '106', null);
INSERT INTO `documentfile` VALUES ('11', 'ertyu', '106', null);
INSERT INTO `documentfile` VALUES ('12', 'fghjkl', '106', null);
INSERT INTO `documentfile` VALUES ('13', 'tyjkl', '106', null);
INSERT INTO `documentfile` VALUES ('21', 'th1.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('22', 'th.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('23', 'th2.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('24', 'th3.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('26', 'th4.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('27', 'th5.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('28', 'th6.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('29', 'th7.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('30', '2022042114112077842774.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('31', '2022042114114583331147.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('32', '2022042114191611753658.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('33', '2022042114207983916089.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('34', '2022042114203695313055.jpg', '1', null);
INSERT INTO `documentfile` VALUES ('35', '2022042510384582224489.jpg', '141', '2022-04-25');
INSERT INTO `documentfile` VALUES ('36', '2022042510382992075611.jpg', '141', '2022-04-25');
INSERT INTO `documentfile` VALUES ('37', '2022042510462780646908.jpg', '142', '2022-04-25');
INSERT INTO `documentfile` VALUES ('38', '2022042510460121570923.jpg', '142', '2022-04-25');
INSERT INTO `documentfile` VALUES ('39', '2022042510572971982869.jpg', '143', '2022-04-25');
INSERT INTO `documentfile` VALUES ('40', '2022042510576647020341.jpg', '143', '2022-04-25');
INSERT INTO `documentfile` VALUES ('41', '2022042616102253899030.jpg', '144', '2022-04-26');
INSERT INTO `documentfile` VALUES ('42', '2022042616106492936447.jpg', '144', '2022-04-26');

-- ----------------------------
-- Table structure for paid
-- ----------------------------
DROP TABLE IF EXISTS `paid`;
CREATE TABLE `paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `price` double(10,2) DEFAULT NULL COMMENT '价格',
  `date` date DEFAULT NULL COMMENT '应付日期',
  `paydate` date DEFAULT NULL COMMENT '付款日期',
  `name` varchar(255) DEFAULT NULL COMMENT '租客',
  `owner` int(11) DEFAULT NULL COMMENT '出租人',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `house_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paid
-- ----------------------------
INSERT INTO `paid` VALUES ('30', '深圳市盐田区沙头角856号4楼', '1300.00', '2019-04-01', null, '何小琳', '31', '1', '17');
INSERT INTO `paid` VALUES ('31', '深圳市盐田区大梅沙66号1楼', '900.00', '2019-04-01', null, '王大锤', '32', '1', '20');
INSERT INTO `paid` VALUES ('32', '深圳市盐田区大梅沙66号3楼', '800.00', '2019-04-01', null, '周晓二', '29', '1', '21');
INSERT INTO `paid` VALUES ('33', '重庆', '1000.00', '2022-03-21', null, '李四', null, '1', null);
INSERT INTO `paid` VALUES ('34', '重庆渝中', '1000.00', '2022-03-30', null, '李四', null, '1', null);
INSERT INTO `paid` VALUES ('35', '重庆渝北', '1000.00', '2022-03-21', null, '李四', null, '1', null);
INSERT INTO `paid` VALUES ('36', '北京', '100.00', '2022-03-23', null, '李四', null, '1', null);
INSERT INTO `paid` VALUES ('37', '南京', '100.00', '2022-03-09', null, '李四', null, '1', null);
INSERT INTO `paid` VALUES ('38', '湖北', null, '2022-03-10', null, '张三', null, '1', null);
INSERT INTO `paid` VALUES ('39', '河南', null, null, null, null, null, '1', null);
INSERT INTO `paid` VALUES ('40', '广东', null, null, null, null, null, '1', null);
INSERT INTO `paid` VALUES ('41', '陕西', null, null, null, null, null, '1', null);
INSERT INTO `paid` VALUES ('42', '山西', null, null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for rent
-- ----------------------------
DROP TABLE IF EXISTS `rent`;
CREATE TABLE `rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rcode` varchar(16) NOT NULL DEFAULT '' COMMENT '信息编码',
  `vname` varchar(16) NOT NULL DEFAULT '' COMMENT '会员账号',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `area` varchar(16) DEFAULT NULL COMMENT '地区',
  `community` varchar(16) DEFAULT NULL COMMENT '小区名',
  `pay` float DEFAULT NULL COMMENT '租金',
  `content` varchar(150) NOT NULL COMMENT '详情描述',
  `contacts` varchar(16) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `sys_user_id` tinyint(10) NOT NULL COMMENT '用户id',
  `mode` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '出租方式',
  `storey` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '楼层高度',
  `orientation` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '朝向',
  `elevator` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否有电梯',
  `is_rent` tinyint(1) DEFAULT '0' COMMENT '是否出租',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_show` tinyint(4) unsigned DEFAULT '0' COMMENT '是否展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rent
-- ----------------------------
INSERT INTO `rent` VALUES ('1', '7T7P9iZ9sk', 'Zhang Lan', 'Prof.', '重庆市渝中区', 'SDEmETGvBh', '227.95', 'mT3mLtpUim', 'hXPnWrFMky', '90-2682-7622', '0', '1', '0', '0', '0', '1', null, '0');
INSERT INTO `rent` VALUES ('2', 'eVfQJEaNF6', 'Kathleen Reyes', 'Mr.', 'XoYi7oJvGr', 'vBtTCXqyRB', '974.49', 'PXBrO7nvlX', '2LYpQOZ7hI', '20-368-9823', '0', '1', '0', '0', '0', '1', null, '0');
INSERT INTO `rent` VALUES ('3', 'oDc3aL8h5k', 'Aoki Mai', 'Prof.', 'tPPyfpw5NZ', 'N6Za5CCnZh', '169.48', 'OSrwjt2SVL', 'mftZWKcLkn', '312-838-4239', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('4', 'WIvyN1nioU', 'Jiang Xiaoming', 'Ms.', 'VBGpgQ9WKr', '9vZORUwmrz', '479.58', 'Um8h78mK71', 'df7RwXGpQI', '52-797-2153', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('5', 'HcUvkSQVha', 'Rosa Simpson', 'Prof.', '2NRFeZxHoV', '0eCZWxaPdV', '189.99', 'xFZLo9GFWK', '7FDz7USUSP', '189-3698-2865', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('6', 'CPmQgpqJgd', 'Yamashita Hazuki', 'Mrs.', 'gv1Yj1vGby', 'FuOlUVu3nO', '301.03', '0tFfkTn4nK', 'ClOjQxP8Ub', '(121) 983 0203', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('7', 'Eb9DqMdfwV', 'Michael Hamilton', 'Mrs.', 'rVbKFFciMe', 'HukuAJtbN1', '679.25', 'FYHz5LS7qy', 'DBRXF6qpyf', '52-015-7011', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('8', '7VKezVsTFs', 'Wong Wing Sze', 'Miss.', 'x56sCZihlg', 'ZWdMy3yYO2', '559.87', 'oqPi8rktmJ', 'I4Dbq7qJfz', '330-770-7048', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('9', 'NoL9xTNssB', 'Kam Sau Man', 'Ms.', 'is8JTHlsOd', 'DOUWRmFjXt', '203.65', 'Gr7AEu3rTO', 'TK2D2aNHcE', '838-525-8301', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('10', '6zNllTAzUN', 'Mo Ming', 'Miss.', 'bMSoeFRYB7', 'BefMdKcI1q', '769.74', 'FGEDrf2cbG', 'PAMYW7Mxzt', '7253 155957', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('11', 'V24r2OdV4D', 'Chang Zitao', 'Ms.', 'H4hVYFwt3e', 'duWZpeCMQi', '165.46', 'ObNP5jpuf4', '4PuoGNqJmf', '7775 599231', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('12', 'G3yfOvLk15', 'Chung Hiu Tung', 'Mrs.', 'B44XJasrD0', 'ZtcbLOVGq8', '994.01', '4b0vz5Bju5', 'hNnFfNOGp2', '5205 010416', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('13', 'BG8g8pYGWt', 'Liu Zhiyuan', 'Miss.', 'dfpFIORRnx', '5oKk4LSHvc', '218.21', 'PHhCfwyUXJ', 'ajyKVMTTQR', '212-899-9572', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('14', 'mI8XSH27C7', 'Nathan Sanders', 'Mrs.', '8pv5awq26w', 'cUMDyb4kUi', '2.08', 'tpkWiQQTBj', 'VT9a6sassF', '(121) 895 7707', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('15', 'TO0iKs7EVq', 'Gary Lee', 'Prof.', 'pzciFtYxv7', 'xtT9goypUj', '357.9', 'rCuWgIG7gH', 'nCYbIxZOQd', '718-626-7004', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('16', '7H6pt0JHr6', 'Joyce Parker', 'Mrs.', 'sSXcXQx92f', 'Lxz9hYPhaJ', '994.46', 'dk5ElukV8X', 'JESISLekEs', '212-294-8949', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('17', 'ZaBUdb7Sku', 'Kelly Mendoza', 'Miss.', '4XHlUv68Mn', 'iEDshwwgDJ', '218.38', 'ZVgIwZxtJ0', 'OZ2UdXj76O', '11-100-5990', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('18', 'HuP60xiHLF', 'Gu Zhennan', 'Ms.', '2nNC6OPhKz', '0HrD6voNmm', '29.23', 'L7olAU6Xcm', 'FachkeuNQr', '718-752-9059', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('19', 'qxg8q3tTkI', 'Eva Jimenez', 'Mrs.', 'kXEBfpqUYq', 'ZEEZtHh3vR', '445.91', 'VhGStE2J4B', 'NBrskYQ6DK', '718-684-7779', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('20', 'LXxkIkAZkk', 'Fan Jialun', 'Mrs.', '5JiVKj6z24', 'CVp43bXYIy', '506.58', 'RQF25nVBKq', '9uDmoC1IvK', '(20) 0476 7436', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('21', 'PcH0d5pLzy', 'Fukuda Daisuke', 'Miss.', '52KKquNAMj', 'iMwOI6uAIJ', '448.26', 'hv280SvnJ0', 'RAdSleM1KF', '90-7870-4484', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('22', 'f4oJ0piEyM', 'Siu Lik Sun', 'Mr.', 'BWzPxg6bga', 'RW2i8kmIOw', '930.59', 'Czf70AhE5U', 'gjnj9Or6Gg', '11-972-4223', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('23', 'x8t5cGxXI9', 'Fujii Yuto', 'Prof.', 'v0BLjZP8M4', 'e7vW3ZLsVp', '941.99', 'm5XL4Oo11G', 'nvwmnZIYxr', '7125 977416', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('24', 'j8fZRugI1V', 'Chen Ziyi', 'Prof.', 'i45AfML830', '67163nOMvz', '643.19', 'PlEXOwUiq4', 'IFKAm85hVW', '330-676-5427', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('25', 'JfiGKDYSq2', 'Mori Hana', 'Mrs.', '8dcaUp6Ove', 'DpFaZ0ZCr1', '396.01', 'SfZbVyImZr', 'IvuXWmxHqQ', '5073 076827', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('26', 'NiEZqw2MK8', 'Maeda Itsuki', 'Prof.', 'JFdsqh9WpB', 'eotBPMePBR', '890.88', 's3StVyKc60', 'qxhjkRQn44', '213-060-9552', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('27', 'vrkz4mCrwH', 'Francis Stephens', 'Mrs.', '925Ff8I7Oe', 'IuE52HiSj6', '846.35', '7o7enCA4K6', 'vnBbGYn900', '52-707-9225', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('28', 'eXQXlWpTwg', 'Wong Lai Yan', 'Ms.', '0tyOY6H9ps', 'Ih3Ok8jP3A', '802.05', 'Gy3JThxgWe', 'f9BiFJvhV2', '80-0376-9559', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('29', 'SAfI8zAvON', 'Yan Anqi', 'Miss.', 'ynjx51uQcJ', 'qpoL4P6b5e', '810.24', 'Z81DPUPxg2', 'zCGp41iesF', '718-967-2907', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('30', '1RDsfIybK6', 'Xu Xiaoming', 'Miss.', 'Ch3sv8uuu4', 'QOLovwxJVV', '568.31', 'yxw7V4Wv4S', 'dNQ0M2pjKJ', '213-754-0007', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('31', '0g5qTcby6m', 'Nakano Minato', 'Prof.', 'oLiGcVm5nK', '86vbKZGO96', '322.67', 'wR8dXgkg2F', 'oNCxcTEHko', '(161) 520 1014', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('32', 'UVbig72Kd2', 'Tang Kwok Yin', 'Prof.', 'mFVRVulNDx', 'Urxlr3KfrZ', '503.8', '4loAXLqt6x', 'PKMNOrzjOb', '20-707-4680', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('33', 'VQKPb8PTgF', 'Choi Chiu Wai', 'Ms.', '0bXxFnoS4t', 'Pdhxy6N18q', '654.75', 'NPoAUiLTLF', 'WNpDvZfNgJ', '213-750-9725', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('34', 'C1FPpBgJeL', 'Wu Sze Kwan', 'Ms.', 'woMLo3x3Rn', 'WQJGB5N5Hf', '309.22', 'J9L3wDGGLs', 'prpcoc02ij', '5297 692196', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('35', 'QnDyFBxRcL', 'Zheng Zhiyuan', 'Mr.', 'y4paOjeOnJ', 'mI92ySh2FN', '445.15', '5CoAmqjnJJ', '1v5H463XkR', '5813 635769', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('36', 'r2oPtiq1rC', 'Sakamoto Itsuki', 'Mr.', 'Zq8XMvvU1H', 's6c5uDmcAp', '151.21', 'Etozfn3O79', 'L67dYD9Y9h', '90-1531-4638', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('37', 'kktYhlJ7Lr', 'Todd Johnson', 'Prof.', '0BAiACAVlg', '4HoQvesntA', '236.82', 'TJ5kPd90e6', 'lCZTKoH3b8', '70-8367-6121', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('38', 'rlYSVxUzzj', 'Takeda Ryota', 'Miss.', '66eG1uTqhT', 'AkZA142Ao5', '531.64', 'UwHvSgihiF', '40N8ubMhqc', '74-189-7268', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('39', '52taqxDxO7', 'Zeng Zhennan', 'Prof.', 'OtR2xAGhJX', 'sLKjuF1x8u', '557.59', 'K2JQsB8kz5', 'nvrcPEWXyj', '213-662-7562', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('40', 'ppTHf04vdS', 'Craig Lopez', 'Prof.', 'r6SufA1vl6', 'C0FzDwFPeX', '373.84', 'ypjN1oa2C3', 'gT1dHespl2', '185-1361-4710', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('41', '91djC5YCuK', 'Ogawa Seiko', 'Mrs.', 'cwSj19mkGf', 'UNQE4cJu6P', '813.2', 'EjXUputJbF', 'bwHXhZ3zfp', '(20) 9235 2121', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('42', 'lsKkIsOphP', 'Edith Ruiz', 'Ms.', 'AeGYSXzZKK', 'eP4dmnLm6f', '388.26', 'wPvpvHVP6r', '1P1iWsLYYn', '66-250-8719', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('43', 'qxQQbajiCK', 'Wei Zhennan', 'Miss.', '5qSaF934RV', 'NC2R3PPyU5', '857.98', '2ti8oWbd52', 'bQ7zB11V1G', '213-385-3913', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('44', 'DftI2ajw9K', 'William Ward', 'Mrs.', 'aPpU5XudeP', 'WXa0105r3o', '647.24', 'gdQsWI2LgI', 'fuYjLnl1Um', '614-671-7673', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('45', 'dXUkrwCEDY', 'Sugiyama Rena', 'Mrs.', 'vIUTJkuxUF', 'aKoDuD0fiz', '943.03', 'Rvg4DR79Ic', 'Yh4e3StojG', '28-5318-2126', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('46', 'E1JpTvDj6B', 'Au Fat', 'Ms.', 'calOHHQMlX', '7ZStWcNJQv', '352.87', 'ShNLO2QXsP', '1RhzgPTCLg', '165-5642-8806', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('47', 'EFebBJ2Smb', 'Chiba Sakura', 'Prof.', 'owp3O221hK', 'u0iMSXzqPd', '683.58', 'KyNUYog0l6', '1gGTAM2gNX', '70-8564-0931', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('48', 'Ajq4C0QhKM', 'Dawn Russell', 'Ms.', 'mpDKL3MLp3', 'qvfYtpWlBN', '200.74', 'xYNpnDZGlV', 'JLki5FnC3F', '212-627-4613', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('49', 'YEfGhBGBGA', 'Gu Zhennan', 'Prof.', '6ohgZF407I', 'LMcfOQ8GsD', '489.77', '9bgDHnYv0Y', '60SyUc5lA6', '769-861-4065', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('50', 'AWQvVVlftR', 'Lee Wai Yee', 'Mrs.', 'nDhSK0wF7f', '2SzA3jdFRg', '742.88', 'CPzhXMQl8H', '2tt3Eovp99', '213-763-2283', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('51', 'bdv5EmhTfJ', 'Ma Yuning', 'Ms.', 'CIAtkrNiZC', '4uY3I90Ei1', '181.47', 'XBTS6fHAlR', 'fuAV4yplay', '(151) 902 7240', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('52', 'DY4CZ5ZBoZ', 'Antonio Torres', 'Mr.', '8zMJ89INch', 'Z3V38HoZNA', '226.52', 'WQxONTnc12', 'N6alRQBSK4', '90-7073-5349', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('53', '6YJF2aJvZG', 'Tao Jiehong', 'Mrs.', 'wE39uv9qgg', 'MbLA23kjBV', '534.52', '2eCd1l1khZ', 'rmU0p8I9aC', '80-3960-2814', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('54', 'dziK5ebS8g', 'Kono Yuito', 'Prof.', 'FVf8aWJtqN', 'KHYrQWHHhW', '565.73', 'wY6i2wptd3', 'UJWInEr7CV', '718-590-5380', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('55', 'y2pCk2xkm8', 'Kikuchi Yuito', 'Ms.', 'FpPQNN4qA7', 'DNoByAWa0B', '415.56', 'ZJH5RhqDjG', 'nCxvBAmjFD', '7179 215636', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('56', '1C19nnhLCf', 'Tsui Chi Ming', 'Mrs.', 'g7FMTCu1s9', 'SNS1usohEw', '184.44', 'xuE3dJW9nN', '09EKwsGcMz', '164-4931-9689', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('57', 'FF9Euw3jbo', 'Qin Rui', 'Prof.', 'Bu7RcAghxy', 'oLCCR34Cuj', '579.99', '2geQjM2Uer', '8hxVGgRfUr', '212-350-7769', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('58', 'ar1FMGenIz', 'Cheung Sze Yu', 'Ms.', 'cNaSIdFyOI', '79y2dw0DWX', '838.33', 'rbbbkUCmdU', 'Yxpak46a6O', '5693 482016', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('59', 'uztmNDsu8H', 'Lu Lan', 'Miss.', 'sBgoxQnWmF', 'IYr0OixlTj', '235.24', 'lQKxBE5n4e', 'x0yXZ905RC', '150-2609-3103', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('60', 'DhFWNmHdwl', 'Sugiyama Ryota', 'Prof.', 'ECz0qxfEmg', '7AjszZvmLE', '263.69', '0ZGovwo342', 'DAa0y2BbzV', '(151) 119 8051', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('61', 'gzoLFk3zis', 'Fujiwara Takuya', 'Miss.', 'plzSNEcXiD', 'YmuSiodNJo', '115.9', 'jIXn7pK7xa', 'dWqMET6QOj', '10-634-5220', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('62', '9Z6Hz2OaO4', 'Tang Fat', 'Mr.', 'NykfMYZgTD', 'eHCU0UDsWl', '423.77', 'FrlTCdC77Z', 'CeM1IyNggd', '(151) 124 2114', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('63', '4CL54P1Npx', 'Janice Graham', 'Mrs.', 'chnflKk5pc', 'EPRx2Qn5xc', '714.07', 'SgKO8AyDvk', 'L1bWvVYHQT', '196-0458-3492', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('64', 'DLfBI5KBGE', 'Noguchi Aoshi', 'Ms.', 'IH5zYULsBq', '2gTRI5mvvx', '616.27', 'uqw1wO7TqH', 'zJLBbGalaz', '52-298-2106', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('65', 'QHpWNTsOT8', 'Hayashi Hazuki', 'Prof.', 'Imp8rkK0zp', '4GKtzsPKkR', '633.38', 'IvoWtAc9gJ', 'wfYMScn05k', '7248 717742', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('66', 'ndG6xLqSjb', 'Ma Suk Yee', 'Mrs.', 'yeOhhdoz6B', 'cltSY0HdDK', '896.25', 'lnJvom9Mb0', 'sEfq5h2EXb', '(20) 6883 8666', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('67', 'XThxU7jJdc', 'Ren Jialun', 'Ms.', '0xOS9iZc6S', 'eSYRDAeTEb', '269.36', 'x6KLgNeJYG', 'SDEMaBFeQr', '5808 123782', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('68', 'lBJw11LpEP', 'Xu Zhiyuan', 'Mrs.', '3dZ2xjdN6c', 'asRT0Kdhms', '410.64', 'bwZ6T88siP', 't9fE4r7jxF', '74-156-1915', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('69', 'EJfJrDXTNn', 'Chang Lik Sun', 'Prof.', 'aDnzNNNivM', 'rPkvBfuMEb', '305.54', 'hv4d3ajl8N', 'OTn3hV01pM', '80-1226-8296', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('70', 'fp7vopXUfZ', 'Edna Anderson', 'Mr.', 'Hqxs9HY2Kd', 'h19EC1idUL', '819.82', 'sOUeoMN4cz', 'iaZcHtEurj', '5403 732612', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('71', 'EG0LLCwjI5', 'Saito Ayano', 'Prof.', 'j27XPULCda', 'y4s7stduaa', '995.88', 'AGnBIsehRT', 'T0BHvAM2CB', '7191 168629', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('72', 'rspGmrFJNY', 'Duan Lu', 'Ms.', 'aRWt53ZE7B', '9KcHesZ5Gv', '142.64', '5JD1IgGjET', 'TywMxzAp9G', '11-162-1203', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('73', 'm2qaMTWcpD', 'Miguel Rivera', 'Miss.', 'CEWC68BfWd', 'T8xaTYkp00', '981.98', 'jKT320QUI4', 'oDrqSPdLRe', '(1223) 23 9806', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('74', 'ajmmBEscjb', 'Tsui Wai Man', 'Ms.', 'XqlDfHsJqd', 'K2ZQdIsaf1', '398.18', 'CO0yNOyfcg', 'lZsR4LOxdQ', '70-4982-0301', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('75', 'koNzz4mhZ1', 'Iwasaki Aoshi', 'Ms.', '337MtdB6bd', '3T3PnvJQKV', '669.39', 'STYZEbgkhd', 'ktXPZiQt9k', '5899 860179', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('76', 'VghWaNztQo', 'Shibata Mio', 'Mrs.', '5qZwZ45dV9', 'nqnVDRMwCr', '737.57', '5MzhVY12R6', 'ZqPHVLbLCl', '718-247-9843', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('77', 'uY1lfir9bq', 'Kinoshita Kenta', 'Miss.', 'DA6cBStamL', 'dtynJVk7JQ', '57.17', 'id85DijTJ7', '6bkhortgaM', '90-8434-9921', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('78', 'BNHBcE0wVG', 'Takeda Mitsuki', 'Mr.', 'eFCu9DXnAQ', 'YpfxTZvSaq', '805.72', 'nFL3bPLbD2', 'TKCyTFLIss', '(20) 4799 1518', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('79', '7NU38Ve7zN', 'Liao Ziyi', 'Miss.', 'S8QWO6PwXx', '9GgeEtyv6u', '809.19', 'PVtsAs85lZ', 'Oaz3BiiwsR', '614-492-0333', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('80', 'SaICqxSP3p', 'Yin Kwok Ming', 'Mrs.', 'ykiS0T8Vca', '1bOtAFuyPo', '406.22', 'uaiMMOZPMA', 'oAbuAmG6VB', '141-3747-4113', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('81', 'W3wUUin4H5', 'Rose Griffin', 'Prof.', 'xXh4BUHNCI', 'gywg0AXyVM', '254.16', 'jqMwMq0rlX', 'LBUGe0v9FS', '718-351-1063', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('82', '5j6L26unlw', 'Xue Zitao', 'Mrs.', 'gaHlY3SDBP', 'gNho7lxUjC', '467.02', 'GuZ1fH0Kdz', 'd5Gsw3Ogw7', '(1223) 79 3842', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('83', '0Ow22RWCxf', 'Takagi Nanami', 'Miss.', 'vFkVpIQaD9', 'EsLQQ4G4cr', '897.72', 'Ysb3HTTVhS', 'IFV9ikieop', '90-1482-6896', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('84', 'Rq6aOgOzfY', 'Song Rui', 'Prof.', 'FpHWSSARca', 'GuRXu5yyrb', '69.13', '3x2hkzhIUn', 'cKtyszWsq0', '172-7116-4608', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('85', 'BJDd9AwGCf', 'Sakai Ikki', 'Mr.', 'dJvBQlMLUh', 'x5zbEyEYXi', '351.05', 'uJyooOx193', 'VkNAchKiWD', '838-493-4064', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('86', 'VyLh8cclMD', 'Sugawara Ayato', 'Miss.', 'Korx0J6B1m', 'mVT6Xw6Hhu', '83.89', 'Lmi6dFqHmU', 'zj093M1xBu', '212-870-1054', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('87', 'F3gg2IaD0W', 'Hou Zhennan', 'Prof.', '4V725v7s3d', '0tV6bLZ95k', '581.7', 'STZmQ9mjVI', 'v902zFTrws', '66-432-2285', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('88', 'DlA4y2SbyP', 'Liu Rui', 'Prof.', '28SQxEu1Jh', '3PapB0aU8c', '397.14', 'JuRQByRRsY', 'sYrifAK1UE', '330-049-2976', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('89', 'gm4FGspOr4', 'Lee On Kay', 'Mr.', '6vZftG0KDd', 'unH3DdiGxT', '187.9', 'Mtwr6c9zpl', 'iHIBAVpA7Y', '21-563-3390', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('90', 'Uy4mriTFY8', 'Yuen Hok Yau', 'Mrs.', 'MW9sXVucNU', 'QvcXrr9l9N', '602.26', 'D3NVEknvgD', '82RYzvCTIY', '90-1830-4667', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('91', 'XJyppYEXN8', 'Terry Kim', 'Prof.', 'RENrBqkUew', '6vnfhnfcAv', '208.06', 'V4rl2UxGm6', 'VzGZODd6kF', '74-705-8883', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('92', 'cEdqKNju6Q', 'Yao Zitao', 'Ms.', 'K3QbU8q7Tu', 'xFg6m7qbKB', '152.13', 'ORiYkCzlXU', 'SHUWeL13yI', '(116) 264 2085', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('93', 'xQ7kL8fYVq', 'Fukuda Ayato', 'Prof.', 'CPg5W5F2Ds', 'a50OtxwOE0', '481.1', 'M5qPCbOQyr', 'GdPbnoFcfm', '10-261-3847', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('94', '2AvpOJk6Db', 'Chan Ming', 'Miss.', '7hvCmE6NwU', 'Lgrxfyu0PK', '833.94', '9vck3bqud9', 'ilPFlHCcVi', '5175 177437', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('95', 'UzEoi3RRge', 'Ishii Mio', 'Mr.', 'K85yeBLy6N', 'DgXhQ84URI', '492.7', 'FUevxldNRY', 'wC1TaXv5d8', '66-764-5218', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('96', 'LOHLUujeeY', 'Yue Kwok Kuen', 'Ms.', 'sGD7ksQd8p', 'EXJnsMbJxz', '628.35', 'i7Vd1FlhQu', 'oBvD5hupTY', '20-860-5836', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('97', 'V88G4OXY0M', 'Zeng Lan', 'Mrs.', 'zGVxfX22uZ', 'Msc1JFMaKh', '720.61', '3eOzxzNeYv', 'iL2al4VomV', '330-899-4172', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('98', 'wUEHXna5bF', 'Irene Hamilton', 'Prof.', '1nyh1hW3eE', 'JVXrY7dc9p', '652.88', '6XXF9v6Wsg', '4i8MNsNA0A', '5384 385321', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('99', '2dOpRcBFgD', 'Jiang Xiaoming', 'Miss.', 'WE8xBVSvlM', 'xhvvODUinM', '600.19', '0bVGzt4P7i', 'pa2frtgfA1', '80-3707-5842', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('100', 'pSVnziiReI', 'Larry Herrera', 'Prof.', 'zxoNOpTm4c', 'SOtF7s7sOG', '553.04', 'LjaEjiqSck', 'caibO70bLn', '(116) 661 0576', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('101', '1314', '小巧', '两居室', '重庆市渝中区', null, '3000', '空中花园', '值得拥有', '110', '0', '1', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('106', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '123', '12313', '1', '1', '2', '2', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('107', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '123', '12313', '1', '2', '2', '2', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('108', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '123', '12313', '1', '2', '2', '2', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('109', '', '', '', '重庆江北', null, '1200', '电梯房', '', '', '2', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('110', '', '', '', '北京天安门', null, '5000', '古风建筑', '', '', '2', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('111', '', '', '', '重庆渝北', null, '1200', '没有', '', '', '2', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('112', '', '', '', '河北淄博', null, '1200', '值得拥有', '', '', '2', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('113', '', '', '', '河北淄博', null, '1300', '没得', '', '', '2', '0', '0', '0', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('114', '', '', '', '重庆嘉陵江', null, '3000', '无', '', '', '2', '1', '1', '3', '1', '0', null, '0');
INSERT INTO `rent` VALUES ('115', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '123', '12313', '11', '2', '2', '2', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('116', '1', '123', '空中花园', '重庆', null, '1234', '值得拥有', '123', '12313', '11', '2', '2', '2', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('117', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '李四', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('118', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '李四', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('119', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('120', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('121', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('122', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('123', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '3', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('124', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('125', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('126', '666', '张三', '空中花园', '重庆', null, '111', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('127', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('128', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '3', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('129', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '3', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('130', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '3', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('131', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('132', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('133', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('134', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('135', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('136', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '3', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('137', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('138', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('139', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('140', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('141', '666', '张三', '空中花园', '重庆', null, '11200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('142', '666', '张三', '空中花园', '重庆', null, '1200', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('143', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');
INSERT INTO `rent` VALUES ('144', '666', '张三', '空中花园', '重庆', null, '12', '三室两厅一卫', '张三', '17783543586', '2', '1', '3', '1', '0', '0', null, '0');

-- ----------------------------
-- Table structure for solve
-- ----------------------------
DROP TABLE IF EXISTS `solve`;
CREATE TABLE `solve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(30) DEFAULT NULL COMMENT '地址',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上报日期',
  `name` varchar(20) DEFAULT NULL COMMENT '保修人',
  `detail` varchar(50) DEFAULT NULL COMMENT '详情',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限ID（自定义）可设置唯一索引UNIQUE',
  `permission_name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述说明',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='权限表';

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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID（自定义）可设置唯一索引UNIQUE',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限类别（主要定义角色属于哪种层级）',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '888888', '超级管理员', '', '88888888', '2021-03-23 15:18:10', null, null, '0');
INSERT INTO `sys_role` VALUES ('2', '100001', 'admin', '00001', '88888888', '2021-03-23 15:18:10', null, null, '0');
INSERT INTO `sys_role` VALUES ('3', '100002', '测试员', '50001', '88888888', '2021-03-23 15:18:10', null, null, '0');
INSERT INTO `sys_role` VALUES ('4', '11', '用户', null, '88888888', '2022-04-20 13:38:48', null, null, '0');
INSERT INTO `sys_role` VALUES ('5', '100003', '普通用户', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '权限ID',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色权限关联表';

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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID（可设置唯一索引UNIQUE）',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '88888888', '超级管理员', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('2', '80000001', '张三', '$2a$10$kZT9t57ahsVVWQ/dUVAiQuga7SgvevnWzudJjQhBVUKrEK8DWpzpy', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('3', '80000002', '李四', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('4', '80000003', '王五', '123456', '88888888', '2021-03-23 15:51:27', null, null, '0');
INSERT INTO `sys_user` VALUES ('11', 'f71b9f62f2f14050938126a7cc984bf1', '17783543586', '$2a$10$kdpGqACyyyU3zsRJkzlT2.QX4rMkOuNWvVqn/xTI8ck9AEitv3zXO', '张三', '2022-04-20 16:24:40', null, null, '0');
INSERT INTO `sys_user` VALUES ('18', '256c9d6b063d4c5faa15c265ee9fc9eb', '17783543588', '$2a$10$v3w4JFmruF3K1NQN7fe0tuWQCykodwYFcSwWJCMq12.Erxy4OzD0W', 'owner', '2022-04-21 12:10:34', null, null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：正常/1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '80000001', '100003', '88888888', '2022-04-21 10:58:14', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('2', '80000001', '888888', '88888888', '2022-04-21 10:58:14', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('3', '80000001', '100001', '88888888', '2022-04-21 10:58:14', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('7', 'f71b9f62f2f14050938126a7cc984bf1', '100001', '88888888', '2022-04-21 10:58:14', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('10', '274648e217d74b9d8ab41a8278803626', '100003', null, '2022-04-21 11:14:29', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('11', 'c8492304f7604a18b778b39857c544be', '100003', null, '2022-04-21 12:06:11', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('12', '3ade676aec5b43f2aff6c19a24d9f4be', '100003', null, '2022-04-21 12:08:34', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('13', 'fdee9ea07c7645d0bef290889fa6ac22', '100003', null, '2022-04-21 12:09:42', null, null, '0');
INSERT INTO `sys_user_role` VALUES ('14', '256c9d6b063d4c5faa15c265ee9fc9eb', '100003', null, '2022-04-21 12:10:34', null, null, '0');

-- ----------------------------
-- Table structure for user_ren_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_ren_ref`;
CREATE TABLE `user_ren_ref` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `rent_id` int(4) DEFAULT NULL COMMENT '出租房id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_ren_ref
-- ----------------------------
