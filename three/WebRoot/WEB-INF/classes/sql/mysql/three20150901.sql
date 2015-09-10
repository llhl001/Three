/*
Navicat MySQL Data Transfer

Source Server         : LocalhostMySql
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-09-02 17:08:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mb_mbgroup
-- ----------------------------
DROP TABLE IF EXISTS `mb_mbgroup`;
CREATE TABLE `mb_mbgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `credit` int(10) NOT NULL,
  `discount` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员用户组';

-- ----------------------------
-- Records of mb_mbgroup
-- ----------------------------

-- ----------------------------
-- Table structure for mb_member
-- ----------------------------
DROP TABLE IF EXISTS `mb_member`;
CREATE TABLE `mb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membercardid` varchar(16) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `prov_name` varchar(32) NOT NULL,
  `city_id` int(10) NOT NULL,
  `city_name` varchar(32) NOT NULL,
  `address` varchar(200) NOT NULL,
  `zipcode` int(7) NOT NULL,
  `cardid` varchar(18) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `grade` tinyint(1) NOT NULL DEFAULT '1',
  `credit` int(10) NOT NULL DEFAULT '0',
  `regdateymd` date NOT NULL,
  `lastdateline` date NOT NULL,
  `mbgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membercardid` (`membercardid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of mb_member
-- ----------------------------

-- ----------------------------
-- Table structure for sale_category
-- ----------------------------
DROP TABLE IF EXISTS `sale_category`;
CREATE TABLE `sale_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `seq` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of sale_category
-- ----------------------------

-- ----------------------------
-- Table structure for sale_goods
-- ----------------------------
DROP TABLE IF EXISTS `sale_goods`;
CREATE TABLE `sale_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(32) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `warn_stock` tinyint(3) NOT NULL DEFAULT '1',
  `weight` varchar(32) NOT NULL,
  `unit` varchar(32) NOT NULL,
  `out_price` decimal(8,2) NOT NULL,
  `in_price` decimal(8,2) NOT NULL,
  `market_price` decimal(8,2) NOT NULL,
  `promote_price` decimal(8,2) NOT NULL,
  `ispromote` tinyint(1) NOT NULL DEFAULT '0',
  `promote_start_date` date NOT NULL,
  `promote_end_date` date NOT NULL,
  `ismemberprice` tinyint(1) NOT NULL DEFAULT '1',
  `creatymd` date NOT NULL,
  `lastinymd` date NOT NULL,
  `goods_desc` varchar(200) NOT NULL,
  `countamount` float(10,2) unsigned NOT NULL,
  `salesamount` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of sale_goods
-- ----------------------------

-- ----------------------------
-- Table structure for sale_log
-- ----------------------------
DROP TABLE IF EXISTS `sale_log`;
CREATE TABLE `sale_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(32) NOT NULL,
  `dateymd` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品管理日志表';

-- ----------------------------
-- Records of sale_log
-- ----------------------------

-- ----------------------------
-- Table structure for sale_purchase
-- ----------------------------
DROP TABLE IF EXISTS `sale_purchase`;
CREATE TABLE `sale_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL,
  `goods_sn` varchar(32) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `in_num` float NOT NULL,
  `out_num` float NOT NULL DEFAULT '0',
  `in_price` decimal(8,2) NOT NULL,
  `dateymd` date NOT NULL,
  `dateline` int(10) NOT NULL,
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='进货表';

-- ----------------------------
-- Records of sale_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for sale_sales
-- ----------------------------
DROP TABLE IF EXISTS `sale_sales`;
CREATE TABLE `sale_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL,
  `goods_sn` varchar(16) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `order_id` varchar(14) NOT NULL,
  `mid` int(10) NOT NULL,
  `membercardid` varchar(16) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `num` float NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `out_price` decimal(8,2) NOT NULL,
  `in_price` decimal(8,2) NOT NULL,
  `dateymd` date NOT NULL,
  `dateline` int(10) NOT NULL,
  `m_discount` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `p_discount` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `refund_type` tinyint(1) NOT NULL DEFAULT '0',
  `refund_num` float NOT NULL DEFAULT '0',
  `refund_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sales_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='销售记录表';

-- ----------------------------
-- Records of sale_sales
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `dictionarytype_id` int(11) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '0', '管理员', '2', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('2', '1', '用户', '2', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionarytype`;
CREATE TABLE `sys_dictionarytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典分类';

-- ----------------------------
-- Records of sys_dictionarytype
-- ----------------------------
INSERT INTO `sys_dictionarytype` VALUES ('1', 'base', '基础设置', '0', '基础设置', null);
INSERT INTO `sys_dictionarytype` VALUES ('2', 'usertype', '用户类型', '0', '用户类型', '1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '三只松鼠', '地址', '01', 'icon_company', null, '0', '2014-02-19 01:00:00');
INSERT INTO `sys_organization` VALUES ('2', '兰剑', 'xyz', '02', 'icon_company', null, '0', '2015-09-02 14:30:40');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `resourcetype` tinyint(1) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '系统管理', '', '系统管理', 'icon_sys', null, '7', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('2', '资源管理', '/resource/manager', '资源管理', 'icon_resource', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('5', '资源列表', '/resource/treeGrid', '资源列表', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('6', '添加', '/resource/add', '资源添加', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('7', '编辑', '/resource/edit', '资源编辑', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('8', '删除', '/resource/delete', '资源删除', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('3', '角色管理', '/role/manager', '角色管理', 'icon_role', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('10', '角色列表', '/role/dataGrid', '角色列表', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('11', '添加', '/role/add', '角色添加', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('12', '编辑', '/role/edit', '角色编辑', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('13', '删除', '/role/delete', '角色删除', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('14', '授权', '/role/grant', '角色授权', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('4', '用户管理', '/user/manager', '用户管理', 'icon_user', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('15', '用户列表', '/user/dataGrid', '用户列表', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('16', '添加', '/user/add', '用户添加', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('17', '编辑', '/user/edit', '用户编辑', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('18', '删除', '/user/delete', '用户删除', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('19', '查看', '/user/view', '用户查看', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('20', '部门管理', '/organization/manager', '部门管理', 'icon_org', '1', '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('21', '部门列表', '/organization/treeGrid', '用户列表', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('22', '添加', '/organization/add', '部门添加', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('23', '编辑', '/organization/edit', '部门编辑', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('24', '删除', '/organization/delete', '部门删除', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('25', '查看', '/organization/view', '部门查看', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('26', '数据字典', '/dictionary/manager', '数据字典', 'icon_dic', '1', '5', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('27', '字典列表', '/dictionary/dataGrid', '字典列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('28', '字典类别列表', '/dictionarytype/dataGrid', '字典类别列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('29', '添加', '/dictionary/add', '字典添加', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('30', '编辑', '/dictionary/edit', '字典编辑', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('31', '删除', '/dictionary/delete', '字典删除', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('32', '商品管理', '', '商品管理', 'icon_sys', null, '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('38', '类别管理', '/category/manager', '类别管理', 'icon_dic', '32', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('39', '商品管理', '/goods/manager', '商品管理', 'icon_dic', '32', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('33', '进货管理', '', '进货管理', 'icon_sys', null, '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('40', '供应商管理', '/supplier/manager', '供应商管理', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('41', '采购入库单', '/purchase/warehousing', '采购入库单', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('42', '采购退货单', '/purchase/return', '采购退货单', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('34', '销售管理', '', '销售管理', 'icon_sys', null, '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('43', '客户管理', '/customer/manager', '客户管理', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('44', '销售单', '/sales/sale', '销售单', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('45', '销售退货单', '/sales/return', '销售退货单', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('35', '仓库管理', '', '仓库管理', 'icon_sys', null, '0', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('46', '仓库设置', '/test/unfinished', '仓库设置', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('47', '库存明细', '/test/unfinished', '库存明细', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('48', '库存盘点', '/test/unfinished', '库存盘点', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('36', '会员管理', '', '会员管理', 'icon_sys', null, '5', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('49', '分组管理', '/test/unfinished', '会员分组', 'icon_dic', '36', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('50', '会员管理', '/test/unfinished', '会员管理', 'icon_dic', '36', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('37', '统计管理', '', '统计管理', 'icon_sys', null, '6', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('51', '销售统计', '/test/unfinished', '销售统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('52', '退货统计', '/test/unfinished', '退货统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('53', '进货统计', '/test/unfinished', '进货统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('56', 'Test', '/test/unfinished', '', 'icon_dic', '32', '0', '0', '0', '2015-09-02 15:45:23');
INSERT INTO `sys_resource` VALUES ('57', '上架管理', '', '上架管理', 'icon_sys', null, '1', '0', '0', '2015-09-02 16:19:27');
INSERT INTO `sys_resource` VALUES ('59', '库存管理', '', '库存管理', 'icon_sys', null, '1', '0', '0', '2015-09-02 16:21:11');
INSERT INTO `sys_resource` VALUES ('58', '下架管理', '', '下架管理', 'icon_sys', null, '1', '0', '0', '2015-09-02 16:20:19');
INSERT INTO `sys_resource` VALUES ('60', '上架测试', '/test/unfinished', '', 'icon_sys', '57', '0', '0', '0', '2015-09-02 16:49:04');
INSERT INTO `sys_resource` VALUES ('61', '下架测试', '/test/unfinished', '', 'icon_dic', '58', '0', '0', '0', '2015-09-02 16:50:14');
INSERT INTO `sys_resource` VALUES ('62', '库存测试', '/test/unfinished', '', 'icon_dic', '59', '0', '0', '0', '2015-09-02 16:50:52');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '0', '超级管理员，拥有全部权限', '0');
INSERT INTO `sys_role` VALUES ('2', 'gch', '0', 'test', '1');
INSERT INTO `sys_role` VALUES ('3', '管理员', '0', '', '1');
INSERT INTO `sys_role` VALUES ('4', '员工', '0', '', '1');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` smallint(5) NOT NULL,
  `resource_id` smallint(5) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '1');
INSERT INTO `sys_role_resource` VALUES ('1', '2');
INSERT INTO `sys_role_resource` VALUES ('1', '3');
INSERT INTO `sys_role_resource` VALUES ('1', '4');
INSERT INTO `sys_role_resource` VALUES ('1', '5');
INSERT INTO `sys_role_resource` VALUES ('1', '6');
INSERT INTO `sys_role_resource` VALUES ('1', '7');
INSERT INTO `sys_role_resource` VALUES ('1', '8');
INSERT INTO `sys_role_resource` VALUES ('1', '10');
INSERT INTO `sys_role_resource` VALUES ('1', '11');
INSERT INTO `sys_role_resource` VALUES ('1', '12');
INSERT INTO `sys_role_resource` VALUES ('1', '13');
INSERT INTO `sys_role_resource` VALUES ('1', '14');
INSERT INTO `sys_role_resource` VALUES ('1', '15');
INSERT INTO `sys_role_resource` VALUES ('1', '16');
INSERT INTO `sys_role_resource` VALUES ('1', '17');
INSERT INTO `sys_role_resource` VALUES ('1', '18');
INSERT INTO `sys_role_resource` VALUES ('1', '19');
INSERT INTO `sys_role_resource` VALUES ('1', '20');
INSERT INTO `sys_role_resource` VALUES ('1', '21');
INSERT INTO `sys_role_resource` VALUES ('1', '22');
INSERT INTO `sys_role_resource` VALUES ('1', '23');
INSERT INTO `sys_role_resource` VALUES ('1', '24');
INSERT INTO `sys_role_resource` VALUES ('1', '25');
INSERT INTO `sys_role_resource` VALUES ('1', '26');
INSERT INTO `sys_role_resource` VALUES ('1', '27');
INSERT INTO `sys_role_resource` VALUES ('1', '28');
INSERT INTO `sys_role_resource` VALUES ('1', '29');
INSERT INTO `sys_role_resource` VALUES ('1', '30');
INSERT INTO `sys_role_resource` VALUES ('1', '31');
INSERT INTO `sys_role_resource` VALUES ('1', '32');
INSERT INTO `sys_role_resource` VALUES ('1', '33');
INSERT INTO `sys_role_resource` VALUES ('1', '34');
INSERT INTO `sys_role_resource` VALUES ('1', '35');
INSERT INTO `sys_role_resource` VALUES ('1', '36');
INSERT INTO `sys_role_resource` VALUES ('1', '37');
INSERT INTO `sys_role_resource` VALUES ('1', '38');
INSERT INTO `sys_role_resource` VALUES ('1', '39');
INSERT INTO `sys_role_resource` VALUES ('1', '40');
INSERT INTO `sys_role_resource` VALUES ('1', '41');
INSERT INTO `sys_role_resource` VALUES ('1', '42');
INSERT INTO `sys_role_resource` VALUES ('1', '43');
INSERT INTO `sys_role_resource` VALUES ('1', '44');
INSERT INTO `sys_role_resource` VALUES ('1', '45');
INSERT INTO `sys_role_resource` VALUES ('1', '46');
INSERT INTO `sys_role_resource` VALUES ('1', '47');
INSERT INTO `sys_role_resource` VALUES ('1', '48');
INSERT INTO `sys_role_resource` VALUES ('1', '49');
INSERT INTO `sys_role_resource` VALUES ('1', '50');
INSERT INTO `sys_role_resource` VALUES ('1', '51');
INSERT INTO `sys_role_resource` VALUES ('1', '52');
INSERT INTO `sys_role_resource` VALUES ('1', '53');
INSERT INTO `sys_role_resource` VALUES ('2', '32');
INSERT INTO `sys_role_resource` VALUES ('2', '33');
INSERT INTO `sys_role_resource` VALUES ('2', '34');
INSERT INTO `sys_role_resource` VALUES ('3', '32');
INSERT INTO `sys_role_resource` VALUES ('3', '33');
INSERT INTO `sys_role_resource` VALUES ('3', '34');
INSERT INTO `sys_role_resource` VALUES ('3', '35');
INSERT INTO `sys_role_resource` VALUES ('3', '37');
INSERT INTO `sys_role_resource` VALUES ('4', '34');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT '0',
  `usertype` tinyint(1) NOT NULL DEFAULT '0',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `organization_id` int(11) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '0', '18', '1', '0', '0', '1', '2012-06-04 01:00:00');
INSERT INTO `sys_user` VALUES ('2', 'vip', 'gch1234', 'c4ca4238a0b923820dcc509a6f75849b', '1', '11', '1', '1', '0', '1', '2015-09-02 14:26:08');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` smallint(5) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
