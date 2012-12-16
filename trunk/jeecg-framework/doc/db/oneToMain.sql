/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : core

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2012-12-11 18:03:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t60_gbuy_order`
-- ----------------------------
DROP TABLE IF EXISTS `t60_gbuy_order`;
CREATE TABLE `t60_gbuy_order` (
  `OBID` varchar(36) NOT NULL COMMENT '主键',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '订单号',
  `GO_VERSION` int(11) NOT NULL COMMENT '版本号',
  `GB_OBID` varchar(36) default NULL COMMENT '团购ID',
  `GB_CODE` varchar(36) default NULL COMMENT '团号',
  `GB_NAME` varchar(100) default NULL COMMENT '团购名称',
  `GODER_TYPE` varchar(2) default NULL COMMENT '订单类型 01:团单 02 单机票 03 单酒店 04 单签证 05 外拼 06 自由行',
  `GO_STATUS` varchar(2) default NULL COMMENT '订单团购状态 01:占位 02:已订 03::取消',
  `TOURISTID` varchar(36) default NULL COMMENT '旅行社ID',
  `AGENCY_ID` varchar(36) default NULL COMMENT '旅行社门店ID',
  `AGENCY_NAME` varchar(50) default NULL COMMENT '旅行社名称',
  `LINKMENID` varchar(36) default NULL COMMENT '联系人ID',
  `USERTYPE` varchar(1) default NULL COMMENT '顾客类型 : 1直客 2同行',
  `GO_CUS_NAME` varchar(50) default NULL COMMENT '客户',
  `GO_SALE_NAME` varchar(100) default NULL COMMENT '销售人',
  `GO_SALE_ID` varchar(36) default NULL COMMENT '销售人ID',
  `GO_CONTACT_NAME` varchar(50) default NULL COMMENT '联系人',
  `GO_ZONE_NO` varchar(6) default NULL COMMENT '区号',
  `GO_PHONE` varchar(20) default NULL COMMENT '电话',
  `GO_TELPHONE` varchar(20) default NULL COMMENT '手机',
  `GO_FACSIMILE` varchar(32) default NULL COMMENT '传真',
  `GO_MAIL` varchar(32) default NULL COMMENT '邮箱',
  `GO_ORDER_COUNT` int(11) default NULL COMMENT '订单人数',
  `GO_ALL_PRICE` decimal(10,2) default NULL COMMENT '总价(不含返款)',
  `GO_RETURN_PRICE` decimal(10,2) default NULL COMMENT '返款',
  `GO_CONTENT` varchar(200) default NULL COMMENT '备注',
  `AUDITOR_STATUS` varchar(2) default NULL COMMENT '审核状态 01:待审核 02:审核中 03:通过 04 驳回',
  `AUDITOR_OBID` varchar(36) default NULL COMMENT '审核人ID',
  `AUDITOR_NAME` varchar(50) default NULL COMMENT '审核人',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`,`GO_ORDER_CODE`,`GO_VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单表';

-- ----------------------------
-- Records of t60_gbuy_order
-- ----------------------------
INSERT INTO `t60_gbuy_order` VALUES ('69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '10', '100', '200', '团购名称', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', null, null, '', '', '', '', '0', '系统管理员', '2012-12-04 21:51:36', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `t60_gbuy_order_custom`
-- ----------------------------
DROP TABLE IF EXISTS `t60_gbuy_order_custom`;
CREATE TABLE `t60_gbuy_order_custom` (
  `OBID` varchar(36) NOT NULL,
  `GORDER_OBID` varchar(36) NOT NULL COMMENT '团购订单ID',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '团购订单号',
  `GOC_CUS_NAME_EN` varchar(50) default NULL COMMENT '客户英文名',
  `GOC_CUS_NAME` varchar(50) default NULL COMMENT '姓名',
  `GOC_CUS_TYPE` varchar(3) default NULL COMMENT '人员类型',
  `GOC_SEX` varchar(2) default NULL COMMENT '性别',
  `GOC_IDCARD` varchar(32) default NULL COMMENT '身份证号',
  `GOC_BIRTHDAY` date default NULL COMMENT '出生日期',
  `GOC_PASSPORT_CODE` varchar(32) default NULL COMMENT '护照号',
  `GOC_PASSPORT_END_DATE` date default NULL COMMENT '护照有效期',
  `GOC_BUSS_CONTENT` varchar(100) default NULL COMMENT '业务',
  `GOC_ROOM_NUM` varchar(10) default NULL COMMENT '同住',
  `GOC_CONTENT` varchar(200) default NULL COMMENT '备注',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`,`GORDER_OBID`,`GO_ORDER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单客户信息';

-- ----------------------------
-- Records of t60_gbuy_order_custom
-- ----------------------------
INSERT INTO `t60_gbuy_order_custom` VALUES ('131adaf1-4084-41fd-9305-7bdc18772028', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '21', '21SS', '', '', '', null, '', null, '', '', '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null);
INSERT INTO `t60_gbuy_order_custom` VALUES ('64d0ded5-94e2-465c-bdff-035527ef3ddf', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '12', '12SS', '', '', '', null, '', null, '', '', '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null);

-- ----------------------------
-- Table structure for `t60_gbuy_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `t60_gbuy_order_product`;
CREATE TABLE `t60_gbuy_order_product` (
  `OBID` varchar(36) NOT NULL,
  `GORDER_OBID` varchar(36) NOT NULL COMMENT '团购订单ID',
  `GO_ORDER_CODE` varchar(36) NOT NULL COMMENT '团购订单号',
  `gop_product_type` varchar(3) NOT NULL COMMENT '服务项目类型',
  `GOP_PRODUCT_NAME` varchar(100) default NULL COMMENT '产品名称',
  `GOP_COUNT` int(11) default NULL COMMENT '个数',
  `GOP_UNIT` varchar(2) default NULL COMMENT '单位',
  `GOP_ONE_PRICE` decimal(10,2) default NULL COMMENT '单价',
  `GOP_SUM_PRICE` decimal(10,2) default NULL COMMENT '小计',
  `GOP_CONTENT` varchar(200) default NULL COMMENT '备注',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  `GOP_PRODUCT_OBID` varchar(36) default NULL COMMENT '团购服务项目ID',
  PRIMARY KEY  (`OBID`,`GORDER_OBID`,`GO_ORDER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购订单产品信息';

-- ----------------------------
-- Records of t60_gbuy_order_product
-- ----------------------------
INSERT INTO `t60_gbuy_order_product` VALUES ('6b022116-68e2-46ab-986f-a636456f5cb1', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '3', '3SS', null, '', null, null, '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null, '');
INSERT INTO `t60_gbuy_order_product` VALUES ('87806b74-bc72-458c-b0df-e19fbb4a7ea3', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '2', '2S', null, '', null, null, '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null, '');
INSERT INTO `t60_gbuy_order_product` VALUES ('e8390ef3-6694-410f-8080-11854a36ddaa', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '1', '1SS', null, '', null, null, '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null, '');
