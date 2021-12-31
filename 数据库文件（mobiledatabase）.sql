/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : mobiledatabase

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 29/12/2021 11:14:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mobileclassify
-- ----------------------------
DROP TABLE IF EXISTS `mobileclassify`;
CREATE TABLE `mobileclassify`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`, `name`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mobileclassify
-- ----------------------------
INSERT INTO `mobileclassify` VALUES (1, '教科书');
INSERT INTO `mobileclassify` VALUES (2, '课外书籍');

-- ----------------------------
-- Table structure for mobileform
-- ----------------------------
DROP TABLE IF EXISTS `mobileform`;
CREATE TABLE `mobileform`  (
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_publish` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_price` float(10, 2) NULL DEFAULT NULL,
  `book_publishDate` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(0) NOT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mobileform
-- ----------------------------
INSERT INTO `mobileform` VALUES ('A1', '专业英语', '清湖出版社', 22.00, '2021 02 06', '1(1).jpg', 1);
INSERT INTO `mobileform` VALUES ('A10', '人间失格', '铁道出版社', 50.00, '2017 05 14', '1(10).jpg', 2);
INSERT INTO `mobileform` VALUES ('A11', '呐喊', '唐门出版社', 75.70, '2011 08 14', '1(11).jpg', 2);
INSERT INTO `mobileform` VALUES ('A12', '老人与海', '三周出版社', 15.20, '2000 04 14', '1(12).jpg', 2);
INSERT INTO `mobileform` VALUES ('A13', '了不起的盖茨比', '唐门出版社', 77.20, '2005 08 01', '1(13).jpg', 2);
INSERT INTO `mobileform` VALUES ('A14', '三国演义', '三周出版社', 42.20, '2001 12 11', '1(14).jpg', 2);
INSERT INTO `mobileform` VALUES ('A2', '格林童话', '人民出版社', 52.00, '2021 02 15', '1(2).jpg', 2);
INSERT INTO `mobileform` VALUES ('A3', '理想国', '人民出版社', 88.00, '2021 02 17', '1(3).jpg', 2);
INSERT INTO `mobileform` VALUES ('A4', '高等数学', '铁道出版社', 11.00, '2021 02 05', '1(4).jpg', 1);
INSERT INTO `mobileform` VALUES ('A5', '变态心理学', '人民出版社', 11.00, '2021 02 11', '1(5).jpg', 1);
INSERT INTO `mobileform` VALUES ('A6', '大学语文', '撒旦出版社', 324.00, '2021 02 08', '1(6).jpg', 1);
INSERT INTO `mobileform` VALUES ('A7', '应用文写作', '剃刀出版社', 50.00, '2019 05 06', '1(7).jpg', 1);
INSERT INTO `mobileform` VALUES ('A8', '电子商务', '北京大学出版社', 25.00, '2017 01 06', '1(8).jpg', 1);
INSERT INTO `mobileform` VALUES ('A9', '数据结构', '南宁出版社', 10.00, '2018 01 01', '1(9).jpg', 1);

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `orderNumber` int(0) NOT NULL AUTO_INCREMENT,
  `logname` char(30) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `mess` varchar(5000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderNumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES (1, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>商品id:123,名称:高等数学单价11.0数量1<br>777<br>购物车的商品总价:     33.00');
INSERT INTO `orderform` VALUES (2, '777', '<br>商品id:111213,名称:专业英语单价22.0数量9<br>777<br>购物车的商品总价:    198.00');
INSERT INTO `orderform` VALUES (3, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>商品id:12321,名称:变态心理学单价11.0数量1<br>777<br>购物车的商品总价:     33.00');
INSERT INTO `orderform` VALUES (4, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>商品id:123,名称:高等数学单价11.0数量1<br>商品id:12321,名称:变态心理学单价11.0数量1<br>777<br>购物车的商品总价:     44.00');
INSERT INTO `orderform` VALUES (5, '777', '<br>商品id:111213,名称:专业英语单价22.0数量2<br>777<br>购物车的商品总价:     44.00');
INSERT INTO `orderform` VALUES (6, '777', '<br>商品id:123,名称:高等数学单价11.0数量1<br>777<br>购物车的商品总价:     11.00');
INSERT INTO `orderform` VALUES (7, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (8, '777', '<br>商品id:123,名称:高等数学单价11.0数量8<br>商品id:12321,名称:变态心理学单价11.0数量1<br>777<br>购物车的商品总价:     99.00');
INSERT INTO `orderform` VALUES (9, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (10, '777', '<br>商品id:111213,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (11, '777', '<br>商品id:A1,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (12, 'cat', '<br>商品id:A1,名称:专业英语单价22.0数量1<br>cat<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (13, 'cat', '<br>商品id:A4,名称:高等数学单价11.0数量1<br>商品id:A5,名称:变态心理学单价11.0数量1<br>cat<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (14, '777', '<br>商品id:A12,名称:老人与海单价15.2数量1<br>商品id:A1,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     37.20');
INSERT INTO `orderform` VALUES (15, '777', '<br>商品id:A1,名称:专业英语单价22.0数量1<br>777<br>购物车的商品总价:     22.00');
INSERT INTO `orderform` VALUES (16, '777', '<br>商品id:A2,名称:格林童话单价52.0数量1<br>商品id:A12,名称:老人与海单价15.2数量1<br>777<br>购物车的商品总价:     67.20');

-- ----------------------------
-- Table structure for shoppingform
-- ----------------------------
DROP TABLE IF EXISTS `shoppingform`;
CREATE TABLE `shoppingform`  (
  `goodsId` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsName` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `goodsPrice` float NULL DEFAULT NULL,
  `goodsAmount` int(0) NULL DEFAULT NULL,
  INDEX `logname`(`logname`) USING BTREE,
  CONSTRAINT `shoppingform_ibfk_1` FOREIGN KEY (`logname`) REFERENCES `user` (`logname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingform
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `logname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addess` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', '123', '11111', '111111', '11111');
INSERT INTO `user` VALUES ('123456', '123456', '', '', '');
INSERT INTO `user` VALUES ('1erqw', '1', '', '', '');
INSERT INTO `user` VALUES ('3423', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('777', '777', '', '', '');
INSERT INTO `user` VALUES ('cat', '123456789', '1350111111', '广东省', '李');
INSERT INTO `user` VALUES ('dinner', '123456789', '888888', '111', '111');
INSERT INTO `user` VALUES ('USER', '123', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
