/*
Navicat MySQL Data Transfer

Source Server         : mms
Source Server Version : 50527
Source Host           : 211.91.224.230:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-07-29 13:47:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_checking_in`
-- ----------------------------
DROP TABLE IF EXISTS `tb_checking_in`;
CREATE TABLE `tb_checking_in` (
  `id` varchar(32) NOT NULL COMMENT '考勤主键id',
  `emp_id` varchar(32) DEFAULT NULL COMMENT '员工ID',
  `stauts` varchar(50) DEFAULT NULL COMMENT '状态',
  `reason` varchar(100) DEFAULT NULL COMMENT '原因',
  `time` date DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_7` (`emp_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_checking_in
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_checking_instance`
-- ----------------------------
DROP TABLE IF EXISTS `tb_checking_instance`;
CREATE TABLE `tb_checking_instance` (
  `emp_id` varchar(32) DEFAULT NULL COMMENT '主键id',
  `id` varchar(32) NOT NULL DEFAULT '0',
  `emp_name` varchar(100) DEFAULT NULL COMMENT '员工姓名',
  `orgen_name` varchar(100) DEFAULT NULL,
  `emp_due` int(11) DEFAULT NULL,
  `emp_actual` int(11) DEFAULT NULL,
  `neglect_work` int(11) DEFAULT NULL,
  `emp_late` int(11) DEFAULT NULL,
  `leave_early` int(11) DEFAULT NULL,
  `overtime` int(11) DEFAULT NULL,
  `emp_leave` int(11) DEFAULT NULL,
  `emp_away` int(11) DEFAULT NULL,
  `weekend_overtime` int(11) DEFAULT NULL,
  `happenday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_12` (`emp_id`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_checking_instance
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_deptorgen`
-- ----------------------------
DROP TABLE IF EXISTS `tb_deptorgen`;
CREATE TABLE `tb_deptorgen` (
  `orgen_id` varchar(32) NOT NULL COMMENT '主键id',
  `dept_id` varchar(32) NOT NULL COMMENT '主键',
  PRIMARY KEY (`orgen_id`,`dept_id`),
  KEY `FK_Relationship_10` (`dept_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`dept_id`) REFERENCES `t_s_depart` (`id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`orgen_id`) REFERENCES `tb_orgen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_deptorgen
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_employee`
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee` (
  `id` varchar(32) NOT NULL COMMENT '员工主键id',
  `orgen_id` varchar(32) DEFAULT NULL COMMENT '机构主键id',
  `post_id` varchar(32) DEFAULT NULL COMMENT '岗位主键id',
  `identity_card` varchar(18) DEFAULT NULL COMMENT '身份证',
  `birthday` date DEFAULT NULL COMMENT '出生年月',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭地址',
  `orgen_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `native_place` varchar(10) DEFAULT NULL COMMENT '籍贯',
  `domicile_place` varchar(50) DEFAULT NULL COMMENT '户口所在地',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `graduate_school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `education_background` varchar(20) DEFAULT NULL COMMENT '学历',
  `marry` varchar(20) DEFAULT NULL COMMENT '婚否',
  `nation` varchar(20) DEFAULT NULL COMMENT '名族',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `politics_status` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `dates_employed` date DEFAULT NULL COMMENT '入职时间',
  `working_time` varchar(50) DEFAULT NULL COMMENT '司龄',
  `E_mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `immediate_family` varchar(50) DEFAULT NULL COMMENT '直系亲属',
  `status` char(2) DEFAULT NULL COMMENT '状态',
  `opening_bank` varchar(50) DEFAULT NULL COMMENT '银行卡开户行',
  `card_no` decimal(20,0) DEFAULT NULL COMMENT '银行卡号',
  `household_properties` char(2) DEFAULT NULL COMMENT '户口性质',
  `job_title` varchar(20) DEFAULT NULL COMMENT '职称',
  `title_level` varchar(20) DEFAULT NULL COMMENT '职称级别',
  `change_jobs` varchar(20) DEFAULT NULL COMMENT '岗位变动',
  `social_security_time` date DEFAULT NULL COMMENT '社保保险缴费起始月',
  `job_no` varchar(20) DEFAULT NULL COMMENT '工号',
  `emp_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_6` (`post_id`),
  KEY `FK_Relationship_8` (`orgen_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`post_id`) REFERENCES `tb_post` (`id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`orgen_id`) REFERENCES `tb_orgen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_employee_contracts`
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee_contracts`;
CREATE TABLE `tb_employee_contracts` (
  `id` varchar(32) NOT NULL COMMENT '员工合同主键ID',
  `emp_id` varchar(32) DEFAULT NULL COMMENT '员工id',
  `contract_effective_date` date DEFAULT NULL COMMENT '合同生效日期',
  `contract_end_date` date DEFAULT NULL COMMENT '合同终止日期',
  `contract_date` date DEFAULT NULL COMMENT '合同签订日期',
  `status` char(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_4` (`emp_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee_contracts
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_orgen`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orgen`;
CREATE TABLE `tb_orgen` (
  `id` varchar(32) NOT NULL COMMENT '机构主键id',
  `perm_name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `orgen_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `place` varchar(100) DEFAULT NULL COMMENT '地址',
  `type` smallint(6) DEFAULT NULL COMMENT '类型',
  `create_time` date DEFAULT NULL COMMENT '成立时间',
  `parent_orgen` varchar(50) DEFAULT NULL COMMENT '上级机构',
  `number` varchar(100) DEFAULT NULL COMMENT '资产编号',
  `tell_phone` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `business_license_no` varchar(100) DEFAULT NULL COMMENT '税务登记证',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '开户行名称',
  `tax_registration_certificate` varchar(100) DEFAULT NULL COMMENT '营业执照',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of tb_orgen
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_permanent_assets`
-- ----------------------------
DROP TABLE IF EXISTS `tb_permanent_assets`;
CREATE TABLE `tb_permanent_assets` (
  `id` varchar(32) NOT NULL COMMENT '固定资产主键id',
  `emp_id` varchar(32) DEFAULT NULL COMMENT '员工id',
  `number` varchar(100) DEFAULT NULL COMMENT '资产编号',
  `perm_name` varchar(100) DEFAULT NULL COMMENT '员工姓名',
  `acc_type` smallint(6) DEFAULT NULL COMMENT '资产类型',
  `stauts` smallint(6) DEFAULT NULL COMMENT '状态\r\n        ',
  `buy_time` date DEFAULT NULL COMMENT '购入时间',
  `price` double DEFAULT NULL COMMENT '资产价值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_11` (`emp_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`emp_id`) REFERENCES `tb_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固定资产';

-- ----------------------------
-- Records of tb_permanent_assets
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_post`
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post` (
  `id` varchar(32) NOT NULL COMMENT '岗位id',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `post_name` varchar(20) DEFAULT NULL COMMENT '岗位名称',
  `post_duty` varchar(50) DEFAULT NULL COMMENT '岗位职责',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_5` (`dept_id`),
  CONSTRAINT `tb_post_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `t_s_depart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_post
-- ----------------------------



-- ----------------------------
-- Table structure for `t_s_depart`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart`;
CREATE TABLE `t_s_depart` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `departname` varchar(50) NOT NULL,
  `description` text COMMENT '部门职能',
  `parentdepartid` varchar(32) DEFAULT NULL COMMENT '上级部门名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_DEPART` (`id`),
  KEY `IDX_FORENGN_PARENT` (`parentdepartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_depart
-- ----------------------------
INSERT INTO `t_s_depart` VALUES ('1', '信息部', '12', null);
INSERT INTO `t_s_depart` VALUES ('2', '设计部', '', null);
INSERT INTO `t_s_depart` VALUES ('3', '研发室', '研发技术难题', '152');

