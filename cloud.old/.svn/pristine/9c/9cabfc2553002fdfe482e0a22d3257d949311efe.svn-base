/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/10/22 9:56:04                           */
/*==============================================================*/


drop table if exists tb_contract_doc;

drop table if exists tb_contract_doc_type;

drop table if exists tb_contract_doc_variable;

drop table if exists tb_contract_templates;

drop table if exists tb_contract_templates_doc;

drop table if exists tb_contract_templates_doc_variable;

drop table if exists tb_contract_templates_relationship;

drop table if exists tb_data_record;

drop table if exists tb_data_source;

drop table if exists tb_data_source_type;

drop table if exists tb_product_category;

drop table if exists tb_product_type;

/*==============================================================*/
/* Table: tb_contract_doc                                       */
/*==============================================================*/
create table tb_contract_doc
(
   doc_id               varchar(32) not null,
   templatesDoc_id      varchar(32),
   createtime           date comment '创建时间',
   exportPath           varchar(100),
   fileName             varchar(100),
   primary key (doc_id)
);

alter table tb_contract_doc comment '合同文件';

/*==============================================================*/
/* Table: tb_contract_doc_type                                  */
/*==============================================================*/
create table tb_contract_doc_type
(
   docType_id           varchar(32) not null,
   typename             varchar(30) comment '分类名称',
   primary key (docType_id)
);

alter table tb_contract_doc_type comment '合同文件类型';

/*==============================================================*/
/* Table: tb_contract_doc_variable                              */
/*==============================================================*/
create table tb_contract_doc_variable
(
   docVariable          varchar(32) not null,
   doc_id               varchar(32),
   variableName         varchar(50) comment '变量名称',
   content              varchar(100) comment '内容',
   primary key (docVariable)
);

alter table tb_contract_doc_variable comment '合同文件变量';

/*==============================================================*/
/* Table: tb_contract_templates                                 */
/*==============================================================*/
create table tb_contract_templates
(
   templates_id         varchar(32) not null,
   createtime           date comment '创建时间',
   status               int comment '状态',
   templatesName        varchar(50),
   primary key (templates_id)
);

alter table tb_contract_templates comment '合同模板';

/*==============================================================*/
/* Table: tb_contract_templates_doc                             */
/*==============================================================*/
create table tb_contract_templates_doc
(
   templatesDoc_id      varchar(32) not null,
   docType_id           varchar(32),
   docName              varchar(50) comment '文件名称',
   path                 varchar(1024) comment '路径',
   createtime           date comment '创建时间',
   bVariable            int comment '是否设置变量(0：无变量，1：有变量)',
   primary key (templatesDoc_id)
);

alter table tb_contract_templates_doc comment '合同模板文件';

/*==============================================================*/
/* Table: tb_contract_templates_doc_variable                    */
/*==============================================================*/
create table tb_contract_templates_doc_variable
(
   templates_doc_variable_id varchar(32) not null,
   templatesDoc_id      varchar(32),
   variableName         varchar(50) comment '变量名称',
   description          varchar(100) comment '描述',
   primary key (templates_doc_variable_id)
);

alter table tb_contract_templates_doc_variable comment '合同模板文件变量设置';

/*==============================================================*/
/* Table: tb_contract_templates_relationship                    */
/*==============================================================*/
create table tb_contract_templates_relationship
(
   templates_doc_id     varchar(32) not null,
   templatesDoc_id      varchar(32),
   templates_id         varchar(32),
   primary key (templates_doc_id)
);

alter table tb_contract_templates_relationship comment '合同模版与模板文件关系表';

/*==============================================================*/
/* Table: tb_data_record                                        */
/*==============================================================*/
create table tb_data_record
(
   record_id            varchar(32) not null comment 'ID',
   source_id            varchar(32) comment 'ID',
   productType_id       varchar(32) comment 'ID',
   productorderno       varchar(50) comment '产品订货号',
   productDesc          varchar(100) comment '产品描述',
   quantity             int comment '数量',
   unitPrice            varchar(50) comment '目录单价',
   discountRate         varchar(50) comment '折扣率',
   otherRates           varchar(50) comment '运保及其他费率',
   installServiceCharge varchar(50) comment '安装服务费',
   firstYear            varchar(50) comment '第一年保修复',
   secondYear           varchar(50) comment '第二年保修费',
   thirdYear            varchar(50) comment '第三年保修费',
   remark               varchar(100) comment '备注',
   primary key (record_id)
);

alter table tb_data_record comment '数据源数据记录';

/*==============================================================*/
/* Table: tb_data_source                                        */
/*==============================================================*/
create table tb_data_source
(
   source_id            varchar(32) not null comment 'ID',
   type_id              varchar(32) comment 'ID',
   status               int comment '状态',
   description          varchar(100) comment '描述',
   createtime           date comment '创建时间',
   sourceName           varchar(50),
   primary key (source_id)
);

alter table tb_data_source comment '数据源总表';

/*==============================================================*/
/* Table: tb_data_source_type                                   */
/*==============================================================*/
create table tb_data_source_type
(
   type_id              varchar(32) not null comment 'ID',
   sourceTypeName       varchar(50),
   primary key (type_id)
);

alter table tb_data_source_type comment '数据源分类';

/*==============================================================*/
/* Table: tb_product_category                                   */
/*==============================================================*/
create table tb_product_category
(
   category_id          varchar(32) not null comment 'ID',
   isRepeat             int comment '标记是否乘以数量(0或者空：乘以数量，1：不乘以数量)',
   productCategoryName  varchar(50),
   primary key (category_id)
);

alter table tb_product_category comment '产品总类';

/*==============================================================*/
/* Table: tb_product_type                                       */
/*==============================================================*/
create table tb_product_type
(
   productType_id       varchar(32) not null comment 'ID',
   category_id          varchar(32) comment 'ID',
   productTypeName      varchar(50),
   primary key (productType_id)
);

alter table tb_product_type comment '产品分类';

alter table tb_contract_doc add constraint FK_Relationship_12 foreign key (templatesDoc_id)
      references tb_contract_templates_doc (templatesDoc_id) on delete restrict on update restrict;

alter table tb_contract_doc_variable add constraint FK_Relationship_6 foreign key (doc_id)
      references tb_contract_doc (doc_id) on delete restrict on update restrict;

alter table tb_contract_templates_doc add constraint FK_Relationship_13 foreign key (docType_id)
      references tb_contract_doc_type (docType_id) on delete restrict on update restrict;

alter table tb_contract_templates_doc_variable add constraint FK_Relationship_11 foreign key (templatesDoc_id)
      references tb_contract_templates_doc (templatesDoc_id) on delete restrict on update restrict;

alter table tb_contract_templates_relationship add constraint FK_Relationship_10 foreign key (templatesDoc_id)
      references tb_contract_templates_doc (templatesDoc_id) on delete restrict on update restrict;

alter table tb_contract_templates_relationship add constraint FK_Relationship_9 foreign key (templates_id)
      references tb_contract_templates (templates_id) on delete restrict on update restrict;

alter table tb_data_record add constraint FK_Relationship_15 foreign key (productType_id)
      references tb_product_type (productType_id) on delete restrict on update restrict;

alter table tb_data_record add constraint FK_Relationship_2 foreign key (source_id)
      references tb_data_source (source_id) on delete restrict on update restrict;

alter table tb_data_source add constraint FK_Relationship_1 foreign key (type_id)
      references tb_data_source_type (type_id) on delete restrict on update restrict;

alter table tb_product_type add constraint FK_Relationship_3 foreign key (category_id)
      references tb_product_category (category_id) on delete restrict on update restrict;

