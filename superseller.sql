/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : superseller

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 23/09/2019 10:40:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for super_admin
-- ----------------------------
DROP TABLE IF EXISTS `super_admin`;
CREATE TABLE `super_admin`  (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `ad_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号',
  `ad_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `ad_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工真实姓名',
  `ad_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员邮箱，用于登录',
  `ad_branch` int(10) NULL DEFAULT NULL COMMENT '归属站点，对应站点id',
  `ad_p_id` int(11) NULL DEFAULT NULL COMMENT '管理员省份id',
  `ad_c_id` int(11) NULL DEFAULT NULL COMMENT '管理员城市id',
  `ad_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员手机号，用于登录',
  `ad_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员QQ号码',
  `ad_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生年月日',
  `ad_sex` tinyint(2) NULL DEFAULT 3 COMMENT '性别；1 男；2 女； 3 未知',
  `ad_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员图像',
  `ad_createtime` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `ad_isable` tinyint(2) NULL DEFAULT NULL COMMENT '是否在职 1 在职；2 离职',
  `ad_role` int(11) NULL DEFAULT NULL COMMENT '权限，对应权限的id',
  `ad_admin` int(255) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  PRIMARY KEY (`ad_id`, `ad_phone`, `ad_bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_admin
-- ----------------------------
INSERT INTO `super_admin` VALUES (1, '201806010001', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1549089944@qq.com', 22, 1, 3, '17691074991', '31123123', '2010-05-18', 1, '/uploads/20180519/9c478cec4a8460e814d8b2a20bb94ae5.jpg', 1525592904, 1, 1, 1);

-- ----------------------------
-- Table structure for super_advert
-- ----------------------------
DROP TABLE IF EXISTS `super_advert`;
CREATE TABLE `super_advert`  (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告表ID',
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `ad_type` tinyint(1) NULL DEFAULT NULL COMMENT '广告类型',
  `ad_order` tinyint(2) NULL DEFAULT NULL COMMENT '广告排序',
  `ad_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '广告跳转链接',
  `ad_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '广告图片',
  `ad_click` int(11) NULL DEFAULT NULL COMMENT '点击次数',
  `ad_status` tinyint(1) NULL DEFAULT NULL COMMENT '显示状态',
  `ad_create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `ad_update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_advert
-- ----------------------------
INSERT INTO `super_advert` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for super_advert_type
-- ----------------------------
DROP TABLE IF EXISTS `super_advert_type`;
CREATE TABLE `super_advert_type`  (
  `adt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告类型ID',
  `adt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `adt_type` tinyint(1) NULL DEFAULT NULL COMMENT '类型',
  `adt_order` tinyint(2) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`adt_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_alisign
-- ----------------------------
DROP TABLE IF EXISTS `super_alisign`;
CREATE TABLE `super_alisign`  (
  `ali_sign_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '阿里短信签名id',
  `ali_sign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里短信签名名称',
  `ali_sign_remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述说明',
  `ali_sign_addtime` int(11) NULL DEFAULT NULL COMMENT '签名添加时间',
  `ali_sign_admin` int(10) NULL DEFAULT NULL COMMENT '添加人',
  `ali_sign_able` tinyint(2) NULL DEFAULT NULL COMMENT '是否可用 1 是  2  否',
  PRIMARY KEY (`ali_sign_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阿里云短信签名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_area
-- ----------------------------
DROP TABLE IF EXISTS `super_area`;
CREATE TABLE `super_area`  (
  `area_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '县区表自增id',
  `area_p_id` int(10) NULL DEFAULT NULL,
  `area_c_id` int(10) NULL DEFAULT NULL,
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_isable` tinyint(2) NULL DEFAULT NULL,
  `area_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成房源编号用的区域编码',
  `area_addtime` int(11) NULL DEFAULT NULL COMMENT '添加操作时间',
  `area_admin` int(11) NULL DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_area
-- ----------------------------
INSERT INTO `super_area` VALUES (3, 1, 3, '未央区', NULL, '11', 1541389158, 1);
INSERT INTO `super_area` VALUES (4, 1, 3, '新城区', NULL, '15', 1541389212, 1);
INSERT INTO `super_area` VALUES (5, 1, 3, '碑林区', NULL, '10', 1541389150, 1);
INSERT INTO `super_area` VALUES (6, 1, 3, '莲湖区', NULL, '14', 1541389202, 1);
INSERT INTO `super_area` VALUES (7, 1, 3, '雁塔区', NULL, '16', 1541389219, 1);
INSERT INTO `super_area` VALUES (8, 1, 3, '灞桥区', NULL, '13', 1541389170, 1);
INSERT INTO `super_area` VALUES (10, 4, 55, '青羊区', NULL, '21', 1541389227, 1);
INSERT INTO `super_area` VALUES (11, 1, 3, '长安区', NULL, '12', 1541389164, 1);
INSERT INTO `super_area` VALUES (12, 4, 55, '武侯区', NULL, '55', 1541389329, 1);

-- ----------------------------
-- Table structure for super_article
-- ----------------------------
DROP TABLE IF EXISTS `super_article`;
CREATE TABLE `super_article`  (
  `art_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `art_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章编号。系统还是能成的编号，规则同客户编号生成规则',
  `art_p_id` int(10) NULL DEFAULT NULL COMMENT '文章省份',
  `art_c_id` int(10) NULL DEFAULT NULL COMMENT '文章城市',
  `art_b_id` int(10) NULL DEFAULT NULL COMMENT '文章站点',
  `art_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词 同seo关键词',
  `art_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题 同seo标题',
  `art_subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章子标题 同seo 描述',
  `art_type` tinyint(2) NULL DEFAULT NULL COMMENT '文章分类：1.房租优势；2精彩瞬间，3企业优势，4.小屋快讯，5.装修风格',
  `art_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章封面图',
  `art_img_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图alt',
  `art_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `art_createtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `art_updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `art_view` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `art_isable` tinyint(2) NULL DEFAULT 1 COMMENT '是否显示，1是，2否',
  `art_istop` tinyint(2) NULL DEFAULT 2 COMMENT '是否置顶，1是，2否',
  `art_admin` int(10) NULL DEFAULT NULL COMMENT '发布人，对应管理员的id',
  `art_via` tinyint(2) NULL DEFAULT NULL COMMENT '文章来源：1，站内文章；2.微信推文',
  PRIMARY KEY (`art_id`, `art_bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_banner
-- ----------------------------
DROP TABLE IF EXISTS `super_banner`;
CREATE TABLE `super_banner`  (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'banner轮播ID',
  `ba_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'banner编号',
  `ba_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'banner主题',
  `ba_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'banner 图片路径',
  `ba_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'banner图片alt',
  `ba_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'banner图跳转路径',
  `ba_p_id` int(11) NULL DEFAULT NULL COMMENT '显示省份',
  `ba_c_id` int(11) NULL DEFAULT NULL COMMENT '显示城市',
  `ba_branch` int(11) NULL DEFAULT 1 COMMENT '显示站点；分站的id',
  `ba_createtime` int(11) NULL DEFAULT NULL COMMENT 'banner 添加时间',
  `ba_updatetime` int(11) NULL DEFAULT NULL COMMENT 'banner 修改更新时间',
  `ba_via` tinyint(2) NULL DEFAULT NULL COMMENT '显示端：1 PC端； 2 移动端;',
  `ba_order` tinyint(4) NULL DEFAULT 1 COMMENT 'banner图排序',
  `ba_isable` tinyint(2) NULL DEFAULT 1 COMMENT '是否显示：1 显示：2隐藏',
  `ba_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  `ba_type` tinyint(2) NULL DEFAULT NULL COMMENT 'banner类型1 首页banner，2 广告',
  PRIMARY KEY (`ba_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_banner
-- ----------------------------
INSERT INTO `super_banner` VALUES (88, '201909090001', '99聚划算', '/uploads/banner/20190909/f669d4c860dfc946031d5321930fc529.png', '聚划算，赶紧买买买', '', NULL, NULL, 1, 1568011700, NULL, NULL, 1, 1, 1, 1);
INSERT INTO `super_banner` VALUES (89, '201909090002', '早秋穿搭时尚1', '/uploads/banner/20190909/e92d2d80a7eae47d42c6526f0475b91f.png', '时尚穿搭，做这条街最靓的仔！1', '', NULL, NULL, 1, 1568011878, NULL, NULL, 2, 1, 1, 1);

-- ----------------------------
-- Table structure for super_branch
-- ----------------------------
DROP TABLE IF EXISTS `super_branch`;
CREATE TABLE `super_branch`  (
  `b_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `b_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点编号',
  `b_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `b_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点logo',
  `b_logo_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片alt',
  `b_prex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该分站的首页链接',
  `b_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点电话（装修咨询）',
  `b_weichat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信二维码',
  `b_weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微博二维码',
  `b_city` int(10) NULL DEFAULT NULL COMMENT '城市id',
  `b_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点地址',
  `b_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点地理坐标',
  `b_record` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点备案号',
  `b_codecount` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '统计代码',
  `b_thridcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服代码',
  `b_othercode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他代码',
  `b_serviceurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服链接',
  `b_createtime` int(11) NULL DEFAULT NULL COMMENT '站点开通时间',
  `b_adminphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点管理员手机号(接受预约短信)',
  `b_isopen` tinyint(2) NULL DEFAULT NULL COMMENT '是否开通：1.是：2 否',
  `b_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  `b_sign` int(10) NULL DEFAULT NULL COMMENT '站点签名',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_case
-- ----------------------------
DROP TABLE IF EXISTS `super_case`;
CREATE TABLE `super_case`  (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '案例id',
  `case_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案例编号。系统自动生成的编号，规则同客户编号生成规则',
  `case_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案例名称',
  `case_style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案例风格',
  `case_p_id` int(10) NULL DEFAULT NULL COMMENT '省份id',
  `case_c_id` int(10) NULL DEFAULT NULL COMMENT '城市id',
  `case_b_id` int(11) NULL DEFAULT NULL COMMENT '分站id',
  `case_price` int(10) NULL DEFAULT NULL COMMENT '案例造价（单位：万元）',
  `case_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案例户型',
  `case_type_iamge` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '户型图',
  `case_type_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户型图alt',
  `case_type_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '户型标题',
  `case_type_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '户型描述',
  `case_bulid` int(11) NULL DEFAULT NULL COMMENT '楼盘id 对应楼盘表（小区）',
  `case_decotime` int(11) NULL DEFAULT NULL COMMENT '案例发布日期',
  `case_updatetime` int(11) NULL DEFAULT NULL COMMENT '案例更新日期',
  `case_view` int(10) NULL DEFAULT 0 COMMENT '浏览量',
  `case_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '案例全景URL',
  `case_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片,多张图用‘，’分割',
  `case_img_alt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '案例图片alt,个数同图片数量，多个用“，”隔开',
  `case_img_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '案例图片描述，个数同图片数量，多个用“，”隔开',
  `case_img_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片的描述，个数同图片，多个用“，”分割',
  `case_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '面积',
  `case_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案例简介',
  `case_designer` int(11) NULL DEFAULT NULL COMMENT '案例设计师id对应设计师表id',
  `case_seo_tilte` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo标题',
  `case_seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo关键词',
  `case_seo_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo描述',
  `case_istop` tinyint(4) NULL DEFAULT 2 COMMENT '置顶: 1 是；2否',
  `case_isable` tinyint(2) NULL DEFAULT 1 COMMENT '是否显示：1，显示；2，隐藏',
  `case_admin` int(10) NULL DEFAULT NULL COMMENT '案例发布人，对应管理员的id',
  `case_order_num` int(10) NULL DEFAULT 0 COMMENT '案例预约数量',
  `case_sort` tinyint(2) NULL DEFAULT NULL COMMENT '案例类型：1 正常案例；2，产品效果',
  PRIMARY KEY (`case_id`, `case_bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装修案例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_city
-- ----------------------------
DROP TABLE IF EXISTS `super_city`;
CREATE TABLE `super_city`  (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `p_id` int(10) NULL DEFAULT NULL COMMENT '省份id对应省份表的id',
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `c_q_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装修品质，对应品质id，多个id用\'，\'隔开',
  `c_q_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品质单价，与装修id对应，多个用‘，’隔开',
  `c_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `c_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成房源编号用的城市编码',
  `c_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_city
-- ----------------------------
INSERT INTO `super_city` VALUES (3, 1, '西安', '36,39,40', '', 1541389115, '10', 1);
INSERT INTO `super_city` VALUES (56, 5, '重庆', '', '', 1541389132, '10', 1);
INSERT INTO `super_city` VALUES (55, 4, '成都', '', '', 1541389121, '11', 1);

-- ----------------------------
-- Table structure for super_collect
-- ----------------------------
DROP TABLE IF EXISTS `super_collect`;
CREATE TABLE `super_collect`  (
  `cl_id` int(11) NOT NULL COMMENT '用户收藏表ID',
  `cl_good_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `cl_m_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `cl_create_time` int(11) NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`cl_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for super_comment
-- ----------------------------
DROP TABLE IF EXISTS `super_comment`;
CREATE TABLE `super_comment`  (
  `cm_id` int(11) NOT NULL COMMENT '评论表ID',
  `cm_parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `cm_goods_id` int(11) NULL DEFAULT NULL COMMENT '评论商品ID',
  `cm_member_id` int(11) NULL DEFAULT NULL COMMENT '评论用户ID',
  `cm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `cm_is_img` tinyint(1) NULL DEFAULT NULL COMMENT '是否图片评论',
  `cm_stars` tinyint(1) NULL DEFAULT NULL COMMENT '评论星级',
  `cm_status` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态:1正常显示，2隐藏或删除',
  `cm_create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `cm_update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cm_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_coupon
-- ----------------------------
DROP TABLE IF EXISTS `super_coupon`;
CREATE TABLE `super_coupon`  (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投放城市,存储城市id，多个id用‘，’隔开',
  `cp_bid` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券系统id',
  `cp_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券名称',
  `cp_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券金额',
  `cp_amount` int(10) NULL DEFAULT NULL COMMENT '优惠券发放数量',
  `cp_srtarttime` int(11) NULL DEFAULT NULL COMMENT '优惠券使用日期',
  `cp_deadline` int(11) NULL DEFAULT NULL COMMENT '优惠券截止日期',
  `cp_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券图片',
  `cp_citys` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投放城市,存储城市id，多个id用‘，’隔开,默认全站投放',
  `cp_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券详细信息',
  `cp_isable` tinyint(2) NULL DEFAULT NULL COMMENT '是否可用',
  `cp_addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `cp_admin` int(10) NULL DEFAULT NULL COMMENT '添加管理员',
  PRIMARY KEY (`cp_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_coupon
-- ----------------------------
INSERT INTO `super_coupon` VALUES (1, '201809300001', '区位', 123.00, NULL, NULL, 1538582400, NULL, NULL, '123123123', 1, 1538273773, 1);

-- ----------------------------
-- Table structure for super_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `super_coupon_log`;
CREATE TABLE `super_coupon_log`  (
  `cpl_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cpl_cp_id` int(10) NULL DEFAULT NULL COMMENT '优惠券id',
  `cpl_rent_id` int(10) NULL DEFAULT NULL COMMENT '租客会员id',
  `cpl_addtime` int(11) NULL DEFAULT NULL COMMENT '领券时间',
  `cpl_verify_time` int(11) NULL DEFAULT NULL COMMENT '优惠券使用时间',
  `cpl_status` tinyint(2) NULL DEFAULT NULL COMMENT '优惠券使用状态:1.已领取；2.已使用；3.已过期',
  PRIMARY KEY (`cpl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_customer
-- ----------------------------
DROP TABLE IF EXISTS `super_customer`;
CREATE TABLE `super_customer`  (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `cus_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户编号系统生成的编号，做客户唯一标识生成规则，如：“201804210001”,前面8位是年与日，后面4位1-9999；不够的用0补空位。',
  `cus_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信端客户id',
  `cus_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名字',
  `cus_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `cus_phone2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用联系方式',
  `cus_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户qq',
  `cus_sex` tinyint(2) NULL DEFAULT NULL COMMENT '性别：1 男； 2 女； 3 不明',
  `cus_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `cus_provid` int(10) NULL DEFAULT 0 COMMENT '省份id，对应省份表id',
  `cus_cityid` int(10) NULL DEFAULT NULL COMMENT '城市id，对应城市表id',
  `cus_areaid` int(10) NULL DEFAULT NULL COMMENT '站点id，对应分站id',
  `cus_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋面积',
  `cus_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋类型：1：新房；2：二手房',
  `cus_style` tinyint(4) NULL DEFAULT NULL COMMENT '装修风格对应 风格表ID',
  `cus_quality` tinyint(4) NULL DEFAULT NULL COMMENT '装修品质（档次）对应档次表ID',
  `cus_house_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋户型：如：两室一厅，存储文字；',
  `cus_build` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小区名称',
  `cus_addtime` int(11) NULL DEFAULT NULL COMMENT '预约时间',
  `cus_opeater` int(10) NULL DEFAULT NULL COMMENT '操作人id 对应登陆管理员id',
  `cus_isrent` tinyint(2) NULL DEFAULT 2 COMMENT '是否已租房子给我们；1.已经租给我们。2，未租；',
  PRIMARY KEY (`cus_id`, `cus_bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1036 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_goods
-- ----------------------------
DROP TABLE IF EXISTS `super_goods`;
CREATE TABLE `super_goods`  (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `goods_sort` int(11) NOT NULL COMMENT '商品分类(二级分类)',
  `goods_type` int(11) NOT NULL COMMENT '商品类型（一级分类）',
  `goods_price` decimal(10, 0) NOT NULL COMMENT '商品价格',
  `goods_dis_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  `goods_stock` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `goods_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品首图',
  `goods_img_more` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品多图(除过首图的顶部轮播图)',
  `goods_sales_num` int(11) NULL DEFAULT 0 COMMENT '销量',
  `goods_view` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `goods_top_time` int(11) NULL DEFAULT NULL COMMENT '置顶时间',
  `goods_top_flg` tinyint(1) NULL DEFAULT 2 COMMENT '是否置顶:1置顶；2正常',
  `goods_del_flg` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品状态：1.上架；2，下架，未上线，3删除',
  `goods_add_date` int(11) NOT NULL COMMENT '入库时间',
  `goods_change_date` int(11) NOT NULL COMMENT '修改时间',
  `goods_admin` int(11) NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of super_goods
-- ----------------------------
INSERT INTO `super_goods` VALUES (2, '创意情侣杯', 6, 0, 520, 250.00, 0, '/uploads/article/20190910/dc9e056b56b9ac907c8a4e4ea3159547.png', 'uploads/text/20190910\\2cf0de4810cb4320046e7fa24155f8ac.png,uploads/text/20190910\\1d3562739de9df5ac6e774a8888b8693.png,uploads/text/20190910\\54356b881804ca6a9db647d582ccb8d6.png', 0, 0, NULL, 2, 2, 1568106906, 1568106906, 1);
INSERT INTO `super_goods` VALUES (3, '金龙鱼菜籽油', 2, 0, 25, 19.00, 0, '/uploads/article/20190911/0f26b57e135964cba3253e2a2cbaca6a.png', 'uploads/text/20190911\\15dcf75b4763b63a461cf8e4c904f2c2.png,uploads/text/20190911\\df3d7e8de3daa80160d8655a7ecea978.png', 0, 0, NULL, 2, 2, 1568167430, 1568167430, 1);
INSERT INTO `super_goods` VALUES (4, '金龙鱼菜籽油', 2, 0, 25, 19.00, 0, '/uploads/article/20190911/0f26b57e135964cba3253e2a2cbaca6a.png', 'uploads/text/20190911\\15dcf75b4763b63a461cf8e4c904f2c2.png,uploads/text/20190911\\df3d7e8de3daa80160d8655a7ecea978.png', 0, 0, NULL, 2, 2, 1568167725, 1568167725, 1);
INSERT INTO `super_goods` VALUES (6, '中秋献礼', 5, 0, 123, 111.00, 0, '/uploads/article/20190911/a8c4a4c02d3d6ef6e04acd35e56b5325.png', 'uploads/text/20190911\\055db9636632550e31ecec1bdaa7e8d6.png,uploads/text/20190911\\e62af177668fcd317d5a6de62a75d2ba.png', 0, 0, NULL, 2, 3, 1568168133, 1568168133, 1);
INSERT INTO `super_goods` VALUES (7, '123', 2, 0, 123, 1231.00, 0, '/uploads/article/20190911/468ac723e58dc954502e5ccb4e7e28bf.png', '', 0, 0, NULL, 2, 2, 1568168325, 1568168325, 1);
INSERT INTO `super_goods` VALUES (8, '12312', 3, 0, 123, 123.00, 0, '/uploads/article/20190911/9fadb5b05421446dfc73b9df0d277ce8.png', 'uploads/text/20190911\\bf9960a0339d72f2f2e67027fb455792.png', 0, 0, NULL, 2, 2, 1568168588, 1568168588, 1);
INSERT INTO `super_goods` VALUES (9, '华盛顿好烦', 6, 0, 123, 123.00, 0, '/uploads/article/20190911/ee028d512577ca6c04abcf408c792ab1.png', 'uploads/text/20190911\\bfdbc8b37e0bc5e1be2f3c4a03cb86a8.png,uploads/text/20190911\\84f7c8fe2fcc5ee6d9455f9f340b5feb.png', 0, 0, NULL, 2, 2, 1568169155, 1568169155, 1);
INSERT INTO `super_goods` VALUES (11, '大豆玉米油', 5, 0, 123, 123.00, 0, '/uploads/article/20190911/a82d8e9ab99d79425df3ea8a6e424af6.png', 'uploads/text/20190911\\66fd22795b3846ba21dda7e75e780fce.png,uploads/text/20190911\\b3f2e05a249237bd9575988f01082904.png', 0, 0, NULL, 2, 2, 1568174131, 1568174131, 1);
INSERT INTO `super_goods` VALUES (12, '屋里屋外（WOLIWOWA） 陶瓷杯子 ', 5, 0, 40, 35.00, 0, '/uploads/article/20190911/bbeb3001fc6c1a6f61f8e572a5bd524b.png', 'uploads/text/20190912\\f407f054a20a197c9a3f183b7ed1613a.png,uploads/text/20190912\\6d5f985b1cad83be1aa00b6fa8d6080b.png', 0, 0, NULL, 1, 1, 1568186171, 1568186171, 1);
INSERT INTO `super_goods` VALUES (14, '陶瓷杯子 创意情侣水杯咖啡杯牛奶杯办公室杯', 8, 0, 68, 35.00, 0, '/uploads/article/20190911/f7ac61004132bdaee7140f3b40592fce.png', '', 0, 0, NULL, 1, 1, 1568188157, 1568188157, 1);
INSERT INTO `super_goods` VALUES (15, '123123', 8, 0, 123, 123.00, 0, '/uploads/article/20190911/4ec226ae503df6b70fa99308ac9c3c46.png', 'uploads/text/20190911\\9bf4915af3fdf6e9b0868b66d0040012.png,uploads/text/20190911\\13f541a5fde6ce2d6219797335f944ff.png', 0, 0, NULL, 2, 2, 1568188193, 1568188193, 1);
INSERT INTO `super_goods` VALUES (16, '情浓中秋，爱意满满', 8, 0, 120, 110.00, 0, '/uploads/article/20190911/0a6d0aed0b8097efcbba7903660ac2fc.png', 'uploads/text/20190911\\1730822f9034fd115a3e70d3bf659873.png,uploads/text/20190911\\28b733fadf4d6ad6572447a87b369d0c.png', 0, 0, NULL, 2, 2, 1568191971, 1568191971, 1);
INSERT INTO `super_goods` VALUES (17, '每逢佳节倍思亲', 2, 0, 1, 1.00, 0, '/uploads/article/20190911/5652db5a8f9683db21f95fb9dae3955c.png', 'uploads/text/20190911\\e81840fd73e9a9bbd47782a8182004f3.png,uploads/text/20190911\\868f923957b0f5885dda351ff452ef84.png', 0, 0, NULL, 2, 2, 1568192497, 1568192497, 1);
INSERT INTO `super_goods` VALUES (18, '岁月流觞123', 5, 0, 1123, 231.00, 0, '/uploads/article/20190911/eb8f349ad0d78495f4915a37b46c4ebc.png', '', 0, 0, NULL, 2, 2, 1568192958, 1568192958, 1);
INSERT INTO `super_goods` VALUES (19, '爱上对方感', 8, 0, 123, 123.00, 0, '/uploads/article/20190911/3535aa50b23f9b2a2b5a9e4d533c88ae.png', '', 0, 0, NULL, 2, 2, 1568196610, 1568196610, 1);
INSERT INTO `super_goods` VALUES (20, '9月12 西门', 8, 0, 123, 123.00, 0, '/uploads/article/20190912/c770fe15600404da3bf72cf8215922c6.png', 'uploads/text/20190912\\4ccadcddc60b3eb985b4821d4846fad2.png,uploads/text/20190912\\93f6eab33d91970a3d3d04fe1605b997.png', 0, 0, NULL, 1, 1, 1568252072, 1568252072, 1);
INSERT INTO `super_goods` VALUES (21, '哈哈哈哈', 5, 4, 123, 123.00, 0, '/uploads/article/20190912/d34d84d67c5321620bff16e7cc7dcf72.png', '', 0, 0, NULL, 2, 2, 1568275363, 1568275363, 1);
INSERT INTO `super_goods` VALUES (22, '中秋月饼', 2, 1, 1, 1.00, 0, '/uploads/article/20190912/bfdbfbdf24810245bb24a1875573b369.png', '', 0, 0, NULL, 2, 2, 1568276262, 1568276262, 1);
INSERT INTO `super_goods` VALUES (23, '透心凉，心飞扬', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/9735d3be0e4ac5b0d3625e637ad799a3.png', 'uploads/text/20190912\\2e20742faf9a80d8db1f04c501d9bbfe.png,uploads/text/20190912\\43b32b52e02eda0d461c960c83415b9f.png', 0, 0, NULL, 2, 1, 1568276572, 1568276572, 1);
INSERT INTO `super_goods` VALUES (24, '123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/4ced7fd7354f67288a0a42f455d22e4e.png', 'uploads/text/20190912\\83db8869508abf08f6222afc471e0e82.png,uploads/text/20190912\\cb11bf3e2dd258aebf2a6bc7d9ac58eb.png', 0, 0, NULL, 2, 1, 1568276643, 1568276643, 1);
INSERT INTO `super_goods` VALUES (25, '1123123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/39f0e11a984835168af96bf2321850c0.png', 'uploads/text/20190912\\cb27fd637338eae224e76bcb1cc6fce7.png,uploads/text/20190912\\0c73a347f0335b3d2d600760aa0bfbcf.png', 0, 0, NULL, 2, 1, 1568276683, 1568276683, 1);
INSERT INTO `super_goods` VALUES (26, '1123123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/39f0e11a984835168af96bf2321850c0.png', 'uploads/text/20190912\\cb27fd637338eae224e76bcb1cc6fce7.png,uploads/text/20190912\\0c73a347f0335b3d2d600760aa0bfbcf.png', 0, 0, NULL, 1, 1, 1568276686, 1568276686, 1);
INSERT INTO `super_goods` VALUES (27, '1123123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/39f0e11a984835168af96bf2321850c0.png', 'uploads/text/20190912\\cb27fd637338eae224e76bcb1cc6fce7.png,uploads/text/20190912\\0c73a347f0335b3d2d600760aa0bfbcf.png', 0, 0, NULL, 2, 1, 1568276686, 1568276686, 1);
INSERT INTO `super_goods` VALUES (28, '1123123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/39f0e11a984835168af96bf2321850c0.png', 'uploads/text/20190912\\cb27fd637338eae224e76bcb1cc6fce7.png,uploads/text/20190912\\0c73a347f0335b3d2d600760aa0bfbcf.png', 0, 0, NULL, 2, 1, 1568276686, 1568276686, 1);
INSERT INTO `super_goods` VALUES (29, '1123123', 8, 7, 1, 1.00, 0, '/uploads/article/20190912/39f0e11a984835168af96bf2321850c0.png', 'uploads/text/20190912\\cb27fd637338eae224e76bcb1cc6fce7.png,uploads/text/20190912\\0c73a347f0335b3d2d600760aa0bfbcf.png', 0, 0, NULL, 2, 1, 1568276687, 1568276687, 1);
INSERT INTO `super_goods` VALUES (30, '半城烟沙', 2, 1, 1, 1.00, 0, '/uploads/article/20190912/713badddf1d7f1253981ada274e77c61.png', 'uploads/text/20190912\\0f1acebb855d096e009cf8f211b0f2b0.png', 0, 0, NULL, 2, 2, 1568276784, 1568276784, 1);
INSERT INTO `super_goods` VALUES (31, '23234', 8, 7, 234, 234.00, 0, '/uploads/article/20190912/9e8be8d7ee521269febcb03fab9ea53d.png', 'uploads/text/20190912\\bcf4549daec70efa9b04fd96edc1af50.png,uploads/text/20190912\\088f8c69584b4e50a022987bd0738686.png', 0, 0, NULL, 2, 1, 1568280353, 1568280353, 1);
INSERT INTO `super_goods` VALUES (32, '23123', 8, 7, 123, 123.00, 0, '/uploads/article/20190916/192485256e0126e6ea2e6073567e541c.png', 'uploads/text/20190916\\178d40517d4bed14028f6bb0d844df57.png', 0, 0, NULL, 2, 2, 1568604192, 1568604192, 1);
INSERT INTO `super_goods` VALUES (33, '旺仔牛奶1', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (34, '旺仔牛奶2', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (35, '旺仔牛奶3', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (36, '旺仔牛奶4', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (37, '旺仔牛奶11', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (38, '旺仔牛奶12', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (39, '旺仔牛奶13', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (40, '旺仔牛奶14', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 2, 0, 0, 1);
INSERT INTO `super_goods` VALUES (41, 'YSK-二11', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (42, 'YSK-二12', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (43, 'YSK-二13', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (44, 'YSK-二14', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 2, 0, 0, 1);
INSERT INTO `super_goods` VALUES (45, 'YSK-二11', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (46, 'YSK-二12', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (47, 'YSK-二13', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (48, 'YSK-二14', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (49, '安安过是电饭锅电饭锅', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (50, '安安过是电饭锅电饭锅', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (51, '安安过是电饭锅电饭锅', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);
INSERT INTO `super_goods` VALUES (52, '安安过是电饭锅电饭锅', 1, 2, 123, 100.00, 1000, '', '', 1, 1, 0, 2, 1, 0, 0, 1);

-- ----------------------------
-- Table structure for super_goods_details
-- ----------------------------
DROP TABLE IF EXISTS `super_goods_details`;
CREATE TABLE `super_goods_details`  (
  `gd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品详情信息表',
  `gd_goods_id` int(11) NOT NULL COMMENT '商品id',
  `gd_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详情(包括但不限于文字排版，图片视频等内容)',
  `gd_addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `ad_admin` int(11) NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`gd_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品详情信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_goods_details
-- ----------------------------
INSERT INTO `super_goods_details` VALUES (1, 12, '<p>123123<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/><img src=\"/public/ueditor/php/upload/image/20190912/1568281948.png\" title=\"1568281948.png\" alt=\"icon.png\"/></p>', 1568281950, 1);
INSERT INTO `super_goods_details` VALUES (2, 32, '<p>3123123123123213</p>', 1568604225, 1);

-- ----------------------------
-- Table structure for super_goods_img
-- ----------------------------
DROP TABLE IF EXISTS `super_goods_img`;
CREATE TABLE `super_goods_img`  (
  `gsig_id` int(11) NOT NULL AUTO_INCREMENT,
  `gsig_goods_id` int(11) NOT NULL COMMENT '商品ID',
  `gsig_img_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `gsig_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位',
  `gsig_add_date` int(11) NOT NULL COMMENT '入库时间',
  `gsig_change_date` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`gsig_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_goods_sorts
-- ----------------------------
DROP TABLE IF EXISTS `super_goods_sorts`;
CREATE TABLE `super_goods_sorts`  (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `ss_f_id` int(11) NULL DEFAULT NULL COMMENT '是否为顶级分类：顶级分类0，父级分类的ID',
  `ss_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `ss_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `ss_type` int(11) NOT NULL COMMENT '分类',
  `ss_order` int(11) NOT NULL COMMENT '排序',
  `ss_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位:1.正常显示；2，显示异常',
  `ss_add_date` int(11) NOT NULL COMMENT '入库时间',
  `ss_change_date` int(11) NOT NULL COMMENT '更新时间',
  `ss_admin` int(11) NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`ss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表:一级分类值有名称：二级分类有图片' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of super_goods_sorts
-- ----------------------------
INSERT INTO `super_goods_sorts` VALUES (1, 0, '菜籽油11', '/uploads/nav/20190910/9fb3d2748352fd853790cb4880863898.png', 1, 1, '1', 1, 1568081390, 1);
INSERT INTO `super_goods_sorts` VALUES (2, 1, '金龙鱼1', '/uploads/nav/20190909/007dc30843dfa4450daff9c22c74a43f.png', 1, 2, '1', 1, 1568010892, 1);
INSERT INTO `super_goods_sorts` VALUES (3, 1, '委曲求全', '/uploads/sort/20190909/36db719cfcbcc3549d83fec4507a49da.png', 0, 2, '1', 1568008446, 1568008446, 1);
INSERT INTO `super_goods_sorts` VALUES (4, 0, '大米', '/uploads/nav/20190910/9b77be3892accc335d675e9a15d2fb8a.png', 0, 1, '1', 1568008845, 1568081341, 1);
INSERT INTO `super_goods_sorts` VALUES (5, 4, '金龙鱼', '/uploads/sort/20190909/1756186aa58fb23dcb1f93fc2c097622.png', 0, 2, '1', 1568008906, 1568008906, 1);
INSERT INTO `super_goods_sorts` VALUES (6, 4, '稻花香', '/uploads/sort/20190909/19140fa171af3625e2df42d8bd2b5a1e.png', 0, 3, '1', 1568008984, 1568008984, 1);
INSERT INTO `super_goods_sorts` VALUES (7, 0, '生活用品', '/uploads/sort/20190911/f7b089dd64ccb7fffd7c1ba150ca6e76.png', 0, 3, '1', 1568187957, 1568187957, 1);
INSERT INTO `super_goods_sorts` VALUES (8, 7, '水杯1', '/uploads/sort/20190911/5fcdafbd0d738235b7e01638ea1ef901.png', 0, 4, '1', 1568187981, 1568188037, 1);

-- ----------------------------
-- Table structure for super_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `super_goods_spec`;
CREATE TABLE `super_goods_spec`  (
  `gs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格ID',
  `gs_goods_id` int(11) NOT NULL COMMENT '商品ID',
  `gs_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `gs_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `gs_stock` int(10) NULL DEFAULT NULL COMMENT '库存',
  `gs_discont` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价',
  `gs_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格图片',
  `gs_status` tinyint(1) NULL DEFAULT 1 COMMENT '状态，1.正常；2.隐藏',
  `gs_addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `gs_update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `gs_admin` int(11) NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`gs_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_goods_spec
-- ----------------------------
INSERT INTO `super_goods_spec` VALUES (1, 11, '123', 123.00, 123, 123.00, '/uploads/article/20190911/9c514cc1fc4cfbd631266b362c29c751.png', 1, 1568185421, 1568185421, 1);
INSERT INTO `super_goods_spec` VALUES (2, 11, '白色款陶瓷马克杯单个', 38.00, 100, 36.00, '/uploads/article/20190911/50859bb2ed02b2a5c8c8c0d273842dd6.png', 1, 1568185555, 1568185555, 1);
INSERT INTO `super_goods_spec` VALUES (3, 11, '黑色款陶瓷马克杯单个', 38.00, 100, 35.00, '/uploads/article/20190911/753bb9ad0f14006f0cd3fee8013a4f01.png', 1, 1568185683, 1568185683, 1);
INSERT INTO `super_goods_spec` VALUES (4, 12, '黑色款陶瓷马克杯单个', 123.00, 12, 12.00, '/uploads/article/20190911/dbb96529f9059271d9736ec87cf8ba8f.png', 1, 1568186240, 1568186240, 1);
INSERT INTO `super_goods_spec` VALUES (5, 12, '白色款陶瓷马克杯单个', 123.00, 123, 123.00, '/uploads/article/20190911/b0bc23e1c2e534c774c9b80bd72a2d5e.png', 1, 1568186266, 1568186266, 1);
INSERT INTO `super_goods_spec` VALUES (9, 16, '情浓中秋，爱意满满2', 12.00, 12, 12.00, '/uploads/article/20190911/b50c5cb295fc10674d586571582e0ed4.png', 1, 1568192067, 1568192067, 1);
INSERT INTO `super_goods_spec` VALUES (8, 16, '情浓中秋，爱意满满1', 1.00, 1, 2.00, '/uploads/article/20190911/731d235678d2bd80da873082eb414a31.png', 1, 1568192049, 1568192049, 1);
INSERT INTO `super_goods_spec` VALUES (10, 16, '情浓中秋，爱意满满3', 123.00, 123, 123.00, '/uploads/article/20190911/86638ff12caa417dda8372f837d6cc3e.png', 1, 1568192305, 1568192305, 1);
INSERT INTO `super_goods_spec` VALUES (11, 16, '情浓中秋，爱意满满4', 1.00, 1, 1.00, '/uploads/article/20190911/2f73ae8ea97b24988dc73722b96b773b.png', 1, 1568192348, 1568192348, 1);
INSERT INTO `super_goods_spec` VALUES (16, 18, '岁月流觞123', 123.00, 123, 23.00, '/uploads/article/20190911/4576a2d72131773d9ae066f156240fd3.png', 1, 1568192982, 1568192982, 1);
INSERT INTO `super_goods_spec` VALUES (14, 17, '每逢佳节倍思亲2', 1.00, 1, 1.00, '/uploads/article/20190911/a39fa96ebb3929191bfa6d8a7e1905e5.png', 1, 1568192536, 1568192536, 1);
INSERT INTO `super_goods_spec` VALUES (15, 17, '每逢佳节倍思亲1', 1.00, 1, 1.00, '/uploads/article/20190911/50176392c66ebd0431e91275316a5f43.png', 1, 1568192579, 1568192579, 1);
INSERT INTO `super_goods_spec` VALUES (18, 0, '123', 123.00, 1231, 123.00, '/uploads/article/20190911/967ba9088642c95633ee00edf2c8f4e7.png', 1, 1568196649, 1568196649, 1);
INSERT INTO `super_goods_spec` VALUES (19, 0, '123', 123.00, 123, 123.00, '/uploads/article/20190911/f0e9fdb911503e1979d6bfb26d2a5a2b.png', 1, 1568196661, 1568196661, 1);
INSERT INTO `super_goods_spec` VALUES (20, 19, '是大法官水电费 ', 1231.00, 123, 123.00, '/uploads/article/20190911/3eca06c3914768dd4e187cc123cc4eee.png', 1, 1568196813, 1568196813, 1);
INSERT INTO `super_goods_spec` VALUES (21, 20, '规格一', 123.00, 123, 123.00, '/uploads/article/20190912/799f6f87c97d6ed05990913b4ac7485d.png', 1, 1568252510, 1568252510, 1);
INSERT INTO `super_goods_spec` VALUES (22, 20, '规格二', 123.00, 123, 123.00, '/uploads/article/20190912/5980139d50f8ac555c26deaaba85f879.png', 1, 1568252524, 1568252524, 1);
INSERT INTO `super_goods_spec` VALUES (23, 20, '1', 1.00, 1, 1.00, '/uploads/article/20190912/56f0dcfb780e3cc5fcf802bb6f77a56f.png', 1, 1568252597, 1568252597, 1);
INSERT INTO `super_goods_spec` VALUES (24, 21, '1', 1.00, 1, 1.00, '/uploads/article/20190912/74a385d0841aaf4e7d62922c4eb8b7dd.png', 1, 1568275373, 1568275373, 1);
INSERT INTO `super_goods_spec` VALUES (25, 21, '2', 2.00, 2, 2.00, '/uploads/article/20190912/dddb29bea6e7907a85b92c1281e4e602.png', 1, 1568275384, 1568275384, 1);
INSERT INTO `super_goods_spec` VALUES (26, 30, '1', 1.00, 1, 1.00, '/uploads/article/20190912/079e2642a87a47398befc9b36ec0bc5f.png', 1, 1568276811, 1568276811, 1);
INSERT INTO `super_goods_spec` VALUES (27, 32, '123123', 12.00, 112, 2.00, '/uploads/article/20190916/11316b42dc18f4f6cb2aaa0c5bc23f96.png', 1, 1568604245, 1568604245, 1);

-- ----------------------------
-- Table structure for super_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `super_goods_type`;
CREATE TABLE `super_goods_type`  (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `tp_type` int(11) NOT NULL COMMENT '分类',
  `tp_order` int(11) NOT NULL COMMENT '排序',
  `tp_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位',
  `tp_add_date` int(11) NOT NULL COMMENT '入库时间',
  `tp_change_date` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`tp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_houses
-- ----------------------------
DROP TABLE IF EXISTS `super_houses`;
CREATE TABLE `super_houses`  (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_b_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统自动生成的房屋编号',
  `h_p_id` int(10) NULL DEFAULT NULL,
  `h_c_id` int(10) NULL DEFAULT NULL,
  `h_a_id` int(11) NULL DEFAULT NULL,
  `h_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房源名称',
  `h_type` int(10) NULL DEFAULT NULL COMMENT '房屋类型，对应type表sort=1的数据',
  `h_area` int(10) NULL DEFAULT NULL COMMENT '房屋面积单位平方米',
  `h_head` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋朝向',
  `h_rent` decimal(10, 2) NULL DEFAULT NULL COMMENT '房屋月租金额',
  `h_rent_type` tinyint(2) NULL DEFAULT 1 COMMENT '租金类型：1，月租；2，日租；3，季租。',
  `h_floor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋楼层',
  `h_nearbus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附近公交路线',
  `h_subway` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附近地铁',
  `h_building` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在小区',
  `h_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房源地址',
  `h_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房源坐标',
  `h_house_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房源封面图',
  `h_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房源图片多图之间用逗号‘，’隔开',
  `h_img_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图alt',
  `h_video` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频链接。',
  `h_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房源描述',
  `h_view` int(10) NULL DEFAULT 0 COMMENT '房源浏览量',
  `h_isnew` tinyint(2) NULL DEFAULT NULL COMMENT '是否为最新，1最新，2非最新',
  `h_iscop` tinyint(2) NULL DEFAULT 1 COMMENT '是否合租；1.整租，2.合租',
  `h_discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为特价，为空不是特价，反之为特价，内容为特价内容。',
  `h_config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房源配置这存type表的id集，多个逗号隔开',
  `h_addtime` int(11) NULL DEFAULT NULL COMMENT '房源添加时间',
  `h_updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `h_rent_status` tinyint(2) NULL DEFAULT 2 COMMENT '出租状态；1，已租，2，未租',
  `h_istop` tinyint(2) NULL DEFAULT 2 COMMENT '是否置顶：1，置顶；2，常规',
  `h_isable` tinyint(2) NULL DEFAULT 1 COMMENT '是否可租，1，可租，2，不可租',
  `h_admin` int(10) NULL DEFAULT NULL COMMENT '添加人员，当前登陆后台的管理员，对应admin_id',
  PRIMARY KEY (`h_id`, `h_b_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_integral
-- ----------------------------
DROP TABLE IF EXISTS `super_integral`;
CREATE TABLE `super_integral`  (
  `it_id` int(11) NULL DEFAULT NULL COMMENT '积分表ID',
  `it_u_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `it_score` int(11) NULL DEFAULT NULL COMMENT '积分名称',
  `it_remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '积分描述',
  `it_avabile` tinyint(2) NULL DEFAULT NULL COMMENT '状态：1正常；2.失效',
  `it_create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `super_loginlog`;
CREATE TABLE `super_loginlog`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_admin` int(11) NULL DEFAULT NULL COMMENT '管理员，对应admin_id',
  `log_time` int(11) NULL DEFAULT NULL COMMENT '登录时间',
  `log_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_logistics
-- ----------------------------
DROP TABLE IF EXISTS `super_logistics`;
CREATE TABLE `super_logistics`  (
  `lgt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流信息表',
  `lgt_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `lgt_third_logid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方物流单号',
  `lgt_current_status` tinyint(1) NULL DEFAULT NULL COMMENT '当前状态',
  `lgt_arrival_time` int(11) NULL DEFAULT NULL COMMENT '到货时间',
  `lgt_del_status` tinyint(1) NULL DEFAULT NULL COMMENT '删除状态',
  `lgt_create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `lgt_update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `lgt_admin` int(11) NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`lgt_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物流信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_member
-- ----------------------------
DROP TABLE IF EXISTS `super_member`;
CREATE TABLE `super_member`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `u_nickname` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `u_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `u_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `u_email` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `u_moblie` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电话',
  `u_avatar` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `u_integral` int(11) NOT NULL COMMENT '积分',
  `u_register_time` int(11) NOT NULL COMMENT '注册时间',
  `u_login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `u_login_hits` int(11) NOT NULL COMMENT '登陆次数',
  `u_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `u_spread_num` int(11) NULL DEFAULT NULL COMMENT '推广人数',
  `u_spread_code` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推广码',
  `u_qr_code` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '二维码',
  `u_level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级',
  `u_referee` int(11) NULL DEFAULT NULL COMMENT '推荐人',
  `u_openid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'openid',
  `u_unionid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unionid',
  `u_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志位',
  `u_add_date` int(11) NOT NULL COMMENT '入库时间',
  `u_change_date` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_member_address
-- ----------------------------
DROP TABLE IF EXISTS `super_member_address`;
CREATE TABLE `super_member_address`  (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_member_id` int(11) NOT NULL COMMENT '用户ID',
  `add_province` int(11) NOT NULL COMMENT '省',
  `add_city_id` int(11) NOT NULL COMMENT '市',
  `add_area_id` int(11) NULL DEFAULT NULL COMMENT '区/县',
  `add_address` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `add_default_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为默认值',
  `add_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志位',
  `add_add_date` int(11) NOT NULL COMMENT '入库时间',
  `add_change_date` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`add_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_menu
-- ----------------------------
DROP TABLE IF EXISTS `super_menu`;
CREATE TABLE `super_menu`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `m_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `m_fid` int(11) NULL DEFAULT NULL COMMENT '菜单父级id',
  `m_control` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器名称，小写',
  `m_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名，小写',
  `m_sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `m_type` int(10) NULL DEFAULT NULL COMMENT '菜单类型1.菜单；2.操作',
  `m_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `m_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `m_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_menu
-- ----------------------------
INSERT INTO `super_menu` VALUES (1, '平台员工', 0, 'admin', 'admin', 1, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (2, '员工列表', 1, 'admin', 'admin', 1, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (4, '角色列表', 1, 'admin', 'role', 1, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (39, '新增', 32, 'banner', 'addbanner', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (40, '修改', 32, 'banner', 'editbanner', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (41, '删除', 32, 'banner', 'delbanner', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (10, '系统配置', 0, 'setinfo', 'setlist', 2, 1, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (11, '基础配置', 10, 'setinfo', 'setlist', 0, 1, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (12, '分站配置', 10, 'setinfo', 'branch', 0, 1, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (13, '新增', 12, 'setinfo', 'addbranch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (14, '客户管理', 0, 'user', 'userlist', 6, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (87, '模块配置', 10, 'admin', 'menu', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (17, '批量删除', 15, 'user', 'delBatch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (18, '单个删除', 15, 'user', 'delUser', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (19, '类型参数', 10, 'setinfo', 'typelist', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (20, '信息配置', 10, 'msg', 'msg', 0, 1, '11111', NULL, NULL);
INSERT INTO `super_menu` VALUES (21, '区域配置', 10, 'district', 'district', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (22, '内容管理', 0, 'article', 'article', 5, 1, '5', NULL, NULL);
INSERT INTO `super_menu` VALUES (23, '文章管理', 22, 'article', 'article', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (24, '案例列表', 22, 'example', 'example', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (25, '楼盘管理', 22, 'building', 'builds', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (26, '设计团队', 22, 'designer', 'team', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (27, '专题模板', 22, 'topic', 'topic', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (28, '推广页面', 22, 'topics', 'topics', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (29, '导航管理', 0, 'nav', 'nav', 4, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (30, '导航列表', 29, 'nav', 'navlist', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (31, '广告管理', 0, 'banner', 'bannerlist', 3, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (42, '新增', 30, 'nav', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (82, '回收站', 14, 'user', 'back', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (37, '菜单管理', 36, 'admin', 'menu', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (83, '首页轮播', 31, 'banner', 'banner', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (43, '编辑', 30, 'nav', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (44, '删除', 30, 'nav', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (45, '新增', 28, 'topics', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (46, '编辑', 28, 'topics', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (47, '删除', 28, 'topics', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (48, '新增', 27, 'topic', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (49, '编辑', 27, 'topic', 'edit', 0, 2, '9', NULL, NULL);
INSERT INTO `super_menu` VALUES (50, '删除', 27, 'topic', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (51, '新增', 26, 'designer', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (52, '编辑', 26, 'designer', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (53, '删除', 26, 'designer', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (54, '新增', 25, 'building', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (55, '编辑', 25, 'building', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (56, '删除', 25, 'building', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (57, '新增', 24, 'example', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (58, '编辑', 24, 'example', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (59, '删除', 24, 'example', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (60, '新增', 23, 'article', 'addarticle', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (61, '编辑', 23, 'article', 'editarticle', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (62, '删除', 23, 'article', 'delarticle', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (65, '导出数据表', 15, 'excel', 'excel', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (64, '编辑', 15, 'user', 'editUser', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (66, '批量恢复', 16, 'user', 'backBatch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (67, '单个恢复', 16, 'user', 'backNormal', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (68, '批量彻删', 16, 'user', 'absdelBatch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (69, '单个彻删', 16, 'user', 'absdelete', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (70, '新增', 2, 'admin', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (71, '编辑', 2, 'admin', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (72, '删除', 2, 'admin', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (76, '新增', 4, 'admin', 'addrole', 2, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (77, '编辑', 4, 'admin', 'editrole', 2, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (78, '删除', 4, 'admin', 'delrole', 1, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (81, '客户列表', 14, 'user', 'user', 2, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (93, '文章轮播', 31, 'banner', 'artbanner', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (94, '编辑', 81, 'user', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (95, '删除', 81, 'user', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (96, '导出', 81, 'user', 'export', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (97, '恢复', 82, 'back', 'recover', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (98, '删除', 82, 'back', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (99, '新增', 90, 'worksite', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (100, '编辑', 90, 'worksite', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (101, '删除', 90, 'worksite', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (102, '新增', 91, 'worker', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (103, '编辑', 91, 'worker', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (104, '删除', 91, 'worker', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (105, '新增', 92, 'banner', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (106, '编辑', 92, 'banner', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (107, '删除', 92, 'banner', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (108, '新增', 83, 'banner', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (109, '编辑', 83, 'banner', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (110, '删除', 83, 'banner', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (111, '新增', 93, 'banner', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (112, '编辑', 93, 'banner', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (113, '删除', 93, 'banner', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (114, '新增', 11, 'setinfo', 'add', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (115, '编辑', 11, 'setinfo', 'edit', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (116, '删除', 11, 'setinfo', 'del', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (117, '编辑', 12, 'setinfo', 'editbranch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (118, '删除', 12, 'setinfo', 'delbranch', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (119, '新增', 87, 'admin', 'addmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (120, '编辑', 87, 'admin', 'editmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (121, '删除', 87, 'admin', 'delmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (122, '新增', 19, 'admin', 'addmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (123, '编辑', 19, 'admin', 'editmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (124, '删除', 19, 'admin', 'delmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (125, '新增', 20, 'admin', 'addmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (126, '编辑', 20, 'admin', 'editmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (127, '删除', 20, 'admin', 'delmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (128, '新增', 21, 'admin', 'addmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (129, '编辑', 21, 'admin', 'editmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (130, '删除', 21, 'admin', 'delmenu', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (131, '客服列表', 14, 'user', 'cusservice', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (132, '推广列表', 14, 'user', 'spread', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (133, '查看', 132, 'user', 'spread', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (134, '编辑', 131, 'user', 'cusservice', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (135, '删除', 131, 'user', 'deluser', 0, 2, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (140, '添加', 137, 'house', 'add', 0, 2, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (139, '查看', 137, 'house', 'index', 0, 2, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (141, '编辑', 137, 'house', 'edit', 0, 2, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (144, '会员管理', 0, 'costomer', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (145, '会员列表', 144, 'customer', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (152, '内部员工', 0, 'staff', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (153, '员工管理', 152, 'staff', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (158, '前端添加', 136, 'market', 'index', 0, 1, '123', NULL, NULL);
INSERT INTO `super_menu` VALUES (159, '操作日志', 0, 'operatelog', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (160, '操作记录', 159, 'operatelog', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (161, '商品管理', 0, 'product', 'index', 0, 1, 'index', NULL, NULL);
INSERT INTO `super_menu` VALUES (162, '商品列表', 161, 'product', 'index', 0, 1, 'q', NULL, NULL);
INSERT INTO `super_menu` VALUES (163, '添加商品', 161, 'product', 'addPro', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (164, '商城管理', 0, 'shop', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (165, '商品分类', 164, 'shop', 'sort', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (166, '商品管理', 164, 'shop', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (167, '订单管理', 0, 'order', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (168, '订单列表', 167, 'order', 'index', 0, 1, '1', NULL, NULL);
INSERT INTO `super_menu` VALUES (169, '会员等级', 144, 'user', 'level', 0, 1, '1', NULL, NULL);

-- ----------------------------
-- Table structure for super_nav
-- ----------------------------
DROP TABLE IF EXISTS `super_nav`;
CREATE TABLE `super_nav`  (
  `nav_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '导航id',
  `nav_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导航标题',
  `nav_fid` int(10) NULL DEFAULT NULL COMMENT '导航父级id',
  `nav_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '导航图片',
  `nav_hover_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '悬停图片',
  `nav_seo_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo标题',
  `nav_seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo关键词',
  `nav_seo_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'seo描述',
  `nav_order` tinyint(255) NULL DEFAULT NULL COMMENT '导航排序数字越大越靠前',
  `nav_isable` tinyint(4) NULL DEFAULT NULL COMMENT '是否显示：1 显示；2 隐藏',
  `nav_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导航链接',
  `nav_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `nav_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  PRIMARY KEY (`nav_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前端网站导航' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_nav
-- ----------------------------
INSERT INTO `super_nav` VALUES (57, '123', 0, '', '', '123', '123', '123', 1, 1, '', 1567995611, 1);

-- ----------------------------
-- Table structure for super_order
-- ----------------------------
DROP TABLE IF EXISTS `super_order`;
CREATE TABLE `super_order`  (
  `or_id` int(11) NOT NULL,
  `or_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `or_member_id` int(11) NOT NULL COMMENT '用户ID',
  `or_add_id` int(11) NULL DEFAULT NULL COMMENT '用户地址ID',
  `or_logistics_id` int(11) NOT NULL COMMENT '物流ID',
  `or_price` decimal(8, 2) NOT NULL COMMENT '商品金额',
  `or_discount` decimal(8, 0) NULL DEFAULT NULL COMMENT '优惠金额',
  `or_pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单实付金额',
  `or_remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `or_time` int(11) NOT NULL COMMENT '下单时间',
  `or_pay_time` int(11) NULL DEFAULT NULL COMMENT '支付时间',
  `or_recipient_time` int(11) NULL DEFAULT NULL COMMENT '确认收货时间',
  `or_refund_time` int(11) NULL DEFAULT NULL COMMENT '退款时间',
  `or_pay_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式',
  `or_pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付状态',
  `or_status` tinyint(1) NOT NULL COMMENT '订单状态：1未支付；2已支付（待发货）；3已发货（运输中）；4已收货；5已评价；6已退款',
  `or_add_date` int(11) NOT NULL COMMENT '入库时间',
  `or_change_date` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`or_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_order_details
-- ----------------------------
DROP TABLE IF EXISTS `super_order_details`;
CREATE TABLE `super_order_details`  (
  `ds_id` int(11) NOT NULL,
  `ds_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `ds_goods_id` int(11) NOT NULL COMMENT '商品id',
  `ds_goods_num` int(11) NOT NULL COMMENT '购买数量',
  `ds_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `ds_refund_time` int(11) NULL DEFAULT NULL COMMENT '退款时间',
  `ds_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位',
  `ds_add_date` int(11) NOT NULL COMMENT '入库时间',
  `ds_change_date` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`ds_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_province
-- ----------------------------
DROP TABLE IF EXISTS `super_province`;
CREATE TABLE `super_province`  (
  `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '省份id',
  `p_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `p_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `p_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  `p_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成房源编号用的数码',
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of super_province
-- ----------------------------
INSERT INTO `super_province` VALUES (1, '陕西', 1541387914, 1, '10');
INSERT INTO `super_province` VALUES (4, '四川', 1541387978, 1, '11');
INSERT INTO `super_province` VALUES (5, '重庆', 1541387984, 1, '12');

-- ----------------------------
-- Table structure for super_role
-- ----------------------------
DROP TABLE IF EXISTS `super_role`;
CREATE TABLE `super_role`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `r_bid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限编号',
  `r_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `r_power` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限设置，对应菜单的id',
  `r_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `r_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  PRIMARY KEY (`r_id`, `r_bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_role
-- ----------------------------
INSERT INTO `super_role` VALUES (1, '201806010001', '超级管理员', '22,23,60,61,62,29,30,42,43,44,31,83,108,109,110,10,11,114,115,116,87,119,120,121,19,122,123,124,1,2,70,71,72,4,76,77,78,144,145,169,164,165,166,167,168', NULL, NULL);

-- ----------------------------
-- Table structure for super_search
-- ----------------------------
DROP TABLE IF EXISTS `super_search`;
CREATE TABLE `super_search`  (
  `ch_id` int(11) NOT NULL,
  `ch_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字',
  `ch_search_num` int(11) NOT NULL COMMENT '搜索次数',
  `ch_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标志为',
  `ch_add_date` int(11) NOT NULL COMMENT '入库时间',
  `ch_change_date` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_setinfo
-- ----------------------------
DROP TABLE IF EXISTS `super_setinfo`;
CREATE TABLE `super_setinfo`  (
  `s_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '基本配置自增键',
  `s_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统配置key',
  `s_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解释说明',
  `s_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置值',
  `s_is_able` tinyint(2) NULL DEFAULT 1 COMMENT '是否可用',
  `s_opeatime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  `s_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  `s_type` tinyint(2) NULL DEFAULT NULL COMMENT '设置的类型；1 短信配置',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of super_setinfo
-- ----------------------------
INSERT INTO `super_setinfo` VALUES (10, 'hotline', '热线电话', '', 1, 1536301983, 1, 0);
INSERT INTO `super_setinfo` VALUES (4, 'ali_sms_key', '阿里短信key', '', 1, 1526987006, 1, 1);
INSERT INTO `super_setinfo` VALUES (5, 'ali_sms_secret', '阿里短信serect', '', 1, 1526986991, 1, 1);
INSERT INTO `super_setinfo` VALUES (8, 'webname', '网站名称', '超级卖家', 1, 1567739153, 1, 0);

-- ----------------------------
-- Table structure for super_shopping
-- ----------------------------
DROP TABLE IF EXISTS `super_shopping`;
CREATE TABLE `super_shopping`  (
  `sg_id` int(11) NOT NULL,
  `sg_goods_id` int(11) NOT NULL COMMENT '商品ID',
  `sg_goods_num` int(11) NOT NULL COMMENT '数量',
  `sg_time` int(11) NOT NULL COMMENT '时间',
  `sg_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位',
  `sg_add_date` int(11) NOT NULL COMMENT '入库时间',
  `sg_change_date` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`sg_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for super_type
-- ----------------------------
DROP TABLE IF EXISTS `super_type`;
CREATE TABLE `super_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `type_branch` int(255) NULL DEFAULT NULL COMMENT '对应的站点ID（仅装修品质）',
  `type_price` int(10) NULL DEFAULT NULL COMMENT '品质单价（仅装修品质）',
  `type_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `type_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `type_addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `type_sort` tinyint(4) NULL DEFAULT NULL COMMENT '类型分类1，房屋类型，5.月租范围,2,房屋配置',
  `type_isable` tinyint(2) NULL DEFAULT NULL COMMENT '是否可用',
  `type_admin` int(10) NULL DEFAULT NULL COMMENT '操作人，对应管理员id',
  `type_order` int(10) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '各种类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_user
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user`  (
  `u_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_c_id` int(10) NULL DEFAULT NULL COMMENT '员工城市id',
  `u_openid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信的openid',
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `u_sex` tinyint(2) NULL DEFAULT NULL COMMENT '1男  2 女 ',
  `u_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称（微信昵称）',
  `u_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆密码(MD5加密）',
  `u_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `u_depart_id` int(10) NULL DEFAULT NULL COMMENT '所属部门id',
  `u_birth` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `u_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `u_isable` tinyint(2) NULL DEFAULT NULL COMMENT '是否在职',
  `u_isadmin` tinyint(2) NULL DEFAULT 2 COMMENT '是否为该部门管理员，1是。2，否',
  `u_addtime` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业内员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for super_view
-- ----------------------------
DROP TABLE IF EXISTS `super_view`;
CREATE TABLE `super_view`  (
  `uv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户浏览表',
  `uv_goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `uv_user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `uv_addtime` int(11) NULL DEFAULT NULL COMMENT '浏览时间',
  PRIMARY KEY (`uv_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览商品表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for super_wheel
-- ----------------------------
DROP TABLE IF EXISTS `super_wheel`;
CREATE TABLE `super_wheel`  (
  `wl_id` int(11) NOT NULL,
  `wl_type` int(11) NOT NULL COMMENT '类型',
  `wl_title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `wl_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路径',
  `wl_link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `wl_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `wl_del_flg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标志位',
  `wl_add_date` int(11) NOT NULL COMMENT '入库时间',
  `wl_change_date` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`wl_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
