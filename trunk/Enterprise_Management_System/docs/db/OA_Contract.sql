/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/8/19 10:50:04                           */
/*==============================================================*/


drop table if exists tb_config_models;

drop table if exists tb_configmodel_data;

drop table if exists tb_customer;

drop table if exists tb_data_record;

drop table if exists tb_data_source;

drop table if exists tb_project;

/*==============================================================*/
/* Table: tb_config_models                                      */
/*==============================================================*/
create table tb_config_models
(
   config_id            varchar(32) not null comment 'ID',
   after_discount_now_price varchar(50) comment '折扣后现场价',
   after_discount_price varchar(50) comment '折扣后价格',
   catalog_total_price  varchar(50) comment '目录合价',
   create_time          date comment '创建时间',
   name                 varchar(50) comment '名称',
   status               varchar(2) comment '状态',
   total_price          varchar(50) comment '总价',
   type                 varchar(20) comment '类型',
   creator_id           varchar(20) comment '创建者ID',
   primary key (config_id)
);

alter table tb_config_models comment '机型配置';

/*==============================================================*/
/* Table: tb_configmodel_data                                   */
/*==============================================================*/
create table tb_configmodel_data
(
   data_id              varchar(32) not null,
   config_id            varchar(32) comment 'ID',
   catalog_price        varchar(20),
   discounted_after_price varchar(20),
   discountRate         varchar(20) comment '折扣率',
   discounted_price     varchar(20),
   first_year           varchar(50) comment '第一年',
   second_year          varchar(50) comment '第二年',
   third_year           varchar(50) comment '第三年',
   quantity             numeric(11,0) comment '数量',
   total_price          varchar(50) comment '总价',
   primary key (data_id)
);

alter table tb_configmodel_data comment '配置单数据';

/*==============================================================*/
/* Table: tb_customer                                           */
/*==============================================================*/
create table tb_customer
(
   customer_id          varchar(32) not null,
   address              varchar(100),
   company_name         varchar(100),
   description          varchar(100) comment '描述',
   contact              varchar(50),
   email                varchar(100),
   phone                varchar(20),
   job_place_id         archar(32),
   primary key (customer_id)
);

/*==============================================================*/
/* Table: tb_data_record                                        */
/*==============================================================*/
create table tb_data_record
(
   record_id            varchar(32) not null comment 'ID',
   source_id            varchar(32) comment 'ID',
   InstallServiceCharge varchar(50) comment '安装服务费',
   discountRate         varchar(20) comment '折扣率',
   first_year           varchar(50) comment '第一年',
   second_year          varchar(50) comment '第二年',
   third_year           varchar(50) comment '第三年',
   otherRates           varchar(50) comment '其他',
   productDesc          varchar(100) comment '产品描述',
   quantity             numeric(11,0) comment '数量',
   remark               varchar(100) comment '备注',
   unitPrice            varchar(50) comment '目录单价',
   product_type_id      varchar(32) comment '类型',
   primary key (record_id)
);

alter table tb_data_record comment '数据源详情';

/*==============================================================*/
/* Table: tb_data_source                                        */
/*==============================================================*/
create table tb_data_source
(
   source_id            varchar(32) not null comment 'ID',
   createtime           date comment '创建时间',
   description          varchar(100) comment '描述',
   name                 varchar(50) comment '名称',
   status               varchar(2) comment '状态',
   type_id              varchar(32) comment '类型ID',
   primary key (source_id)
);

alter table tb_data_source comment '数据源';

/*==============================================================*/
/* Table: tb_project                                            */
/*==============================================================*/
create table tb_project
(
   project_id           varchar(32) not null,
   create_time          date comment '创建时间',
   description          varchar(100) comment '描述',
   project_name         varchar(50),
   user_id              varchar(32),
   customer             varchar(32),
   primary key (project_id)
);

alter table tb_configmodel_data add constraint FK_Relationship_2 foreign key (config_id)
      references tb_config_models (config_id) on delete restrict on update restrict;

alter table tb_data_record add constraint FK_Relationship_1 foreign key (source_id)
      references tb_data_source (source_id) on delete restrict on update restrict;

