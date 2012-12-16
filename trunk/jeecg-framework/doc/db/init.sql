/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : easyssh

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2012-12-14 14:00:52
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `OBID` varchar(36) NOT NULL default '' COMMENT '主键',
  `NAME` varchar(32) default NULL COMMENT '用户名',
  `AGE` int(11) default NULL COMMENT '年龄',
  `SALARY` decimal(10,2) default NULL COMMENT '工资',
  `BIRTHDAY` date default NULL COMMENT '生日',
  `LOGON_DATE` datetime default NULL COMMENT '注册时间',
  `CRTUSER` varchar(36) default NULL COMMENT '创建人',
  `CRTUSER_NAME` varchar(32) default NULL COMMENT '创建人名字',
  `CREATE_DT` datetime default NULL COMMENT '创建时间',
  `MODIFIER` varchar(36) default NULL COMMENT '修改人',
  `MODIFIER_NAME` varchar(32) default NULL COMMENT '修改人名字',
  `MODIFY_DT` datetime default NULL COMMENT '修改时间',
  `DELFLAG` int(11) default '0' COMMENT '删除标记',
  `DEL_DT` datetime default NULL COMMENT '删除时间',
  PRIMARY KEY  (`OBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('79c21f72-9ec9-46e9-8412-5f9cd683966c', '12', '12', '12.00', '2011-12-15', '2011-12-14 09:42:22', '0', '超级用户', '2011-12-14 09:42:24', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `t00_dict_param`
-- ----------------------------
DROP TABLE IF EXISTS `t00_dict_param`;
CREATE TABLE `t00_dict_param` (
  `OBID` varchar(36) NOT NULL,
  `delflag` int(11) default NULL,
  `param_level` varchar(255) default NULL,
  `param_level_dec` varchar(255) default NULL,
  `param_name` varchar(255) default NULL,
  `param_value` varchar(255) default NULL,
  `param_view_order` int(11) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`OBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t00_dict_param
-- ----------------------------
INSERT INTO `t00_dict_param` VALUES ('001', '0', '001', '性别', '男', '01', null, null);
INSERT INTO `t00_dict_param` VALUES ('002', '0', '001', '性别', '女', '02', null, null);

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
INSERT INTO `t60_gbuy_order` VALUES ('612b2372-55b6-462c-abeb-53d72987056b', '12', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, '', '', '', '', '0', '超级用户', '2011-12-12 17:04:46', null, null, null, '0', null);
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
INSERT INTO `t60_gbuy_order_custom` VALUES ('080cc141-c6ee-4a3f-9fb4-138bfe8dd686', '612b2372-55b6-462c-abeb-53d72987056b', '12', '1', '1', '11', '1', '', null, '', null, '', '', '', '0', '超级用户', '2011-12-12 17:04:46', null, null, null, '0', null);
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
INSERT INTO `t60_gbuy_order_product` VALUES ('6cc76127-d8ea-459f-8733-668bc029f7d6', '612b2372-55b6-462c-abeb-53d72987056b', '12', '1', '11', '1', '11', null, null, '', '0', '超级用户', '2011-12-12 17:04:46', null, null, null, '0', null, '');
INSERT INTO `t60_gbuy_order_product` VALUES ('87806b74-bc72-458c-b0df-e19fbb4a7ea3', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '2', '2S', null, '', null, null, '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null, '');
INSERT INTO `t60_gbuy_order_product` VALUES ('e8390ef3-6694-410f-8080-11854a36ddaa', '69511aa2-9924-4e19-ada1-19553817ca3e', 'Q01', '1', '1SS', null, '', null, null, '', '0', '系统管理员', '2012-12-04 21:51:48', '0', '系统管理员', '2012-12-04 21:51:48', '0', null, '');

-- ----------------------------
-- Table structure for `tauth`
-- ----------------------------
DROP TABLE IF EXISTS `tauth`;
CREATE TABLE `tauth` (
  `CID` varchar(36) NOT NULL,
  `CDESC` varchar(200) default NULL,
  `CNAME` varchar(100) NOT NULL,
  `CSEQ` decimal(22,0) default NULL,
  `CURL` varchar(200) default NULL,
  `CICONCLS` varchar(100) default NULL,
  `CPID` varchar(36) default NULL,
  `CTYPE` varchar(2) default NULL,
  PRIMARY KEY  (`CID`),
  KEY `FK4BE8BFC70E6FF6E` (`CPID`),
  KEY `FK4BE8BFC70E1C7B7` (`CPID`),
  CONSTRAINT `FK4BE8BFC70E1C7B7` FOREIGN KEY (`CPID`) REFERENCES `tauth` (`CID`),
  CONSTRAINT `FK4BE8BFC70E6FF6E` FOREIGN KEY (`CPID`) REFERENCES `tauth` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tauth
-- ----------------------------
INSERT INTO `tauth` VALUES ('0', null, '首页', '1', '', null, null, '01');
INSERT INTO `tauth` VALUES ('3774805f-b027-8121-36de-cdaef17bf870', '描述信息', '单表模型添加按钮', '10', 'personAction!add.action', null, 'ef9c0ec5-efb2-62bb-1953-dcadf7a5e6b1', '02');
INSERT INTO `tauth` VALUES ('7a5f9bea-89f1-380a-75ce-4d4d3ea75f8b', '描述信息', '单表模型修改按钮', '10', 'personAction!edit.action', null, 'ef9c0ec5-efb2-62bb-1953-dcadf7a5e6b1', '02');
INSERT INTO `tauth` VALUES ('a04e14e8-058c-1dbe-b128-c075fa982632', '描述信息', '用户添加', '10', 'userAction!add.action', null, 'dde32285-2999-acd6-62b1-961ff294bf58', '02');
INSERT INTO `tauth` VALUES ('buggl', null, 'BUG管理', '5', 'bugAction!goBug.action', null, 'ywgl', null);
INSERT INTO `tauth` VALUES ('cdgl', null, '菜单管理', '3', 'menuAction!goMenu.action', null, 'xtgl', '01');
INSERT INTO `tauth` VALUES ('d818a0c9-5bbf-1a74-51b6-de1c318e909c', '描述信息', '按钮权限', '10', '', null, null, '02');
INSERT INTO `tauth` VALUES ('dde32285-2999-acd6-62b1-961ff294bf58', '描述信息', '用户管理', '10', '', null, 'd818a0c9-5bbf-1a74-51b6-de1c318e909c', '02');
INSERT INTO `tauth` VALUES ('dict', null, '字典管理', '4', 'dictParamAction!goDictParam.action', null, 'xtgl', '01');
INSERT INTO `tauth` VALUES ('druidIndex', null, 'druid监控', '3', 'datasourceAction!goDruid.action', null, 'sjkgl', '01');
INSERT INTO `tauth` VALUES ('ef9c0ec5-efb2-62bb-1953-dcadf7a5e6b1', '描述信息', '单表模型', '10', '', null, 'd818a0c9-5bbf-1a74-51b6-de1c318e909c', '02');
INSERT INTO `tauth` VALUES ('jsgl', null, '角色管理', '2', 'roleAction!goRole.action', null, 'xtgl', '01');
INSERT INTO `tauth` VALUES ('one', null, '单表模型', '3', 'personAction!goPerson.action', null, 'ywgl', '01');
INSERT INTO `tauth` VALUES ('onetomain', null, '一对多模型', '3', 'gbuyOrderAction!goGbuyOrder.action', null, 'ywgl', '01');
INSERT INTO `tauth` VALUES ('qxgl', null, '按鈕权限', '4', 'authAction!goAuth.action', null, 'xtgl', '01');
INSERT INTO `tauth` VALUES ('sjkgl', null, '数据库管理', '2', '', null, '0', '01');
INSERT INTO `tauth` VALUES ('xtgl', null, '系统管理', '3', '', null, '0', '01');
INSERT INTO `tauth` VALUES ('yhgl', null, '用户管理', '1', 'userAction!goUser.action', null, 'xtgl', '01');
INSERT INTO `tauth` VALUES ('ywgl', null, '生成器例子', '2', '', null, '0', '01');

-- ----------------------------
-- Table structure for `tbug`
-- ----------------------------
DROP TABLE IF EXISTS `tbug`;
CREATE TABLE `tbug` (
  `CID` varchar(36) NOT NULL,
  `CCREATEDATETIME` datetime default NULL,
  `CDESC` longtext,
  `CNAME` varchar(100) NOT NULL,
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbug
-- ----------------------------
INSERT INTO `tbug` VALUES ('b73b97fa-edb0-4d90-a46b-7f4ab9925323', '2012-12-05 18:00:54', '11113<img src=\"/jeecg/attached/png/2012/12/13/bea9c953416e43a387a650eb7ecbd2bd.png\" alt=\"\" />', '1');

-- ----------------------------
-- Table structure for `tonline`
-- ----------------------------
DROP TABLE IF EXISTS `tonline`;
CREATE TABLE `tonline` (
  `CID` varchar(36) NOT NULL,
  `CDATETIME` datetime NOT NULL,
  `CIP` varchar(50) NOT NULL,
  `CNAME` varchar(100) NOT NULL,
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tonline
-- ----------------------------
INSERT INTO `tonline` VALUES ('bec27753-50ae-45f7-8508-eaac47e0384c', '2011-12-14 10:38:09', '本地', 'admin');

-- ----------------------------
-- Table structure for `trole`
-- ----------------------------
DROP TABLE IF EXISTS `trole`;
CREATE TABLE `trole` (
  `CID` varchar(36) NOT NULL,
  `CDESC` varchar(200) default NULL,
  `CNAME` varchar(100) NOT NULL,
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole
-- ----------------------------
INSERT INTO `trole` VALUES ('0', '拥有系统所有权限', '超级管理员');
INSERT INTO `trole` VALUES ('1', '', 'Guest');

-- ----------------------------
-- Table structure for `troletauth`
-- ----------------------------
DROP TABLE IF EXISTS `troletauth`;
CREATE TABLE `troletauth` (
  `CID` varchar(36) NOT NULL,
  `CAUTHID` varchar(36) default NULL,
  `CROLEID` varchar(36) default NULL,
  PRIMARY KEY  (`CID`),
  KEY `FKE3580B7291E92055` (`CAUTHID`),
  KEY `FKE3580B72AE9AEA71` (`CROLEID`),
  CONSTRAINT `FKE3580B7291E92055` FOREIGN KEY (`CAUTHID`) REFERENCES `tauth` (`CID`),
  CONSTRAINT `FKE3580B72AE9AEA71` FOREIGN KEY (`CROLEID`) REFERENCES `trole` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of troletauth
-- ----------------------------
INSERT INTO `troletauth` VALUES ('11d0f3d9-7ff7-4b9f-b8ed-c20a34c35c3d', 'druidIndex', '0');
INSERT INTO `troletauth` VALUES ('24e5a9f9-4a55-4c8e-8643-2fb065d5cec9', 'buggl', '1');
INSERT INTO `troletauth` VALUES ('3961ea9c-049b-432d-9004-e8458e2a4f20', 'xtgl', '0');
INSERT INTO `troletauth` VALUES ('3a90b161-884c-4b3b-89ba-1af41fc99899', 'dde32285-2999-acd6-62b1-961ff294bf58', '0');
INSERT INTO `troletauth` VALUES ('4c38a3a6-a6fc-4b02-a726-6430ad69ca08', 'sjkgl', '0');
INSERT INTO `troletauth` VALUES ('668da4d3-85a8-454b-9a5f-abf2acf4b757', 'one', '0');
INSERT INTO `troletauth` VALUES ('67c3e087-63ef-4c2c-8d54-3eb8b115e941', 'cdgl', '0');
INSERT INTO `troletauth` VALUES ('771c7bd8-83a5-419d-ae2c-c07cc7b3b6c7', '3774805f-b027-8121-36de-cdaef17bf870', '0');
INSERT INTO `troletauth` VALUES ('8994bbe3-4a78-4292-94d1-92cfa3cac349', 'd818a0c9-5bbf-1a74-51b6-de1c318e909c', '0');
INSERT INTO `troletauth` VALUES ('8e5573a1-24f4-41a1-a746-7f670aee31a9', 'onetomain', '0');
INSERT INTO `troletauth` VALUES ('8eb7c90f-a549-47a7-b066-74c4950326f6', 'onetomain', '1');
INSERT INTO `troletauth` VALUES ('985f09cb-8c9c-4c8a-835e-bb8ede72f246', 'ywgl', '1');
INSERT INTO `troletauth` VALUES ('a67de752-5a7f-4eea-88d0-08b54c4433dc', 'dict', '0');
INSERT INTO `troletauth` VALUES ('b0b60617-d540-4ed2-aabd-9a353a780cd3', '0', '0');
INSERT INTO `troletauth` VALUES ('b7b0972c-cf3f-42c4-95c1-0bcd8f1bfba2', 'jsgl', '0');
INSERT INTO `troletauth` VALUES ('bf3f61c3-2a17-4131-8646-8bb8768287c4', 'one', '1');
INSERT INTO `troletauth` VALUES ('c1aff2a0-8b3f-48ed-98bd-460b6b7461e2', 'a04e14e8-058c-1dbe-b128-c075fa982632', '0');
INSERT INTO `troletauth` VALUES ('c3aea943-207d-468c-9c9c-0149157a7a9f', 'buggl', '0');
INSERT INTO `troletauth` VALUES ('ca92162c-c350-4e57-a4fa-f98141a81e87', 'ef9c0ec5-efb2-62bb-1953-dcadf7a5e6b1', '0');
INSERT INTO `troletauth` VALUES ('d7640290-d3cd-4396-b146-e3200ab6ec19', 'ywgl', '0');
INSERT INTO `troletauth` VALUES ('d874fe57-4570-432e-9bf4-e502ee96854b', 'qxgl', '0');
INSERT INTO `troletauth` VALUES ('d8afe5c0-8681-4fbd-a07a-dfe5f2fc26b0', '7a5f9bea-89f1-380a-75ce-4d4d3ea75f8b', '0');
INSERT INTO `troletauth` VALUES ('ea61de6f-7c3b-4f40-8985-90a6d1b3e74a', 'yhgl', '0');

-- ----------------------------
-- Table structure for `tuser`
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `CID` varchar(36) NOT NULL,
  `CCREATEDATETIME` datetime default NULL,
  `CMODIFYDATETIME` datetime default NULL,
  `CNAME` varchar(100) NOT NULL,
  `CPWD` varchar(100) NOT NULL,
  `dept` varchar(255) default NULL,
  `mail` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `subcompany` varchar(255) default NULL,
  `usertype` varchar(255) default NULL,
  PRIMARY KEY  (`CID`),
  UNIQUE KEY `CNAME` (`CNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('0', null, null, 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, '超级用户', '1', null, null);
INSERT INTO `tuser` VALUES ('e214c47c-eaf3-ac56-ca94-2c4bc23e41b5', '2012-12-13 16:32:08', '2012-12-13 16:34:38', 'zhangdh', '4297f44b13955235245b2497399d7a93', '', '', '', '开发用户', '1', '', '内部用户');

-- ----------------------------
-- Table structure for `tusertrole`
-- ----------------------------
DROP TABLE IF EXISTS `tusertrole`;
CREATE TABLE `tusertrole` (
  `CID` varchar(36) NOT NULL,
  `CROLEID` varchar(36) default NULL,
  `CUSERID` varchar(36) default NULL,
  PRIMARY KEY  (`CID`),
  KEY `FKE395100BB3F03FDB` (`CUSERID`),
  KEY `FKE395100BAE9AEA71` (`CROLEID`),
  CONSTRAINT `FKE395100BAE9AEA71` FOREIGN KEY (`CROLEID`) REFERENCES `trole` (`CID`),
  CONSTRAINT `FKE395100BB3F03FDB` FOREIGN KEY (`CUSERID`) REFERENCES `tuser` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tusertrole
-- ----------------------------
INSERT INTO `tusertrole` VALUES ('1fbfc2c2-7746-48a4-9a4f-9ff694f991f9', '0', '0');
INSERT INTO `tusertrole` VALUES ('6e8aa052-b15b-4a2c-9c38-e02836d1428e', '1', 'e214c47c-eaf3-ac56-ca94-2c4bc23e41b5');
