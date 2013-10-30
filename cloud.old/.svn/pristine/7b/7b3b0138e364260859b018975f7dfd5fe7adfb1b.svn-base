/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/9/11 14:08:40                           */
/*==============================================================*/


drop table if exists tb_cms_right;

drop table if exists tb_cms_role;

drop table if exists tb_cms_user;

drop table if exists tb_config_detail;

drop table if exists tb_dom_user;

drop table if exists tb_domain;

drop table if exists tb_group;

drop table if exists tb_iso;

drop table if exists tb_operating_system;

drop table if exists tb_order_detail;

drop table if exists tb_orders;

drop table if exists tb_powerShell;

drop table if exists tb_price_overview;

drop table if exists tb_product;

drop table if exists tb_role_right;

drop table if exists tb_set_prices;

drop table if exists tb_shell_type;

drop table if exists tb_tenants;

drop table if exists tb_variable;

drop table if exists tb_vhd_disk;

drop table if exists tb_virtual_machine;

drop table if exists tb_virtual_network_switch;

drop table if exists tb_virtual_type;

/*==============================================================*/
/* Table: tb_cms_right                                          */
/*==============================================================*/
create table tb_cms_right
(
   id                   bigint not null,
   parent_id            bigint,
   right_name           varchar(50),
   url                  varchar(150),
   create_time          timestamp,
   level                smallint,
   primary key (id)
);

