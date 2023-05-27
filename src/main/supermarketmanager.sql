/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50741 (5.7.41-log)
 Source Host           : localhost:3306
 Source Schema         : supermarketmanager

 Target Server Type    : MySQL
 Target Server Version : 50741 (5.7.41-log)
 File Encoding         : 65001

 Date: 27/05/2023 11:39:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'root', '654321', 'Admin', '超级管理员');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (2, '餐具', '餐具');
INSERT INTO `t_category` VALUES (3, '家用电器', '电视机、冰箱、洗衣机等');
INSERT INTO `t_category` VALUES (4, '家具', '家具');
INSERT INTO `t_category` VALUES (5, '卫浴', '卫生间用品');
INSERT INTO `t_category` VALUES (6, '粮油', '粮油');
INSERT INTO `t_category` VALUES (7, '零食', '零食');
INSERT INTO `t_category` VALUES (8, '宠物用品', '宠物用品');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '张三', '19898989898', '四川成都市武侯区', '2023-04-19 12:50:07', NULL);
INSERT INTO `t_customer` VALUES (2, '李四', '17878787878', '四川成都市成华区', '2023-04-19 12:50:32', '2023-04-19 12:50:34');
INSERT INTO `t_customer` VALUES (3, '王五', '16767677676', '四川成都市双流区', '2023-04-19 12:58:22', '2023-04-19 12:58:25');
INSERT INTO `t_customer` VALUES (4, '赵六', '16556566565', '四川成都市郫都区', '2023-04-19 12:58:56', '2023-04-19 12:58:58');
INSERT INTO `t_customer` VALUES (5, '钱七', '15445454545', '四川成都市金牛区', '2023-04-19 12:59:43', '2023-04-19 12:59:46');
INSERT INTO `t_customer` VALUES (6, '王八', '14334343433', '四川成都市高新区', '2023-04-19 13:00:23', NULL);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单唯一编号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单日期',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总价',
  `state` int(11) NULL DEFAULT NULL COMMENT '订单状态：1已完成，0待支付，-1取消',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '顾客id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, NULL, '2023-05-01 22:16:24', NULL, NULL, NULL);
