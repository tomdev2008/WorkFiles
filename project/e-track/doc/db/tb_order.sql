-- ----------------------------
-- 代理商表`tb_agents`
-- ----------------------------
CREATE TABLE `tb_agents` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '代理商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- 渠道`tb_channel`
-- ----------------------------
CREATE TABLE `tb_channel` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '渠道',
  `com` varchar(155) DEFAULT NULL COMMENT '英文渠道',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- 目的国`tb_destination_country`
-- ----------------------------
CREATE TABLE `tb_destination_country` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `destination_country` varchar(255) DEFAULT NULL COMMENT '目的国',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--订单表
-- ----------------------------
CREATE TABLE `tb_orders` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `agents_id` varchar(255) NOT NULL COMMENT '代理商',
  `channel_id` varchar(255) NOT NULL COMMENT '渠道',
  `country_id` varchar(255) NOT NULL COMMENT '目的国',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `important` int(11) DEFAULT NULL COMMENT '重要',
  `create_time` datetime DEFAULT NULL COMMENT '创单时间',
  `user_account_id` varchar(32) NOT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`),
  KEY `agents_id` (`agents_id`),
  KEY `channel_id` (`channel_id`),
  KEY `country_id` (`country_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `tb_orders_fk` FOREIGN KEY (`agents_id`) REFERENCES `tb_agents` (`id`),
  CONSTRAINT `tb_orders_fk1` FOREIGN KEY (`channel_id`) REFERENCES `tb_channel` (`id`),
  CONSTRAINT `tb_orders_fk2` FOREIGN KEY (`country_id`) REFERENCES `tb_destination_country` (`id`),
  CONSTRAINT `tb_orders_fk3` FOREIGN KEY (`user_account_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--订单表
-- ----------------------------
CREATE TABLE `tb_orders` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `agents_id` varchar(255) NOT NULL COMMENT '代理商',
  `channel_id` varchar(255) NOT NULL COMMENT '渠道',
  `country_id` varchar(255) NOT NULL COMMENT '目的国',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `important` int(11) DEFAULT NULL COMMENT '重要',
  `create_time` datetime DEFAULT NULL COMMENT '创单时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `agents_id` (`agents_id`),
  KEY `channel_id` (`channel_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `tb_orders_fk` FOREIGN KEY (`agents_id`) REFERENCES `tb_agents` (`id`),
  CONSTRAINT `tb_orders_fk1` FOREIGN KEY (`channel_id`) REFERENCES `tb_channel` (`id`),
  CONSTRAINT `tb_orders_fk2` FOREIGN KEY (`country_id`) REFERENCES `tb_destination_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--订单详情表
-- ----------------------------
CREATE TABLE `tb_order_tracking` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `information` varchar(255) DEFAULT NULL COMMENT '跟踪信息',
  `time` datetime DEFAULT NULL COMMENT '开始时间',
  `ftime` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tb_order_tracking_fk` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--备注表
-- ----------------------------
CREATE TABLE `tb_remark` (
  `id` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `orders_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id` (`orders_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_remark_fk` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `tb_remark_fk1` FOREIGN KEY (`orders_id`) REFERENCES `tb_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;