/*==============================================================*/
/* Table: tb_cms_role                                           */
/*==============================================================*/
create table tb_cms_role
(
   id                   bigint not null,
   role_name            varchar(50),
   operator_id          bigint,
   create_time          timestamp,
   update_time          timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: tb_cms_user                                           */
/*==============================================================*/
create table tb_cms_user
(
   id                   bigint not null,
   tb_cms_role_id       bigint,
   account              varchar(50),
   consumer_name        varchar(50),
   password             varchar(50),
   phone                varchar(20),
   email                varchar(100),
   create_time          timestamp,
   last_login_time      timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: tb_config_detail                                      */
/*==============================================================*/
create table tb_config_detail
(
   id                   bigint not null,
   tb_price_overview_id bigint,
   tb_operating_system_id bigint,
   cpu_size             smallint,
   cpu_unit             varchar(50),
   memory_size          smallint,
   memory_unit          varchar(50),
   public_network       bigint,
   public_network_unit  varchar(50),
   system_disk_size     bigint,
   data_disk            bigint,
   data_unit            varchar(50),
   system_unit          varchar(50),
   primary key (id)
);

alter table tb_config_detail comment '配置详情表';

/*==============================================================*/
/* Table: tb_dom_user                                           */
/*==============================================================*/
create table tb_dom_user
(
   id                   bigint not null,
   tb_domain_id         bigint,
   tb_virtual_machine_id bigint,
   tb_group_id          bigint,
   first_name           varchar(150),
   last_name            varchar(150),
   name                 varchar(150),
   english_name         varchar(150),
   login_name           varchar(150),
   password             varchar(150),
   not_update_pwd       smallint comment '1、不能更改
            2、能更改',
   next_update_pwd      smallint comment '1、登陆须更改密码
            2、登陆不更改密码',
   pwd_expired          smallint comment '1、永不过期
            2、过期',
   account_disabled     smallint comment '1、已禁用
            2、未禁用',
   creater              varchar(150),
   primary key (id)
);

alter table tb_dom_user comment '域用户，system center 登陆用户';

/*==============================================================*/
/* Table: tb_domain                                             */
/*==============================================================*/
create table tb_domain
(
   id                   bigint not null,
   domain_name          varchar(150),
   primary key (id)
);

alter table tb_domain comment '系统域';

/*==============================================================*/
/* Table: tb_group                                              */
/*==============================================================*/
create table tb_group
(
   id                   bigint not null,
   group_name           varchar(150),
   group_domain         smallint comment '1、全局域
            2、本地域
            3、通用',
   group_type           smallint comment '1、安全组
            2、通讯组',
   primary key (id)
);

alter table tb_group comment '系统组';

/*==============================================================*/
/* Table: tb_iso                                                */
/*==============================================================*/
create table tb_iso
(
   id                   bigint not null,
   iso_name             varchar(50),
   iso_size             bigint,
   size_unit            varchar(10),
   iso_url              varchar(150),
   iso_version          varchar(100),
   primary key (id)
);

alter table tb_iso comment '镜像文件管理';

/*==============================================================*/
/* Table: tb_operating_system                                   */
/*==============================================================*/
create table tb_operating_system
(
   id                   bigint not null,
   system_name          varchar(100),
   median_type          varchar(50),
   version              varchar(50),
   primary key (id)
);

alter table tb_operating_system comment '操作系统表';

/*==============================================================*/
/* Table: tb_order_detail                                       */
/*==============================================================*/
create table tb_order_detail
(
   id                   bigint not null,
   tb_orders_id         bigint,
   tb_operating_system_id bigint,
   cpu_size             bigint,
   memory_size          bigint,
   system_disk_size     bigint,
   cpu_unit             varchar(10),
   memory_unit          varchar(10),
   public_network       bigint,
   public_network_unit  varchar(10),
   number               bigint,
   fee                  double,
   buy_time             bigint,
   begin_use_time       timestamp,
   end_use_time         timestamp,
   data_disk_size       bigint,
   data_unit            varchar(50),
   buy_time_type        smallint comment '1、月
            2、年',
   system_disk_unit     varchar(50),
   primary key (id)
);

alter table tb_order_detail comment '订单详情';

/*==============================================================*/
/* Table: tb_orders                                             */
/*==============================================================*/
create table tb_orders
(
   id                   bigint not null,
   tb_tenants_id        bigint,
   orders_num           varchar(50),
   create_time          timestamp,
   state                smallint comment '1、未支付，2、已支付，3、未开通，4、已开通，5、已作废，6、删除，7、审核中',
   type                 smallint comment '1、试用，2、购买',
   产品名称                 varchar(100),
   primary key (id)
);

alter table tb_orders comment '订单表';

/*==============================================================*/
/* Table: tb_powerShell                                         */
/*==============================================================*/
create table tb_powerShell
(
   file_name            varchar(150),
   powerShell_name      varchar(150),
   remark               varchar(150),
   id                   bigint not null,
   tb_shell_type_id     bigint,
   tb_variable_id       bigint,
   primary key (id)
);

alter table tb_powerShell comment '脚本管理表';

/*==============================================================*/
/* Table: tb_price_overview                                     */
/*==============================================================*/
create table tb_price_overview
(
   id                   bigint not null,
   tb_product_id        bigint,
   config_name          varchar(100),
   type                 smallint comment '1、推荐配置
            2、试用配置
            3、自定义配置',
   pre_month_price      double,
   pre_year_price       double,
   primary key (id)
);

alter table tb_price_overview comment '价格总览表';

/*==============================================================*/
/* Table: tb_product                                            */
/*==============================================================*/
create table tb_product
(
   id                   bigint not null,
   name                 varchar(100),
   detail               varchar(200),
   type                 smallint,
   primary key (id)
);

alter table tb_product comment '服务与产品表';

/*==============================================================*/
/* Table: tb_role_right                                         */
/*==============================================================*/
create table tb_role_right
(
   tb_cms_right_id      bigint not null,
   tb_cms_role_id       bigint not null,
   primary key (tb_cms_right_id, tb_cms_role_id)
);

/*==============================================================*/
/* Table: tb_set_prices                                         */
/*==============================================================*/
create table tb_set_prices
(
   id                   bigint not null,
   cpu_growth_rate      int,
   cpu_growth_price     double,
   cpu_growth_unit      varchar(50),
   memory_growth_rate   int,
   memory_growth_price  double,
   memory_growth_unit   varchar(50),
   data_growth_rate     int,
   data_growth_price    double,
   data_growth_unit     varchar(50),
   network_growth_rate  int,
   network_growth_price double,
   network_growth_unit  varchar(50),
   primary key (id)
);

alter table tb_set_prices comment '制定价格表';

/*==============================================================*/
/* Table: tb_shell_type                                         */
/*==============================================================*/
create table tb_shell_type
(
   id                   bigint not null,
   type_name            varchar(150),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_tenants                                            */
/*==============================================================*/
create table tb_tenants
(
   id                   bigint not null,
   tb_dom_user_id       bigint,
   user_name            varchar(150),
   email                varchar(150) comment '不能重复',
   account              varchar(150) comment '不能重复',
   password             varchar(150),
   register_time        timestamp,
   unregister_time      timestamp,
   state                smallint comment '1、正常
            2、禁用',
   primary key (id)
);

alter table tb_tenants comment '租户，用于web登陆的用户';

/*==============================================================*/
/* Table: tb_variable                                           */
/*==============================================================*/
create table tb_variable
(
   name                 varchar(150),
   value                varchar(150),
   id                   bigint not null,
   primary key (id)
);

alter table tb_variable comment '脚本变量表';

/*==============================================================*/
/* Table: tb_vhd_disk                                           */
/*==============================================================*/
create table tb_vhd_disk
(
   id                   bigint not null,
   disk_name            varchar(50),
   disk_size            bigint,
   primary key (id)
);

alter table tb_vhd_disk comment 'VHD磁盘';

/*==============================================================*/
/* Table: tb_virtual_machine                                    */
/*==============================================================*/
create table tb_virtual_machine
(
   id                   bigint not null,
   tb_vhd_disk_id       bigint,
   tb_iso_id            bigint,
   tb_virtual_type_id   bigint,
   tb_virtual_network_switch_id bigint,
   host_name            varchar(50),
   intranet_ip          varchar(50),
   extranet_ip          varchar(50),
   destruction_time     timestamp,
   create_time          timestamp,
   boot_time            timestamp,
   shutdown_time        timestamp,
   cpu_size             bigint,
   memory_size          bigint,
   disk_size            bigint,
   extranet_port        varchar(10),
   state                smallint comment '1、开机
            2、关机
            3、待机',
   cpu_unit             varchar(10),
   memory_unit          varchar(10),
   disk_unit            varchar(10),
   operating_system     varchar(50),
   data_disk_size       bigint,
   data_disk_unit       varchar(50),
   primary key (id)
);

alter table tb_virtual_machine comment '虚拟机表';

/*==============================================================*/
/* Table: tb_virtual_network_switch                             */
/*==============================================================*/
create table tb_virtual_network_switch
(
   id                   bigint not null,
   network_name         varchar(50),
   start_ip             varchar(50),
   end_ip               varchar(50),
   vlan_id              int comment '范围从1-4094',
   gateway_ip           varchar(50),
   mask_ip              varchar(50),
   remark               varchar(100),
   use_range            smallint comment '1、内网
            2、外网',
   primary key (id)
);

alter table tb_virtual_network_switch comment '虚拟网络交换机';

/*==============================================================*/
/* Table: tb_virtual_type                                       */
/*==============================================================*/
create table tb_virtual_type
(
   id                   bigint not null,
   virturl_type_name    varchar(50) comment '1、openstack
            2、hyper',
   primary key (id)
);

alter table tb_virtual_type comment '创建虚拟机资源类型';

alter table tb_cms_user add constraint FK_Relationship_19 foreign key (tb_cms_role_id)
      references tb_cms_role (id) on delete restrict on update restrict;

alter table tb_config_detail add constraint FK_Relationship_14 foreign key (tb_operating_system_id)
      references tb_operating_system (id) on delete restrict on update restrict;

alter table tb_config_detail add constraint FK_Relationship_15 foreign key (tb_price_overview_id)
      references tb_price_overview (id) on delete restrict on update restrict;

alter table tb_dom_user add constraint FK_Relationship_2 foreign key (tb_domain_id)
      references tb_domain (id) on delete restrict on update restrict;

alter table tb_dom_user add constraint FK_Relationship_3 foreign key (tb_group_id)
      references tb_group (id) on delete restrict on update restrict;

alter table tb_dom_user add constraint FK_Relationship_6 foreign key (tb_virtual_machine_id)
      references tb_virtual_machine (id) on delete restrict on update restrict;

alter table tb_order_detail add constraint FK_Relationship_10 foreign key (tb_orders_id)
      references tb_orders (id) on delete restrict on update restrict;

alter table tb_order_detail add constraint FK_Relationship_13 foreign key (tb_operating_system_id)
      references tb_operating_system (id) on delete restrict on update restrict;

alter table tb_orders add constraint FK_Relationship_11 foreign key (tb_tenants_id)
      references tb_tenants (id) on delete restrict on update restrict;

alter table tb_powerShell add constraint FK_Relationship_1 foreign key (tb_variable_id)
      references tb_variable (id) on delete restrict on update restrict;

alter table tb_powerShell add constraint FK_Relationship_5 foreign key (tb_shell_type_id)
      references tb_shell_type (id) on delete restrict on update restrict;

alter table tb_price_overview add constraint FK_Relationship_12 foreign key (tb_product_id)
      references tb_product (id) on delete restrict on update restrict;

alter table tb_role_right add constraint FK_Relationship_17 foreign key (tb_cms_right_id)
      references tb_cms_right (id) on delete restrict on update restrict;

alter table tb_role_right add constraint FK_Relationship_18 foreign key (tb_cms_role_id)
      references tb_cms_role (id) on delete restrict on update restrict;

alter table tb_tenants add constraint FK_Relationship_4 foreign key (tb_dom_user_id)
      references tb_dom_user (id) on delete restrict on update restrict;

alter table tb_virtual_machine add constraint FK_Relationship_16 foreign key (tb_virtual_type_id)
      references tb_virtual_type (id) on delete restrict on update restrict;

alter table tb_virtual_machine add constraint FK_Relationship_7 foreign key (tb_iso_id)
      references tb_iso (id) on delete restrict on update restrict;

alter table tb_virtual_machine add constraint FK_Relationship_8 foreign key (tb_virtual_network_switch_id)
      references tb_virtual_network_switch (id) on delete restrict on update restrict;

alter table tb_virtual_machine add constraint FK_Relationship_9 foreign key (tb_vhd_disk_id)
      references tb_vhd_disk (id) on delete restrict on update restrict;