INSERT INTO `t_order` VALUES (2, 'CD-2012021673676', '2023-04-19 13:08:08', 1128.34, -1, 2);
INSERT INTO `t_order` VALUES (3, 'CD-2012021665938', '2023-04-19 13:08:41', 56.00, 0, 1);
INSERT INTO `t_order` VALUES (4, 'CD-2012021667676', '2023-04-19 13:11:29', 88.60, 1, 4);
INSERT INTO `t_order` VALUES (5, 'CD-2012021633422', '2023-04-05 13:11:51', 128.80, 1, 5);
INSERT INTO `t_order` VALUES (6, 'CD-2012021322090', '2023-03-28 13:19:19', 665.00, 0, 3);
INSERT INTO `t_order` VALUES (7, 'CD-2012021676763', '2023-06-26 13:19:49', 8500.00, 1, 2);
INSERT INTO `t_order` VALUES (8, 'CD-2012021222900', '2015-06-19 13:20:24', 6350.00, 0, 2);
INSERT INTO `t_order` VALUES (9, 'CD-2012021393920', '2023-04-26 14:28:52', 3490.00, 1, 4);
INSERT INTO `t_order` VALUES (10, 'CD-2012021339009', '2023-04-19 13:21:14', 1200.00, -1, 4);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` double NULL DEFAULT NULL COMMENT '商品价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '商品库存',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, 'HXTV11-028765', '海信电视H11', 6500, 30, 3, 3, '85寸超大屏电视');
INSERT INTO `t_product` VALUES (2, 'CWTV22-028676', '创维电视P22', 7500, 20, 3, 3, '创维电视');
INSERT INTO `t_product` VALUES (5, 'TC55-YUE7888', '陶瓷餐具套装C55', 560, 30, 2, 2, '吃饭的家伙');
INSERT INTO `t_product` VALUES (6, 'PT66-YU67677', '403不锈钢盆', 68, 20, 2, 2, '盆');
INSERT INTO `t_product` VALUES (7, 'SHE-YI783222', '上下床N77', 340, 10, 4, 8, '经久耐用');
INSERT INTO `t_product` VALUES (8, 'DESKTOP7847', '实木餐桌K90', 3450, 20, 4, 8, NULL);
INSERT INTO `t_product` VALUES (9, 'HS11-8837833', '多功能花洒L11', 350, 100, 5, 6, '');
INSERT INTO `t_product` VALUES (10, 'MT33-6767733', '高颜值马桶', 600, 20, 5, 6, '');
INSERT INTO `t_product` VALUES (11, 'XC44-9898933', '俄罗斯大香肠', 50, 30, 6, 1, '风味十足');
INSERT INTO `t_product` VALUES (12, 'XM77-7363838', '泰国香米', 45, 44, 6, 1, '保质保量');
INSERT INTO `t_product` VALUES (13, 'HS88-9822321', '酒鬼花生Y88', 18, 300, 7, 7, '花生还是那个花生');
INSERT INTO `t_product` VALUES (14, 'JT99-7878362', '盐焗鸡腿U99', 20, 34, 7, 7, '香得很');
INSERT INTO `t_product` VALUES (15, 'MS02-3374888', '猫砂R02', 40, 89, 8, 5, '推荐使用');
INSERT INTO `t_product` VALUES (18, 'MW67-3837878', '皇家三层猫屋', 430, 39, 8, 5, '颜值相当高');

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '练习电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES (1, 'CD-WHH112334', '娃哈哈粮油公司', '刘三农', '15653535242', '四川成都', '2023-04-04 13:53:33');
INSERT INTO `t_supplier` VALUES (2, 'DZ-LX44532222', '吃得香餐具', '张二炮', '15244252552', '四川达州', '2022-06-16 13:55:19');
INSERT INTO `t_supplier` VALUES (3, 'ZG-LP22899982', '老板电器', '王大花', '12788776333', '四川自贡', '2023-01-06 13:57:29');
INSERT INTO `t_supplier` VALUES (4, 'MY-HK8977373', '好看厨具', '代小丽', '14557282722', '四川绵阳', '2023-02-15 13:58:52');
INSERT INTO `t_supplier` VALUES (5, 'DY-CW3333333', '宠物乐园', '赵一丿', '13556564533', '四川德阳', '2019-06-01 14:57:14');
INSERT INTO `t_supplier` VALUES (6, 'NC-XSS555555', '洗刷刷有限公司', '李小凤', '13654546353', '四川南充', '2024-06-19 15:00:13');
INSERT INTO `t_supplier` VALUES (7, 'WW-DGG8787', '顶呱呱食品有限公司', '托马斯', '13764545463', '四川万源', '2020-07-19 15:04:37');
INSERT INTO `t_supplier` VALUES (8, 'ZY-JJ9383743', '家家乐家具', '五连鞭', '13862526262', '四川资阳', '2022-08-19 17:28:25');

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operation_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人-关联admin表',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 616 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_system_log
-- ----------------------------
INSERT INTO `t_system_log` VALUES (1, 1, '[127.0.0.1在2023年04月26日 09时50分15秒操作了com.jd.controller.SupplierController的list方法]', '2023-04-26 09:50:16');
INSERT INTO `t_system_log` VALUES (2, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 10时58分06秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 10:58:07');
INSERT INTO `t_system_log` VALUES (3, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时01分03秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:01:03');
INSERT INTO `t_system_log` VALUES (4, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时01分06秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:01:06');
INSERT INTO `t_system_log` VALUES (5, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时02分01秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 11:02:01');
INSERT INTO `t_system_log` VALUES (6, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时03分31秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:03:32');
INSERT INTO `t_system_log` VALUES (7, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时04分39秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:04:39');
INSERT INTO `t_system_log` VALUES (8, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时09分50秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:09:50');
INSERT INTO `t_system_log` VALUES (9, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时09分53秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:09:53');
INSERT INTO `t_system_log` VALUES (10, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时09分56秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:09:57');
INSERT INTO `t_system_log` VALUES (11, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时11分54秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:11:54');
INSERT INTO `t_system_log` VALUES (12, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时11分57秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:11:57');
INSERT INTO `t_system_log` VALUES (13, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时12分50秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:12:50');
INSERT INTO `t_system_log` VALUES (14, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时12分51秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:12:52');
INSERT INTO `t_system_log` VALUES (15, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时12分53秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:12:54');
INSERT INTO `t_system_log` VALUES (16, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时12分56秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:12:57');
INSERT INTO `t_system_log` VALUES (17, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时12分58秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:12:59');
INSERT INTO `t_system_log` VALUES (18, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时13分00秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:13:00');
INSERT INTO `t_system_log` VALUES (19, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时13分06秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:13:06');
INSERT INTO `t_system_log` VALUES (20, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时13分07秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:13:08');
INSERT INTO `t_system_log` VALUES (21, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 11时13分17秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:13:17');
INSERT INTO `t_system_log` VALUES (22, 1, '[127.0.0.1在2023年04月26日 11时45分28秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:45:29');
INSERT INTO `t_system_log` VALUES (23, 1, '[127.0.0.1在2023年04月26日 11时45分32秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:45:33');
INSERT INTO `t_system_log` VALUES (24, 1, '[127.0.0.1在2023年04月26日 11时46分40秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:46:40');
INSERT INTO `t_system_log` VALUES (25, 1, '[127.0.0.1在2023年04月26日 11时46分49秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:46:49');
INSERT INTO `t_system_log` VALUES (26, 1, '[127.0.0.1在2023年04月26日 11时49分09秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:49:10');
INSERT INTO `t_system_log` VALUES (27, 1, '[127.0.0.1在2023年04月26日 11时49分11秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:49:11');
INSERT INTO `t_system_log` VALUES (28, 1, '[127.0.0.1在2023年04月26日 11时49分13秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 11:49:13');
INSERT INTO `t_system_log` VALUES (29, 1, '[127.0.0.1在2023年04月26日 11时49分14秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 11:49:15');
INSERT INTO `t_system_log` VALUES (30, 1, '[127.0.0.1在2023年04月26日 11时49分15秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 11:49:16');
INSERT INTO `t_system_log` VALUES (31, 1, '[127.0.0.1在2023年04月26日 12时20分59秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:20:59');
INSERT INTO `t_system_log` VALUES (32, 1, '[127.0.0.1在2023年04月26日 12时23分00秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:23:01');
INSERT INTO `t_system_log` VALUES (33, 1, '[127.0.0.1在2023年04月26日 12时29分28秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:29:28');
INSERT INTO `t_system_log` VALUES (34, 1, '[127.0.0.1在2023年04月26日 12时33分52秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:33:52');
INSERT INTO `t_system_log` VALUES (35, 1, '[127.0.0.1在2023年04月26日 12时35分14秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:35:14');
INSERT INTO `t_system_log` VALUES (36, 1, '[127.0.0.1在2023年04月26日 12时35分15秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 12:35:16');
INSERT INTO `t_system_log` VALUES (37, 1, '[127.0.0.1在2023年04月26日 12时35分19秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:35:20');
INSERT INTO `t_system_log` VALUES (38, 1, '[127.0.0.1在2023年04月26日 12时42分48秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:42:49');
INSERT INTO `t_system_log` VALUES (39, 1, '[127.0.0.1在2023年04月26日 12时42分50秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:42:51');
INSERT INTO `t_system_log` VALUES (40, 1, '[127.0.0.1在2023年04月26日 12时42分56秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:42:56');
INSERT INTO `t_system_log` VALUES (41, 1, '[127.0.0.1在2023年04月26日 12时43分01秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:43:01');
INSERT INTO `t_system_log` VALUES (42, 1, '[127.0.0.1在2023年04月26日 12时43分41秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:43:42');
INSERT INTO `t_system_log` VALUES (43, 1, '[127.0.0.1在2023年04月26日 12时44分09秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:44:10');
INSERT INTO `t_system_log` VALUES (44, 1, '[127.0.0.1在2023年04月26日 12时44分13秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:44:13');
INSERT INTO `t_system_log` VALUES (45, 1, '[127.0.0.1在2023年04月26日 12时45分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:45:49');
INSERT INTO `t_system_log` VALUES (46, 1, '[127.0.0.1在2023年04月26日 12时45分51秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:45:52');
INSERT INTO `t_system_log` VALUES (47, 1, '[127.0.0.1在2023年04月26日 12时46分46秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:46:46');
INSERT INTO `t_system_log` VALUES (48, 1, '[127.0.0.1在2023年04月26日 12时46分49秒操作了com.jd.controller.CustomerController的list方法]', '2023-04-26 12:46:49');
INSERT INTO `t_system_log` VALUES (49, 1, '[127.0.0.1在2023年04月26日 12时46分55秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:46:55');
INSERT INTO `t_system_log` VALUES (50, 1, '[127.0.0.1在2023年04月26日 12时46分57秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:46:57');
INSERT INTO `t_system_log` VALUES (51, 1, '[127.0.0.1在2023年04月26日 12时46分57秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:46:58');
INSERT INTO `t_system_log` VALUES (52, 1, '[127.0.0.1在2023年04月26日 12时46分58秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:46:59');
INSERT INTO `t_system_log` VALUES (53, 1, '[127.0.0.1在2023年04月26日 12时47分37秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:47:38');
INSERT INTO `t_system_log` VALUES (54, 1, '[127.0.0.1在2023年04月26日 12时47分41秒操作了com.jd.controller.SystemLogController的list方法]', '2023-04-26 12:47:41');
INSERT INTO `t_system_log` VALUES (55, 1, '[127.0.0.1在2023年04月26日 12时47分42秒操作了com.jd.controller.SupplierController的list方法]', '2023-04-26 12:47:43');
INSERT INTO `t_system_log` VALUES (56, 1, '[127.0.0.1在2023年04月26日 12时49分32秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:49:32');
INSERT INTO `t_system_log` VALUES (57, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时50分13秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:50:14');
INSERT INTO `t_system_log` VALUES (58, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时50分32秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:50:33');
INSERT INTO `t_system_log` VALUES (59, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时50分33秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:50:34');
INSERT INTO `t_system_log` VALUES (60, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分40秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:40');
INSERT INTO `t_system_log` VALUES (61, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分40秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:41');
INSERT INTO `t_system_log` VALUES (62, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:49');
INSERT INTO `t_system_log` VALUES (63, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:50');
INSERT INTO `t_system_log` VALUES (64, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分52秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:52');
INSERT INTO `t_system_log` VALUES (65, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时51分58秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:51:58');
INSERT INTO `t_system_log` VALUES (66, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时52分34秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:52:35');
INSERT INTO `t_system_log` VALUES (67, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时53分15秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:53:16');
INSERT INTO `t_system_log` VALUES (68, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时54分00秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:54:00');
INSERT INTO `t_system_log` VALUES (69, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时54分10秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 12:54:10');
INSERT INTO `t_system_log` VALUES (70, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时54分29秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 12:54:29');
INSERT INTO `t_system_log` VALUES (71, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时54分29秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:54:29');
INSERT INTO `t_system_log` VALUES (72, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时55分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:55:49');
INSERT INTO `t_system_log` VALUES (73, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时55分50秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:55:50');
INSERT INTO `t_system_log` VALUES (74, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时55分51秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:55:52');
INSERT INTO `t_system_log` VALUES (75, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时55分55秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 12:55:55');
INSERT INTO `t_system_log` VALUES (76, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 12时55分55秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 12:55:55');
INSERT INTO `t_system_log` VALUES (77, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 13时08分29秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:08:30');
INSERT INTO `t_system_log` VALUES (78, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 13时08分37秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:08:37');
INSERT INTO `t_system_log` VALUES (79, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 13时09分18秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:09:19');
INSERT INTO `t_system_log` VALUES (80, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 13时10分26秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:10:26');
INSERT INTO `t_system_log` VALUES (81, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 13时11分34秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:11:34');
INSERT INTO `t_system_log` VALUES (82, 1, '[127.0.0.1在2023年04月26日 13时12分22秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:12:22');
INSERT INTO `t_system_log` VALUES (83, 1, '[127.0.0.1在2023年04月26日 13时12分55秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:12:56');
INSERT INTO `t_system_log` VALUES (84, 1, '[127.0.0.1在2023年04月26日 13时13分16秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:13:16');
INSERT INTO `t_system_log` VALUES (85, 1, '[127.0.0.1在2023年04月26日 13时14分06秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 13:14:06');
INSERT INTO `t_system_log` VALUES (86, 1, '[127.0.0.1在2023年04月26日 13时14分09秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:14:09');
INSERT INTO `t_system_log` VALUES (87, 1, '[127.0.0.1在2023年04月26日 13时14分58秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:14:59');
INSERT INTO `t_system_log` VALUES (88, 1, '[127.0.0.1在2023年04月26日 13时15分05秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:15:06');
INSERT INTO `t_system_log` VALUES (89, 1, '[127.0.0.1在2023年04月26日 13时16分07秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:16:07');
INSERT INTO `t_system_log` VALUES (90, 1, '[127.0.0.1在2023年04月26日 13时16分08秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 13:16:09');
INSERT INTO `t_system_log` VALUES (91, 1, '[127.0.0.1在2023年04月26日 13时16分27秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 13:16:28');
INSERT INTO `t_system_log` VALUES (92, 1, '[127.0.0.1在2023年04月26日 13时16分27秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:16:28');
INSERT INTO `t_system_log` VALUES (93, 1, '[127.0.0.1在2023年04月26日 13时19分08秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:19:09');
INSERT INTO `t_system_log` VALUES (94, 1, '[127.0.0.1在2023年04月26日 13时19分10秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:19:11');
INSERT INTO `t_system_log` VALUES (95, 1, '[127.0.0.1在2023年04月26日 13时19分10秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:19:11');
INSERT INTO `t_system_log` VALUES (96, 1, '[127.0.0.1在2023年04月26日 13时19分13秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 13:19:13');
INSERT INTO `t_system_log` VALUES (97, 1, '[127.0.0.1在2023年04月26日 13时19分30秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 13:19:31');
INSERT INTO `t_system_log` VALUES (98, 1, '[127.0.0.1在2023年04月26日 13时19分30秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:19:31');
INSERT INTO `t_system_log` VALUES (99, 1, '[127.0.0.1在2023年04月26日 13时20分28秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 13:20:29');
INSERT INTO `t_system_log` VALUES (100, 1, '[127.0.0.1在2023年04月26日 13时20分31秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:20:31');
INSERT INTO `t_system_log` VALUES (101, 1, '[127.0.0.1在2023年04月26日 13时21分36秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 13:21:36');
INSERT INTO `t_system_log` VALUES (102, 1, '[127.0.0.1在2023年04月26日 13时22分36秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 13:22:36');
INSERT INTO `t_system_log` VALUES (103, 1, '[127.0.0.1在2023年04月26日 13时22分36秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:22:36');
INSERT INTO `t_system_log` VALUES (104, 1, '[127.0.0.1在2023年04月26日 13时22分41秒操作了com.jd.controller.OrderController的delete方法]', '2023-04-26 13:22:42');
INSERT INTO `t_system_log` VALUES (105, 1, '[127.0.0.1在2023年04月26日 13时22分41秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:22:42');
INSERT INTO `t_system_log` VALUES (106, 1, '[127.0.0.1在2023年04月26日 13时31分20秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:31:20');
INSERT INTO `t_system_log` VALUES (107, 1, '[127.0.0.1在2023年04月26日 13时31分24秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:31:25');
INSERT INTO `t_system_log` VALUES (108, 1, '[127.0.0.1在2023年04月26日 13时32分21秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:32:22');
INSERT INTO `t_system_log` VALUES (109, 1, '[127.0.0.1在2023年04月26日 13时32分22秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:32:23');
INSERT INTO `t_system_log` VALUES (110, 1, '[127.0.0.1在2023年04月26日 13时32分23秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:32:23');
INSERT INTO `t_system_log` VALUES (111, 1, '[127.0.0.1在2023年04月26日 13时32分25秒操作了com.jd.controller.CustomerController的list方法]', '2023-04-26 13:32:25');
INSERT INTO `t_system_log` VALUES (112, 1, '[127.0.0.1在2023年04月26日 13时32分26秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 13:32:26');
INSERT INTO `t_system_log` VALUES (113, 1, '[127.0.0.1在2023年04月26日 13时32分29秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:32:30');
INSERT INTO `t_system_log` VALUES (114, 1, '[127.0.0.1在2023年04月26日 13时32分32秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:32:33');
INSERT INTO `t_system_log` VALUES (115, 1, '[127.0.0.1在2023年04月26日 13时36分33秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:33');
INSERT INTO `t_system_log` VALUES (116, 1, '[127.0.0.1在2023年04月26日 13时36分33秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:34');
INSERT INTO `t_system_log` VALUES (117, 1, '[127.0.0.1在2023年04月26日 13时36分34秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:34');
INSERT INTO `t_system_log` VALUES (118, 1, '[127.0.0.1在2023年04月26日 13时36分41秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:42');
INSERT INTO `t_system_log` VALUES (119, 1, '[127.0.0.1在2023年04月26日 13时36分48秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:48');
INSERT INTO `t_system_log` VALUES (120, 1, '[127.0.0.1在2023年04月26日 13时36分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:36:50');
INSERT INTO `t_system_log` VALUES (121, 1, '[127.0.0.1在2023年04月26日 13时36分51秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:36:51');
INSERT INTO `t_system_log` VALUES (122, 1, '[127.0.0.1在2023年04月26日 13时36分52秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:36:53');
INSERT INTO `t_system_log` VALUES (123, 1, '[127.0.0.1在2023年04月26日 13时36分58秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 13:36:58');
INSERT INTO `t_system_log` VALUES (124, 1, '[127.0.0.1在2023年04月26日 13时38分34秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:38:35');
INSERT INTO `t_system_log` VALUES (125, 1, '[127.0.0.1在2023年04月26日 13时38分36秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:38:36');
INSERT INTO `t_system_log` VALUES (126, 1, '[127.0.0.1在2023年04月26日 13时39分49秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:39:49');
INSERT INTO `t_system_log` VALUES (127, 1, '[127.0.0.1在2023年04月26日 13时39分50秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:39:51');
INSERT INTO `t_system_log` VALUES (128, 1, '[127.0.0.1在2023年04月26日 13时39分52秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:39:52');
INSERT INTO `t_system_log` VALUES (129, 1, '[127.0.0.1在2023年04月26日 13时39分55秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:39:55');
INSERT INTO `t_system_log` VALUES (130, 1, '[127.0.0.1在2023年04月26日 13时39分56秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:39:57');
INSERT INTO `t_system_log` VALUES (131, 1, '[127.0.0.1在2023年04月26日 13时43分16秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:43:16');
INSERT INTO `t_system_log` VALUES (132, 1, '[127.0.0.1在2023年04月26日 13时43分17秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:43:18');
INSERT INTO `t_system_log` VALUES (133, 1, '[127.0.0.1在2023年04月26日 13时43分19秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 13:43:19');
INSERT INTO `t_system_log` VALUES (134, 1, '[127.0.0.1在2023年04月26日 13时43分20秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:43:21');
INSERT INTO `t_system_log` VALUES (135, 1, '[127.0.0.1在2023年04月26日 13时43分22秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:43:22');
INSERT INTO `t_system_log` VALUES (136, 1, '[127.0.0.1在2023年04月26日 13时43分44秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:43:45');
INSERT INTO `t_system_log` VALUES (137, 1, '[127.0.0.1在2023年04月26日 13时43分46秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:43:47');
INSERT INTO `t_system_log` VALUES (138, 1, '[127.0.0.1在2023年04月26日 13时43分48秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:43:49');
INSERT INTO `t_system_log` VALUES (139, 1, '[127.0.0.1在2023年04月26日 13时43分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:43:50');
INSERT INTO `t_system_log` VALUES (140, 1, '[127.0.0.1在2023年04月26日 13时43分51秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:43:51');
INSERT INTO `t_system_log` VALUES (141, 1, '[127.0.0.1在2023年04月26日 13时50分49秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:50:49');
INSERT INTO `t_system_log` VALUES (142, 1, '[127.0.0.1在2023年04月26日 13时50分50秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:50:51');
INSERT INTO `t_system_log` VALUES (143, 1, '[127.0.0.1在2023年04月26日 13时51分26秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:51:26');
INSERT INTO `t_system_log` VALUES (144, 1, '[127.0.0.1在2023年04月26日 13时51分57秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:51:58');
INSERT INTO `t_system_log` VALUES (145, 1, '[127.0.0.1在2023年04月26日 13时58分30秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 13:58:30');
INSERT INTO `t_system_log` VALUES (146, 1, '[127.0.0.1在2023年04月26日 13时58分32秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 13:58:33');
INSERT INTO `t_system_log` VALUES (147, 1, '[127.0.0.1在2023年04月26日 14时08分23秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:08:23');
INSERT INTO `t_system_log` VALUES (148, 1, '[127.0.0.1在2023年04月26日 14时11分25秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:11:25');
INSERT INTO `t_system_log` VALUES (149, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时16分06秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:16:07');
INSERT INTO `t_system_log` VALUES (150, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时16分08秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:16:08');
INSERT INTO `t_system_log` VALUES (151, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时16分21秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:16:22');
INSERT INTO `t_system_log` VALUES (152, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时21分10秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:21:11');
INSERT INTO `t_system_log` VALUES (153, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时21分12秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:21:12');
INSERT INTO `t_system_log` VALUES (154, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时22分17秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:22:17');
INSERT INTO `t_system_log` VALUES (155, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分40秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:28:41');
INSERT INTO `t_system_log` VALUES (156, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分42秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:28:42');
INSERT INTO `t_system_log` VALUES (157, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分47秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:28:47');
INSERT INTO `t_system_log` VALUES (158, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分51秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:28:51');
INSERT INTO `t_system_log` VALUES (159, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分51秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 14:28:52');
INSERT INTO `t_system_log` VALUES (160, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时28分52秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:28:52');
INSERT INTO `t_system_log` VALUES (161, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时29分17秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:29:18');
INSERT INTO `t_system_log` VALUES (162, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时34分30秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 14:34:31');
INSERT INTO `t_system_log` VALUES (163, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 14时34分33秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 14:34:33');
INSERT INTO `t_system_log` VALUES (164, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时09分15秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:09:15');
INSERT INTO `t_system_log` VALUES (165, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时09分39秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:09:39');
INSERT INTO `t_system_log` VALUES (166, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时10分02秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:10:03');
INSERT INTO `t_system_log` VALUES (167, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时10分23秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:10:23');
INSERT INTO `t_system_log` VALUES (168, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时11分08秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:11:08');
INSERT INTO `t_system_log` VALUES (169, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时11分14秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:11:14');
INSERT INTO `t_system_log` VALUES (170, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时13分01秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:13:01');
INSERT INTO `t_system_log` VALUES (171, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时15分17秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:15:17');
INSERT INTO `t_system_log` VALUES (172, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时15分25秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:15:25');
INSERT INTO `t_system_log` VALUES (173, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时15分59秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:15:59');
INSERT INTO `t_system_log` VALUES (175, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时20分28秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:20:28');
INSERT INTO `t_system_log` VALUES (176, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时33分33秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:33:33');
INSERT INTO `t_system_log` VALUES (177, 1, '[0:0:0:0:0:0:0:1在2023年04月26日 15时33分39秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:33:39');
INSERT INTO `t_system_log` VALUES (178, 1, '[127.0.0.1在2023年04月26日 15时42分43秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 15:42:43');
INSERT INTO `t_system_log` VALUES (179, 1, '[127.0.0.1在2023年04月26日 15时42分46秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 15:42:47');
INSERT INTO `t_system_log` VALUES (180, 1, '[127.0.0.1在2023年04月26日 15时47分04秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:47:05');
INSERT INTO `t_system_log` VALUES (181, 1, '[127.0.0.1在2023年04月26日 15时56分50秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:56:50');
INSERT INTO `t_system_log` VALUES (182, 1, '[127.0.0.1在2023年04月26日 15时57分23秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:57:23');
INSERT INTO `t_system_log` VALUES (183, 1, '[127.0.0.1在2023年04月26日 15时58分58秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 15:58:58');
INSERT INTO `t_system_log` VALUES (184, 1, '[127.0.0.1在2023年04月26日 16时00分01秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:00:01');
INSERT INTO `t_system_log` VALUES (185, 1, '[127.0.0.1在2023年04月26日 16时08分02秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:08:02');
INSERT INTO `t_system_log` VALUES (186, 1, '[127.0.0.1在2023年04月26日 16时08分04秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:08:05');
INSERT INTO `t_system_log` VALUES (187, 1, '[127.0.0.1在2023年04月26日 16时09分27秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:09:28');
INSERT INTO `t_system_log` VALUES (188, 1, '[127.0.0.1在2023年04月26日 16时10分02秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:10:03');
INSERT INTO `t_system_log` VALUES (189, 1, '[127.0.0.1在2023年04月26日 16时10分09秒操作了com.jd.controller.SystemLogController的list方法]', '2023-04-26 16:10:09');
INSERT INTO `t_system_log` VALUES (190, 1, '[127.0.0.1在2023年04月26日 16时10分13秒操作了com.jd.controller.SystemLogController的delete方法]', '2023-04-26 16:10:14');
INSERT INTO `t_system_log` VALUES (191, 1, '[127.0.0.1在2023年04月26日 16时10分13秒操作了com.jd.controller.SystemLogController的list方法]', '2023-04-26 16:10:14');
INSERT INTO `t_system_log` VALUES (192, 1, '[127.0.0.1在2023年04月26日 16时10分14秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 16:10:15');
INSERT INTO `t_system_log` VALUES (193, 1, '[127.0.0.1在2023年04月26日 16时10分18秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:10:19');
INSERT INTO `t_system_log` VALUES (194, 1, '[127.0.0.1在2023年04月26日 16时10分24秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 16:10:25');
INSERT INTO `t_system_log` VALUES (195, 1, '[127.0.0.1在2023年04月26日 16时10分44秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 16:10:44');
INSERT INTO `t_system_log` VALUES (196, 1, '[127.0.0.1在2023年04月26日 16时10分44秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:10:44');
INSERT INTO `t_system_log` VALUES (197, 1, '[127.0.0.1在2023年04月26日 16时10分57秒操作了com.jd.controller.OrderController的delete方法]', '2023-04-26 16:10:58');
INSERT INTO `t_system_log` VALUES (198, 1, '[127.0.0.1在2023年04月26日 16时10分58秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:10:58');
INSERT INTO `t_system_log` VALUES (199, 1, '[127.0.0.1在2023年04月26日 16时11分02秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 16:11:02');
INSERT INTO `t_system_log` VALUES (200, 1, '[127.0.0.1在2023年04月26日 16时11分19秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 16:11:19');
INSERT INTO `t_system_log` VALUES (201, 1, '[127.0.0.1在2023年04月26日 16时11分19秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:11:19');
INSERT INTO `t_system_log` VALUES (202, 1, '[127.0.0.1在2023年04月26日 16时11分23秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:11:24');
INSERT INTO `t_system_log` VALUES (203, 1, '[127.0.0.1在2023年04月26日 16时11分30秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:11:30');
INSERT INTO `t_system_log` VALUES (204, 1, '[127.0.0.1在2023年04月26日 16时11分43秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:11:44');
INSERT INTO `t_system_log` VALUES (205, 1, '[127.0.0.1在2023年04月26日 16时13分45秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:13:45');
INSERT INTO `t_system_log` VALUES (206, 1, '[127.0.0.1在2023年04月26日 16时13分49秒操作了com.jd.controller.OrderController的view方法]', '2023-04-26 16:13:50');
INSERT INTO `t_system_log` VALUES (207, 1, '[127.0.0.1在2023年04月26日 16时13分51秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:13:52');
INSERT INTO `t_system_log` VALUES (208, 1, '[127.0.0.1在2023年04月26日 16时13分53秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:13:54');
INSERT INTO `t_system_log` VALUES (209, 1, '[127.0.0.1在2023年04月26日 16时13分57秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 16:13:57');
INSERT INTO `t_system_log` VALUES (210, 1, '[127.0.0.1在2023年04月26日 16时13分57秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:13:57');
INSERT INTO `t_system_log` VALUES (211, 1, '[127.0.0.1在2023年04月26日 16时14分01秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:14:01');
INSERT INTO `t_system_log` VALUES (212, 1, '[127.0.0.1在2023年04月26日 16时14分03秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 16:14:04');
INSERT INTO `t_system_log` VALUES (213, 1, '[127.0.0.1在2023年04月26日 16时14分03秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:14:04');
INSERT INTO `t_system_log` VALUES (214, 1, '[127.0.0.1在2023年04月26日 16时14分08秒操作了com.jd.controller.OrderController的add方法]', '2023-04-26 16:14:09');
INSERT INTO `t_system_log` VALUES (215, 1, '[127.0.0.1在2023年04月26日 16时14分33秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-04-26 16:14:33');
INSERT INTO `t_system_log` VALUES (216, 1, '[127.0.0.1在2023年04月26日 16时14分33秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:14:33');
INSERT INTO `t_system_log` VALUES (217, 1, '[127.0.0.1在2023年04月26日 16时15分15秒操作了com.jd.controller.OrderController的delete方法]', '2023-04-26 16:15:16');
INSERT INTO `t_system_log` VALUES (218, 1, '[127.0.0.1在2023年04月26日 16时15分15秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:15:16');
INSERT INTO `t_system_log` VALUES (219, 1, '[127.0.0.1在2023年04月26日 16时15分23秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:15:23');
INSERT INTO `t_system_log` VALUES (220, 1, '[127.0.0.1在2023年04月26日 16时15分27秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:15:28');
INSERT INTO `t_system_log` VALUES (221, 1, '[127.0.0.1在2023年04月26日 16时15分33秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:15:33');
INSERT INTO `t_system_log` VALUES (222, 1, '[127.0.0.1在2023年04月26日 16时15分43秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:15:43');
INSERT INTO `t_system_log` VALUES (223, 1, '[127.0.0.1在2023年04月26日 16时16分01秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:16:02');
INSERT INTO `t_system_log` VALUES (224, 1, '[127.0.0.1在2023年04月26日 16时16分08秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-04-26 16:16:08');
INSERT INTO `t_system_log` VALUES (225, 1, '[127.0.0.1在2023年04月26日 16时16分21秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:16:21');
INSERT INTO `t_system_log` VALUES (226, 1, '[127.0.0.1在2023年04月26日 16时16分42秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:16:42');
INSERT INTO `t_system_log` VALUES (227, 1, '[127.0.0.1在2023年04月26日 16时17分03秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:17:04');
INSERT INTO `t_system_log` VALUES (228, 1, '[127.0.0.1在2023年04月26日 16时17分38秒操作了com.jd.controller.OrderController的list方法]', '2023-04-26 16:17:38');
INSERT INTO `t_system_log` VALUES (229, 1, '[127.0.0.1在2023年04月26日 16时17分40秒操作了com.jd.controller.OrderController的update方法]', '2023-04-26 16:17:40');
INSERT INTO `t_system_log` VALUES (230, 1, '[127.0.0.1在2023年04月26日 16时17分47秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-26 16:17:48');
INSERT INTO `t_system_log` VALUES (231, 1, '[127.0.0.1在2023年04月27日 19时15分37秒操作了com.jd.controller.OrderController的list方法]', '2023-04-27 19:15:37');
INSERT INTO `t_system_log` VALUES (232, 1, '[127.0.0.1在2023年04月27日 19时15分41秒操作了com.jd.controller.OrderController的update方法]', '2023-04-27 19:15:42');
INSERT INTO `t_system_log` VALUES (233, 1, '[127.0.0.1在2023年04月27日 19时34分14秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-27 19:34:14');
INSERT INTO `t_system_log` VALUES (234, 1, '[127.0.0.1在2023年04月27日 19时35分54秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-27 19:35:55');
INSERT INTO `t_system_log` VALUES (235, 1, '[127.0.0.1在2023年04月27日 19时37分22秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-27 19:37:22');
INSERT INTO `t_system_log` VALUES (236, 1, '[127.0.0.1在2023年04月27日 19时37分57秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-04-27 19:37:58');
INSERT INTO `t_system_log` VALUES (237, 1, '[127.0.0.1在2023年04月27日 20时04分00秒操作了com.jd.controller.SupplierController的list方法]', '2023-04-27 20:04:00');
INSERT INTO `t_system_log` VALUES (238, 1, '[127.0.0.1在2023年05月01日 21时34分55秒操作了com.jd.controller.SupplierController的list方法]', '2023-05-01 21:34:55');
INSERT INTO `t_system_log` VALUES (239, 1, '[127.0.0.1在2023年05月01日 21时34分59秒操作了com.jd.controller.SupplierController的update方法]', '2023-05-01 21:34:59');
INSERT INTO `t_system_log` VALUES (240, 1, '[127.0.0.1在2023年05月01日 21时35分07秒操作了com.jd.controller.CustomerController的list方法]', '2023-05-01 21:35:08');
INSERT INTO `t_system_log` VALUES (241, 1, '[127.0.0.1在2023年05月01日 21时35分08秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 21:35:09');
INSERT INTO `t_system_log` VALUES (242, 1, '[127.0.0.1在2023年05月01日 21时35分10秒操作了com.jd.controller.OrderController的update方法]', '2023-05-01 21:35:11');
INSERT INTO `t_system_log` VALUES (243, 1, '[127.0.0.1在2023年05月01日 21时47分45秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 21:47:46');
INSERT INTO `t_system_log` VALUES (244, 1, '[127.0.0.1在2023年05月01日 21时47分47秒操作了com.jd.controller.OrderController的update方法]', '2023-05-01 21:47:47');
INSERT INTO `t_system_log` VALUES (245, 1, '[127.0.0.1在2023年05月01日 21时50分21秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 21:50:22');
INSERT INTO `t_system_log` VALUES (246, 1, '[127.0.0.1在2023年05月01日 21时50分25秒操作了com.jd.controller.OrderController的update方法]', '2023-05-01 21:50:26');
INSERT INTO `t_system_log` VALUES (247, 1, '[127.0.0.1在2023年05月01日 21时53分03秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 21:53:03');
INSERT INTO `t_system_log` VALUES (248, 1, '[127.0.0.1在2023年05月01日 22时03分34秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:03:35');
INSERT INTO `t_system_log` VALUES (249, 1, '[127.0.0.1在2023年05月01日 22时04分28秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:04:28');
INSERT INTO `t_system_log` VALUES (250, 1, '[127.0.0.1在2023年05月01日 22时04分30秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:04:30');
INSERT INTO `t_system_log` VALUES (251, 1, '[127.0.0.1在2023年05月01日 22时04分31秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:04:31');
INSERT INTO `t_system_log` VALUES (252, 1, '[127.0.0.1在2023年05月01日 22时07分17秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:07:18');
INSERT INTO `t_system_log` VALUES (253, 1, '[127.0.0.1在2023年05月01日 22时07分20秒操作了com.jd.controller.OrderController的query方法]', '2023-05-01 22:07:20');
INSERT INTO `t_system_log` VALUES (254, 1, '[127.0.0.1在2023年05月01日 22时07分23秒操作了com.jd.controller.OrderController的query方法]', '2023-05-01 22:07:24');
INSERT INTO `t_system_log` VALUES (255, 1, '[127.0.0.1在2023年05月01日 22时07分27秒操作了com.jd.controller.OrderController的query方法]', '2023-05-01 22:07:27');
INSERT INTO `t_system_log` VALUES (256, 1, '[127.0.0.1在2023年05月01日 22时07分29秒操作了com.jd.controller.OrderController的query方法]', '2023-05-01 22:07:30');
INSERT INTO `t_system_log` VALUES (257, 1, '[127.0.0.1在2023年05月01日 22时07分55秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:07:55');
INSERT INTO `t_system_log` VALUES (258, 1, '[127.0.0.1在2023年05月01日 22时10分27秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:10:27');
INSERT INTO `t_system_log` VALUES (259, 1, '[127.0.0.1在2023年05月01日 22时11分47秒操作了com.jd.controller.OrderController的view方法]', '2023-05-01 22:11:47');
INSERT INTO `t_system_log` VALUES (260, 1, '[127.0.0.1在2023年05月01日 22时11分48秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:11:49');
INSERT INTO `t_system_log` VALUES (261, 1, '[127.0.0.1在2023年05月01日 22时11分50秒操作了com.jd.controller.OrderController的view方法]', '2023-05-01 22:11:51');
INSERT INTO `t_system_log` VALUES (262, 1, '[127.0.0.1在2023年05月01日 22时11分52秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:11:52');
INSERT INTO `t_system_log` VALUES (263, 1, '[127.0.0.1在2023年05月01日 22时11分55秒操作了com.jd.controller.OrderController的del方法]', '2023-05-01 22:11:56');
INSERT INTO `t_system_log` VALUES (264, 1, '[127.0.0.1在2023年05月01日 22时11分55秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:11:56');
INSERT INTO `t_system_log` VALUES (265, 1, '[127.0.0.1在2023年05月01日 22时13分30秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:13:31');
INSERT INTO `t_system_log` VALUES (266, 1, '[127.0.0.1在2023年05月01日 22时13分51秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:13:51');
INSERT INTO `t_system_log` VALUES (267, 1, '[127.0.0.1在2023年05月01日 22时15分04秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:15:05');
INSERT INTO `t_system_log` VALUES (268, 1, '[127.0.0.1在2023年05月01日 22时16分22秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:16:23');
INSERT INTO `t_system_log` VALUES (269, 1, '[127.0.0.1在2023年05月01日 22时16分24秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-05-01 22:16:24');
INSERT INTO `t_system_log` VALUES (270, 1, '[127.0.0.1在2023年05月01日 22时16分24秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:16:24');
INSERT INTO `t_system_log` VALUES (271, 1, '[127.0.0.1在2023年05月01日 22时18分15秒操作了com.jd.controller.SupplierController的list方法]', '2023-05-01 22:18:16');
INSERT INTO `t_system_log` VALUES (272, 1, '[127.0.0.1在2023年05月01日 22时18分17秒操作了com.jd.controller.SupplierController的update方法]', '2023-05-01 22:18:18');
INSERT INTO `t_system_log` VALUES (273, 1, '[127.0.0.1在2023年05月01日 22时18分19秒操作了com.jd.controller.CustomerController的list方法]', '2023-05-01 22:18:19');
INSERT INTO `t_system_log` VALUES (274, 1, '[127.0.0.1在2023年05月01日 22时18分20秒操作了com.jd.controller.CustomerController的update方法]', '2023-05-01 22:18:21');
INSERT INTO `t_system_log` VALUES (275, 1, '[127.0.0.1在2023年05月01日 22时18分23秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:18:23');
INSERT INTO `t_system_log` VALUES (276, 1, '[127.0.0.1在2023年05月01日 22时18分26秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:18:26');
INSERT INTO `t_system_log` VALUES (277, 1, '[127.0.0.1在2023年05月01日 22时18分46秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:18:47');
INSERT INTO `t_system_log` VALUES (278, 1, '[127.0.0.1在2023年05月01日 22时25分22秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:25:23');
INSERT INTO `t_system_log` VALUES (279, 1, '[127.0.0.1在2023年05月01日 22时26分39秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:26:39');
INSERT INTO `t_system_log` VALUES (280, 1, '[127.0.0.1在2023年05月01日 22时27分01秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:27:01');
INSERT INTO `t_system_log` VALUES (281, 1, '[127.0.0.1在2023年05月01日 22时29分13秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:29:14');
INSERT INTO `t_system_log` VALUES (282, 1, '[127.0.0.1在2023年05月01日 22时34分36秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 22:34:36');
INSERT INTO `t_system_log` VALUES (283, 1, '[127.0.0.1在2023年05月01日 22时34分37秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:34:37');
INSERT INTO `t_system_log` VALUES (284, 1, '[127.0.0.1在2023年05月01日 22时35分10秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 22:35:11');
INSERT INTO `t_system_log` VALUES (285, 1, '[127.0.0.1在2023年05月01日 22时35分13秒操作了com.jd.controller.OrderController的toUpdate方法]', '2023-05-01 22:35:14');
INSERT INTO `t_system_log` VALUES (286, 1, '[127.0.0.1在2023年05月01日 22时48分02秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 22:48:02');
INSERT INTO `t_system_log` VALUES (287, 1, '[127.0.0.1在2023年05月01日 22时51分43秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 22:51:43');
INSERT INTO `t_system_log` VALUES (288, 1, '[127.0.0.1在2023年05月01日 22时52分01秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 22:52:01');
INSERT INTO `t_system_log` VALUES (289, 1, '[127.0.0.1在2023年05月01日 22时59分53秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 22:59:54');
INSERT INTO `t_system_log` VALUES (290, 1, '[127.0.0.1在2023年05月01日 23时00分07秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:00:07');
INSERT INTO `t_system_log` VALUES (291, 1, '[127.0.0.1在2023年05月01日 23时00分20秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:00:21');
INSERT INTO `t_system_log` VALUES (292, 1, '[127.0.0.1在2023年05月01日 23时00分27秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:00:28');
INSERT INTO `t_system_log` VALUES (293, 1, '[127.0.0.1在2023年05月01日 23时01分50秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:01:51');
INSERT INTO `t_system_log` VALUES (294, 1, '[127.0.0.1在2023年05月01日 23时05分08秒操作了com.jd.controller.OrderController的list方法]', '2023-05-01 23:05:09');
INSERT INTO `t_system_log` VALUES (295, 1, '[127.0.0.1在2023年05月01日 23时06分29秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:06:29');
INSERT INTO `t_system_log` VALUES (296, 1, '[127.0.0.1在2023年05月01日 23时06分42秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-01 23:06:42');
INSERT INTO `t_system_log` VALUES (297, 1, '[127.0.0.1在2023年05月02日 23时58分58秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-02 23:58:58');
INSERT INTO `t_system_log` VALUES (298, 1, '[127.0.0.1在2023年05月02日 23时59分10秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-02 23:59:10');
INSERT INTO `t_system_log` VALUES (299, 1, '[127.0.0.1在2023年05月02日 23时59分37秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-02 23:59:37');
INSERT INTO `t_system_log` VALUES (300, 1, '[127.0.0.1在2023年05月03日 00时01分04秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 00:01:04');
INSERT INTO `t_system_log` VALUES (301, 1, '[127.0.0.1在2023年05月03日 00时03分25秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 00:03:26');
INSERT INTO `t_system_log` VALUES (302, 1, '[127.0.0.1在2023年05月03日 00时03分36秒操作了com.jd.controller.OrderController的query方法]', '2023-05-03 00:03:37');
INSERT INTO `t_system_log` VALUES (303, 1, '[127.0.0.1在2023年05月03日 00时04分39秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 00:04:40');
INSERT INTO `t_system_log` VALUES (304, 1, '[127.0.0.1在2023年05月03日 11时47分31秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 11:47:31');
INSERT INTO `t_system_log` VALUES (305, 1, '[127.0.0.1在2023年05月03日 11时55分27秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 11:55:27');
INSERT INTO `t_system_log` VALUES (306, 1, '[127.0.0.1在2023年05月03日 11时55分29秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 11:55:29');
INSERT INTO `t_system_log` VALUES (307, 1, '[127.0.0.1在2023年05月03日 11时55分30秒操作了com.jd.controller.SystemController的loginOut方法]', '2023-05-03 11:55:30');
INSERT INTO `t_system_log` VALUES (308, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 11时58分17秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 11:58:18');
INSERT INTO `t_system_log` VALUES (309, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时13分55秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:13:56');
INSERT INTO `t_system_log` VALUES (310, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时13分57秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 12:13:57');
INSERT INTO `t_system_log` VALUES (311, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分16秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 12:14:16');
INSERT INTO `t_system_log` VALUES (312, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分18秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 12:14:19');
INSERT INTO `t_system_log` VALUES (313, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分19秒操作了com.jd.controller.OrderController的list方法]', '2023-05-03 12:14:20');
INSERT INTO `t_system_log` VALUES (314, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分21秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 12:14:22');
INSERT INTO `t_system_log` VALUES (315, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分32秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:14:32');
INSERT INTO `t_system_log` VALUES (316, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分33秒操作了com.jd.controller.CategoryController的toAdd方法]', '2023-05-03 12:14:34');
INSERT INTO `t_system_log` VALUES (317, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时14分56秒操作了com.jd.controller.CategoryController的toAdd方法]', '2023-05-03 12:14:56');
INSERT INTO `t_system_log` VALUES (318, 1, '[127.0.0.1在2023年05月03日 12时18分08秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:18:08');
INSERT INTO `t_system_log` VALUES (319, 1, '[127.0.0.1在2023年05月03日 12时18分10秒操作了com.jd.controller.CategoryController的toAdd方法]', '2023-05-03 12:18:11');
INSERT INTO `t_system_log` VALUES (320, 1, '[127.0.0.1在2023年05月03日 12时18分17秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:18:18');
INSERT INTO `t_system_log` VALUES (321, 1, '[127.0.0.1在2023年05月03日 12时18分18秒操作了com.jd.controller.CategoryController的toAdd方法]', '2023-05-03 12:18:19');
INSERT INTO `t_system_log` VALUES (322, 1, '[127.0.0.1在2023年05月03日 12时22分27秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:22:27');
INSERT INTO `t_system_log` VALUES (323, 1, '[127.0.0.1在2023年05月03日 12时22分29秒操作了com.jd.controller.CategoryController的toAdd方法]', '2023-05-03 12:22:30');
INSERT INTO `t_system_log` VALUES (324, 1, '[127.0.0.1在2023年05月03日 12时22分49秒操作了com.jd.controller.CategoryController的addOrUpdate方法]', '2023-05-03 12:22:50');
INSERT INTO `t_system_log` VALUES (325, 1, '[127.0.0.1在2023年05月03日 12时22分49秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:22:50');
INSERT INTO `t_system_log` VALUES (326, 1, '[127.0.0.1在2023年05月03日 12时24分47秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:24:48');
INSERT INTO `t_system_log` VALUES (327, 1, '[127.0.0.1在2023年05月03日 12时24分51秒操作了com.jd.controller.CategoryController的del方法]', '2023-05-03 12:24:51');
INSERT INTO `t_system_log` VALUES (328, 1, '[127.0.0.1在2023年05月03日 12时24分51秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:24:51');
INSERT INTO `t_system_log` VALUES (329, 1, '[127.0.0.1在2023年05月03日 12时30分40秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:30:41');
INSERT INTO `t_system_log` VALUES (330, 1, '[127.0.0.1在2023年05月03日 12时30分45秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 12:30:45');
INSERT INTO `t_system_log` VALUES (331, 1, '[127.0.0.1在2023年05月03日 12时30分49秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 12:30:50');
INSERT INTO `t_system_log` VALUES (332, 1, '[127.0.0.1在2023年05月03日 12时30分52秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 12:30:53');
INSERT INTO `t_system_log` VALUES (333, 1, '[127.0.0.1在2023年05月03日 12时31分06秒操作了com.jd.controller.CategoryController的addOrUpdate方法]', '2023-05-03 12:31:06');
INSERT INTO `t_system_log` VALUES (334, 1, '[127.0.0.1在2023年05月03日 12时31分06秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:31:06');
INSERT INTO `t_system_log` VALUES (335, 1, '[127.0.0.1在2023年05月03日 12时31分07秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 12:31:08');
INSERT INTO `t_system_log` VALUES (336, 1, '[127.0.0.1在2023年05月03日 12时31分16秒操作了com.jd.controller.CategoryController的addOrUpdate方法]', '2023-05-03 12:31:16');
INSERT INTO `t_system_log` VALUES (337, 1, '[127.0.0.1在2023年05月03日 12时31分16秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:31:16');
INSERT INTO `t_system_log` VALUES (338, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时36分30秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:36:30');
INSERT INTO `t_system_log` VALUES (339, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时36分42秒操作了com.jd.controller.CategoryController的view方法]', '2023-05-03 12:36:42');
INSERT INTO `t_system_log` VALUES (340, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时36分44秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:36:45');
INSERT INTO `t_system_log` VALUES (341, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时36分46秒操作了com.jd.controller.CategoryController的view方法]', '2023-05-03 12:36:46');
INSERT INTO `t_system_log` VALUES (342, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 12时36分48秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 12:36:49');
INSERT INTO `t_system_log` VALUES (343, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时41分06秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 14:41:07');
INSERT INTO `t_system_log` VALUES (344, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时41分17秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 14:41:18');
INSERT INTO `t_system_log` VALUES (345, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时41分21秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 14:41:22');
INSERT INTO `t_system_log` VALUES (346, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时41分40秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 14:41:40');
INSERT INTO `t_system_log` VALUES (347, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时48分37秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 14:48:37');
INSERT INTO `t_system_log` VALUES (348, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时48分43秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 14:48:44');
INSERT INTO `t_system_log` VALUES (349, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 14时48分51秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 14:48:51');
INSERT INTO `t_system_log` VALUES (350, 1, '[127.0.0.1在2023年05月03日 15时16分04秒操作了com.jd.controller.OrderController的list方法]', '2023-05-03 15:16:05');
INSERT INTO `t_system_log` VALUES (351, 1, '[127.0.0.1在2023年05月03日 15时16分06秒操作了com.jd.controller.OrderController的toAdd方法]', '2023-05-03 15:16:07');
INSERT INTO `t_system_log` VALUES (352, 1, '[127.0.0.1在2023年05月03日 15时16分16秒操作了com.jd.controller.OrderController的addOrUpdate方法]', '2023-05-03 15:16:17');
INSERT INTO `t_system_log` VALUES (353, 1, '[127.0.0.1在2023年05月03日 15时16分17秒操作了com.jd.controller.OrderController的list方法]', '2023-05-03 15:16:17');
INSERT INTO `t_system_log` VALUES (354, 1, '[127.0.0.1在2023年05月03日 15时16分22秒操作了com.jd.controller.OrderController的del方法]', '2023-05-03 15:16:23');
INSERT INTO `t_system_log` VALUES (355, 1, '[127.0.0.1在2023年05月03日 15时16分22秒操作了com.jd.controller.OrderController的list方法]', '2023-05-03 15:16:23');
INSERT INTO `t_system_log` VALUES (356, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时19分48秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:19:49');
INSERT INTO `t_system_log` VALUES (357, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时20分44秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:20:44');
INSERT INTO `t_system_log` VALUES (358, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时20分53秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:20:53');
INSERT INTO `t_system_log` VALUES (359, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时21分04秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:21:04');
INSERT INTO `t_system_log` VALUES (360, 1, '[127.0.0.1在2023年05月03日 16时21分10秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:21:10');
INSERT INTO `t_system_log` VALUES (361, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分36秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:23:37');
INSERT INTO `t_system_log` VALUES (362, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分39秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:23:40');
INSERT INTO `t_system_log` VALUES (363, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分45秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:23:46');
INSERT INTO `t_system_log` VALUES (364, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分47秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:23:48');
INSERT INTO `t_system_log` VALUES (365, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分52秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:23:52');
INSERT INTO `t_system_log` VALUES (366, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时23分59秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:24:00');
INSERT INTO `t_system_log` VALUES (367, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时24分02秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:24:03');
INSERT INTO `t_system_log` VALUES (368, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时27分39秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:27:39');
INSERT INTO `t_system_log` VALUES (369, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时27分48秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:27:49');
INSERT INTO `t_system_log` VALUES (370, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时27分58秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:27:59');
INSERT INTO `t_system_log` VALUES (371, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 16时28分26秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:28:27');
INSERT INTO `t_system_log` VALUES (372, 1, '[127.0.0.1在2023年05月03日 16时34分26秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:34:26');
INSERT INTO `t_system_log` VALUES (373, 1, '[127.0.0.1在2023年05月03日 16时34分34秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:34:35');
INSERT INTO `t_system_log` VALUES (374, 1, '[127.0.0.1在2023年05月03日 16时34分42秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:34:43');
INSERT INTO `t_system_log` VALUES (375, 1, '[127.0.0.1在2023年05月03日 16时34分46秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:34:47');
INSERT INTO `t_system_log` VALUES (376, 1, '[127.0.0.1在2023年05月03日 16时34分48秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:34:48');
INSERT INTO `t_system_log` VALUES (377, 1, '[127.0.0.1在2023年05月03日 16时40分54秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:40:55');
INSERT INTO `t_system_log` VALUES (378, 1, '[127.0.0.1在2023年05月03日 16时40分57秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:40:58');
INSERT INTO `t_system_log` VALUES (379, 1, '[127.0.0.1在2023年05月03日 16时41分00秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:41:00');
INSERT INTO `t_system_log` VALUES (380, 1, '[127.0.0.1在2023年05月03日 16时41分10秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:41:11');
INSERT INTO `t_system_log` VALUES (381, 1, '[127.0.0.1在2023年05月03日 16时42分26秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:42:27');
INSERT INTO `t_system_log` VALUES (382, 1, '[127.0.0.1在2023年05月03日 16时42分37秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:42:37');
INSERT INTO `t_system_log` VALUES (383, 1, '[127.0.0.1在2023年05月03日 16时45分02秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:03');
INSERT INTO `t_system_log` VALUES (384, 1, '[127.0.0.1在2023年05月03日 16时45分07秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:07');
INSERT INTO `t_system_log` VALUES (385, 1, '[127.0.0.1在2023年05月03日 16时45分11秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:11');
INSERT INTO `t_system_log` VALUES (386, 1, '[127.0.0.1在2023年05月03日 16时45分14秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:15');
INSERT INTO `t_system_log` VALUES (387, 1, '[127.0.0.1在2023年05月03日 16时45分18秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:18');
INSERT INTO `t_system_log` VALUES (388, 1, '[127.0.0.1在2023年05月03日 16时45分20秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:45:21');
INSERT INTO `t_system_log` VALUES (389, 1, '[127.0.0.1在2023年05月03日 16时46分39秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:46:40');
INSERT INTO `t_system_log` VALUES (390, 1, '[127.0.0.1在2023年05月03日 16时46分43秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:46:43');
INSERT INTO `t_system_log` VALUES (391, 1, '[127.0.0.1在2023年05月03日 16时46分45秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:46:46');
INSERT INTO `t_system_log` VALUES (392, 1, '[127.0.0.1在2023年05月03日 16时47分09秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:47:09');
INSERT INTO `t_system_log` VALUES (393, 1, '[127.0.0.1在2023年05月03日 16时48分04秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 16:48:04');
INSERT INTO `t_system_log` VALUES (394, 1, '[127.0.0.1在2023年05月03日 16时48分06秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:07');
INSERT INTO `t_system_log` VALUES (395, 1, '[127.0.0.1在2023年05月03日 16时48分11秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:12');
INSERT INTO `t_system_log` VALUES (396, 1, '[127.0.0.1在2023年05月03日 16时48分14秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:15');
INSERT INTO `t_system_log` VALUES (397, 1, '[127.0.0.1在2023年05月03日 16时48分19秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:20');
INSERT INTO `t_system_log` VALUES (398, 1, '[127.0.0.1在2023年05月03日 16时48分23秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:23');
INSERT INTO `t_system_log` VALUES (399, 1, '[127.0.0.1在2023年05月03日 16时48分25秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:25');
INSERT INTO `t_system_log` VALUES (400, 1, '[127.0.0.1在2023年05月03日 16时48分26秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:27');
INSERT INTO `t_system_log` VALUES (401, 1, '[127.0.0.1在2023年05月03日 16时48分29秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:48:30');
INSERT INTO `t_system_log` VALUES (402, 1, '[127.0.0.1在2023年05月03日 16时51分00秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 16:51:00');
INSERT INTO `t_system_log` VALUES (403, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时05分59秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:06:00');
INSERT INTO `t_system_log` VALUES (404, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时06分07秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:06:08');
INSERT INTO `t_system_log` VALUES (405, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时09分31秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:09:32');
INSERT INTO `t_system_log` VALUES (406, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时09分38秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:09:39');
INSERT INTO `t_system_log` VALUES (407, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时10分00秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:10:01');
INSERT INTO `t_system_log` VALUES (408, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时13分40秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:13:41');
INSERT INTO `t_system_log` VALUES (409, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时13分50秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:13:50');
INSERT INTO `t_system_log` VALUES (410, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时15分31秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:15:31');
INSERT INTO `t_system_log` VALUES (411, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时15分36秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:15:36');
INSERT INTO `t_system_log` VALUES (412, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分11秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:19:12');
INSERT INTO `t_system_log` VALUES (413, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分14秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:19:14');
INSERT INTO `t_system_log` VALUES (414, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分17秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:19:17');
INSERT INTO `t_system_log` VALUES (415, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分40秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:19:40');
INSERT INTO `t_system_log` VALUES (416, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分42秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:19:43');
INSERT INTO `t_system_log` VALUES (417, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时19分45秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:19:45');
INSERT INTO `t_system_log` VALUES (418, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时20分36秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:20:37');
INSERT INTO `t_system_log` VALUES (419, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时20分39秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:20:39');
INSERT INTO `t_system_log` VALUES (420, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时20分41秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:20:41');
INSERT INTO `t_system_log` VALUES (421, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时29分15秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 17:29:16');
INSERT INTO `t_system_log` VALUES (422, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时29分21秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:29:22');
INSERT INTO `t_system_log` VALUES (423, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时29分23秒操作了com.jd.controller.ProductController的view方法]', '2023-05-03 17:29:24');
INSERT INTO `t_system_log` VALUES (424, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时29分29秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:29:30');
INSERT INTO `t_system_log` VALUES (425, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时30分22秒操作了com.jd.controller.ProductController的toAdd方法]', '2023-05-03 17:30:22');
INSERT INTO `t_system_log` VALUES (426, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时40分14秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:40:14');
INSERT INTO `t_system_log` VALUES (427, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 17时40分19秒操作了com.jd.controller.ProductController的toAdd方法]', '2023-05-03 17:40:20');
INSERT INTO `t_system_log` VALUES (428, 1, '[127.0.0.1在2023年05月03日 17时41分56秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:41:56');
INSERT INTO `t_system_log` VALUES (429, 1, '[127.0.0.1在2023年05月03日 17时41分59秒操作了com.jd.controller.ProductController的toAdd方法]', '2023-05-03 17:41:59');
INSERT INTO `t_system_log` VALUES (430, 1, '[127.0.0.1在2023年05月03日 17时44分45秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:44:46');
INSERT INTO `t_system_log` VALUES (431, 1, '[127.0.0.1在2023年05月03日 17时44分47秒操作了com.jd.controller.ProductController的toAdd方法]', '2023-05-03 17:44:48');
INSERT INTO `t_system_log` VALUES (432, 1, '[127.0.0.1在2023年05月03日 17时47分22秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:47:22');
INSERT INTO `t_system_log` VALUES (433, 1, '[127.0.0.1在2023年05月03日 17时47分23秒操作了com.jd.controller.ProductController的toAdd方法]', '2023-05-03 17:47:23');
INSERT INTO `t_system_log` VALUES (434, 1, '[127.0.0.1在2023年05月03日 17时48分25秒操作了com.jd.controller.ProductController的addOrUpdate方法]', '2023-05-03 17:48:26');
INSERT INTO `t_system_log` VALUES (435, 1, '[127.0.0.1在2023年05月03日 17时48分25秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:48:26');
INSERT INTO `t_system_log` VALUES (436, 1, '[127.0.0.1在2023年05月03日 17时48分40秒操作了com.jd.controller.ProductController的del方法]', '2023-05-03 17:48:41');
INSERT INTO `t_system_log` VALUES (437, 1, '[127.0.0.1在2023年05月03日 17时48分40秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 17:48:41');
INSERT INTO `t_system_log` VALUES (438, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时09分58秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:09:58');
INSERT INTO `t_system_log` VALUES (439, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时10分01秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:10:02');
INSERT INTO `t_system_log` VALUES (440, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时10分14秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:10:14');
INSERT INTO `t_system_log` VALUES (441, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时10分18秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:10:18');
INSERT INTO `t_system_log` VALUES (442, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时12分03秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:12:04');
INSERT INTO `t_system_log` VALUES (443, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时12分07秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:12:07');
INSERT INTO `t_system_log` VALUES (444, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时12分10秒操作了com.jd.controller.ProductController的addOrUpdate方法]', '2023-05-03 18:12:10');
INSERT INTO `t_system_log` VALUES (445, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时12分10秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:12:10');
INSERT INTO `t_system_log` VALUES (446, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时12分14秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:12:14');
INSERT INTO `t_system_log` VALUES (447, 1, '[127.0.0.1在2023年05月03日 18时13分34秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:13:34');
INSERT INTO `t_system_log` VALUES (448, 1, '[127.0.0.1在2023年05月03日 18时13分36秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:13:36');
INSERT INTO `t_system_log` VALUES (449, 1, '[127.0.0.1在2023年05月03日 18时13分39秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:13:40');
INSERT INTO `t_system_log` VALUES (450, 1, '[127.0.0.1在2023年05月03日 18时15分39秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:15:40');
INSERT INTO `t_system_log` VALUES (451, 1, '[127.0.0.1在2023年05月03日 18时17分05秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:17:05');
INSERT INTO `t_system_log` VALUES (452, 1, '[127.0.0.1在2023年05月03日 18时17分06秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:17:07');
INSERT INTO `t_system_log` VALUES (453, 1, '[127.0.0.1在2023年05月03日 18时17分16秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:17:17');
INSERT INTO `t_system_log` VALUES (454, 1, '[127.0.0.1在2023年05月03日 18时17分20秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:17:21');
INSERT INTO `t_system_log` VALUES (455, 1, '[127.0.0.1在2023年05月03日 18时17分27秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:17:28');
INSERT INTO `t_system_log` VALUES (456, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时23分23秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:23:23');
INSERT INTO `t_system_log` VALUES (457, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时23分25秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:23:25');
INSERT INTO `t_system_log` VALUES (458, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时24分40秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:24:41');
INSERT INTO `t_system_log` VALUES (459, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时24分42秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:24:42');
INSERT INTO `t_system_log` VALUES (460, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时24分46秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:24:46');
INSERT INTO `t_system_log` VALUES (461, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时27分48秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:27:49');
INSERT INTO `t_system_log` VALUES (462, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时27分51秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:27:51');
INSERT INTO `t_system_log` VALUES (463, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时28分01秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:28:01');
INSERT INTO `t_system_log` VALUES (464, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时28分04秒操作了com.jd.controller.CategoryController的del方法]', '2023-05-03 18:28:04');
INSERT INTO `t_system_log` VALUES (465, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时28分04秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:28:04');
INSERT INTO `t_system_log` VALUES (466, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时28分07秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:28:08');
INSERT INTO `t_system_log` VALUES (467, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时28分14秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:28:15');
INSERT INTO `t_system_log` VALUES (468, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时31分05秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:31:06');
INSERT INTO `t_system_log` VALUES (469, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时31分07秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 18:31:08');
INSERT INTO `t_system_log` VALUES (470, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时31分11秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 18:31:12');
INSERT INTO `t_system_log` VALUES (471, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时31分13秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 18:31:13');
INSERT INTO `t_system_log` VALUES (472, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时36分16秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:36:16');
INSERT INTO `t_system_log` VALUES (473, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时36分18秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:36:18');
INSERT INTO `t_system_log` VALUES (474, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时36分22秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:36:23');
INSERT INTO `t_system_log` VALUES (475, 1, '[127.0.0.1在2023年05月03日 18时36分59秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:36:59');
INSERT INTO `t_system_log` VALUES (476, 1, '[127.0.0.1在2023年05月03日 18时37分00秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:00');
INSERT INTO `t_system_log` VALUES (477, 1, '[127.0.0.1在2023年05月03日 18时37分03秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:04');
INSERT INTO `t_system_log` VALUES (478, 1, '[127.0.0.1在2023年05月03日 18时37分08秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:08');
INSERT INTO `t_system_log` VALUES (479, 1, '[127.0.0.1在2023年05月03日 18时37分11秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:12');
INSERT INTO `t_system_log` VALUES (480, 1, '[127.0.0.1在2023年05月03日 18时37分13秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:14');
INSERT INTO `t_system_log` VALUES (481, 1, '[127.0.0.1在2023年05月03日 18时37分16秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:16');
INSERT INTO `t_system_log` VALUES (482, 1, '[127.0.0.1在2023年05月03日 18时37分19秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:19');
INSERT INTO `t_system_log` VALUES (483, 1, '[127.0.0.1在2023年05月03日 18时37分21秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:22');
INSERT INTO `t_system_log` VALUES (484, 1, '[127.0.0.1在2023年05月03日 18时37分24秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:24');
INSERT INTO `t_system_log` VALUES (485, 1, '[127.0.0.1在2023年05月03日 18时37分26秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:37:26');
INSERT INTO `t_system_log` VALUES (486, 1, '[127.0.0.1在2023年05月03日 18时42分00秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:42:01');
INSERT INTO `t_system_log` VALUES (487, 1, '[127.0.0.1在2023年05月03日 18时42分02秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:42:02');
INSERT INTO `t_system_log` VALUES (488, 1, '[127.0.0.1在2023年05月03日 18时42分13秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:42:14');
INSERT INTO `t_system_log` VALUES (489, 1, '[127.0.0.1在2023年05月03日 18时42分18秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:42:18');
INSERT INTO `t_system_log` VALUES (490, 1, '[127.0.0.1在2023年05月03日 18时48分13秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:48:14');
INSERT INTO `t_system_log` VALUES (491, 1, '[127.0.0.1在2023年05月03日 18时48分15秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:48:15');
INSERT INTO `t_system_log` VALUES (492, 1, '[127.0.0.1在2023年05月03日 18时48分20秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:48:21');
INSERT INTO `t_system_log` VALUES (493, 1, '[127.0.0.1在2023年05月03日 18时49分39秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:49:40');
INSERT INTO `t_system_log` VALUES (494, 1, '[127.0.0.1在2023年05月03日 18时49分45秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:49:46');
INSERT INTO `t_system_log` VALUES (495, 1, '[127.0.0.1在2023年05月03日 18时49分46秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:49:47');
INSERT INTO `t_system_log` VALUES (496, 1, '[127.0.0.1在2023年05月03日 18时50分13秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:50:13');
INSERT INTO `t_system_log` VALUES (497, 1, '[127.0.0.1在2023年05月03日 18时50分13秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:50:14');
INSERT INTO `t_system_log` VALUES (498, 1, '[127.0.0.1在2023年05月03日 18时50分34秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:50:35');
INSERT INTO `t_system_log` VALUES (499, 1, '[127.0.0.1在2023年05月03日 18时51分30秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:51:31');
INSERT INTO `t_system_log` VALUES (500, 1, '[127.0.0.1在2023年05月03日 18时51分32秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:51:33');
INSERT INTO `t_system_log` VALUES (501, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时52分42秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:52:43');
INSERT INTO `t_system_log` VALUES (502, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时52分44秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:52:44');
INSERT INTO `t_system_log` VALUES (503, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时53分57秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 18:53:58');
INSERT INTO `t_system_log` VALUES (504, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时54分00秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:54:01');
INSERT INTO `t_system_log` VALUES (505, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时54分02秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:54:02');
INSERT INTO `t_system_log` VALUES (506, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时54分08秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:54:09');
INSERT INTO `t_system_log` VALUES (507, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时55分05秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:55:05');
INSERT INTO `t_system_log` VALUES (508, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时55分07秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:55:07');
INSERT INTO `t_system_log` VALUES (509, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时58分27秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:58:27');
INSERT INTO `t_system_log` VALUES (510, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时58分30秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:58:30');
INSERT INTO `t_system_log` VALUES (511, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时58分34秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 18:58:34');
INSERT INTO `t_system_log` VALUES (512, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时59分58秒操作了com.jd.controller.ProductController的addOrUpdate方法]', '2023-05-03 18:59:58');
INSERT INTO `t_system_log` VALUES (513, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 18时59分58秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 18:59:58');
INSERT INTO `t_system_log` VALUES (514, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时00分00秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:00:01');
INSERT INTO `t_system_log` VALUES (515, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时00分17秒操作了com.jd.controller.ProductController的addOrUpdate方法]', '2023-05-03 19:00:18');
INSERT INTO `t_system_log` VALUES (516, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时00分17秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:00:18');
INSERT INTO `t_system_log` VALUES (517, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时01分39秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:01:39');
INSERT INTO `t_system_log` VALUES (518, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时02分08秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:02:09');
INSERT INTO `t_system_log` VALUES (519, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时02分47秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:02:48');
INSERT INTO `t_system_log` VALUES (520, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时02分54秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:02:55');
INSERT INTO `t_system_log` VALUES (521, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时03分36秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:03:37');
INSERT INTO `t_system_log` VALUES (522, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时03分57秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:03:58');
INSERT INTO `t_system_log` VALUES (523, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时03分58秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:03:59');
INSERT INTO `t_system_log` VALUES (524, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分02秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:04:03');
INSERT INTO `t_system_log` VALUES (525, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分05秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:04:05');
INSERT INTO `t_system_log` VALUES (526, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分30秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:04:30');
INSERT INTO `t_system_log` VALUES (527, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分31秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:04:31');
INSERT INTO `t_system_log` VALUES (528, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分31秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:04:32');
INSERT INTO `t_system_log` VALUES (529, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分33秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:04:34');
INSERT INTO `t_system_log` VALUES (530, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时04分38秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:04:38');
INSERT INTO `t_system_log` VALUES (531, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分08秒操作了com.jd.controller.SystemLogController的list方法]', '2023-05-03 19:12:09');
INSERT INTO `t_system_log` VALUES (532, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分11秒操作了com.jd.controller.SupplierController的list方法]', '2023-05-03 19:12:11');
INSERT INTO `t_system_log` VALUES (533, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分11秒操作了com.jd.controller.CustomerController的list方法]', '2023-05-03 19:12:12');
INSERT INTO `t_system_log` VALUES (534, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分13秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-03 19:12:13');
INSERT INTO `t_system_log` VALUES (535, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分43秒操作了com.jd.controller.SystemController的changePassword方法]', '2023-05-03 19:12:44');
INSERT INTO `t_system_log` VALUES (536, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分45秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 19:12:45');
INSERT INTO `t_system_log` VALUES (537, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分47秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:12:47');
INSERT INTO `t_system_log` VALUES (538, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分48秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 19:12:48');
INSERT INTO `t_system_log` VALUES (539, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分49秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:12:50');
INSERT INTO `t_system_log` VALUES (540, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分53秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 19:12:53');
INSERT INTO `t_system_log` VALUES (541, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分55秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 19:12:55');
INSERT INTO `t_system_log` VALUES (542, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时12分58秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 19:12:59');
INSERT INTO `t_system_log` VALUES (543, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时13分08秒操作了com.jd.controller.ProductController的query方法]', '2023-05-03 19:13:08');
INSERT INTO `t_system_log` VALUES (544, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时13分10秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 19:13:10');
INSERT INTO `t_system_log` VALUES (545, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时13分11秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:13:12');
INSERT INTO `t_system_log` VALUES (546, 1, '[0:0:0:0:0:0:0:1在2023年05月03日 19时13分14秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:13:14');
INSERT INTO `t_system_log` VALUES (547, 1, '[127.0.0.1在2023年05月03日 19时29分26秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:29:27');
INSERT INTO `t_system_log` VALUES (548, 1, '[127.0.0.1在2023年05月03日 19时29分28秒操作了com.jd.controller.ProductController的view方法]', '2023-05-03 19:29:28');
INSERT INTO `t_system_log` VALUES (549, 1, '[127.0.0.1在2023年05月03日 19时29分29秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:29:30');
INSERT INTO `t_system_log` VALUES (550, 1, '[127.0.0.1在2023年05月03日 19时29分31秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:29:32');
INSERT INTO `t_system_log` VALUES (551, 1, '[127.0.0.1在2023年05月03日 19时29分40秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:29:41');
INSERT INTO `t_system_log` VALUES (552, 1, '[127.0.0.1在2023年05月03日 19时32分13秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:32:13');
INSERT INTO `t_system_log` VALUES (553, 1, '[127.0.0.1在2023年05月03日 19时32分15秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:32:16');
INSERT INTO `t_system_log` VALUES (554, 1, '[127.0.0.1在2023年05月03日 19时32分19秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:32:19');
INSERT INTO `t_system_log` VALUES (555, 1, '[127.0.0.1在2023年05月03日 19时33分33秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:33:34');
INSERT INTO `t_system_log` VALUES (556, 1, '[127.0.0.1在2023年05月03日 19时33分38秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:33:38');
INSERT INTO `t_system_log` VALUES (557, 1, '[127.0.0.1在2023年05月03日 19时35分33秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:35:34');
INSERT INTO `t_system_log` VALUES (558, 1, '[127.0.0.1在2023年05月03日 19时35分36秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:35:36');
INSERT INTO `t_system_log` VALUES (559, 1, '[127.0.0.1在2023年05月03日 19时35分40秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:35:40');
INSERT INTO `t_system_log` VALUES (560, 1, '[127.0.0.1在2023年05月03日 19时36分19秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:36:20');
INSERT INTO `t_system_log` VALUES (561, 1, '[127.0.0.1在2023年05月03日 19时36分21秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:36:21');
INSERT INTO `t_system_log` VALUES (562, 1, '[127.0.0.1在2023年05月03日 19时41分22秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:41:22');
INSERT INTO `t_system_log` VALUES (563, 1, '[127.0.0.1在2023年05月03日 19时42分28秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:42:29');
INSERT INTO `t_system_log` VALUES (564, 1, '[127.0.0.1在2023年05月03日 19时42分30秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 19:42:30');
INSERT INTO `t_system_log` VALUES (565, 1, '[127.0.0.1在2023年05月03日 19时42分32秒操作了com.jd.controller.CategoryController的view方法]', '2023-05-03 19:42:32');
INSERT INTO `t_system_log` VALUES (566, 1, '[127.0.0.1在2023年05月03日 19时42分33秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-03 19:42:33');
INSERT INTO `t_system_log` VALUES (567, 1, '[127.0.0.1在2023年05月03日 19时42分34秒操作了com.jd.controller.CategoryController的toUpdate方法]', '2023-05-03 19:42:34');
INSERT INTO `t_system_log` VALUES (568, 1, '[127.0.0.1在2023年05月03日 19时42分42秒操作了com.jd.controller.CategoryController的query方法]', '2023-05-03 19:42:42');
INSERT INTO `t_system_log` VALUES (569, 1, '[127.0.0.1在2023年05月03日 19时42分43秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:42:44');
INSERT INTO `t_system_log` VALUES (570, 1, '[127.0.0.1在2023年05月03日 19时42分46秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:42:46');
INSERT INTO `t_system_log` VALUES (571, 1, '[127.0.0.1在2023年05月03日 19时46分16秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:46:17');
INSERT INTO `t_system_log` VALUES (572, 1, '[127.0.0.1在2023年05月03日 19时46分19秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:46:19');
INSERT INTO `t_system_log` VALUES (573, 1, '[127.0.0.1在2023年05月03日 19时57分22秒操作了com.jd.controller.ProductController的list方法]', '2023-05-03 19:57:23');
INSERT INTO `t_system_log` VALUES (574, 1, '[127.0.0.1在2023年05月03日 19时57分25秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-03 19:57:25');
INSERT INTO `t_system_log` VALUES (575, 1, '[127.0.0.1在2023年05月04日 08时44分57秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 08:44:58');
INSERT INTO `t_system_log` VALUES (576, 1, '[127.0.0.1在2023年05月04日 08时44分59秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:44:59');
INSERT INTO `t_system_log` VALUES (577, 1, '[127.0.0.1在2023年05月04日 08时45分15秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:45:15');
INSERT INTO `t_system_log` VALUES (578, 1, '[127.0.0.1在2023年05月04日 08时45分22秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:45:23');
INSERT INTO `t_system_log` VALUES (579, 1, '[127.0.0.1在2023年05月04日 08时48分26秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:48:26');
INSERT INTO `t_system_log` VALUES (580, 1, '[127.0.0.1在2023年05月04日 08时48分31秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:48:32');
INSERT INTO `t_system_log` VALUES (581, 1, '[127.0.0.1在2023年05月04日 08时50分30秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 08:50:30');
INSERT INTO `t_system_log` VALUES (582, 1, '[127.0.0.1在2023年05月04日 08时50分33秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:50:33');
INSERT INTO `t_system_log` VALUES (583, 1, '[127.0.0.1在2023年05月04日 08时50分39秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:50:40');
INSERT INTO `t_system_log` VALUES (584, 1, '[127.0.0.1在2023年05月04日 08时50分42秒操作了com.jd.controller.ProductController的query方法]', '2023-05-04 08:50:43');
INSERT INTO `t_system_log` VALUES (585, 1, '[127.0.0.1在2023年05月04日 08时50分44秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 08:50:44');
INSERT INTO `t_system_log` VALUES (586, 1, '[127.0.0.1在2023年05月04日 09时31分14秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 09:31:14');
INSERT INTO `t_system_log` VALUES (587, 1, '[127.0.0.1在2023年05月04日 09时31分17秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 09:31:17');
INSERT INTO `t_system_log` VALUES (588, 1, '[127.0.0.1在2023年05月04日 09时33分51秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 09:33:52');
INSERT INTO `t_system_log` VALUES (589, 1, '[127.0.0.1在2023年05月04日 09时33分56秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 09:33:56');
INSERT INTO `t_system_log` VALUES (590, 1, '[127.0.0.1在2023年05月04日 09时34分30秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 09:34:31');
INSERT INTO `t_system_log` VALUES (591, 1, '[127.0.0.1在2023年05月04日 09时34分34秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 09:34:34');
INSERT INTO `t_system_log` VALUES (592, 1, '[127.0.0.1在2023年05月04日 09时34分41秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 09:34:42');
INSERT INTO `t_system_log` VALUES (593, 1, '[127.0.0.1在2023年05月04日 19时54分40秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 19:54:41');
INSERT INTO `t_system_log` VALUES (594, 1, '[127.0.0.1在2023年05月04日 19时54分42秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 19:54:43');
INSERT INTO `t_system_log` VALUES (595, 1, '[127.0.0.1在2023年05月04日 19时56分31秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 19:56:31');
INSERT INTO `t_system_log` VALUES (596, 1, '[127.0.0.1在2023年05月04日 20时01分23秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:01:24');
INSERT INTO `t_system_log` VALUES (597, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时01分25秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:01:25');
INSERT INTO `t_system_log` VALUES (598, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时20分41秒操作了com.jd.controller.CategoryController的list方法]', '2023-05-04 20:20:41');
INSERT INTO `t_system_log` VALUES (599, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时20分41秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:20:42');
INSERT INTO `t_system_log` VALUES (600, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时20分43秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:20:43');
INSERT INTO `t_system_log` VALUES (601, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时20分46秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:20:47');
INSERT INTO `t_system_log` VALUES (602, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时22分20秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:22:21');
INSERT INTO `t_system_log` VALUES (603, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时22分23秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:22:23');
INSERT INTO `t_system_log` VALUES (604, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时24分09秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:24:10');
INSERT INTO `t_system_log` VALUES (605, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时25分33秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:25:33');
INSERT INTO `t_system_log` VALUES (606, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时30分52秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:30:53');
INSERT INTO `t_system_log` VALUES (607, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时34分44秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:34:44');
INSERT INTO `t_system_log` VALUES (608, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时34分48秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:34:48');
INSERT INTO `t_system_log` VALUES (609, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时35分25秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:35:26');
INSERT INTO `t_system_log` VALUES (610, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时35分29秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:35:29');
INSERT INTO `t_system_log` VALUES (611, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时36分19秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:36:20');
INSERT INTO `t_system_log` VALUES (612, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时36分22秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:36:22');
INSERT INTO `t_system_log` VALUES (613, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时37分39秒操作了com.jd.controller.ProductController的list方法]', '2023-05-04 20:37:39');
INSERT INTO `t_system_log` VALUES (614, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时37分41秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:37:42');
INSERT INTO `t_system_log` VALUES (615, 1, '[0:0:0:0:0:0:0:1在2023年05月04日 20时38分06秒操作了com.jd.controller.ProductController的toUpdate方法]', '2023-05-04 20:38:06');

SET FOREIGN_KEY_CHECKS = 1;
