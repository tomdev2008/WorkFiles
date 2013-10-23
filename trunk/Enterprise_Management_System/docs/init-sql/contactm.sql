/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-09-30 13:12:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tb_contract`
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract` (
  `id` varchar(255) NOT NULL,
  `contract_no` varchar(255) default NULL,
  `contract_price` varchar(255) default NULL,
  `billing_date` datetime default NULL,
  `daohuo_payment_date` datetime default NULL,
  `chuyan_payment_date` datetime default NULL,
  `zhongyan_payment_date` datetime default NULL,
  `contract_filing_date` datetime default NULL,
  `contract_signing_date` datetime default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD8F770D5F7414CA0` (`zhongyan_payment_date`),
  KEY `contract_no` (`contract_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售合同';

-- ----------------------------
-- Records of tb_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` varchar(36) NOT NULL,
  `contract_id` varchar(255) DEFAULT NULL,
  `kx_order_no` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `contract_no` varchar(50) DEFAULT NULL,
  `client` varchar(50) DEFAULT NULL,
  `final_client` varchar(50) DEFAULT NULL,
  `payment` varchar(100) DEFAULT NULL,
  `principal` varchar(50) DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `tb_contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单';

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------


-- ----------------------------
-- Table structure for `tb_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail` (
  `id` varchar(255) NOT NULL,
  `order_id` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `totalprice` varchar(255) default NULL,
  `purchase_price` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY  (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售明细';

-- ----------------------------
-- Records of tb_order_detail
-- ----------------------------



-- ----------------------------
-- Table structure for `tb_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase`;
CREATE TABLE `tb_purchase` (
  `id` varchar(255) NOT NULL,
  `order_detail_id` varchar(255) NOT NULL,
  `purchase_contract_id` varchar(255) default NULL,
  `area` varchar(255) default NULL,
  `supplier` varchar(255) default NULL,
  `product_name` varchar(255) default NULL,
  `model` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `unit_price` varchar(255) default NULL,
  `total_price` varchar(255) default NULL,
  `purchaser` varchar(255) default NULL,
  `predict_arrival_date` datetime default NULL,
  `place_order_date` datetime default NULL,
  `invoice_date` datetime default NULL,
  `invoice_remark` varchar(255) default NULL,
  `payment_date` datetime default NULL,
  `inquire_no` varchar(255) default NULL,
  `type_service_no` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY  (`id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `purchase_contract_id` (`purchase_contract_id`),
  CONSTRAINT `order_detail_id` FOREIGN KEY (`order_detail_id`) REFERENCES `tb_order_detail` (`id`),
  CONSTRAINT `purchase_contract_id` FOREIGN KEY (`purchase_contract_id`) REFERENCES `tb_purchase_contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购清单';

-- ----------------------------
-- Records of tb_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_purchase_contract`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase_contract`;
CREATE TABLE `tb_purchase_contract` (
  `id` varchar(255) NOT NULL,
  `contract_no` varchar(255) default NULL,
  `contract_price` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购合同';

-- ----------------------------
-- Records of tb_purchase_contract
-- ----------------------------


CREATE TABLE `tb_contract_receive_money` (
  `id` varchar(255) NOT NULL COMMENT '合同回款序号',
  `contract_id` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `receive_money` varchar(255) DEFAULT NULL COMMENT '回款金额',
  `receiveDate` date DEFAULT NULL COMMENT '回款日期',
  `not_receive_money` varchar(255) DEFAULT NULL COMMENT '未回款金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '回款备注',
  `money_type` varchar(255) DEFAULT NULL COMMENT '回款分类',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `contract_id` FOREIGN KEY (`contract_id`) REFERENCES `tb_contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同回款';


CREATE TABLE `tb_inventory` (
   `id` varchar(255) NOT NULL DEFAULT '' COMMENT '库存序号',
  `category` varchar(255) DEFAULT NULL COMMENT '固定资产类别',
  `name` varchar(255) DEFAULT NULL COMMENT '固定资产名称',
  `model` varchar(255) DEFAULT NULL COMMENT '规格型号',
  `configuration` varchar(255) DEFAULT NULL COMMENT '配置',
  `num` varchar(20) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `buyDate` date DEFAULT NULL COMMENT '购置日期',
  `buyMoney` varchar(255) DEFAULT NULL COMMENT '购置金额',
  `contractNo` varchar(255) DEFAULT NULL COMMENT '合同号',
  `kxorderNo` varchar(255) DEFAULT NULL COMMENT '康讯订单号',
  `place` varchar(255) DEFAULT NULL COMMENT '所在地点',
  `inventoryDate` date DEFAULT NULL COMMENT '盘存时间',
  `users` varchar(255) DEFAULT NULL COMMENT '领用人',
  `useDate` date DEFAULT NULL COMMENT '领用时间',
  `useNum` varchar(255) DEFAULT NULL COMMENT '领用数量',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `outDate` date DEFAULT NULL COMMENT '出库时间',
  `outNo` varchar(255) DEFAULT NULL COMMENT '出库编号',
  `outDescribe` varchar(255) DEFAULT NULL COMMENT '出库用途',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存';

